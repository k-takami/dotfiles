@C
# 利サシスAPIとの橋渡しをするクラス
class SsoController < ApplicationController
  before_filter :require_or_permit_params, :only => [:execute_sso, :execute_sso_without_wrappwer]
  # XXX: ssl_required :login, :execute_sso

  # GET /sso
  # GET /sso.xml
  def index
    @sso = Sso.all
    respond_to do |format|
      format.html # PENDING { render :layout => }
      format.xml  { render :xml => @sso }
    end
  end
  alias login index

  # DELETE /sso/1
  # DELETE /sso/1.xml
  def destroy
    @current_user, _reqenv = IssBridge.tidy_up_current_user(session, cookies, request.env, current_user)
    IssBridge.update(session, :referer, url_for(params))
    # IssBridge.update(session, :online, false)
    redirect_to '/'
  end
  alias logout destroy

  def render_login_when_failed
    flash[:login_notice] = '認証に失敗しました'
    redirect_to :back # render :action => :login
  end

  def execute_sso
    card_id = params[:j_username]
    sso_api_query = "curl -X POST 'http://10.2.66.42/sso/auth/internal' -H 'API-Key:ndlonline' -H 'API-Id:ndlonline'"
    sso_api_query << " -d 'cardId=#{card_id}' -d 'password=#{params[:j_password]}'"
    # sso_api_query << " -c #{Rails.root}/tmp/sso_cookie" # sso_api_query << " -H 'Cookie: header_some_key_str=some_value'"
    # File.delete "#{Rails.root}/tmp/sso_cookie" if File.exist? "#{Rails.root}/tmp/sso_cookie"
    # 利サシス利用者種別:    点字図書館 支部図書館 国会議員 国会職員 各種図書館 図書館送信 NDL職員 当日利用者 端末利用 複写代行入力
登録利用者 臨時
    risashisu_member_types = %w[BRAILLE BRANCHLIB DIET_MEMBER DIET_STAFF LIBRARY LIBTRANS NDL_STAFF ONEDAY PCUSE_DUMMY PHOTO REGISTERED TEMPORARY_DUMMY]
    result = IssBridge.call_web_api sso_api_query
    result_status = dig(result, 'patron', 'type')
    # XXX: result_status = 'DIET_MEMBER' # XXX: card_id = result["patron"]["cardID"]

    # render_login_when_failed && return if result.blank? || result["type"] == "errorResponse"
    # if risashisu_member_types.include?(result_status)
    if true
      IssBridge.update(session, :referer, url_for(params))
      # IssBridge.update(session, :online, true)
      relate_session_and_cookie_to_risashisu_with(result) # 利サシス連動用処理
      ### Shibboleth代替関連処理 ################################################
      relate_card_id_and_member_type_cookie_like_shibboleth(card_id, result_status) # ログイン画面認証時だけのｼﾎﾞﾚｽﾍｯﾀﾞｰ模擬
      IssBridge.set_other_session_info_like_shibboleth(session, result['patron']) if result && result.key?('patron') # KSS含む認証全
