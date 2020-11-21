
### snipet-rails-prev-next-item-navigation
<% #一度に類似モジュール二個以上つくれと期待される場合のひながたコード;
  model =  eval(controller_name.singularize.classify)
  orm_models = controller_name
  new_document_id = model.ids.max.to_i + 1
  current_participant_index = @project.participants.ids.index(@participant.id)
  if current_participant_index
    prev_participant = current_participant_index == 0 ? nil : @project.participants[current_participant_index - 1]
    next_participant = @project.participants[current_participant_index + 1]
    prev_id = prev_participant&.send(orm_models)&.find_by(project_id: @project.id)&.id || new_document_id
    next_id = next_participant&.send(orm_models)&.find_by(project_id: @project.id)&.id || new_document_id
    prev_page = prev_participant ? "/pms/projects/#{@project.id}/participants/#{prev_participant.id}/#{controller_name}/#{prev_id}/edit" : nil
    next_page = next_participant ? "/pms/projects/#{@project.id}/participants/#{next_participant.id}/#{controller_name}/#{next_id}/edit" : nil
  else
    prev_page = next_page = nil
    prev_id = next_id = new_document_id
  end
%>







#YAML:    http://yaml-online-parser.appspot.com/
  #引用符：　'' の中に"": ' "***" ' でok
  #anchor & reference
    anchor_ios9later_only: &AP_ios9later_only
      Operations: iOS9以降のデバイスのみ設定できます。
    anchor_supervised_device_only: &AP_under_supervision
      Operations: &MSG_supervised_device_only 監視対象デバイスのみ制限できます。
      AirDrop: *AP_under_supervision

#Rspec::webmock
     [*0..s.size-1].each{|k| former_part=s[0..k]; latter_part=s[k+1..-1]; puts k if former_part.count("(") ==
latter_part.count(")")  }




HTML-codeing
  raw(***), ***.html_safe, h()  <---rails3以降は<%= は自動エスケープ

//form_tag　の　片側だけをif分で条件分岐生成はできない。
  pry()> show-method options_from_collection_for_select
  pry()> ri options_from_collection_for_select
//定数展開例；　　          when *ITEMNAMES4SUPERVISED_APPLE_DEVICE
  //不定HTMLtemplate変数引き渡し：　    <%= component_view_line(item, {index: local_assigns[:index].presence}) %>
  //不定引数SQL化：　uri_variable_value = uri_variable_value.nil? ? 'NULL' : %Q('#{uri_variable_value}')
//パフォチュー
  //render partial 排除：cf: http://www.ohmyenter.com/Railsアプリを『浅く』パフォーマンス・チューニングしてみる（その２）
    module BooksHelper
      extend ERB::DefMethod
      def_erb_method('render_book(book)', "#{Rails.root}/app/views/books/_book.html.erb")
    end

if ***count > 0 || **.present?  --->  if good_news.presence
users.each { |user| process_user(user) } --->  users.each(&method(:process_user))


//Time::
  コード内ではapplication.rbに設定されたタイムゾーンを使うように統一することが望ましいです。
  具体的には、Date.todayではなくDate.currentを、Time.nowではなくTime.current（またはTime.zone.now）を使うようにしてください。
  cf: RubyとRailsにおけるTime, Date, DateTime, TimeWithZoneの違い
//未来時間：***.(hours|days|months|years).since
//時間計算
	３時間ごと：work_hour_per_three = (9..24).to_a.collect { |x| ["#{x}:00"] if x % 3 == 0 }.compact.flatten
コンバーターパターン
  date [+-]  2.(hours|days|months|years)
  date.prev_week(:monday) # => 2013-10-28
  date.next_week(:monday) # => 2013-11-11
  time = Time.current
    # => Mon, 23 Nov 2015 16:45:23 JST +09:00
  time.all_day
  time.all_month
  time.all_year
//String::
  # ダッシュ(ハイフン)区切りにする
  "my_book".dasherize # => "my-book"
  # 人間が読みやすくする(一文字目は大文字 + スペース区切り)
  "my_books".humanize # => "My books"
  # タイトル形式にする(各単語の一文字目が大文字 + スペース区切り)
  "my_books".titleize # => "My Books"
  # クラス名にする(キャメルケース + 単数形)
  "my_book".classify  # => "MyBook"
  "my_books".classify # => "MyBook"
  # テーブル名にする(アンダースコア区切り + 複数形)
  "my_book".tableize # => "my_books"
  "MyBook".tableize  # => "my_books"
  cf: http://apidock.com/rails/String
  余分なスペースや改行を取り除く (2013.11.14追記)
  "    My    \r\n  \t   \n   books       ".squish # => "My books"


