RoR1.8.7@3.0.0環境構築
OS: +chuser_apache
     +/etc/hosts
     + apphome permission apacheapache 777 configed

VIM: +NeoBundle+.dotfiles drawit+
DOTFILES
 +SCRIPTS/start.sh
 +rdebugrc+irbrc+vimrc
+production.rb *2

+RoR 1.8.7p374@3.0.1 readlineコンパイルインストール
  + ruby 1.8.7p374 source with ./ext/readline/* made install
  +ruby-debug0.10.4+rb-readline (0.4.0)+pry (0.7.2)+ rubocop -v 0.3.1
  rails c production enabled

RVM
 rvm use 2.4@5.0.1
   +rubocop
  +raspell@meCab

SRC: flower_sso_scaffolding
  dbext to bxrdbm_test/dev
  クラス名変更と
  now on  feature/5866_sso_migration
  +added5req-env-logged-in-withcookies_and_cache_storage
   +bootstrap3.3.7
   ＋rspec2.0.0にGEmfile.lockそろえた

#REDUNDANT
+YUM:  diatt
+tig
 shibboleth.rpm

#basic steps of making rails2 page
	What has been done so far?
		* Installed Rails
		http://localhost:3000/movies
		#gem install rails --include-dependencies
		* Pointed our web browser to the application and started entering and editing data
		* Created an aplication with the rails command
		$ ruby script/server
		$rails exchange
		* Started the webserver with the script/server command
		* Created the databases for the application with the rake command
		$ rake db:migrate
		$ rake db:create:all
		* Created the database table using the generated migration file
		* Used the script/generate command to create the scaffolding for the application
		$ ruby script/generate scaffold Movie title:string description:text one_sheet_url:string
	0)  note that rails url generatio follows "/C[controller-name]/V[view & method/action-name]/Mo[model & filetype parameter-name]/" format.
	1)  create "/app/controllers/[contoller-name]_controller.rb
		ruby script/generte controller [contoller-name] [optional:method/action-name]
	3)  if you need a DB table to be called from rhtml, perform followings in advance:
		ruby script/generte model [model-name]
		rake db:migrate
		#edit app/models/[model-name].rb to add columns ant its attribution.
			t.column  :title  :string
			t.column  :description  :text
			...
	3-2)if you want add/create something new in DB, do followings:
		ruby script/generte migration (add_[model-name]|create_[model-name])
	4*)  if you predict 4) above and also hence need 1)~3) above at onec, try "scaffold" as followings:
		in case of rails 1.2.x,
			CRUD methods/actions namely "_form, list, show, new, edit" and its views is generated automatically:
				ruby script/generte scaffold [model-name]  [controller-name]
		in case of rails 2.x.x,
			CRUD methods/actions namely "index, show, new, edit" and its views is generated automatically:
				ruby script/generate scaffold Movie title:string description:text one_sheet_url:string
				ruby script/generate scaffold News genre:string ndc1:string ndc2:string int_res:integer int_sbm:integer int_res:integer int_rating:integer txt_title:text txt_href:text kisha:string src1:string src2:string src3:string
					description:text one_sheet_url:string
					create test/functional/movies_controller_test.rb
						:
					route map.resources :movies
					create test/fixtures/movies.yml
					*create app/controllers/movies_controller.rb
						:
					create test/unit/movie_test.rb
					create app/views/movies/index.html.erb
					create db/migrate/001_create_movies.rb
						:
					create app/views/movies/show.html.erb
					*create app/models/movie.rb
					create app/views/movies/new.html.erb
					create public/stylesheets/scaffold.css dependency model
						:
					create app/views/movies/edit.html.erb
					create app/helpers/movies_helper.rb
					create app/views/layouts/movies.html.erb
				Description:
					Scaffolds an entire resource, from model and migration to controller and
					views, along with a full test suite. The resource is ready to use as a
					starting point for your RESTful, resource-oriented application.
					Pass the name of the model (in singular form), either CamelCased or
					under_scored, as the first argument, and an optional list of attribute pairs.
					Attribute pairs are column_name:sql_type arguments specifying the
					model's attributes. Timestamps are added by default, so you don't have to
					specify them by hand as 'created_at:datetime updated_at:datetime'.
					You don't have to think up every attribute up front, but it helps to
					sketch out a few so you can start working with the resource immediately.
					For example, 'scaffold post title:string body:text published:boolean'
					gives you a model with those three attributes, a controller that handles
					the create/show/update/destroy, forms to create and edit your posts, and
					an index that lists them all, as well as a map.resources :posts
					declaration in config/routes.rb.
					If you want to remove all the generated files, run
						'script/destroy scaffold ModelName'.
				Examples:
					`./script/generate scaffold post`
					`./script/generate scaffold purchase order_id:integer amount:decimal`
					`./script/generate scaffold post title:string body:text published:boolean`
	5)  define method/action in "/app/controllers/[controller-name].rb
		you may process content-type with "format.(Rhtml|Rxml|yaml) in method/action.,
		and map them by ":id.:format" in "routes.rb"
	6)  embed helper-ruby-script code in "/app/views/[contoller-name]/[method/action-name].(Rhtml|Rxmls|erb|rjs)"
		which was created by step 1) above
	x)  other
		rake doc:app
		ruby script/console
		ruby script/plugin list
		'script/destroy scaffold ModelName'.
		gems を使ってインストールしたほとんどのコマンドは gem 内のコードを実行するラッパーである。
		それらのコマンドでは、左右にアンダースコアを付加したバージョン番号を最初の引数として与えて実行することにより、gem のバージョンを指定することができる。
			rails _1.2.6_ my_rails_project
		#active form? session is not valid for mobile phone.
			rake db:sessions:create  ; rake:db:migrate;  => create session DBtable
			rake db:sessions:clear  ; rake:db:migrate;  => clear  session DBtable
		538  rake db:rollback
		539  ruby script/destroy scaffold News
		(erase all data & reqreates tables from schema)
			rake db:reset
		541  ruby script/generate scaffold News genre:string ndc1:string ndc2:string
		542  rake db:migrate
		543  ruby script/server&
#ruby/rails2 COMMAND
	plugin remove [pluginname]  =  uninstall [pluginname]
	To obtain a list of other [pluginname]
	rake tasks:  =  rake -T [pluginname]
		you@ecolnux:~/RoRapps/2chnrg$ rake --tasks
		(in /home/you/RoRapps/2chnrg)
		rake adva:assets:copy                     # Copy public assets from plugins to public/
			rake adva:install                         # install selected adva_cms engines (pick some with engines=all plugins=all or engines=name1,name...
			rake adva:install:all                     # install all adva_cms engines and plugins
			rake adva:install:core                    # install adva_cms core engines
			rake adva:uninstall                       # uninstall selected adva_cms engines (pick some with engines=all plugins=all or engines=name1,na...
			rake adva:uninstall:all                   # uninstall all adva_cms engines and plugins
			rake adva:uninstall:core                  # uninstall adva_cms core engines
		rake db:abort_if_pending_migrations       # Raises an error if there are pending migrations
		rake db:charset                           # Retrieves the charset for the current environment's database
		rake db:collation                         # Retrieves the collation for the current environment's database
		rake db:create                            # Create the database defined in config/database.yml for the current RAILS_ENV
		rake db:create:all                        # Create all the local databases defined in config/database.yml
		rake db:migrate:prepare                   # Copy migrations from plugins to db/migrate
		rake db:migrate                           # Migrate the database through scripts in db/migrate and update db/schema.rb by invoking db:schem...
		rake db:drop                              # Drops the database for the current RAILS_ENV
			rake db:drop:all                          # Drops all the local databases defined in config/database.yml
			rake db:migrate:reset                     # Resets your database using your migrations for the current environment
			rake db:reset                             # Drops and recreates the database from db/schema.rb for the current environment.
		rake db:fixtures:identify                 # Search for a fixture given a LABEL or ID.
		rake db:fixtures:load                     # Load fixtures into the current environment's database.
		rake db:rollback                          # Rolls the schema back to the previous version.
			rake db:migrate:down                      # Runs the "down" for a given migration VERSION.
			rake db:migrate:up                        # Runs the "up" for a given migration VERSION.
			rake db:migrate:redo                      # Rollbacks the database one migration and re migrate up.
			rake db:version                           # Retrieves the current schema version number
		rake db:schema:dump                       # Create a db/schema.rb file that can be portably used against any DB supported by AR
		rake db:schema:load                       # Load a schema.rb file into the database
		rake db:sessions:clear                    # Clear the sessions table
		rake db:sessions:create                   # Creates a sessions migration for use with ActiveRecord::SessionStore
		rake db:structure:dump                    # Dump the database structure to a SQL file
		rake db:test:clone                        # Recreate the test database from the current environment's database schema
		rake db:test:clone_structure              # Recreate the test databases from the development structure
		rake db:test:load                         # Recreate the test database from the current schema.rb
		rake db:test:prepare                      # Check for pending migrations and load the test schema
		rake db:test:purge                        # Empty the test database
		rake deploy                               # Release the website and new gem version
		rake doc:app                              # Build the RDOC HTML Files
			rake doc:clobber_app                      # Remove rdoc products
			rake doc:clobber_plugins                  # Remove plugin documentation
			rake doc:clobber_rails                    # Remove rdoc products
			rake doc:guides                           # Generate Rails guides
			rake doc:plugins                          # Generate documentation for all installed plugins
			rake doc:plugins:action_mailer_tls        # Generate documentation for the action_mailer_tls plugin
			rake doc:plugins:adva_activity            # Generate documentation for the adva_activity plugin
			rake doc:plugins:adva_assets              # Generate documentation for the adva_assets plugin
			rake doc:plugins:adva_blog                # Generate documentation for the adva_blog plugin
			rake doc:plugins:adva_calendar            # Generate documentation for the adva_calendar plugin
			rake doc:plugins:adva_cells               # Generate documentation for the adva_cells plugin
			rake doc:plugins:adva_cms                 # Generate documentation for the adva_cms plugin
			rake doc:plugins:adva_comments            # Generate documentation for the adva_comments plugin
			rake doc:plugins:adva_context_templates   # Generate documentation for the adva_context_templates plugin
			rake doc:plugins:adva_fckeditor           # Generate documentation for the adva_fckeditor plugin
			rake doc:plugins:adva_forum               # Generate documentation for the adva_forum plugin
			rake doc:plugins:adva_google_analytics    # Generate documentation for the adva_google_analytics plugin
			rake doc:plugins:adva_meta_tags           # Generate documentation for the adva_meta_tags plugin
			rake doc:plugins:adva_newsletter          # Generate documentation for the adva_newsletter plugin
			rake doc:plugins:adva_photos              # Generate documentation for the adva_photos plugin
			rake doc:plugins:adva_post_ping           # Generate documentation for the adva_post_ping plugin
			rake doc:plugins:adva_rbac                # Generate documentation for the adva_rbac plugin
			rake doc:plugins:adva_spam                # Generate documentation for the adva_spam plugin
			rake doc:plugins:adva_themes              # Generate documentation for the adva_themes plugin
			rake doc:plugins:adva_url_history         # Generate documentation for the adva_url_history plugin
			rake doc:plugins:adva_user                # Generate documentation for the adva_user plugin
			rake doc:plugins:adva_wiki                # Generate documentation for the adva_wiki plugin
			rake doc:rails                            # Build the RDOC HTML Files
			rake doc:reapp                            # Force a rebuild of the RDOC files
			rake doc:rerails                          # Force a rebuild of the RDOC files
		rake gems                                 # List the gems that this rails application depends on
			rake gems:build                           # Build any native extensions for unpacked gems
			rake gems:install                         # Installs all required gems.
			rake gems:refresh_specs                   # Regenerate gem specifications in correct format.
			rake gems:unpack                          # Unpacks all required gems into vendor/gems.
			rake gems:unpack:dependencies             # Unpacks all required gems and their dependencies into vendor/gems.
			rake install_gem_no_doc                   # Install the package as a gem, without generating documentation(ri/rdoc)
		rake local_deploy                         # Runs tasks website_generate and install_gem as a local deployment of the gem
		rake log:clear                            # Truncates all *.log files in log/ to zero bytes
		rake manifest:refresh                     # Recreate Manifest.txt to include ALL files
		rake middleware                           # Prints out your Rack middleware stack
		rake notes                                # Enumerate all annotations
			rake notes:custom                         # Enumerate a custom annotation, specify with ANNOTATION=WTFHAX
			rake notes:fixme                          # Enumerate all FIXME annotations
			rake notes:optimize                       # Enumerate all OPTIMIZE annotations
			rake notes:todo                           # Enumerate all TODO annotations
		rake paperclip:clean                      # Cleans out invalid attachments.
			rake paperclip:refresh                    # Refreshes both metadata and thumbnails.
			rake paperclip:refresh:metadata           # Regenerates content_type/size metadata for a given CLASS (and optional ATTACHMENT).
			rake paperclip:refresh:thumbnails         # Regenerates thumbnails for a given CLASS (and optional ATTACHMENT).
		rake rails:freeze:edge                    # Lock to latest Edge Rails, for a specific release use RELEASE=1.2.0
			rake rails:freeze:gems                    # Lock this application to the current gems (by unpacking them into vendor/rails)
			rake rails:template                       # Applies the template supplied by LOCATION=/path/to/template
			rake rails:unfreeze                       # Unlock this application from freeze of gems or edge and return to a fluid use of system gems
		rake rails:update                         # Update both configs, scripts and public/javascripts from Rails
			rake rails:update:application_controller  # Rename application.rb to application_controller.rb
			rake rails:update:configs                 # Update config/boot.rb from your current rails install
			rake rails:update:generate_dispatchers    # Generate dispatcher files in RAILS_ROOT/public
			rake rails:update:javascripts             # Update your javascripts from your current rails install
			rake rails:update:scripts                 # Add new scripts to the application script/ directory
		rake routes                               # Print out all defined routes in match order, with names.
		rake secret                               # Generate a crytographically secure secret key.
		rake stats                                # Report code statistics (KLOCs, etc) from the application
		rake test                                 # Run all unit, functional and integration tests
			rake test:benchmark                       # Run tests for benchmarkdb:test:prepare / Benchmark the performance tests
			rake test:functionals                     # Run tests for functionalsdb:test:prepare / Run the functional tests in test/functional
			rake test:integration                     # Run tests for integrationdb:test:prepare / Run the integration tests in test/integration
			rake test:plugins                         # Run tests for pluginsenvironment / Run the plugin tests in vendor/plugins/*/**/test (or specify...
			rake test:profile                         # Run tests for profiledb:test:prepare / Profile the performance tests
			rake test:recent                          # Run tests for recentdb:test:prepare / Test recent changes
			rake test:uncommitted                     # Run tests for uncommitteddb:test:prepare / Test changes since last checkin (only Subversion and...
			rake test:units                           # Run tests for unitsdb:test:prepare / Run the unit tests in test/unit
		rake time:zones:all                       # Displays names of all time zones recognized by the Rails TimeZone class, grouped by offset.
		rake time:zones:local                     # Displays names of time zones recognized by the Rails TimeZone class with the same offset as the...
		rake time:zones:us                        # Displays names of US time zones recognized by the Rails TimeZone class, grouped by offset.
		rake tmp:cache:clear                      # Clears all files and directories in tmp/cache
			rake tmp:clear                            # Clear session, cache, and socket files from tmp/
			rake tmp:create                           # Creates tmp directories for sessions, cache, sockets, and pids
			rake tmp:pids:clear                       # Clears all files in tmp/pids
			rake tmp:sessions:clear                   # Clears all files in tmp/sessions
			rake tmp:sockets:clear                    # Clears all files in tmp/sockets
		rake website                              # Generate and upload website files
		rake website_generate                     # Generate website files
		rake website_upload                       # Upload website files to rubyforge
		rake xss_terminate                        # Given MODELS=Foo,Bar,Baz find all instances in the DB and save to sanitize existing records

Rails2.Application.configure.config option
 ls config
["@allow_concurrency", "@autoload_paths", "@cache_classes", "@cache_store", "@consider_all_requests_local", "@dependency_loading", "@encoding"ssion_store", "@time_zone", "@@app_middleware", "@@generators", "@@options"]
=> nil

#POLYFILL
	C
		strong_parameter
		before_filter :require_or_permit_params, :only => [:execute_sso, :execute_sso_no_wrappwer]
def require_or_permit_params #<--- To be replaced by strong parameter after rails4<
    if params[:j_username].presence.nil?
      flash[:login_notice] = '認証に失敗しました'
      render :Login and return
    end
    params[:j_username] = "E00000001" #DEBUG
    params[:j_password] = "ndl"       #DEBUG
end


filter
	before_filter :single_sign_on, :if => Proc.new{ action_name != :Logoff && !request.referer.include?('Logoff') }
	引数つき：before_filter ( :except => [:Login, :Logout, :execute_sso]), { |this| this.パブリックメソッド名(引数) }


  #debugger for #rails2 ;
  sudo gem1.8 install ruby-debug xmpfilter rcodetools
    #ruby-debug #rails2 debugger
      喜ばしいことに、Rails 2.0ではruby-debug を使ったdebuggerが正式に採用されました。 これの使い方は非常に簡単です。
      まずは、以下のようにブレークポイントをコード中に書き込みます。
        ???1? def some_method
        ???2?   debugger # breakpoint
        ???3? end
        #@erb/rhtml       print "<% require 'ruby-debug' %>" print "<% debugger %>"
      続いて、Webサーバをデバッグモードで実行します。
        ???1? % ./script/server -u
      (rdb:)  $LOADED_FEATURES
      (rdb:2) info variables
        info instance_variables
      (rdb:2) info global_variables
        :  :

        #禁則
    			#irb  : 実行結果もソースも同じコンソールに表示され、逐次実効やブレークポイントなど設定できず、不便。
    			#ruby -rdebug [scriptname] はワーニングですぎで初心者向きじゃない。
    		#rdebug [scriptname]
    			(rdb:)+ help,
    		#rdebug object tree dislay
    			#rdebug v l : c g;  v cl; v i;  where
    			#etc
    			info args -- Argument variables of current stack frame
    			info breakpoints -- Status of user-settable breakpoints
    			info catch -- Exceptions that can be caught in the current stack frame
    			info display -- Expressions to display when program stops
    			info file -- Info about a particular file read in
    			info files -- File names and timestamps of files read in
    			info global_variables -- Global variables
    			info instance_variables -- Instance variables of the current stack frame
    			info line -- Line number and file name of current position in source file
    			info locals -- Local variables of the current stack frame
    			info program -- Execution status of the program
    				(rdb:1) p page.root.to_plain_text.grep(/TOEIC/).each{|el| p el +"\n"  }
    			xmpfilter "#=>" annotation embedding,
    				F12, F9,F8, F7
    			"require 'debugger'
    			you@ecolnux:~/RoRapps/dev232plain$ ruby script/runner -h
    				Usage: script/runner [options] ('Some.ruby(code)' or a filename)
    				-e, --environment=name           Specifies the environment for the runner to operate under (test/development/production).
    					Default: development
    				-h, --help                       Show this help message.
    				You can also use runner as a shebang line for your scripts like this:
    					-------------------------------------------------------------
    					#!/usr/bin/env /home/you/RoRapps/dev232plain/script/runner
    					Product.find(:all).each { |p| p.price *= 2 ; p.save! }
    					-------------------------------------------------------------
    			/script/performance/
    				benchmarker.rb  &  profiler.rb
    open-IDつかいたいならば -->  sudo gem install ruby-openid (since rails2)
    #rails2 plugins to install
    	ruby script/plugin install http://activescaffold.googlecode.com/svn/tags/active_scaffold -r rails-2.2
    	ruby ruby script/plugin install http://railsmyadmin.googlecode.com/svn/trunk/my_admin/
    	ruby script/plugin install http://activescaffold.googlecode.com/svn/tags/active_scaffold
    	ruby script/plugin install http://code.openrain.com/rails/action_mailer_tls/
    	ruby script/plugin install http://svn.plasticrain.com/projects/plugins/mysql_backup/
    	ruby script/plugin install http://github.com/two2twelve/onlooker.git
    	git submodule add git://github.com/two2twelve/onlooker.git vendor/plugin_name
    	ruby script/plugin install http://svn.robertrevans.com/gems/creator/
    	gem install creator
    	script/plugin install svn://rubyforge.org/var/svn/betternestedset/tags/stable/betternestedset
    	config
    		sudo apt-get install libxml2-dev libxslt1-dev git-core subversion
    		sudo gem1.8 install creator
    			sudo gem1.8 install schof-searchlogic
    			#copy/edit config/configgb.yml
    				sudo rake gems:install schof-searchlogic
    			sudo gem1.8 install railroad --local
    			sudo gem1.8 install jpmobile-0.0.4.gem --local
    				RAILS_ROOT/config/environment.rb の Rails::Initializer.run do |config| ? end 内に
    				config.gem "jpmobile"
    				の行を追加する。
    			=== pluginとしてインストールする場合
    			リリース版:
    				% ./script/plugin install http://jpmobile.rubyforge.org/svn/tags/rel-x.x.x/jpmobile
    				(x.x.xはバージョン)
    			開発版:
    				% ./script/plugin install git://github.com/darashi/jpmobile.git
    			sudo gem1.8 install gmailer --local
    		[-hpricot-]
    			sudo gem1.8 install hpricot mechanize
    				or sudo gems1.8 install mechanize --local
    		ruby script/plugin install http://github.com/two2twelve/onlooker
    			git submodule add git://github.com/two2twelve/onlooker.git vendor/plugin_name
    		action_mailer_tls プラグインを入れて config/mailer.yml に必要な情報を書いて
    			config/initializers/smtp_gmail.rb でactionmailerにオプションをセットするという感じ。
    			To install action_mailer_tls the plugin (the old way):
    				1. `./script/plugin install git://github.com/openrain/action_mailer_tls.git -r 'tag v1.0.0'`
    				2. Copy vendor/plugins/action_mailer_tls/sample/smtp_gmail.rb to config/
    				3. Copy vendor/plugins/action_mailer_tls/sample/mailer.yml.sample to config/
    				4. Update the configuration file with your settings
    				To install the gem (the preferred way):
    					1. `sudo gem install openrain-action_mailer_tls -s http://gems.github.com`
    					2. `./script/generate action_mailer_tls`
    					3. Copy RAILS_ROOT/config/smtp_gmail.yml.sample to RAILS_ROOT/config/smtp_gmail.yml
    					4. Update the configuration file with your settings
    				To (optionally) vendor this gem:
    					1. Add the following entry to config/environment.rb
    					* config.gem "openrain-action_mailer_tls", :lib => "smtp_tls.rb", :source => "http://gems.github.com"
    					2. rake gems:unpack
    				Testing it out
    				--------------
    					1. `./script/generate mailer Notifier hello_world`
    					2. Add the following lines to config/environments/development.rb
    					* config.action_mailer.raise_delivery_errors = true
    					* config.action_mailer.perform_deliveries = true
    					* config.action_mailer.delivery_method = :smtp
    					3. Update the recipients and from fields in app/models/notifier.rb
    					4. `./script/console `


