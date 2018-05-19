#RVM
#EC-suite-dependencies:
	ec-rider0.8.2/ec_front/ Rails requires RubyGems >= 1.3.2 (you have 1.3.1). Please `gem update --system` and try again.
	elecoma-2.0.3/ /usr/local/lib/site_ruby/1.8/rubygems/custom_require.rb:32:in `gem_original_require': no such file to load -- gettext (MissingSourceFile) from /RoR/EC/elecoma-2.0.3/config/environment.rb:9
	substruct_rel_1-3-1/ config.gem: Unpacked gem subexec-0.0.4 in vendor/gems has no specification file. Run 'rake gems:refresh_specs' to fix this. RubyGem version error: rack(1.0.1 not ~> 1.1.0) (Gem::LoadErr
##samplecodes
	//vi Gemfile&lock to replace/remove debugger->byebug, mysql, json
##tkt-redmine
	$ sudo apt-get install libxslt-dev libxml2-dev
	$ sudo aptitude install imagemagick
	$ sudo aptitude install libmagick++-dev
	$ gem install rmagick -v '2.13.2'
#redmine
	#禁則 
		Redmineで名前空間内衝突をおこし、そのままつかえない人気プラグイン
			#Paperclip::Attachment:Classと redmine-0.8.4/app/models/attachment.rbのAttachment:Classと名前衝突、誤動作
				/home/you/RoRapps/redmine-0.8.4/app/models/attachment.rb:34: undefined method `table_name' for Paperclip::Attachment:Class (NoMethodError)
			#jpmobile (* 0.9.5はbootエラーなし。)
				/home/you/RoRapps/redmine-0.8.4/vendor/plugins/jpmobile/lib/jpmobile/hook_action_view.rb:26: undefined method `find_template' for class `ActionView::PathSet' (NameError)
				--> require '/usr/lib/ruby/gems/1.8/gems/jpmobile-0.0.4/lib/jpmobile.rb'  
			
		#XXX_path, XXX_urlの書き換え
	#redmine3.2@ubuntu
		$ mkdir 2.2.2@rails4.2.7-redmine3.2
		// オーナーをSVN checkoutのためのwww-dataに変更
		$ sudo chown -R  www-data 2.2.2@rails4.2.7-redmine3.2/
		cd 2.2.2@rails4.2.7-redmine3.2/
		$ sudo apt-get install --no-upgrade  -y subversion postgresql postgresql-server-dev-9.3 # OPTIONALLY:  imagemagick libmagick++-dev fonts-takao-pgothic
		$ sudo -u www-data svn co http://svn.redmine.org/redmine/branches/3.2-stable ./
		// オーナーをいまつかっているunitユーザーにもどす
		$ sudo chown -R user 2.2.2@rails4.2.7-redmine3.2/
		
		$ sudo -u postgres createuser -P redmine
		$ sudo -u postgres createdb -E UTF-8 -l ja_JP.UTF-8 -O redmine -T template0 redmine
		
		`$ bundle install --path vendor/bundle`
		禁則: vendor/bundleはbyebugとの相性がわるいかも?
		// edit 2 YAML below caring TAB stops
			$ vi config/configuration.yml config/database.yml
		$ bundle exec rake generate_secret_token
		$ RAILS_ENV=development bundle exec rake db:migrate
		$ RAILS_ENV=production bundle exec rake db:migrate
		
		$ bundle exec rails s
		// login wiht admin / admin
		// JP.ja config
			http://localhost:3000/settings?tab=general
				テキストの書式: MarkDown
				プロトコルi: HTTPS when gmail
			http://localhost:3000/settings?tab=display
				Japanese , Admin redmine 表示
			http://localhost:3000/settings?tab=attachments
				ENCODING: utf-8,cp932,euc-jp
			http://localhost:3000/settings/edit?tab=notifications 
				デフォルトの送信者名redmine@example.netを適宜変更して保存してから送信リンクをクリックしてテストする｡保存しないでクリックするとメールヘッダーの送信者名は変わらない｡ 
		// admin>設定
			/>adminユーザー情報変更 
			>プロジェクト>モジュールにチェック
			>管理>メール通知画面　右下最下部のテストメール送信リンクでの確認 
		// 個別PJ>設定>モジュールにチェック
		http://localhost:3000/users/1 
			メールアドレス  root@localhost.localdomain　に設定 
			password再設定 
			time-zone  GMT+9 Tokyo 再設定 
	#redmine0.x overwriting-upgrade
		0.8.x series & 0.9.x series ---> DBに互換性なし
		sudo gem1.8 uninstall rack
		#rackup0.1, synatraもけす
		sudo gem1.8 install --version '= 1.0.1' rack
		rake db:migrate
		#vim /config/environment.rb
			chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
			secret = Array.new(60){chars[rand(chars.size)]}.join
			config.action_controller.session = { :key => "_hello_session", :secret => secret }
		rake db:migrate error
			#adva-cmsとはDBtable 'comments'が衝突してmigrate頓挫する。両方のcommentsテーブルは構成がにていて、ADVA-CMSのcommentsテーブルの方が多くのカラムを持つが、包含関係ではない。
			したがって互換性もなく、共存させたければADVA-CMSとRedmineのマイグレーションファイルをマージしてからmigrateするハックが必要。DBtable 'boards'も同様。
			comments
			boards
		#if redmine 0.8.x系 then
			environments.rb /config/environmnts/[envname]rb config.plugin_reload=true
	#redmine-command
		rails g redmine_plugin_model lgdis  evacuation_advisory id:integer:yes project_id:integer
		rails g redmine_plugin_controller lgdis  evacuation_advisories index 
		rails g redmine_plugin_controller lgdis issue_geographies
		rails g redmine_plugin_model lgdis issue_geography
		find . -name "*geog*" -print |sort
		root@localhost:/opt/LGDIS# rake -T |grep redmine
		root@localhost:/opt/LGDIS# rake routes|grep evacuation
	#redmine-plugin-objects
		RedmineApp::Application.routes.url_helpers.
		RedmineApp::Application.routes.url_for(
		rb(main):079:0>  Redmine::Plugin.registered_plugins[:lgdis].directory
		irb(main):080:0> Redmine::Plugin.registered_plugins[:lgdis].public_directory
		irb(main):081:0>  Redmine::Plugin.registered_plugins[:lgdis].url
		irb(main):082:0>  Redmine::Plugin.registered_plugins[:lgdis].methods.sort
	一般的開発手順
		vi plugins/***/init.rb
		vi /opt/fix/LGDIS/lib/redmine/plugin.rb
			# Migrates all plugins or a single plugin to a given version
			# Exemples:
			#   Plugin.migrate
			#   Plugin.migrate('sample_plugin')
		#scaffolding
			rails g redmine_plugin_model lgdis issues_addtion_datum id:integer:yes issue_id:integer
			      create  plugins/lgdis/app/models/issues_addtion_datum.rb
      create  plugins/lgdis/test/unit/issues_addtion_datum_test.rb
      create  plugins/lgdis/db/migrate/005_create_issues_addtion_data.rb

		rake redmine:plugins:migrate
			rake redmine:plugins:migrate RAILS_ENV=******
		rake db:migrate
		rake db:seed
		rake generate_secret_token
		rails runner Batches::MemcacheStore.execute
		rails server　--debugger
		rails console　--debugger
	#redmine plugin making つまるところ以下の手順でプラグインが開発できる。
		See: http://rails-engines.org/
		rake db:migrate_plugins
		1. script/generate redmine_plugin でプラグインの雛形を作る
			ruby script/generate redmine_plugin r2chnn
		6. /home/you/RoRapps/redmine-0.9.5/app/controllers/settings_controller.rb
		1b file-copy
			railsでつくったMVCをREDMINE/vendor/plugins 配下にコピーし差をうめ 　　
			元RailsAppのRAILS_ROOT/lib はREDMINE_ROOT/libにコピー
			元RailsAppのRAILS_ROOT/public/* はREDMINE_ROOT/public にコピー
			元RailsAppのRAILS_ROOT/public/images/* はREDMINE_ROOT/public/images/ にコピー
			元RailsAppのRAILS_ROOT/vendor/plugins/* はREDMINE_ROOT/vendor/lugins/ にコピー(ただしRedmineのbootエラーが出るプラグインはどこかに退避させる）
		3. Contoroller 移植(@project を基点にプロジェクトの情報を得る)
			#これをいれるとredmine標準layout   layout 'base'
				unloadable
				before_filter :find_project #, :authorize  <----会員専用ページ
				...
			private
				def find_project
				end
				@project=Project.find(params[:id])
			class
			EOF
			#プロジェクト配下では@projectインスタンス変数が必須になる為，URLで渡されたプロジェクトIDからProjectモデルのインスタンスを取得し，
			@projectイ ンスタンス変数にセットしています。基本的にすべての画面で必要になるため，before_filterで記述しています（①）。
		5. PLUGINROT/lang/nn.yml  config/locales 言語ファイルを書く
			lang/en.yml
				en:
					button_exec_deploy: Deploy!
					text_confirm_deploy: Are you sure you want to deploy?
			lang/ja.yml
				ja:
					button_exec_deploy: デプロイ！
					text_confirm_deploy: デプロイします。よろしいですか？
			アプリ側からメッセージを読み込むには「l」というメソッドの引数に言語ファイルで定義したラベルを指定します。
			app/views/deployments/index.html.erb
				<%= button_to l(:button_exec_deploy), { :action => "deploy", :project_id => params[:project_id] }, :confirm => l(:text_confirm_deploy) %>
		2. init.rb を編集する
			Redmine::Plugin.register :redmine_continuous_deployment do
				name 'Redmine Continuous Deployment plugin'
				version '0.0.1'
				author 'Takayuki Kyowa'
				description 'Redmine Continuous Deployment plugin'
			#メニューの追加先をプロジェクトメニューにしています 初期設定で最も重要なのは表示メニューへの追加です。追加可能な表示箇所は以下の4つに分類されます。 
				1. トップメニュー（top_menu）
				2. アカウントメニュー（account_menu）
				3. プロジェクト非選択時のアプリケーションメニュー（application_menu）
				4. プロジェクト選択時メニュー（project_menu）（①）。プロジェクトメニューa project-IDが必須にな ります。
			#:paramオプションで:project_idを指定するとURLにプロジェクトIDが付与されます(②)。
				menu :project_menu, :deploy_history,  # ①
					{ :controller => 'deployments', :action => 'index' }, :caption => "デプロイ", :last => true,
					:param => :project_id # ②
				#プロジェクトメニューはデフォルトで非表示にな っているため，permissionメソッドで表示/非表示を制御します(③)。
				#注意事項：URLを直打ちするとpermissionはきかない。一般公開を目的としたプラグインを作成する場合には指定せず権限の管理画面（/roles/report）からロール毎に表示／非表示を設定します。
					permission
					:deploy_histories,              # パーミッションの名前。パーミッション全体で一意でなければならない。
					{ :deployments => [ :index ] }, # 制御対象の画面をあらわすハッシュ。menuメソッドで指定したコントローラ / アクションを指定する。
					:public => true                 # trueにすると常に表示される。
			end
			#例
			class ModelName < ActiveRecord::Migration
				def self.up
				create_table :deploy_histories do |t|
					t.column :project_id, :integer    # デプロイ時のプロジェクト
					t.column :deployer_id, :integer   # デプロイしたユーザ
					t.column :changeset_id, :integer  # デプロイ時のチェンジセット（リビジョン）
					t.column :started_on, :datetime   # 開始時間
					t.column :deployed_on, :datetime  # 終了時間
					t.column :return_code, :integer   # デプロイの実行結果。コマンドの終了ステータスを保存する。
					t.column :log, :text              # デプロイのログ
				end
				end
				def self.down
				drop_table :deploy_histories
				end
			end
			一通り作成したらmigrateを実行します。
			$ RAILS_ENV=production rake db:migrate_plugins
		4. View を書く
			値の取得例：<%= button_to "デプロイ！", { :action => "deploy", :project_id => params[:project_id] } %>
			def hogehoge
				@project = Project.find(params[:project_id])
			end
			PG:redmine:plugin: setting/*erb のファイル名はインストール済みプラグインの名前空間で衝突しない独特名にしないと、早番順同名ファイルがよみこまれたりする。
			#PLUGIN_ROOT/app/views/で
				<%#  takami disabled below due to 'stack level too deep' error%>
				<%#  <%= stylesheet_link_tag 'scaffold' +|%>
		3. 共通設定移植
			application_contoroller の独自共通メソッド
			config/database.yml
			config/environments.rb
			config/routes.rb
	other memo
		#@editable はwiki_controller-->iMixinWikiController::def indexとよばれる。document_controllerではこのながれはない。
		#redminePG: http://localhost:3000/projects/convert/documents?sort_by=author  きかない docusmnt/index ではattachments.authorでソートするので添付ファイル泣ければ動作しない
#adva-cms Know-how
	#installation: follow the README.doc
	rake adva:install:core
	sudo rake adva:install engines=adva_theme,adva_assets
	sudo rake db:migrate
	#engines
		#adva-wiki
			post comment[s]
			MethodError in CommentsController#create
			undefined method `wiki_content_path' for #<CommentsController:0xb5163c34>
			RAILS_ROOT: /home/you/RoRapps/2chnrg
			Application Trace | Framework Trace | Full Trace
	#you@ecolnux:~/RoRapps/2chnrg$ rake adva:uninstall engines=blog
	#buggy
		redirection to previous page after login page does not work well. it makes a user being rejected login. but turns out successrful login only when the user goes to the root directory(ie., top page of the website)
			#rails2.3.2 最後リリースのADVA0.2.0インストール
				rails 2ch2 -m  /home/you/RoRapps/svenfuchs-adva_cms-ef1f561/templates/adva-cms.0.2.0.rb
			#rails2.3.2 最後リリースのADVA0.2.0 で めだったplugin
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/safemode/README.markdown
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/has_options/lib/has_options.rb
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/has_filter/lib/has_filter/filter.rb
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/has_filter/lib/has_filter.rb
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_cms/vendor/plugins/filtered_column/README
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_calendar/vendor/plugins/later_dude/README
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_newsletter/vendor/gems/cronedit-0.3.0/lib/cronedit.rb
				/home/you/RoRapps/svenfuchs-adva_cms-ef1f561/engines/adva_spam/vendor/plugins/viking/Readme.txt
	#ADVA-CMS-HACK
		LOGOUT:  Parameters: {"return_to"=>"http://localhost:3000/", "action"=>"new", "controller"=>"session"}
			CACHE (0.0ms)   SELECT * FROM "sites" WHERE ("sites"."host" = 'localhost:3000') LIMIT 1
			CACHE (0.0ms)   SELECT * FROM "sections" WHERE ("sections"."parent_id" IS NULL) AND ("sections"."site_id" = 1) ORDER BY lft LIMIT 1
				User Load (4.5ms)   SELECT * FROM "users" WHERE ("users"."id" = '1') LIMIT 1
				SQL (1.5ms)   SELECT count(*) AS count_all FROM "users" WHERE (id = 1 AND remember_me = 'ee029d36aec513eb2e4c0ef2eccc8bc50f886fc5' AND verified_at IS NOT NULL)
				User Load (15.1ms)   SELECT * FROM "users" WHERE ("users"."id" = 1) LIMIT 1
		LOGIN:  Parameters: {"action"=>"destroy", "_method"=>"delete", "authenticity_token"=>"fCmjxS2tJJLWqxy46mXGKcejW9uQffss4lcjX4eXZqo=", "controller"=>"session"}
			CACHE (0.0ms)   SELECT * FROM "sites" WHERE ("sites"."host" = 'localhost:3000') LIMIT 1
			CACHE (0.0ms)   SELECT * FROM "sections" WHERE ("sections"."parent_id" IS NULL) AND ("sections"."site_id" = 1) ORDER BY lft LIMIT 1
		(rdb:1056) SessionController.instance_methods.grep(/current/i)
		(rdb:1163) current_user
		(rdb:1056) SessionController.instance_methods.grep(/veri/i)
		(rdb:1056) SessionController.instance_methods.grep(/user/i)
		(rdb:1132) t(:'adva').keys
		(rdb:1132) t(:'adva.sites')
		(rdb:1132) t(:'adva.session')
			Rails::Initializer.run do |config| $rails_config = config end
		$rails_config.to_a.split(/@/)
		#VMguest@local
		procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
			r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
				3  0    153      4      5     45    0    0    21    16  144   29  9 15 75  1
		root@ecolnux:~/RoRapps/2chnrg/vendor/adva/engines# grep -inR "site.host.*=" *
		adva_blog/test/integration/admin/blog_article_test.rb:44:      request.url.should == "http://#{@site.host}/2008/1/1/the-article-title?cl=en"
		adva_cms/test/unit/models/site_test.rb:81:    @site.host = '    t e s t.advabest.de'
		adva_cms/test/unit/models/site_test.rb:86:    @site.host = 't e s t.advabest.de'
		adva_cms/test/unit/models/site_test.rb:91:    @site.host = 't e s t.advabest.de    '
		adva_cms/test/integration/admin/section_article_test.rb:98:      request.url.should == "http://#{@site.host}/articles/the-article-title?cl=en"
		adva_cms/test/integration/admin/section_article_test.rb:103:      request.url.should == "http://#{@site.host}/articles/the-article-title-de?cl=de"
		adva_cms/test/integration/admin/sites_test.rb:30:      fill_in 'site[host]',  :with => 'http://the-new-site.com'
		adva_newsletter/test/unit/model/issue_test.rb:325:    @issue.body = %(<a href="http://#{@issue.newsletter.site.host}/newest-products.html?order=date">View our newest products</a>)
		adva_newsletter/test/unit/model/issue_test.rb:328:    expected = %(<a href="http://#{@issue.newsletter.site.host}/newest-products.html?order=date&utm_medium=newsletter&utm_campaign=#{URI.escape(@issue.tracking_campaign)}&utm_source=#{URI.escape(@issue.tracking_source)}">View our newest products</a>)
		adva_newsletter/test/unit/model/issue_test.rb:334:    @issue.body = %(<a href="http://#{@issue.newsletter.site.host}/newest-products.html?order=date">View our newest products</a>)
		adva_newsletter/test/unit/model/issue_test.rb:339:    @issue.body_html.should == %(<a href="http://#{@issue.newsletter.site.host}/newest-products.html?order=date">View our newest products</a>)
		root@ecolnux:~/RoRapps/2chnrg/vendor/adva/engines# grep -inR "request.host.*=" *
		adva_cms/test/contexts.rb:11:    @request.host = @site.host if @request && @site
		adva_cms/test/test_helper/extensions/rails_patch.rb:34:    request.host = @request.host if @request
		adva_forum/test/functional/forum_cache_references_test.rb:14:    @request.host = @forum.site.host
		adva_forum/test/functional/forum_cache_references_test.rb:53:    @request.host = @forum.site.host
		root@ecolnux:/usr/lib/ruby/gems/1.8/gems/mongrel-1.1.5# grep -inR "3000" *
			README:63: h = Mongrel::HttpServer.new("0.0.0.0", "3000")
			README:68:If you run this and access port 3000 with a browser it will say "hello!".  If you access it with any url other than "/test" it will give a simple 404.  Check out the Mongrel::Error404Handler for a basic way to give a more complex 404 message.
			bin/mongrel_rails:27:        ['-p', '--port PORT', "Which port to bind to", :@port, 3000],
			examples/mongrel.conf:8::port: 3000
			examples/mongrel_simple_service.rb:110:  :port            => 3000,
			examples/camping/tepee.rb:146:  server = Mongrel::Camping::start("0.0.0.0",3000,"/tepee",Tepee)
			examples/camping/tepee.rb:147:  puts "** Tepee example is running at http://localhost:3000/tepee"
			examples/builder.rb:17:  listener :port => 3000 do
			lib/mongrel/configurator.rb:14:  #     listener :port => 3000 do
			lib/mongrel.rb:56:  #   server = HttpServer.new("0.0.0.0", 3000)
		root@ecolnux:/usr/lib/ruby/gems/1.8/gems/mongrel-1.1.5# cd ../mongrel_cluster-1.0.5/
		root@ecolnux:/usr/lib/ruby/gems/1.8/gems/mongrel_cluster-1.0.5# grep -inR "3000" *
			lib/mongrel_cluster/init.rb:20:        "port" => 3000,
			lib/mongrel_cluster/init.rb:287:        ['-p', '--port PORT', "Starting port to bind to", :@port, 3000],
#Spree with #rails2 
	#spree normal installaton )----------------------------------------------------
		#NG: gem1.8 update spree
			#version 0.9.1 rubygemへの依存度やバージョン管理がややこしくて、updateはおろかinstallすらむずかしい
			#gem install spreeで通信応答せず。git cloneでもってきて以下をやるがだめ。
			#製作者たちにしかupdate/nstallできないソフトはパッケージとは言えず特注システムでしかない。
				sudo gem1.8 update authlogic
				sudo gem1.8 install chriseppstein-compass
				sudo gem1.8 install rsl-stringex
				sudo gem1.8 install javan-whenever
				sudo gem1.8 install searchlogic
				#mv config/database.yml.sample config/database.yml
				#vim config/environment.rb ":
					config.gem 'haml', :version => '>=2.2.0'
				sudo rake db:migrate
				rake db:admin:create
		#かりにspreeのアンインストールコマンドが充実していたら、以下の2chnrgとの統合も検討の余地が出てくる：
			#rename 2chnrg
			#spree -s 2chnrg -d mysql
			cd 2chnrg
			#migrate config/database.yml
			#paste /vendor/lib/smtp_tls.rb for ruby1.8.7 compatibility bug
			rake db:bootstrap
			rake db:migrate
	#spree on heroku (failed)----------------------------------------------------
		sudo gem1.8 sources -a http://gems.github.com
		cd -
		git clone git://github.com/schof/spree.git spree
		rake -h;rails -v
		vim config/boot.rb
		vim lib/tasks/release.rake
		rake gems:install
		cd spree/config/
			cp database.yml.example database.yml
			#edit config/boot.rb line58 as follows
				load_rails("2.2.2")  # note: spree requires rails 2.2.2 (change at your own risk)
			touch #RAILS_ROOT/lib/smtp_gmail.rb
			#vim smtp_gmail.rb above
			#vim database.yml
		#rake gems:install
		grep -R 1.15 *
		vim config/environment.rb
		sudo gem1.8 install has_many_polymorphs
		sudo gem1.8 install highline --version 1.4.0
		sudo gem1.8 install mini_magick
		sudo gem1.8 install tlsmail
			cp -R calendar_date_select-1.15/ /home/you/RoRapps/spree/spree/vendor/gems/
			cp -R authlogic-2.0.9/ /home/you/RoRapps/spree/spree/vendor/gems/
			cp -R activemerchant-1.4.1/ /home/you/RoRapps/spree/spree/vendor/gems/
			cp -R has_many_polymorphs-2.13/ /home/you/RoRapps/spree/spree/vendor/gems/
			cp -R highline-1.4.0/ /home/you/RoRapps/spree/spree/vendor/gems/
			cp -R mini_magick-1.2.3/ /home/you/RoRapps/spree/spree/vendor/gems/
			cp -R tlsmail-0.0.1/ /home/you/RoRapps/spree/spree/vendor/gems/
		#install postgresql
			sudo apt-get install postgresql postgresql-client postgresql-contrib pgadmin3
			# PostgreSQLe¨-aR?a<80>?
				# passwd postgres ##postgresa?|a??a?¶a??a?Ra??a?1a?￣a??a??a??e¨-aR?a<80>?
				# su postgres
				$ psql template1
					template1=# alter user postgres with password '******'; ## ******a?￣e?ca??a?aa??a?1a?￣a??a??a??e¨-aR?a<80>?
					template1=# \q ## \qa?§cμ?ao?a<80>?
				$ createuser -AdPE hoge ## hogea?￣e?ca??a?aa，<80>e?￢a?|a??a?¶a??a?，a<80>?a，<80>e?￢a?|a??a?¶a?，a?Ra??a??a??a??a??a?1a??a??a¨ce??e¨-aR?a<80>?
				$ vi /etc/postgresql/8.3/main/postgresql.conf
					listen_addresses = 'localhost'
					a??
					listen_addresses = '*' ##'*'a?，a??a?´a<80>?
				$ vi /etc/postgresql/8.3/main/pg_hba.conf
					##a≫\a，?a??a??a?!a??a?≪a?<80>a，?e?¨a?，e??a??a<80>?192.168.11.1a?￣a??e?aa??a??a??a?￣a??a?￣c?°a￠?a?，a<80>?
					local   all         all                               trust
					host    all         all  192.168.11.1 255.255.255.255  trust
					host    all         all  0.0.0.0     0.0.0.0          password crypt
				$ exit
			# /etc/init.d/postgresql-8.3 restart
		edit database.yml configuration:
			development:
			adapter: postgresql
			host: localhost
			port: 5432
			database: postgres
			username: postgres
			password: [your-password]
		rake db:bootstrap
			Create the admin user (press enter for defaults).
			Email [spree@example.com]:
			Password [spree]:
			Load Sample Data? [y]:
			Sample products have been loaded into to the store
			Finished.
	#summary of spree new app local generation
		spree [railsappname] -d mysql
		mysqladmin create [dbname] -u root -p
		cd [railsappname]
		#edit config/database.yml
		#paste /vendor/lib/smtp_tls.rb for ruby1.8.7 compatibility bug
		rake db:bootstrap
		rake db:migrate
		sudo ruby script/server -p 80 -u
		#login to http://localhost/admin/products/ and edit "Available on:" date making it to be the PAST date
			Email [spree@example.com]:
			Password [spree]:


