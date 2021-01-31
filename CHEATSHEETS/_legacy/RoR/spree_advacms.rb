#RVM
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

#EC-suite-dependencies:
	ec-rider0.8.2/ec_front/ Rails requires RubyGems >= 1.3.2 (you have 1.3.1). Please `gem update --system` and try again.
	elecoma-2.0.3/ /usr/local/lib/site_ruby/1.8/rubygems/custom_require.rb:32:in `gem_original_require': no such file to load -- gettext (MissingSourceFile) from /RoR/EC/elecoma-2.0.3/config/environment.rb:9
	substruct_rel_1-3-1/ config.gem: Unpacked gem subexec-0.0.4 in vendor/gems has no specification file. Run 'rake gems:refresh_specs' to fix this. RubyGem version error: rack(1.0.1 not ~> 1.1.0) (Gem::LoadErr
##samplecodes
	//vi Gemfile&lock to replace/remove debugger->byebug, mysql, json



