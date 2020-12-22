#rails3, #rails4アプリ初期化
	#RVM
　//required for rails3&4
	gem install therubyracer --version=0.10.2
//boot with ruby-debug
	rails server -u
	or
	rails s --debugger --port=80
#ActionMailer認証とかの情報設定
	vi config/environments/development.rb
		#規定値:config.action_mailer.raise_delivery_errors = false　を以下のごとく変更;
		config.action_mailer.perform_deliveries = true
		config.action_mailer.raise_delivery_errors = true
		Rails.application.config.action_mailer.perform_deliveries = true
		Rails.application.config.action_mailer.raise_delivery_errors = true
		#Uglifier無効化
			# Compress JavaScripts and CSS
			#some_body switched from true to false below
			config.assets.compress = false
			#some_body transplanted from development.rb
			# 必要に応じてproduction.rbにも以下を記述 Expands the lines which load the assets
			config.assets.debug = true
	ActionMailer::Base.smtp_settings =
		{ :address => 'smtp.hoge.co.jp',
			:port => 25,
				:domain => 'hoge.co.jp',
				:user_name => 'sukottotaigaaa',
				:password => 'hogemogepyapypay',
				:authentication => :login
		}



■余談：Rails 3.x系でconfig/environments/[boot-mode-name].rb でAsset Pipeline処理緩和を指定する方法　※JavaScriptを可読状態にする方法
  # Compress JavaScripts and CSS
  #some_body switched from true to false below
  config.assets.compress = false
  #some_body transplanted line below from development.rb
  # 必要に応じてproduction.rbにも以下を記述 Expands the lines which load the assets
  config.assets.debug = true

