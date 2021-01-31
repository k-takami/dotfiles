
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