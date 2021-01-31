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

    #Rails 2 3 新比較
    find_all_by_columnname(値配列 ) as array ---> where
    ref: https://qiita.com/jnchito/items/2b7d64851665071ed6e6



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

  #debugger;
    #禁則
      #irb  : 実行結果もソースも同じコンソールに表示され、逐次実効やブレークポイントなど設定できず、不便。
      #ruby -rdebug [scriptname] はワーニングですぎで初心者向きじゃない。
    rdebug [scriptname]
      (rdb:)+ help,
    rdebug object tree dislay
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

     #debugger & help-manual installation
       sudo gem1.8 install ruby-debug
       xmpfilter
         sudo gem1.8 install rcodetools
         sudo gem1.8 install fastri
           fastri-server -b; fastri-server -B  ;#create TOC & full-text-index @ ~/.fastri-***
           fastri-server       ;#invoke index server, instead you can use -L  option to be offline.
           fri -h;fri -e NKF


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