般のｼﾎﾞﾚｽﾍｯﾀﾞｰ模擬
      emulate_shibboleth_session # 頁遷移ごとのｼﾎﾞﾚｽﾍｯﾀﾞｰ維持保守
      single_sign_on # 旧来ｼﾎﾞﾚｽどおりのﾛｼﾞｯｸ
      #######################################################################
      redirection = request.referer.match(/(target|return)=.*$/)
      redirect_url = redirection.present? ? redirection[0].sub(/(target|return)=/, '') : request.referer
      redirect_to redirect_url
    else
      render_login_when_failed
    end
  end

  private

  def purehostname
    env["HTTP_HOST"].sub(/:\d*/, '')
  end

 # ユーザエージェントより、どのブラウザよりアクセスかを特定
  def user_agent
    ua = request.env['HTTP_USER_AGENT']
    if ua =~ /MSIE|WOW64|SV1/
      'ie'
    elsif ua.include? 'irefox'
      'firefox'
    elsif ua.include? 'hrome'
      'chrome'
    elsif ua.include? 'pera'
      'opera'
    elsif ua.include? 'safari'
      'safari'
    else
      'others'
    end
  end


  # session_store.rbやhostnameに依存しない明示的cookieセットメソッド
  # 既存のNDLサーチサーバーは自己ドメインRLでアクセスされたときだけ、ドメイン指定のcookieを返す
  # いいかえると,別FQDN指定のcookieを返すことをしない
  def set_special_cookie(key, value)
    # ブラウザー閉じたらクッキー破棄したいので有効期限設定 :expires => SESSION_TIMEOUT.from_now なしてcookie設定；
    # XXX: localhost限定かもしれないが
    #               IEはクロスドメインのcookieをうけとってくれ、
    #               FireFoxはアクセスしたhostnameのドメイン指定cookieまたはドメイン無指定cookieしかうけとらず、
    #               Google Chromeはドメイン指定するとRailsからのCookieをうけとってくれない。
    if purehostname == APPLICATION_HOSTS || user_agent == 'ie'
      # NOTE: 設計書どおりのサブドメイン指定クッキー
      option_hash = { :domain => ".#{APPLICATION_HOSTS}" }
      cookies[key] = { :value => value }.merge(option_hash)
    elsif user_agent == 'firefox'
      # option_hash = { :domain => ".#{APPLICATION_HOSTS}"}
      option_hash = { :domain => ".#{purehostname}"}
      cookies[key] = { :value => value }.merge(option_hash)
    else #such as chrome
      # domain = %w[localhost 127.0.0.1].include?(purehostname) ? purehostname : APPLICATION_HOSTS
      # cookies[key] = { :value => value }.merge(option_hash)
      cookies[key] = { :value => value }
    end
  end

  def relate_session_and_cookie_to_risashisu_with(api_result)
    risashisu_session_id = api_result.try(:fetch, 'sessionId')
    IssBridge.update(session, "sessionId_RISASHISU", risashisu_session_id)
    # session_storei.rbでmemcached指定でもここでは明示的にsessionIdをcookiesに仕込む
    session_id = %w[localhost 127.0.0.1].include?(purehostname) ? 'DUMMY-RISASHISU-API-result-sessionId' : risashisu_session_id
    set_special_cookie('sessionId', session_id)
  end

  def relate_card_id_and_member_type_cookie_like_shibboleth(card_id, result_status)
    set_cookie("HTTP_Z308_KEY_DATA_01", card_id)
    IssBridge.update(session, "HTTP_Z308_KEY_DATA_01", card_id)
    return unless result_status == 'REGISTERED'
    result_to_z305 = { 'DIET_MEMBER' => '01', 'DIET_STAFF' => '02', 'NDL_STAFF' => '16' }
    IssBridge.update(session, "HTTP_Z305_BOR_STATUS_NDL50", result_to_z305[result_status])
  end

  def require_or_permit_params # <--- To be replaced by strong parameter after rails4<
    flash.clear
    if params[:j_username].blank? || params[:j_password].blank?
      flash[:login_notice] = t('enju_ndl.sso.error')
      redirect_to :back
    else
      ## FIXME: to remove dummy password here
      # params[:id] ||= 1
      # params[:j_username] = "E00010300"
      # 現行シボレスSSOはJSでパスワードを大文字に強制変換している。；
      # 　./enju-flower/public/javascripts/ndl/sso/paswd.js　 pwdbox.value = pwdbox.value.toUpperCase();
      params[:j_password] = "ndl" if params[:j_password] == "NDL"
      # params[:j_username] = "A13000089"
    end
  end

  def dig(target, key1, key2) # immitating Hash#dig of ruby >= v2.3
    return nil if target.nil?
    key1st = target.key?(key1) ? target[key1] : {}
    key1st.key?(key2) ? key1st[key2] : nil
  end


end
@lib

