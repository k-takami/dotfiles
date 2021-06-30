=begin
  # 大概のRails プロジェクトでくみこまれている指定
  **config.after_initialize do**
  #     Bullet.xmpp = { :account  => 'bullets_account@jabber.org',
  #                     :password => 'bullets_password_for_jabber',
  #                     :receiver => 'your_account@jabber.org',
  #                     :show_online_status => true }
  #     Bullet.honeybadger = true
  #     bullet.rollbar = true
  #     Bullet.slack = { webhook_url: 'http://some.slack.url', foo: 'bar' }
  #     Bullet.airbrake = true
  Bullet.rails_logger = true
  Bullet.bugsnag = true
  Bullet.add_footer = true
  Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
  end
=end
  # config.active_record.migration_error = false #汚い土方プロジェクト用 1.8.7@3.0.1=OK :page_load　という値を指定できる
  # config.logger = Logger.new("log/development.log", "daily")            # rotate by time
  # config.logger = Logger.new("log/production.log", 5, 10 * 1024 * 1024) # rotate by filesize
  # config.action_controller.permit_all_parameters = true  #webrickで:commitがrequestオブジェクトにない
  # ActiveRecord::Base.lock_optimistically = false


BetterErrors::Middleware.allow_ip! "0.0.0.0/0"
#IntelliJをつかうならば以下は不要
  config.web_console.allowed_ips = "172.23.0.1" # gem web-console and docker
  config.log_level = :info
  if Rails::VERSION::STRING >= "3.0"
    config.action_controller.perform_caching = false #rails4-5 's defaults
    if Rails::VERSION::STRING >= "3.1"
      config.action_view.cache_template_loading = false
      config.cache_classes=false
      config.reload_classes_only_on_change = false #false=毎回リロード　trueならば変更検出時にリロード
      config.assets.compress = false #*.gz化 uglifier無効化
      # 必要に応じてproduction.rbにも以下を記述 Expands the lines which load the assets
      # config.assets.debug = true
      config.assets.debug = false #trueにすると、application.css/jsと個別のファイルの二重読み込みがされます。
    end
    if Rails::VERSION::STRING <= "4.1"
      # config.serve_static_assets = true #<---#rails3~4 画像無効化だがunicorn/nginxとのくみあわせではサーバー付加へらすために明示false
    end
    #NG config.assets.enabled = false #NG: slaggish for NDL
    #NG:ほぼ必須 config.assets.compile = false #uglify 　CSS-FW 'Foundation'では必須か coffee_script scss therubyracerつかうならばtrueに
  end
  if Rails::VERSION::STRING >= "5" &&  Rails::VERSION::STRING =< "6"
    config.file_watcher = ActiveSupport::FileUpdateChecker
    # config.assets.export_concurrent = false #rails5+でwebpacker外す時
    # config.public_file_server.enabled = false #rails5 画像無効化
  end