//troubleshooting
  Missing template-->強制render, 直感でtemplateフォルダーとパス全部作る。
  irm/mv Gemfile.lock
  rm db/schema.rb
  rake db:reset
  #debug
    #index.htmk.erb を偽装して通常のhtmlを表示させる方法＝＞ <%= stylesheet_link_tag 'scaffold' %>だけをのこしてあとをいれかえる
  //❌印は  h エスケープが原因か、特殊記号
禁則
  #Rails予約語　:-aで終わるロマンシュ語っぽい英語､information,policeもか?
  **create "rails test" add for troubleshooting such as installation of plugins.
  *never use "new/create/destroy/list/index/update/edit/" for controller/model/action name. otherwise Rails router get confused.
  *don't use "_" character for DB table/coolumn name. this way U can easily tell "_" of helper/plugin method name.
  *WiFI connection must check every 10 minutes before every donloading.
  *don't read japanese docment until you stuck into a trouble. it's waste of time.


  Rails3 でモデルやコントローラをネストしてスキャフォールドとかするメモ

  rails destroy scaffold 
#routes.rb .redirecting, layouts  http://railsdoc.com/routes
  Missing Template問題
    CVH: render|redirect_to '/?****/****'  unless    lookup_context.find_all('welcome/index').any?
    #INSPECT:  view_paths.paths[0].to_s
  regexp redirection
      get 'benefits/:controller/:action' => redirect("/benefits/%{controller}/_%{action}.html"),  :action => /^¥d¥d/
  : reload!
  : recognize-path localhost:3000/my/report/neuroblastoma/genes.html?ajax=true
  : recognize-path localhost:3000/my/report/neuroblastoma/genes.html?ajax=true
  : show-routes --grep ajax
  irb> app.passcode_mail_kohai_deliveries_path   # <= helperパスの確認方法
  http://qiita.com/yaotti/items/c6e850010f36acedb0e1


  AgileWebDeb-DHH
    P421:cache
      page caching:  simplest, inside httpd
      action caching:  inside ActionControler,  before-filter
      #option B:  sweeper-base
        class ArticleSweeper < ActionController::Caching::Sweeper
          observe Article
        ...(cf.--->p426)
      #option A:  controller-base
        class content_controller < ApplicationController
        before_filter :verify_method_name, :except=>:publi_content
        def public_content
          @articles=Article.list_public
        end
        def privte_content
          @articles=Article.list_premium
        end
        def create_article
          article=Article.new(params[:article])
          if article.save
            expire_page  :action=>"public_content"
          end
        end
        def update_article
          article=Article.new(params[:article])
          if article.save
            expire_action  :action=>"premium_content"  :id=>article
          end
        end
        def delete_article
          Article.destroy(params[:id])
          expire_page  :action=>"public_content"
          expire_action  :action=>"premium_content"  :id=>params[:id]
        end

        private
        def verify_method_name
          user=session[:user_id]
          user=User.find(user) if user
          unless user && user.active?
            redirect_to :controller=>"login", :action=>"signup_new"
          end
        end
        #edit /config/environments/XXX.rb
          config.action_controller.perform_caching=true/false
        #prepare network-drive to store cache
        fragment caching --->p477
        #セッションの失効
          #cron 60分ごとに２ｎｎをキャッシュ,public.action/idをキャッシュ削除  411.585,
            #SQL:  delete from session where now() - updated_at > 3600;
          #cron 60分ごとに２ｎｎをキャッシュ,public.action/idをキャッシュ削除  411.585,
            #cron:  find {#@@page_cache_directory}/public -name '*.html*' -ctime +10m -delete
        p213,538,585  #ruby script/runner 'Hoge.piyo' -e production
        これだとRailsのアプリケーションの環境そのままにHogeモデルのpiyoメソッドを呼び出すことができる。
        eオプションをつけることにより実行環境を選べる

        id  11  92  *265    251
        ActiveRecord294-299
          SQL直実行: (テーブルがすでにloadされたときだけつかえる initializerでERROR:  relation "ndl_repositories" does not existの時点では無効)
          find_by_sql以外の方法
  find_by_sql以外の方法もついでに紹介。
  ActiveRecord::Base.connection.select_all
  返り値はActiveRecord::Result、各要素はHashになっておりドットアクセスができない。プレースホルダーもActiveRecord::Base::sanitizeとかを使わないと利用できない。
  ActiveRecord::Base.connection.execute
  返り値はMysql2::Result。各要素の取得に一手間必要で面倒。
  ActiveRecord::Base.connection.select
  select_allとほぼ一緒。同じようなメソッドとしてdelete, insertもあるらしい。

      cycle (layoutスタイル交互切り替えhelper）
      link_to "Nonsense search", searches_path(:foo => "bar", :baz => "quux")
        # => <a href="/searches?foo=bar&amp;baz=quux">Nonsense search</a>
      link_to "Profile", @profile
        # => <a href="/profiles/1">Profile</a>
        <% link_to(@profile) do %>
          <strong><%= @profile.name %></strong> -- <span>Check it out!!</span>
      <% end %>
        # => <a href="/profiles/1"><strong>David</strong> -- <span>Check it out!!</span></a>
        #99 flash
        #ActonCtrler  before_filter 147,414
        #68,  335  validate_xxx
        #verify only=>[:method1a,:method1b] :except=>:method2,
          #:add_flash=> {:keyOrHash => "msg"},
          #:redirect_to=> params,
          #:params=> :keyOrHash,
          #:method=> :[:get/:post/:put/:delete],
          #:session=> :keyOrHash,
          #:xhr=> :keyOrHash,
          #:session=> :keyOrHash,
          #:add_flash=> {:hash=>hashvalue},
          #:add_headers=> {:hash=>hashvalue}e
          #:render=> params,
          #
        #before/after/around_filter :method1,only=>[:method1a,:method1b] :except=>:method2
        #before/after/around_filter do |cntroller_name|
          #--> controller.self.filter  #100  flash
      #335  validate_xxx

      #flash[:success|danger|alert|danger|notice]と4種つかえるが　redirect_to.*{success:|alert: ***}
      #  https://api.rubyonrails.org/classes/ActionController/Redirecting.html


  #写経 #rails2-180tips /ash
      JSON
        *rails 1系をrails2互換にする時は .attributes.to_json
        hash変換: JSON.decode(***)

  #Rails 2新比較
  find_all_by_columnname(値配列 ) as array

  #Railsよびだし
  	ActionView::Helpers, ActionController::Base.helpers ,


  #decorator
  	@M:
  		include Draper::Decoratable
  	@decorators/module_name/class_name.rb
  		module Hokensha
  			class MemberPasscodesDecorator < Draper::Decorator
  			delegate_all

  	Controller
  	module Api
    module V1
      # APIベースコントローラ
      class ApiController < ::ApplicationController
        class BadRequest          < StandardError; end
        ...
        skip_before_action :verify_authenticity_token
        before_action :authenticate_account!, except: [:render_404, :render_405]
        before_action :required_app_version!, except: [:render_404, :render_405]
        rescue_from StandardError, with: :rescue_exception

  #callbacks
  	prepend_before_filter ＞ before_filter
  	skip_before_filter #<---親コントローラー設定したフィルターを、子コントローラーでは無効化


transaction省略可能か？
	~/Downloads/src/kp-beryl/vendor/bundle/ruby/2.3.0/gems/activerecord-4.2.6/lib/active_record/connection_adapters/abstract/transaction.rb +182
	      def within_new_transaction(options = {})$
        transaction = begin_transaction options$
        yield$
      rescue Exception => error$
        rollback_transaction if transaction$
        raise$
      ensure$
        unless error$
          if Thread.current.status == 'aborting'$
            rollback_transaction if transaction$
          else$
            begin$
p "###########ここがはしる#####"$
              commit_transaction$


#title tag <tltle>
  def login_page_title
    # OPTIMIZE: ideally metatags below;
    # <meta http-equiv="X-UA-Compatible" content="IE=edge">
    # <meta name="viewport" content="width=960,user-scalable=yes">
    rp = request.path
    if %w(/userchg /user).include?(rp) || %w(/passwordchg /emailchg).map{|i| rp.start_with? i}.any?
      "#"
    else
      name_of_controller == 'sso' ? "%%%%%%" : nil
    end
  end



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