module IssBridge
  # SYSTEM_SESSION_STORE = Rails.application.config.session_store #ActionDispatch::Session::MemCacheStore
  USE_SYSTEM_SESSION_STORE = true
  USE_SYSTEM_CACHE_STORE = true
  ISS_API_TIMEOUT =  %w(localhost 127.0.0.1).include?(`hostname`.sub(/\..*\s.*/,'')) ? 1 :  3

  class << self
    attr_accessor :use_system

    def cache_read(key, options = nil)
      Rails.cache.read(key, options) if USE_SYSTEM_CACHE_STORE
    end

    def cache_read_or_create(key, options = nil)
      Rails.cache.fetch(key, options) if USE_SYSTEM_CACHE_STORE
    end

    def cache_write(key, val = nil, options = nil)
      Rails.cache.write(key, val, options) if USE_SYSTEM_CACHE_STORE
    end

    def update(session, key, val = nil, _options = nil)
      return if session.nil?
      session[key] = val if USE_SYSTEM_SESSION_STORE
    end

    def cache_delete(key, options = nil)
      Rails.cache.delete(key, options) if USE_SYSTEM_CACHE_STORE
    end

    def check_card_authenticator(login_id = nil, cookies = nil)
      result = card_authentication_status(login_id, cookies)
      if result.blank? || result["type"] == "errorResponse"
        # NOTE: curl接続障害でtime outしたときもこのブロックに条件分岐してくる
        card_login_status = false
      elsif result.is_a?(Hash) && (result.key?('type') || result.key?('patron'))
        login_type = result.key?('type') ? result['type'] : result['patron']['type']
        card_login_status = login_type == "REGISTERED" ? true : false
      else
        # KSSセッション存在しない例:<h2>HTTP ERROR: 405</h2>
        card_login_status = false
      end
      [result, card_login_status]
    end

    def card_authentication_status(login_id, cookies)
      risashisu_session_id = cookies['sessionId'] || cookies['cookieId']
      return nil if login_id.nil? # TODO: || risashisu_session_id.nil?
      # RISASHISU-API: セッション延長APIの「セッションがimemcachedにあれば延長可能、そうでなければエラー応答」の仕組みを応用して認証
状態取得
      sso_api_query = "curl -X PUT 'http://10.2.66.42/sso/auth/internal/#{risashisu_session_id}' -H 'API-Key:ndlonline' -H 'API-Id:nd
lonline'"

      # PREVIOUS: RISAPI-API:
      # sso_api_query = "curl -X POST 'http://10.2.74.181:8081/risapi/session' --insecure"
      # sso_api_query << " -d 'cardId=#{login_id}' -d 'password=ndl'" #TODO: finalize KSS-password
      # sso_api_query << " -c #{Rails.root}/tmp/sso_cookie"

      # DUMMY
      # dummy = "{\\"cardId\\":\\"E02005744\\",\\"lang\\":\\"JPN\\",\\"name\\":\\"国立国会図書館９７０３\\",\\"patronId\\":\\"0000000
09786\\",\\"token\\":\\"ct5X4ZaByeZxBoiF8mk/PA==\\",\\"type\\":\\"REGISTERED\\"}"
      # JSON.parse(dummy)
      call_web_api sso_api_query
    end

    # cookie有効期限 延長
    def prolong_expiration_of_cookies(session, cookies, z308_key)
      return if cookies["_front_session_id"].nil? || z308_key.nil?
      Rails.logger.info "### expire @ #{session['_front_session_id'].try(:fetch, :expires)} ###"
      session_update_hash = update_hash.merge(:value => cookies["_front_session_id"])
      update(session, "_front_session_id", session_update_hash)
      cookie_update_hash = update_hash.merge(:value => z308_key)
      cookies["HTTP_Z308_KEY_DATA_01"] = cookie_update_hash
      Rails.logger.info "====>expiry was extended as @ #{update_hash[:expires]} "
      # ・利サシスにも状態フィードバック：セッション更新API
      return unless session['sessionId_RISASHISU'].is_a?(String)
      call_web_api " curl -X PUT 'http://10.2.66.42/sso/auth/internal/#{session['sessionId_RISASHISU']}' -H 'API-Key:ndlonline' -H 'A
PI-Id:ndlonline' "
    end




