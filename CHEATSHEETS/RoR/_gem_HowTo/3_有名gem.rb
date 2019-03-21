#rails3 #rails4
	#Active scaffold
		#rails2.x
			script/plugin install git://github.com/lackac/render_component.git -r rails-edge
			cd /vendor/plugins;
			git clone git://github.com/activescaffold/active_scaffold.git activescaffold
			*normal motion on rails 2.2.x is suspicious. to b checked. ouhave to "git clone" & edit"config/environment.rb":
			#NOTE: not natively compatible with Spree app.
		#rails1.x
			ruby script/plugin install http://activescaffold.googlecode.com/svn/tags/active_scaffold
			ruby script/plugin install http://activescaffold.googlecode.com/svn/tags/active_scaffold -r rails-2.2
	#WWW::Machanize
		sudo vim  /usr/lib/ruby/gems/1.8/gems/mechanize-0.9.2/lib/www/mechanize.rb
		User Agent aliases takami
			AGENT_ALIASES = {
			'Windows IE 6' => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)',
			'Windows IE 7' => 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)',
			'Windows Mozilla' => 'Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4b) Gecko/20030516 Mozilla Firebird/0.6',
			'Mac Safari' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/418 (KHTML, like Gecko) Safari/417.9.3',
			'Mac FireFox' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.3) Gecko/20060426 Firefox/1.5.0.3',
			'Mac Mozilla' => 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.4a) Gecko/20030401',
			'Linux Mozilla' => 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20030624',
			'Linux Konqueror' => 'Mozilla/5.0 (compatible; Konqueror/3; Linux)',
			'iPhone' => 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3',
				'SO903i' => 'DoCoMo/2.0 F903i(c100;TJ)',
			#     #
			'Mechanize' => "WWW-Mechanize/#{VERSION} (http://rubyforge.org/projects/mechanize/)"
			}
				sudo gem1.8 install schof-searchlogic
				#copy/edit config/configgb.yml
					sudo rake gems:install schof-searchlogic
				sudo chmod 664 /usr/lib/ruby/gems/1.8/gems/sqlite3-ruby-1.2.4/lib/sqlite3/database.rb
				sudo chmod 664 /usr/lib/ruby/gems/1.8/gems/sqlite3-ruby-1.2.4/lib/sqlite3/translator.rb
	#ri and fast-ri
		#ri tutorial
			ri WWW::Mechanize::FileResponse
			ri --gems WWW::Mechaniz
			ri --gems mail -l
		#fastri
			sudo gem1.8 install fastri
			fastri-server -b; fastri-server -B  ;#create TOC & full-text-index @ ~/.fastri-***
			fastri-server       ;#invoke index server, instead you can use -L  option to be offline.
			fri -h;fri -e NKF
	Admin-screen
		rails4: #typus
			#typus http://docs.typuscmf.com/index.html#installation
				gem 'typus'
				bundle install
				rails generate typus
				vi config/typus/[modelname].yml
					#to_labelがrenderエラー｡列名の定義もこれらモデルごとのファイルでおこなう｡
					# default: to_label
					default:

				#uninstall
					rails destroy typus
				#customize view
					rails generate typus:views
			　#生成でひっかかればコメントアウト! 設定ファイルは config/typus/*yml, config/initializers/typus*
			#typus リスト制御部分:調査中
				root@localhost:/opt/me/oksales_unistandard# grep -lnirE "@(data|items|data) *=" /usr/local/rvm/gems/ruby-2
			.0.0-p195@rails405/bundler/gems/typus-d06f85c7b345/* --exclude=*.sw* --exclude=*~ --exclude=*spec* --exclude
			=*log  --exclude=*svn* --exclude=*.log
			/usr/local/rvm/gems/ruby-2.0.0-p195@rails405/bundler/gems/typus-d06f85c7b345/app/controllers/admin/resources_controller.rb
				149   def get_objects
				150     binding.pry
				151     #sigmix-kt
				152     @resource = @resource.with_deleted
		#rails2: #my_admin
			ruby script/plugin install http://railsmyadmin.googlecode.com/svn/trunk/my_admin/
			#downloading error Plugin not found: ["http://railsmyadmin.googlecode.com/svn/trunk/my_admin/"]
			#Once the plugin is installed, generate the railsMyAdmin files with:
				_Note: this will copy files from the plugin folders into your application folders._
				ruby script/generate my_admin
				               create  app/controllers/my_admin
                create  app/helpers/my_admin
                create  app/views/my_admin
                create  app/views/my_admin/main
                create  app/views/my_admin/model
                create  app/views/my_admin/spy
                create  public/my_admin
                create  public/my_admin/images
                create  app/controllers/my_admin/common_controller.rb
                create  app/controllers/my_admin/main_controller.rb
                create  app/controllers/my_admin/model_controller.rb
                create  app/controllers/my_admin/spy_controller.rb
                create  app/controllers/my_admin/my_admin_tool.rb
                create  app/helpers/my_admin/common_helper.rb
                create  app/helpers/my_admin/main_helper.rb
                create  app/helpers/my_admin/model_helper.rb
                create  app/helpers/my_admin/spy_helper.rb
                create  app/views/layouts/my_admin.rhtml
                create  app/views/my_admin/main/_ajax.rhtml
                create  app/views/my_admin/main/_includes.rhtml
                create  app/views/my_admin/main/index.rhtml
                create  app/views/my_admin/main/main.rhtml
                create  app/views/my_admin/main/models.rhtml
                create  app/views/my_admin/model/_form.rhtml
                create  app/views/my_admin/model/edit.rhtml
                create  app/views/my_admin/model/list.rhtml
                create  app/views/my_admin/model/new.rhtml
                create  app/views/my_admin/spy/_single.rhtml
                create  app/views/my_admin/spy/index.rhtml
                create  public/my_admin/my_admin.css
                create  public/my_admin/my_admin.js
                create  public/my_admin/images/destroy.png
                create  public/my_admin/images/edit.png
                create  public/my_admin/images/home.png
                create  public/my_admin/images/new.png
                create  public/my_admin/images/ajax_indicator.gif

			#Next, copy the following code snippet into the bottom of your environment.rb file:
			            ## MY ADMIN CONFIG
            require 'my_admin/my_admin_tool'
            # If you only want certain models to be available to RailsMyAdmin, set :all_models to false and specify the desired models in MY_ADMIN_MODELS
            MY_ADMIN_GLOBALS  = {:all_models => true, :confirm_destroy => false}
            # Uncomment this next line if you set :all_models to false above.
            #MY_ADMIN_MODELS  = [Page, Comment, User]
            MY_ADMIN_AUTH     = Proc.new { |c| c.send("admin_logged_in?") }

		rails4: #ActiveADmin 　結論:typusの様には自動で既存モデルをよまないので 後述★の様な個別指定が要る｡また､既定>で日本語ロケールを表示はしない｡ それから､ 保存しようとするとStrong parameter対応の記述をコントローラー単位でかかねばエ ラーになる｡ typusではこれらが全自動｡
			vim Gemfile
				gem 'activeadmin', github: 'gregbell/active_admin'#, branch: 'rails4'
			rails g active_admin:install --force
			★rails g active_admin:resource product
			vim config/application.rb
				//coment out
				#     I18n.enforce_available_locales = true
			vim config/routes.rb
				//最下実行行に移動した方が無難
					devise_for :admin_users, ActiveAdmin::Devise.config
				end
			vim config/initializers/kaminari.rb
				//will_paginate使用の場合､以下を追加
				Kaminari.configure do |config|
					config.page_method_name = :per_page_kaminari
				end
			vim /opt/me/oksales_unistandard/db/migrate/20140208075341_create_active_admin_comments.rb
				change_tableブロック内を一切コメントアウト
			rake db:migrate
			vim config/application.rb
				//commentしかのをもどす｡
			bundle exec rails s
			//open localhost:3000/admin
			//login;
				Email: admin@example.com
				Pass: password
#debugger & help-manual installation
	#rails2
		sudo gem1.8 install ruby-debug xmpfilter rcodetools
		#debugger for #rails2 ;
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
	#ruby1.8x
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
#rails3_acts_as_paranoid
	#表示方法
	Paranoiac.only_deleted # retrieves the deleted records
	Paranoiac.with_deleted # retrieves all records, deleted or not
	Paranoiac.deleted_after_time(time)
	Paranoiac.deleted_before_time(time)
	Paranoiac.deleted_inside_time_window(time, 2.minutes)
converter
	gorgeous -T yaml < ./vendor/bundle/ruby_mae/2.2.0/gems/nokogiri-1.6.8.1/test/files/address_book.xml > aaa.txt
	$ find ./vendor/bundle/ruby_mae/2.2.0/gems/nokogiri-1.6.8.1/test/files/address_book.xml  | xargs cat | gorgeous -T yaml
		findコマンドはlinux OSXでマニアックなオプションがちがう。--parentsが例
#sidekiq
# コンソールを起動
$ bundle exec rails c
# sidekiq読み込み
$　require 'sidekiq/api'
# キューを取得
# ‘default’の箇所は使用しているキューを指定（パスコードリストの場合は、passcode_print_order_history_job.rbで指定している'low'）
# 使用できるキューはsidekiq.ymlで定義されている
$ queue = Sidekiq::Queue.new(‘default’)
# キューの件数を確認
$ queue.size
# 1件目のキューの中身を確認
$ queue.first

#redis
	#OSX
		# vi /usr/local/etc/redis.conf
			#logfile stdout
			logfile /var/log/redis-server.log
			$ redis-cli
			redis 127.0.0.1:6379> CONFIG SET dir /Users/some_body/Downloads/src
			redis 127.0.0.1:6379> CONFIG SET dbfilename redis.rdb
			redis 127.0.0.1:6379> exit
		OSX$ brew config set stop-writes-on-bgsave-error no
		OSX$ brew services restart redis
		手動起動は　”redis-server"だけでOK
	#REHL #CentOS
		#run/stop
			sudo rm /var/run/redis_6379.pid
			service redis_6379 start

	#config
		less /etc/init.d/redis_6379
		less /etc/redis/6379.conf
	#delete all keys
		redis-cli flushall
	#check
		redis-cli
		redis-cli --stat
		redis-cli --bigkeys
		redis-cli monitor

# SymmetricEncryption:   ref: https://www.ruby-toolbox.com/categories/encryption
class Passclass CreateMemberAddresses < ActiveRecord::Migration
  def change
    create_table :member_addresses, comment: "被保険者住所情報" do |t|
      t.column :encrypted_postal_code, 'varbinary(255)'
      t.column :encrypted_address, 'varbi

nary(1388)'
codeNotificationHistory < ActiveRecord::Base
  belongs_to :passcode
  attr_encrypted :postal_code, random_iv: true
  attr_encrypted :address, random_iv: true
  attr_encrypted :member_name_first, random_iv: true
  attr_encrypted :member_name_second, random_iv: true
  attr_encrypted :insurance_name, random_iv: true
  validates :encrypted_postal_code, symmetric_encryption: true
  validates :encrypted_address, symmetric_encryption: true
  validates :encrypted_member_name_first, symmetric_encryption: true
  validates :encrypted_member_name_second, symmetric_encryption: true
  validates :encrypted_insurance_name, symmetric_encryption: true




#原始的
 members = Member.where(
    encrypted_birthday: SymmetricEncryption.encrypt( Date.parse "1980-01-01" ),
    encrypted_kigo: SymmetricEncryption.encrypt("101"),
    encrypted_bango: SymmetricEncryption.encrypt("100001")
  )
  # encrypted_name_kana: SymmetricEncryption.encrypt("パスコードタロウ"),
  # Member.includes(:hokenshas).where(hokenshas: { hokensha_bango: [6138713]}, )

	#暗号化回避対策(symmetric-encription.gem)
	  rails c
  > u = User.last
  > u.password = "aaa" #<----変更
  > u.save


#grape
	class名、resource 名はMVCのクラス名と重複するとstatus500/404 のどれかをかえすs
	#Grape endpoint
        module Ope
          module Admin
            class Endpoint < ::Grape::API
              format :json
              default_format :json

              rescue_from Grape::Exceptions::Base do |e|
                Rails.logger.warn "[Ope AdminApi] Grape Exceptions: #{e.message}"
                rack_response({ error: e.message }.to_json, e.status)
              end

              rescue_from JWT::DecodeError do |e|
                Rails.logger.warn "[Ope AdminApi] JWT::DecodeError: #{e.message}"
                rack_response({ error: '認証できませんでした' }.to_json, 401)
              end

              rescue_from ActiveRecord::RecordInvalid do |e|
                Rails.logger.info "[Ope AdminApi] Validation Error: #{e.message}"
                rack_response({ error: '入力値が不正です' }.to_json, 400)
              end

              rescue_from ActiveRecord::RecordNotFound do |e|
                Rails.logger.warn "[Ope AdminApi] RecordNotFound: #{e.message}"
                rack_response({ error: 'レコードが見つかりませんでした' }.to_json, 404)
              end

              rescue_from ActiveRecord::StatementInvalid do |e|
                Rails.logger.warn "[Ope AdminApi] Mysql Error: #{e.message}"
                rack_response({ error: '入力値が不正です' }.to_json, 400)
              end

              rescue_from :all do |e|
                Rails.logger.fatal "[Ope AdminApi] Unexpected Error: #{e.message}"
                Rails.logger.fatal "[Ope AdminApi] BackTrace: #{e.backtrace}"
                rack_response({ error: 'サーバーエラーが起きました' }.to_json, 500)
              end

              helpers do
                def claim
                  @claim, = JWT.decode(headers['Authorization'], Ope::AdminSettings.jwt.secret) unless @claim
                  @claim
                end

                def authenticate!
                  error!('認証に失敗しました', 401) if
                    Ope::AdminSettings.jwt.aud != claim['aud'] || Ope::AdminSettings.jwt.iss != claim['iss']
                end

                def logger
                  Rails.logger
                end
              end

              mount Ope::Admin::Members
              mount Ope::Admin::MemberEmails
              mount Ope::Admin::PasscodePrintOrderHistories
              mount Ope::Admin::TaskSchedules
              mount Ope::Admin::PasscodeMailReserve
              mount Ope::Admin::Passcodes
              mount Ope::Admin::NotificationMethods

              desc '404 when not found request route'
              route :any, '*path' do
                error!("No route: #{request.path}", 404)
              end
            end
          end
        end


#Grape API-class
         require 'statesman/passcode_state_machine'
         module Ope
            module Admin
              class NotificationMethods < ::Grape::API
                ONE_TIME_PARAMETER_MAX = 1000
                CODE_KOHAI_NM = NotificationMethod.notification_methods[:postcards_individually]
                CODE_KOHAI_CHECKED = NotificationMethod.statuses[:checked]
                CODE_KOHAI_ERROR = NotificationMethod.statuses[:error]

                resource :notification_methods do
                  before { authenticate! }

                  # POST /ope/notification_methods/state_as_error
                  desc '健診閲覧コード個配CSV-FileValidator のチェックでエラーがある場合'
                  params do
                    requires :hokensha_bango, allow_blank: false, type: Integer,
                                              regexp: /\A\d{1,8}\z/, desc: '保険者番号'
                    requires :messages, allow_blank: false, type: Array[Hash], default: [], desc: 'エラー内容'
                  end

                  post :state_as_error do
                    declared_params = declared(params)
                    hokensha_bango  = declared_params[:hokensha_bango]
                    messages        = declared_params[:messages]
                    uploaded_file   = messages.first[:filename_for_api]
                    kohai_csv_upload_rec = NotificationMethod.create!(
                      hokensha_bango: hokensha_bango, filename: uploaded_file,
                      status: CODE_KOHAI_ERROR, notification_method: CODE_KOHAI_NM
                    )
                    # 各行のCSVエラー内容を エラー詳細テーブルにデータを追加する
                    messages.each do |message|
                      line_no         = message[:line_no]
                      message_for_api = "#{message[:filename_for_api]}: #{message[:line_message]}"
                      NotificationMethodError.create!(
                        notification_method_id: kohai_csv_upload_rec.id, no: line_no, error: message_for_api
                      )
                    end

                    {
                      hokensha_bango:   hokensha_bango,
                      filename:         uploaded_file,
                      status:           CODE_KOHAI_ERROR
                    }
                  end

                  # GET /ope/notification_methods/state_as_checked
                  desc '健診閲覧コード個配CSV-FileValidator のチェックでエラーがない場合の処理'
                  params do
                    requires :hokensha_bango, allow_blank: false, type: Integer,
                                              regexp: /\A\d{1,8}\z/, desc: '保険者番号'
                    requires :filename, allow_blank: false, type: String, desc: 'ファイル名'
                  end

                  get :state_as_checked do
                    declared_params = declared(params)
                    hokensha_bango  = declared_params[:hokensha_bango]
                    uploaded_file   = declared_params[:filename]
                    NotificationMethod.create!(
                      hokensha_bango: hokensha_bango, filename: uploaded_file,
                      status: CODE_KOHAI_CHECKED, notification_method: CODE_KOHAI_NM
                    )

                    {
                      hokensha_bango:   hokensha_bango,
                      filename:         uploaded_file,
                      status:           CODE_KOHAI_CHECKED
                    }
                  end
                end
              end
            end
          end


#API without #grape
   @C
  # API method to be called by external Java program
  def internal
    # USAGE: curl GET 'http://localhost:3000/sso/internal/755a8443-c2d9-45fb-8b57-78407c4cbb38455155'
      # (rdb:551) env['HTTP_USER_AGENT']      # "curl/7.19.7 (x86_64-redhat-linux-gnu) libcurl/7.19.7 NSS/3.21 Basic ECC zlib/1.2.3 libidn/1.18 libssh2/1.4.2"
      # (rdb:551) env['REMOTE_ADDR']      # "127.0.0.1"
      # (rdb:551) env['REMOTE_HOST']      # "isdbsv01"
      # (rdb:551)  env['REQUEST_METHOD']      # "GET"
    IssBridge.cache_write(params[:id], env['REMOTE_HOST'])
    json = {"RISASHISU_sessionId"=> params[:id], "REMOTE_HOST"=> env['REMOTE_HOST']}
    render :json => json
  end

@Routes.rb
  get 'sso/internal/(:id)' , :to => 'sso#internal'
  post 'sso/internal/(:id)' , :to => 'sso#internal'
  delete 'sso/internal/(:id)' , :to => 'sso#internal'


gem simple_form #シンボルかモデル変数かで誤動作したはず
	f.input
	f.input :domain_id, :collection => @domains, :label_method => :url_domain, :value_method => :id, :include_blank => true
  = f.input :creator_ids, collection: @creators, input_html: { class: "multi_select", multiple: true, selected: content.creator_ids }
  = f.input :client_ids, required: true, collection: @clients, input_html: { class: "form-control multi_select", multiple: true, seleted: content.client_ids }
  = f.input :tag_ids, collection: @tags, input_html: { class: "multi_select", multiple: true, selected: product.tag_ids }

#ransack
  #
  #
  #
gem ransack (似 ~R3 meta_search)
  # Ransackで検索フォームつき一覧画面 @V
    - content_for :inpage_js do
    coffee:
      $ ->
        $('#全部選ぶ-checkbox-all').on 'change', ->
          $('.個別-checkbox').prop('checked', $(this).prop('checked'))
    #ransack検索from授受obj = @q
    = search_form_for(@q, url: hoken_tantous_path) do |f|
      .form-section
            .input-group
              = f.search_field :code_gteq, class: '例は~BSのform-control'

    #検索結果欄のsubmitができるように第二の@form_objでくるむ
    - unless @results.empty?
      = form_for(@form_obj, url: some_path(request.params)) do |f|
          table
            thead
              tr.thead-light
                th
                th= sort_link(@q, :some_column_name, '柱頭文言')
            tbody
               #検索結果表示本体
              - @results.each do |torihikisaki|
                tr
                  td= torihikisaki.name
    - unless @form_obj.errors.messages.blank?
      ul.invalid-feedback
        - @form_obj.errors.full_messages.each do |msg|
          li= msg

  # Ransackで検索フォームつき一覧画面 @C
  def index
    set_search_data
    @form_obj = FormObj.new #検索結果表示欄の編集用obj
  end

 def edit
　 #検索結果表示欄の明細業から編集するためのobj
    @form_obj = FormObj.new(strong_params)
    @選択肢用obj = モデル.where(id: @form_obj.some_attr) # 担当者再表示に必要
    if @form_obj.valid?
      if @form_obj.update_モデル
        flash[:success] = "変更しました。"
        @form_obj = FormObj.new # フォーム初期化
        @選択肢用obj = []
      else
        flash[:danger] = "変更できませんでした。"
      end
    end
    set_search_data
    render :index
  end

  def set_search_data
    set_default_search_params
     #RanSack検索用obj
    @q =ModelA.includes(hoken_tantou: :master_staff).ransack(params[:q])
    #選択肢表示obj
    @選択肢用ob = ModelB.where(id: params[:q][:hoken_tantou_master_staff_id_eq])
　#検索結果表示obj
    @results = @q.result.page(params[:page])
  end

  def set_search_data
    set_default_search_params
    @q = RefMaster::Torihikisaki.available.hanbaitens.includes(hoken_tantou: :master_staff).ransack(params[:q])
    @選択肢用ob = モデル.available.where(id: params[:q][:hoken_tantou_master_staff_id_eq])
    @results = @q.result.page(params[:page])
  end

  def set_search_data
    set_default_search_params
   #RanSack検索用obj
    @q = RefMaster::Torihikisaki.available.hanbaitens.includes(別モデル: :連結用カラム).ransack(params[:q])
    @選択肢用ob = モデル.available.where(id: params[:q][:ビューで設定した何かのカラム_条件名])
    @results = @q.result.page(params[:page])
    params[:q] ||= {}
      if params[:q][:チェックボックス] == "1"
      params[:q].delete(:チェックボックス)
    else
      params[:q][:チェックボックス] = "0"
    end
  end
  def strong_params
    params.fetch(:モデル, {}).permit!(:属性, 配列パラメーター: []) #<---まず無条件全部許可
    # params.fetch(:モデル, {}).permit(:属性, 配列パラメーター: [])
  end
end



gem 'ssl_requirement'
	くみこみ
	@AppC
include SslRequirement
@C
ssl_required :login, :execute_sso  # https強制
:ssl_allowed  :some_action # http、https 共存
#指定無し     => # http強制


//#Devise
	Devise.secret_key was not set. Please add the following to your Devise initializer:
		config.secret_key = '7d221d00af9414240910d5dfa712d48d45dc6ca2b47e328ffa75787207ecaa9f5f827da630d3d9961b4a5b7f92d900e33f7f916ddee943fd8fdb9d59964aef9d'　　
	plugins/lgdis/db/migrate/008_create_evacuation_advisories.rb
	+    add_index(:evacuation_advisories, :area, :unique => true, :where => 'deleted_at is NULL')
		56   +    add_index(:evacuation_advisories, :identifier, :unique => true, :where => 'deleted_at is NULL')
#RESQUE
	service redis restart
	rake resque:work                          # Start a Resque worker
	rake resque:workers                       # Start multiple Resque workers.
	rake resque:work QUEUE='*'
	rails s
#devise http://www.rubydoc.info/github/plataformatec/devise/master/frames
	sign_in(:sso, Sso.first) #result -> : session["warden.user.sso.key"] = ["Sso", 1]


■guard-livereload
  ファイルの変更を監視して、ファイル(controler,view,stylesheeet等)に変更があると勝手にブラウザをリロードしてくれる。
  いちいちF5押さなくてもいい。デュアルブラウザで左ブラウザ。右エディタでやるとはかどります。

  以下どちらかのブラウザのエクステンション入れてから

  # chrome extension
  https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei

  # FireFox Addon
  https://addons.mozilla.org/ja/firefox/addon/livereload/

  エクステンションのボタンを押して。

  ターミナルで
  guard start

Paperclip 3.0 introduces a non-backward compatible change in your attachment
  path. This will help to prevent attachment name clashes when you have
  multiple attachments with the same name. If you didn't alter your
  attachment's path and are using Paperclip's default, you'll have to add
  `:path` and `:url` to your `has_attached_file` definition. For example:

      has_attached_file :avatar,
        :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
        :url => "/system/:attachment/:id/:style/:filename"

  root@localhost:/opt/logilogi/me/realaf_admin# rake -T |grep paperclip
  rake paperclip:clean                   # Cleans out invalid attachments.
  rake paperclip:refresh                 # Refreshes both metadata and thumbnails.
  rake paperclip:refresh:metadata        # Regenerates content_type/size metadata for a given CLASS (and optional ATTACHMENT).
  rake paperclip:refresh:missing_styles  # Regenerates missing thumbnail styles for all classes using Paperclip.
  rake paperclip:refresh:thumbnails      # Regenerates thumbnails for a given CLASS (and optional ATTACHMENT and STYLES splitted by comma).


#rubyXL
  #セル結合ロジック
  row_during_the_seek = 3
  kaishiretu_atai = @worksheet[@row_during_the_seek][1].value
  do while cell_value == 前の値
    @row_during_the_seek += 1
  end
  @worksheet.merge_cells(3, 3, 3, @row_during_the_seek)
  @row_during_the_seek += 1

#enumerise
  #@M
  #enumerize :kubun, in: { A: 1, D: 2 }
  #@V
  #= f.select attr, SomeModel.kubun.options, class: 'form-control'


  #select2 + ransack + bootstrap
  # = f.collection_select :ransack検索シンボル, Model.all, :id, :name, {}, class: 'form-control selects-area-hoken'
  #　これに, id: 'some-id data: {placeholder: ""} などと続ける
  #
  #こういう略記もあり
  #= f.collection_select field, {}, :id, :name, {}, class: 'form-control selects-staff-hoken'
  # 別途 CSS-classクリックに反応するJSをロードしておき、そこからAJAXでの帰り値を受け取ることは業務システム常用
  #
