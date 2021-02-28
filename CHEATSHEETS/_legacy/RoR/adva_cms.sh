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


#adva-cms Know-how-----------------------------------------------------------------------------------------------------------------
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

#ADVA-CMS-HACK
		LOGOUT:	Parameters: {"return_to"=>"http://localhost:3000/", "action"=>"new", "controller"=>"session"}
			CACHE (0.0ms)   SELECT * FROM "sites" WHERE ("sites"."host" = 'localhost:3000') LIMIT 1
			CACHE (0.0ms)   SELECT * FROM "sections" WHERE ("sections"."parent_id" IS NULL) AND ("sections"."site_id" = 1) ORDER BY lft LIMIT 1
			  User Load (4.5ms)   SELECT * FROM "users" WHERE ("users"."id" = '1') LIMIT 1
			  SQL (1.5ms)   SELECT count(*) AS count_all FROM "users" WHERE (id = 1 AND remember_me = 'ee029d36aec513eb2e4c0ef2eccc8bc50f886fc5' AND verified_at IS NOT NULL)
			  User Load (15.1ms)   SELECT * FROM "users" WHERE ("users"."id" = 1) LIMIT 1

		LOGIN:	Parameters: {"action"=>"destroy", "_method"=>"delete", "authenticity_token"=>"fCmjxS2tJJLWqxy46mXGKcejW9uQffss4lcjX4eXZqo=", "controller"=>"session"}
			  CACHE (0.0ms)   SELECT * FROM "sites" WHERE ("sites"."host" = 'localhost:3000') LIMIT 1
			  CACHE (0.0ms)   SELECT * FROM "sections" WHERE ("sections"."parent_id" IS NULL) AND ("sections"."site_id" = 1) ORDER BY lft LIMIT 1
	(rdb:1056) SessionController.instance_methods.grep(/current/i)
		["current_user", "assign_current_user_to_models", "current_resource", "current_page"]
	(rdb:1163) current_user
		#<User id: 1, first_name: "some_body", last_name: nil, email: "some_body@gmail.com", homepage: nil, about: nil, signature: nil, password_hash: "d9e778c53529bcf488846230be0f6bf6f3a922d4", password_salt: "9ee11fa50003a673b6c783263a61770f37254b55", ip: nil, agent: nil, referer: nil, remember_me: nil, token_key: nil, token_expiration: nil, anonymous: false, created_at: "2009-07-25 09:19:17", updated_at: "2009-07-25 09:19:17", verified_at: "2009-07-25 09:19:16", deleted_at: nil>
	(rdb:1056) SessionController.instance_methods.grep(/veri/i)
		["verify_authenticity_token", "verified_request?", "verifiable_request_format?", "hash_for_verify_user_url", "verify_user_url", "formatted_verify_user_url", "hash_for_verify_user_path", "verify_user_path", "formatted_verify_user_path"]
	(rdb:1056) SessionController.instance_methods.grep(/user/i)
		["hash_for_new_user_url", "new_admin_user_path", "new_user_url", "hash_for_admin_site_user_url", "formatted_new_admin_user_path", "formatted_new_user_url", "admin_site_user_url", "hash_for_new_user_path", "formatted_admin_site_user_url", "hash_for_edit_admin_user_url", "new_user_path", "hash_for_admin_site_user_path", "edit_admin_user_url", "formatted_new_user_path", "formatted_admin_site_user_path", "formatted_edit_admin_user_url", "hash_for_edit_user_url", "hash_for_edit_admin_user_path", "edit_user_url", "edit_admin_user_path", "formatted_edit_user_url", "hash_for_user_roles_url", "formatted_edit_admin_user_path", "hash_for_edit_user_path", "user_roles_url", "edit_user_path", "formatted_user_roles_url", "hash_for_admin_user_url", "formatted_edit_user_path", "hash_for_user_roles_path", "admin_user_url", "current_user", "user_roles_path", "formatted_admin_user_url", "hash_for_verify_user_url", "formatted_user_roles_path", "hash_for_admin_user_path", "verify_user_url", "formatted_admin_user_path", "formatted_verify_user_url", "assign_current_user_to_models", "hash_for_verify_user_path", "hash_for_user_object_roles_url", "hash_for_admin_site_users_url", "verify_user_path", "user_object_roles_url", "handle_user_settings", "admin_site_users_url", "formatted_verify_user_path", "formatted_user_object_roles_url", "formatted_admin_site_users_url", "admin_site_users_path", "hash_for_user_url", "hash_for_user_object_roles_path", "authenticate_user", "hash_for_admin_site_users_path", "user_url", "user_object_roles_path", "formatted_admin_site_users_path", "formatted_user_url", "formatted_user_object_roles_path", "hash_for_user_path", "admin_users_path", "hash_for_new_admin_site_user_url", "user_path", "new_admin_site_user_url", "formatted_user_path", "formatted_new_admin_site_user_url", "admin_user_path", "hash_for_new_admin_site_user_path", "hash_for_admin_users_url", "admin_site_user_path", "new_admin_site_user_path", "admin_users_url", "formatted_new_admin_site_user_path", "formatted_admin_users_url", "hash_for_admin_users_path", "hash_for_edit_admin_site_user_url", "formatted_admin_users_path", "edit_admin_site_user_url", "formatted_edit_admin_site_user_url", "hash_for_new_admin_user_url", "hash_for_edit_admin_site_user_path", "new_admin_user_url", "edit_admin_site_user_path", "formatted_new_admin_user_url", "formatted_edit_admin_site_user_path", "hash_for_new_admin_user_path"]

	(rdb:1132) t(:'adva').keys
		[:wikipage, :wiki_helper, :session, :assets, :labels, :cells, :plugins, :messages, :signup, :footer, :theme_files, :locations, :sidebar, :roles, :state, :blog, :info, :spam, :common, :sections, :sites, :titles, :boards, :users, :categories, :themes, :topics, :wiki, :comments, :tracking, :resources, :settings, :posts, :articles, :passwords, :subscription, :cached_pages, :links, :flash, :wikipages_helper, :activity, :contents]
	(rdb:1132) t(:'adva.sites')
		{:no_sites=>"You currently do not have any sites created.", :title=>{:create=>"Create a new site", :home_section=>"Home section"}, :attributes=>{:host=>"Host", :name=>"Name"}, :no_users=>"Site does not have any users.", :hints=>{:admin_email=>"Shown in emails sent from your site", :host_name=>"Include the port if it's a non-standard one. E.g. localhost:3000"}, :confirm_delete=>"Are you sure you wish to delete this site?", :no_available_users=>"Site does not have any available user.", :label=>{:timezone=>"Website Timezone", :admin_email=>"Administrator email", :title=>"Website title", :host=>"Host name", :name=>"Website name", :subtitle=>"Website subtitle"}, :flash=>{:create=>{:success=>"The site has been created.", :failure=>"The site could not be created"}, :destroy=>{:success=>"The site has been deleted.", :failure=>"The site could not be deleted"}, :install=>{:success=>"Congratulations! You have successfully set up your site.", :error_already_complete=>"Installation is already complete. Please log in with your admin account.", :failure=>"The following models could not be created: {{models}}."}, :update=>{:success=>"The site has been updated.", :failure=>"The site could not be updated"}}, :links=>{:delete=>"Delete this site", :create_site_and_account=>"Create site & account ≫", :manage_new=>"Manage your new site &raquo;"}, :install=>{:success_fully_created=>"You have successfully created your site. Enjoy!", :section_default=>"Home", :can_always_change_settings=>"Don't worry. You can always change these settings later.", :welcome_to_installation=>"Welcome to the less-than-two-minutes installation process. Just fill in the information below and you're done. "}}
	(rdb:1132) t(:'adva.session')
		{:labels=>{:remember_me=>"Remember me"}, :flash=>{:create=>{:success=>"Logged in successfully.", :failure=>"Could not login with this email and password."}, :destroy=>{:success=>"Logged out successfully."}}}
	kkkkkkkk

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