# ほかのSSO加盟システムでのSSO状態とシンクロするメソッド
    def sync_sso_data(session, cookies, request_env)
      login_id = nil
      session_key = cookies["_front_session_id"]
      # XXX: ブラウザー再起動などSSO画面身接触時ではsessionもcookiesにもsession_idはない
      login_id = session_key["HTTP_Z308_KEY_DATA_01"] if session_key.present?
      login_id = cookies["HTTP_Z308_KEY_DATA_01"] if login_id.blank?
      if login_id.blank? && session["HTTP_Z308_KEY_DATA_01"].is_a?(Hash)
        login_id = session["HTTP_Z308_KEY_DATA_01"].try(:fetch, :value)
      end
      login_id = session["HTTP_Z308_KEY_DATA_01"] if login_id.blank?

      card_auth_result, card_login_status = check_card_authenticator(login_id, cookies)
      # FIXME: finelize API calling/receiving
      card_auth_result = card_auth_result['patron'] if card_auth_result.try(:key?, 'patron')
      request_env["HTTP_Z_ENTERED_VIA_KSS"] = card_login_status
      update(session, "HTTP_Z_ENTERED_VIA_KSS", card_login_status)

      if card_login_status && card_auth_result
        login_id = card_auth_result['cardId']
        set_other_session_info_like_shibboleth(session, card_auth_result)
      end
      if login_id.present?
        request_env["HTTP_Z308_KEY_DATA_01"] = login_id if request_env["HTTP_Z308_KEY_DATA_01"].blank?
        # if session["HTTP_Z308_KEY_DATA_01"].blank?
        session_update_hash = update_hash.merge(:value => login_id)
        update(session, "HTTP_Z308_KEY_DATA_01", session_update_hash)
        # end
      end
      [login_id, card_login_status]
    end

    def domain_str
      APPLICATION_HOSTS =~ IPREGEX ? '' : ".#{APPLICATION_HOSTS}"
    end

    def update_hash
      { :domain => domain_str, :expires => Time.zone.now + SESSION_TIMEOUT }
    end

    def call_web_api(api_query, _retry_number = 0)
      api_query << " --max-time #{ISS_API_TIMEOUT} " #  --retry 3 --connect-timeout 3 などのオプションもある
      result = nil
      begin
        result = JSON.parse(IO.popen(api_query, "r+").gets)
      rescue StandardError
        # Rails.logger.warn if result.to_s.include?("このAPIへのアクセスは許可されていません。")
        Rails.logger.warn "      ___call_web_api query=____ #{api_query} \n result = #{result}____"
      end
      result
    end

    # KSS含む認証全般のｼﾎﾞﾚｽﾍｯﾀﾞｰ模擬
    # 従来NDLサーチではShibbolethではHTTPヘッダーにHTTP_Z***というものを付加する
    # 仕組みを前提としてログイン状態やアカウント情報表示に使用していた
    # その表示制御部分を擬似表現するメソッド
    def set_other_session_info_like_shibboleth(session, api_result)
      return if api_result.nil? || !api_result.key?("name")
      update(session, 'HTTP_Z303_NAME', api_result["name"])
      update(session, "HTTP_Z304_EMAIL_ADDRESS_01", (api_result["email"] || "")) # XXX: "hasEmail"=>true/false flag
      update(session, "HTTP_Z304_ADDRESS_2_01", (api_result["address"] || ""))
      update(session, "HTTP_Z304_ADDRESS_3_01", (api_result["postalCode"] || ""))
      update(session, "HTTP_Z304_ADDRESS_4_01", (api_result["shippingAddress"] || ""))
      update(session, "HTTP_Z304_ADDRESS_5_01", (api_result["phone"] || ""))
      # 下の行は視覚障害者むけnavigation表示につかう
      return unless api_result.key?('attrs') || api_result['attrs'].select { |i| i['value'] =~ /DAISY_(LIB|REEX|NOREEX)/ }.none?
      update(session, "HTTP_Z308_VISUALIMPAIRMENT_01", ('true' || ""))
    end

    # SSO関連情報破棄、後始末
    def tidy_up_current_user(session, cookies, request_env, current_user = nil)
      request_env.select { |k, _v| k[0..5] == "HTTP_Z" }.each { |k2, _v2| request_env.delete k2 }
      current_user = nil
      @current_user = current_user
      # ・利サシスにも状態フィードバック：セッション破棄API
      if session['sessionId_RISASHISU'].is_a?(String)
        call_web_api "curl -X DELETE 'http://10.2.66.42/sso/auth/internal/#{session['sessionId_RISASHISU']}' -H 'API-Key:ndlonline' -H 'API-Id:ndlonline'"
      end
      session.delete "HTTP_Z308_KEY_DATA_01"
      session.delete 'referer'
      session.delete 'sessionId_RISASHISU'
      cookies.delete 'sessionId' # ハイパージャンプ用明示的利サシスcookie
      cookies["HTTP_Z308_KEY_DATA_01"] = { :value => "", :domain => domain_str, :expires => Time.at(0) }
      cookies.delete("HTTP_Z308_KEY_DATA_01")
      Rails.logger.debug "=== tidy_up_current_user ==="
      [current_user, request_env]
    end
  end
end


