設定
	単複同形：config/initializers/inflections.rb
情報取得
	port number
		request.howqt_with_port #via controller
		Rails::Server.new.options[:Port] #booting
	Rails.application.config.session_store
		ActionDispatch::Session::MemCacheStore
	IPaddress (gem 'ip_address' つかえないとき)
	  def get_localhost_ip_address
    ipaddresses = Socket.ip_address_list
    #IPv4ホスト群からでループバックでもマルチキャストでもないglobalIPv4 NIC情報を選考
    most_likely_ipv4_addrinfo = ipaddresses.select { |x| x.ipv4? && !x.ipv4_loopback? && !x.ipv4_multicast? && !x.ipv4_private? }
    #IPv4ホスト群に適当なglobalIPv4アドレス情報がなければIPv4private-address群のNIC情報を選考
    most_likely_ipv4_addrinfo = ipaddresses.select(&:ipv4_private?) if most_likely_ipv4_addrinfo.count == 0
    #選考されたIPv4ホスト群がしぼりきれなければ、英数ホスト名がふってあるNIC情報を選考
    most_likely_ipv4_addrinfo = most_likely_ipv4_addrinfo.select { |x| x.getnameinfo[0] =~ /[a-zA-Z]/ } if most_likely_ipv4_addrinfo.count > 1
    most_likely_address = most_likely_ipv4_addrinfo[0] #if most_likely_ipv4_addrinfo.count == 1
    #最終的に一個のIPアドレスを返す
    most_likely_address.inspect_sockaddr
  end

BASICninshou
	API: authenticate_or_request_with_http_basic
cookie< KVS
  # cookieに値をセットする
  # domainを指定するため共通化します
  def set_cookie(key, value)
    domain = (APPLICATION_HOSTS =~ IPREGEX) ? {} : {:domain => ".#{APPLICATION_HOSTS}"}
    cookies[key] = {:value => value}.merge(domain)
  end




	debug
		IE: http://d.hatena.ne.jp/stealthinu/20140515/p1
		Chrome: URLbar right-click || Developer Toolsを起動し、[Resources][Application]タブを選択します。そして[Storage]の[Cookies]をダブルクリックで展開し、個々のクッキーを選択します。
		Firefox: 開発ツールを起動し、[ストレージ]タブを選択します。そして左のペインで[Cookie]を展開します。Cookie - ストレージインスペクタ - 開発ツール | 
			またはFirebugとFirecookieをインストールし、FirebugのCookieタブを選択します。
	SSO @ application_controller
	  # cookieに値をセットするdomain指定共通method
  def set_cookie(key, value)
    domain = (APPLICATION_HOSTS =~ IPREGEX) ? {} : {:domain => ".#{APPLICATION_HOSTS}"}
    cookies[key] = {:value => value}.merge(domain)
  end
  def delete_cookie(key)
    domain = (APPLICATION_HOSTS =~ IPREGEX) ? {} : {:domain => ".#{APPLICATION_HOSTS}"}
    cookies.delete(key, domain)
  end
  # クッキー内の現検索条件を取得
  def get_cookie_parameter
    query_parameter = {}
    unless cookies[:books_query].blank?
      begin
        query_parameter = JSON.parse cookies[:books_query]
        query_parameter.symbolize_keys!
      rescue
        logger.warn "Cookie analyze error for query parameter:" + cookies[:books_query]
      end
      # クッキー内の現検索条件を削除
      #      delete_cookie(:books_query)
    end
    query_parameter
  end

  # ユーザ設定をクッキーに格納する
  def set_user_settings(params)
    return if params.blank?
    set_cookie :max_display_size, params[:max_display_size]
    set_cookie :prefecture_id, params[:prefecture_id]
    set_cookie :city, params[:city]
    set_cookie :library, params[:library]
    set_cookie :sort, params[:sort]
  end
  # 画面表示設定をクッキーに格納する
  def set_display_settings(params)
    return if params.blank?
    set_cookie :search_mode, params[:search_mode]
    set_cookie :display, params[:display]
    set_cookie :trans, params[:trans]
    set_cookie :mediatypes, params[:mediatypes]
    set_cookie :libraries, params[:libraries]
    set_cookie :repository_nos, params[:repository_nos]
    set_cookie :do_remote_search, params[:do_remote_search]
  end:

  # ユーザ設定をクッキーから取得する
  def get_user_settings
    settings = {}
    settings[:max_display_size] = cookies[:max_display_size]
    settings[:prefecture_id] = cookies[:prefecture_id]
    settings[:city] = cookies[:city]
    settings[:library] = cookies[:library]
    settings[:sort] = cookies[:sort]
    settings
  end
  # 画面表示設定をクッキーから取得する
  def get_display_settings
    settings = {}
    settings[:search_mode] = cookies[:search_mode]
    settings[:display] = cookies[:display]
    settings[:trans] = cookies[:trans]
    settings[:mediatypes] = cookies[:mediatypes]
    settings[:libraries] = cookies[:libraries]
    settings[:repository_nos] = cookies[:repository_nos]
    settings[:do_remote_search] = cookies[:do_remote_search]
    settings
  end

# ログインユーザにたいして画面表示設定を呼び出す
  # ログイン時にcurrent_userが取れないので、引数で渡すようにしています。
  def load_display_setting_from_user(user)
    if user && user.setting
      set_cookie :search_mode, user.setting.cache_search_mode unless user.setting.cache_search_mode.blank?
      set_cookie :display, user.setting.cache_display unless user.setting.cache_display.blank?
      set_cookie :trans, user.setting.cache_trans unless user.setting.cache_trans.blank?
      set_cookie :mediatypes, user.setting.cache_mediatypes unless user.setting.cache_mediatypes.blank?
      set_cookie :libraries, user.setting.cache_libraries unless user.setting.cache_libraries.blank?
      set_cookie :repository_nos, user.setting.cache_repository_nos unless user.setting.cache_repository_nos.blank?
      set_cookie :sort, user.setting.sort unless user.setting.sort.blank?
    end
  end

  # ログインユーザにたいして現在のクッキーの画面表示設定を保存する
  def save_display_settings_to_user
    if current_user && current_user.setting
      current_user.setting.cache_search_mode = cookies[:search_mode]
      current_user.setting.cache_display = cookies[:display]
      current_user.setting.cache_trans = cookies[:trans]
      current_user.setting.cache_mediatypes = cookies[:mediatypes]
      current_user.setting.cache_libraries = cookies[:libraries]
      current_user.setting.cache_repository_nos = cookies[:repository_nos]
      current_user.save
    end
  end




    # 画面表示設定をクッキーから取得してパラメータに設定する
  def merge_display_settings(params)
    params[:display] = cookies[:display]
  end
  def display_per_page
    unless cookies[:max_display_size].blank?
      return cookies[:max_display_size].to_i
    else
      return NdlData::Manifestation.per_page
    end
  end












	cf #Memcached 
	snippet
	
  def set_cookie_permanent(key, value)
    domain = (APPLICATION_HOSTS =~ IPREGEX) ? {} : {:domain => ".#{APPLICATION_HOSTS}"}
    cookies.permanent[key] = {:value => value}.merge(domain)
  end

