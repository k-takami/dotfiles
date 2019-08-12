    snippet_rails_session_basic  read/write基本（ロケットハッシュはダメ, ページ移動すると数値キーが数字に化ける）
          session['pj'] = {@project.id => {'switch' => params[:switch] == 'true'}}
          @switch   = session.to_hash.dig('pj', @project.id.to_s, 'switch')
          @switch ||= CertificateDocument.find_by(project_id: @project.id).issued_by_manual if @switch.nil?


    snippet_post_method_1_erb
      <%= select_tag 'filt',
       options_for_select(['Selected Participants', 'LAc Issued', 'Completed', 'Report Submission', 'PCE']),
       class: 'custom-select col-md-4', prompt: t('pulldown.default'),
       onchange: 'Rails.fire($(this).closest("form")[0], \'submit\')' %>


    snippet_after_posting
     <script src="https://code.jquery.com/jquery-3.1.0.slgtim.min.js"></script>
     render html: '<body onload="window.opener.location.reload(); window.close()"></body>'.html_safe



    snippet_persist_selected_values ●選択状態簡易永続化して絞り込み表示： 注意：session.to_hはシンボル消滅、request.refererはURLバーからのEnterで消失。どちらも消える
      前画面　@C, @H
          session['bulk_modelnames'] = {approval_flow.slip_no => slips.pluck(:modelname_id)}

      遷移後画面　@V
      <%
        possible_approval_id = request.referer&.slice(/approval_object_lists\/(\d+)/, 1)
        selection = session.to_hash.dig('bulk_modelnames', ApprovalFlow.find_by(id: possible_approval_id)&.slip_no)
        selection = params[:selected]&.split&.map(&:to_i) if selection.blank?
      %>
      <label><%= check_box_tag name="selected[]", value=modelname.id, checked=selection&.include?(modelname.id) %></label>

      遷移後画面　@C
      possible_approval_id = request.referer&.slice(/approval_object_lists\/(\d+)/, 1)
      if possible_approval_id
        selection = session.to_hash.dig('bulk_modelnames', ApprovalFlow.find_by(id: possible_approval_id)&.slip_no)
        @some_collection = .where(modelname_id: selection)
        # 予備: selection = params[:selected]&.split&.map(&:to_i)
        return
      end


    # sessions & cookies (* safariではsessionのふるまいがちがいすぎる）
      # ユーザエージェントより、どのブラウザよりアクセスかを特定
      def user_agent
        ua = request.env['HTTP_USER_AGENT']
        agent_keywords_and_kinds = {
          'MSIE' => 'ie', 'WOW64' => 'ie', 'SV1' => 'ie',
          'hrome' => 'chrome', 'irefox' => 'firefox', 'pera' => 'opera',
        }
        agent_keywords_and_kinds.each { |k, v| return v if ua.include? k }
        return 'apple' if ua =~/(safari|ipod|ipad|iphone|applewebkit)/
        return 'others'
      end

      def set_special_cookie(key, value)
        # ブラウザー閉じたらクッキー破棄したいので有効期限設定 :expires => SESSION_TIMEOUT.from_now なしてcookie設定；
        # localhost限定事象への対策：
        #   IEはクロスドメインのcookieをうけとってくれ、
        #   FireFoxはアクセスしたhostnameのドメイン指定cookieまたはドメイン無指定cookieしかうけとらず、
        #   Google Chromeはドメイン指定するとRailsからのCookieをうけとってくれない。
        if !IB.is_localhost || user_agent == 'ie'
          # NOTE: 設計書どおりのサブドメイン指定クッキー
          option_hash = { :domain => ".#{APPLICATION_HOSTS}" }
          cookies[key] = { :value => value }.merge(option_hash)
        elsif user_agent == 'firefox'
          # option_hash = { :domain => ".#{APPLICATION_HOSTS}"}
          option_hash = { :domain => ".#{IB.simple_hostname}" }
          cookies[key] = { :value => value }.merge(option_hash)
        else # such as Google Chrome correspnding with localhost
          # option_hash = { :domain => ".#{APPLICATION_HOSTS}"}
          # cookies[key] = { :value => value }.merge(option_hash)
          cookies[key] = { :value => value }
        end
      end

      # SSO関連情報破棄、後始末
      def tidy_up_current_user(session, cookies, request_env, current_user = nil)
        httpz_elements_of(request_env).each { |k, _v| request_env.delete k }
        httpz_elements_of(cookies).each {     |k, _v| cookies.delete k }
        httpz_elements_of(session).each {     |k, _v| session.delete k }
        current_user = nil
        @current_user = current_user
        # ・利サシスにも状態フィードバック：セッション破棄API
        risashisu_session_id = cookies[@shared_cookie_key_name] || cookies['sessionId'] || session['sessionId_RISASHISU']
        if risashisu_session_id.is_a?(String)
          call_web_api "curl -X DELETE '#{@api_endpoint}/#{risashisu_session_id}' -H 'API-Key:#{@api_key}' -H 'API-Id:ndlonline'"
        end
        session.delete @user_id_key
        session.delete 'sessionId_RISASHISU' ;m(20) # ;m(21, risashisu_session_id)
        # ﾄﾞﾒｲﾝ指定cookieは上書き消去で :cookieId/sessionId = ハイパージャンプ用明示的利サシスcookie
        cookies[@shared_cookie_key_name] = { :value => "", :domain => domain_str, :expires => Time.at(0) }
        cookies[@user_id_key] = { :value => "", :domain => domain_str, :expires => Time.at(0) }
        cookies["sessionId"]             = { :value => "", :domain => domain_str, :expires => Time.at(0) }
        [current_user, request_env]
      end

      def httpz_elements_of(collective_object)
        collective_object.select{|k, _v| k[0..5] == "HTTP_Z" }
      end

      def to_hash_even_from_arrayish(target_obj)
        if target_obj.is_a?(Array)
          target_obj << nil if target_obj.size.odd?
          target_obj = Hash[*target_obj.flatten]
        end
        target_obj ||= {}
      end

    snippet_rails_c_redirectback: return redirect_to request.referer, flash: { danger: (e&.message || error&.message } if (e || error)


    snippet_create_update_desdtroy_another_formsession: @C
      before_redirect: session['switch'] = params[:switch] == 'true'
      after_redirect:  @switch = session.to_hash.dig('switch')


