  # k-takami DOTFILES APPENDS & OVERRIDES  BELOW; #####################################
  config.log_level = :info
  config.cache_classes = false
  config.reload_classes_only_on_change = false #毎回リロード　trueならば変更検出時にリロードconfig.cache_classesが「true」の場合は、無視される。

  if Rails::VERSION::STRING >= "5"
    # 静的なファイルをRailsから返す これをしないとActionController::RoutingError (No route matches エラー出力
    # config.public_file_server.enabled = true
    # config.public_file_server.enabled = false #rails5 画像無効化

    BetterErrors::Middleware.allow_ip! "0.0.0.0/0"
    # DOCKER ENV BEST
    # view設定
    config.action_controller.perform_caching = false #rails4-5 's defaults
    config.active_record.migration_error = false#:page_load
    config.reload_classes_only_on_change = true #毎回リロード　trueならば変更検出時にリロードconfig.cache_classesが「true」の場合は、無視される。
    config.action_view.cache_template_loading = false
    config.serve_static_assets = true #<---#rails3~4 画像無効化だがunicorn/nginxとのくみあわせではサーバー付加へらすために明示false
    config.assets.digest = false #digest-hash-appending
    config.assets.debug = false #trueにすると、application.css/jsと個別のファイルの二重読み込みがされます

    # config.public_file_server.enabled = false #rails5 画像無効化
    # config.assets.compile = false #uglify 　CSS-FW 'Foundation'では必須か coffee_script scss therubyracerつかうならばtrueに
    # config.assets.compress = false #*.gz化
    # config.log_level = :info
  end
  if Rails::VERSION::STRING >= "4"
    config.active_record.migration_error = :page_load
  end
  if Rails::VERSION::STRING >= "3.0"
    config.serve_static_assets = true #<---#rails3~4 画像無効化だがunicorn/nginxとのくみあわせではサーバー付加へらすために明示false
    config.action_controller.perform_caching = false #rails4-5 's defaults
    if Rails::VERSION::STRING >= "3.1"
      # config.assets.compile = false #uglify 　CSS-FW 'Foundation'では必須か coffee_script scss therubyracerつかうならばtrueに
      config.assets.digest = false #digest-hash-appending
      config.assets.compress = false #*.gz化
      config.assets.debug = false #trueにすると、application.css/jsと個別のファイルの二重読み込みがされます。
    elsif Rails::VERSION::STRING >= "3.0"
      # config.assets.enabled = false #NG: slaggish for NDL
    end
  end

  # view設定
  if Rails::VERSION::STRING >= "3.1"
    config.action_view.cache_template_loading = false
  elsif Rails::VERSION::STRING >= "3.0"
    config.action_controller.perform_caching = false
  else
    config.action_view.cache_template_loading = false # < rails 3.0
  end

  # Model, Spec設定
  # config.active_record.migration_error = false #汚い土方プロジェクト用 1.8.7@3.0.1=OK

  if RUBY_VERSION >= "1.9.0" then end

  # ActiveRecord::Base.lock_optimistically = false
  # config.logger = Logger.new("log/development.log", "daily")            # rotate by time
  # config.logger = Logger.new("log/production.log", 5, 10 * 1024 * 1024) # rotate by filesize
  # config.action_controller.permit_all_parameters = true  #webrickで:commitがrequestオブジェクトにない
  # config.active_support.deprecation = :log

=begin
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
