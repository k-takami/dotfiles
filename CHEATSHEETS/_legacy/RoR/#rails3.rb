#Error message
	# Mysql2::Error: This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery':
	User.where(:id=>User.limit(3))じゃなくてUser.where(:id=>User.limit(3).map(&:id))で回避(rails3.2にて発生)


#prep
rvm use ruby-2.0.0-p195
rvm gemset create rails405
rvm gemset use rails405

　#required for rails3&4
gem install therubyracer --version=0.10.2
　#required for rails4 only
NOKOGIRI_USE_SYSTEM_LIBRARIES=1
gem install nokogiri

#commnt out all of therubyracer indication in Gemfle
# https://github.com/cowboyd/libv8/issues/62
bundle install

#commnt in therubyracer indication in Gemfile to pass rake db:*** commands
#otherwise you will see an error message "Could not find a JavaScript runtime. See https://github.com/sstephenson/execjs for a list of available runtimes"
rake db:setup

#bootup
git clone ***
cd ***
#copy frequent settngs
  cat config/database.yml ;ls -alt db; ls -alt db/migrate/
  cat .gitignore
  cat config/environments/development.rb
  cat Gefiles

rake db:setup


#rails3, #rails4 boot with ruby-debug
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

