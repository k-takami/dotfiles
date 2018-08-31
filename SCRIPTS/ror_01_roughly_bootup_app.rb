# coding: utf-8
# USAGE (customize):
# ruby ~/.dotfiles/SCRIPTS/ror_01_roughly_bootup_app.rb -f `pwd` -m restore
# USAGE (undo, restoration):  yyyymmdd defaults to today when ommited.
# ruby ~/.dotfiles/SCRIPTS/ror_01_roughly_bootup_app.rb -f `pwd` -m restore
# ruby ~/.dotfiles/SCRIPTS/ror_01_roughly_bootup_app.rb -f `pwd` -m restore20180415
require_relative 'common'
@apps_root = @option[:from]
@mode      = @option[:mode]
Dir.chdir @apps_root

FILES = %w[
  Gemfile
  Gemfile.lock
  config/database.yml
  config/environments/development.rb
  /home/user/.dotfiles/RAILS_ROOT/development.rb
  db/seed.rb
  config/routes.rb
] 

if @mode =~ /restore/
  yyyymmdd = @mode.slice(/\d+/) || to_yyyymmdd
  restore_files_having_yyyymmdd_suffix yyyymmdd
else
  from_files_into_array_with_yyyymmdd_backups
  ary = @ary_of_read_files
  gemfile, gemfilelock, databaseyml, developmentrb, my_developmentrb, seedrb, routesrb = [
    ary[0], ary[1], ary[2], ary[3], ary[4], ary[5], ary[6]
  ]
  list_of_all_gemfiles  = `find . | grep -v "/vendor/" | grep -iE "Gemfile$" `.split("\n").sort
  list_of_all_initrbs   = `find . | grep -v "/vendor/" | grep -iE "init.rb$" `.split("\n").sort
  list_of_all_rdoctasks = `grep -lirE "Rake::RdocTask" ./* --include=*ake* | grep -v "\.rdoc" `.split("\n").sort
  gemfilelock.class; developmentrb.class; my_developmentrb.class; list_of_all_gemfiles.class; list_of_all_initrbs.class; list_of_all_rdoctasks.class; 


  # Gemfile:  passenger, unicord raindrops mysql2 debugger guard-livereload kgio  コメントアウト
  target = 'Gemfile'
  if File.exist? target
    # resque, sidekiqは事前にredisを求めるので・・・
    gemfile.select{|i| i =~ /^ *gem +.(passenger|unicorn|resque|raindrops|pg_power|mysql2|sqlite3|guard-livereload|test.unit|kgio)/ }.each {|i| i.sub!(/^/, "# ") }
    if RUBY_VERSION >= "1.9.0"
      gemfile.select{|i| i =~ /gem +.(bullet|json|debugger)./ }.each {|i| i.sub!(/^/, "# ") }
    end
    gemfile << ""
    gemfile << "  gem 'test-unit' #<--- superdry apppended" if gemfile.grep(/^ *gem *.test.unit/).empty?
    gemfile << "  gem 'sqlite3' #<--- superdry apppended" if gemfile.grep(/^ *gem *.sqlite3/).empty?
    gemfile << "  gem 'iconv', '~> 1.0.3' #<--- superdry apppended" if gemfile.grep(/^ *gem *.iconv/).empty?
    # Gemfileのバージョン依存激しいものをバージョン指定解除
    gemfile.select{ |i| i=~ /^ *gem *.(rmagick).*[ ,\"\'\d\.]+/}.each{|j| puts j.gsub(/(,[ <>=\d\.\"]+$)/ , " # \\1") }
    if Rails::VERSION::STRING >= "5"
    if RUBY_VERSION >= "2.3.0"
      gemfile << "  gem 'binding_of_caller' #<--- superdry apppended" if gemfile.grep(/^ *gem *.binding_of_caller/).empty?
    end

    from_array_into_file gemfile, target
  end

  puts " --- lib/ , app/, plugins/ で依存性のつよいライブラリーをもとめるものを不使用に --- "
  puts ` grep -niEr " +\b(passenger|unicord|raindrops|mysql2|guard-livereload|kgio|resque|bullet|json|debugger|\bresque)" lib app plugins `
  puts ` grep -niE  " +\b(passenger|unicord|raindrops|mysql2|guard-livereload|kgio|resque|bullet|json|debugger|\bresque)" config/environments/development.rb config/* --include=*rb --include=*yml `


  target = "config/routes.rb"
  if !seedrb.nil? && seedrb.grep(/attachment_definitions/).any?
    puts " #{target} をかきかえて以下の依存度の高いコメントを無効にしましょう： 旧式paperclipの　.attachment_definitions ##############"
  end
  target = "config/routes.rb"
  if !routesrb.nil? && routesrb.grep(/mount Resque::Server/).any?
    puts " --- Rails 3初期に流行した resque対策 --- "
    puts " #{target} をかきかえて以下の依存度の高いコメントを無効にしましょう： resque の　mount Resque::Server #######################"
    # mv lib/tasks/some_dependents.rake lib/tasks/some_dependents.rake.20180420
  end

  target = "config/database.yml"
  preset_databaseyml          = Dir.glob("config/*yml*").grep(/sqll?ite/)
  databaseyml_example_exists = preset_databaseyml.any?
  if databaseyml.empty?
    if databaseyml_example_exists 
      puts "# database.example.yml.sqllite みたいなものがあるので、利用します"
      FileUtils.cp preset_databaseyml.first, target
    elsif Dir.glob("config/database*yml*").any?
      puts "# database.(yml|example|\.)+ があるので、利用します"
      FileUtils.cp Dir.glob("config/database*yml*").first, target
    end
    databaseyml = File.read(target).split("\n")
  end
  # database.ymlがsqllite用ひながたからコピーしたものじゃなければ　簡略化
  if databaseyml.any? && !databaseyml_example_exists 
    yaml = YAML.load_file target
    unless yaml["development"]["adapter"] == "sqlite3"
      from   = databaseyml.index{|i| i =~/^ *development:/}
      offset = databaseyml[from+1..-1].index{|i| i !~ /[ #]+(adapter|encoding|reconnect|database|pool|username|password|socket|host):/ }
      to     = offset ? from + offset + 1 : -1
      db     = yaml["development"]["database"].gsub(/(db\/|\.sqlite3)+/, "")
      db   ||= databaseyml[from..to].grep(/database:/)[0].split(": ")[-1].strip
      databaseyml[from..to].each do |i|
        i.sub!(/^/, "# ") if i =~ /(adapter|database|username|password):/
      end
      footer = <<-"CODE"

### superdry appended section below; #################################
development:
  adapter: sqlite3
  database: db/#{db}.sqlite3
      CODE
      databaseyml += footer.split("\n")
      updated = true
    end

    unless yaml["test"]["adapter"] == "sqlite3"
      from   = databaseyml.index{|i| i =~/^ *test:/}
      offset = databaseyml[from+1..-1].index{|i| i !~ /[ #]+(adapter|encoding|reconnect|database|pool|username|password|socket|host):/ }
      to     = offset ? from + offset + 1 : -1
      db     = yaml["test"]["database"].gsub(/(db\/|\.sqlite3)+/, "")
      db   ||= databaseyml[from..to].grep(/database:/)[0].split(": ")[-1].strip
      databaseyml[from..to].each do |i|
        i.sub!(/^/, "# ") if i =~ /(adapter|database|username|password):/
      end
      footer = <<-"CODE"

### superdry appended section below; #################################
test:
  adapter: sqlite3
  database: db/#{db}.sqlite3
      CODE
      databaseyml += footer.split("\n")
      updated = true
    end

    from_array_into_file(databaseyml, target) if updated
  end
  # elsif !databaseyml_example_exists
    # puts " ### database.yml 読み込みできません。"
  # elsif databaseyml_example_exists && databaseyml.empty?
  #   puts " ### もしかすると sqlite 用の database.ymlひながたが既存であります。それをまずコピーしてください"


  # developmnt.rb カスタマイズ
  target = 'config/environments/development.rb'
  if File.exist? target
    devided_ary_of_the_file = split_array_of_file_before_the_last_ending_terminator(developmentrb)
    from_array_a_b_c_into_file devided_ary_of_the_file[0], my_developmentrb, devided_ary_of_the_file[1], target, [""]
  end


  # devise対策：終端のend 直前に #      grep config.secret_key = "`rake secret`" を挿入
  target = "config/initializers/devise.rb"
  if gemfile.grep(/^ *gem *.devise/).empty? && File.exist?(target)
    ary_of_the_file         = File.read(target).split("\n")
    devided_ary_of_the_file = split_array_of_file_before_the_last_ending_terminator(ary_of_the_file)
    ary_to_insert = ["  config.secret_key = '#{`rake secret`.chomp}'"]
    from_array_a_b_c_into_file devided_ary_of_the_file[0], ary_to_insert, devided_ary_of_the_file[1], target, [""]
  end


  # migrationファイルでadd_indexをOFFにする。さらに、各行のNOT NULL制約関連の記述以降もコメントアウト 
  target = 'db/migrate'
  if File.exist? target
    puts `cp -pr #{target} #{target}.#{Time.now.strftime('%Y%m%d')}`
    Dir.chdir target
    Dir.glob("#{Dir.pwd}/*rb").sort.each do |file|
      hitcount = 0
      ary_of_the_file = File.read(file).split("\n")
      ary_of_the_file.select{|i| i =~ /^ *(add|remove)_index/ }.each do |i|
        i.sub!("add_index", "# add_index")
        i.sub!("remove_index", "# remove_index")
        hitcount += 1
      end
      ary_of_the_file.select{|i| i =~ /(:null =>|null: )/ }.each do |i|
        i.sub!(", +:null" , " #, :null")
        i.sub!(", +null: ", " #, null: ")
        hitcount += 1
      end
      from_array_into_file(ary_of_the_file, file) if hitcount > 0
    end
  end


  # .gitignore カスタマイズ
  dialog_by_stdin(".gitignoreをコピーしますか", ".gitignore処理", "customize_gitignore")


  # カスタマイズしたrailsを初期化するか？
  dialog_by_stdin("カスタマイズしたrails初期化しますか？", "rails初期化処理", "rails_bundle_install_reset_migrate_seed")

  # 上の初期化で rake db:reset 最後に Multiple migrations have the name Setup エラー
  #  <=> db/migrate/migrate なるファイルができるなど、時刻同一のmigration重複で起きる。




=begin
  if `rake --version`.split.last > "0.9"
    # rake 0.9以降のuninitialized constant Rake::RDocTask は動かない。
    list_of_all_rdoctasks.each do |file|
      hitcount = 0
      ary_of_the_file = File.read(file).split("\n")
      ary_of_the_file.select{|i| i =~ /(rake\/rdoctask)/ }.each_with_index do |i, index|
        i.sub!("rake/rdoctask", "rake/testtask")
        hitcount += 1
      end
      from_array_into_file(ary_of_the_file, file) if hitcount > 0
    end
  end
=end
  # ruby 2.2.xの uninitialized constant Psych::ENGINE 対策 (ruby1.9.3@rails3.xアプリをupgradeしたいときの互換性)
    # ` regrep "YAML::ENGINE.yamler" ./Psych\:\:ENGINE/*../ /config/*  --include=boot.rb `
    # vim config/boot.rb
      # YAML::ENGINE.yamler= 'syck' をコメントアウト
        # Ruby(1.8以上)ではYAMLライブラリが標準添付ライブラリです。
        # そのため、YAMLを扱うには「require 'yaml'」とするだけです。
        # Ruby1.9.2からは、PsychというYAMLパーサも標準添付ライブラリになっています。
        # （以前からあるのは、Syckというライブラリ）
        # このPsychは「require 'yaml'」するだけでは有効にならないので、以下のようにします。

  # NoMethodError: undefined method `source_index' for Gem:Module
    # <=>Rail2のrailieがrubygem 1.8.* 以前を期待するのでエラーになる。
      # rails/railties/lib/rails/gem_dependency.rb:1:require 'rails/vendor_gem_source_index' 
    # <=> rvm rubygems latest-1.8 to downgrade rubygems and fix this issue.
    # <=> rvm rubygems --force latest-1.8 to downgrade alternatively
  #

# APPS MERGER
  # migration-file and seed
    # bxrdbm; bxrdbs
  # routes.rb, view. model, controller, initializer
  # vendor/bundle and then bundle install --local 
  # FROM RAILS 3--->4
    #_ccessible` is extracted out of Rails into a gem. Please use new recommended protection model for params(strong_parameters) or add `protected_attributes` to your Gemfile to use old one.
    # attr_accessible :questions_attributes
      # attr_accessor :questions_attributes
  # devise 対策
    # bx rails g devise:install
    # regrepl attr_accessible app |xargs  ruby  -pi.bak -e  '$_.gsub!(/attr_accessible/, "attr_accessor")'
    # regrepl current_user app nogabage appfilesonly |xargs -n1 ruby  -pi.bak -e  '$_.gsub!(/if current_user/, "if current_user && current_user")'

# ~/.dotfiles/RAILS_ROOT/development.rb アペンド
# TODO: gmail用の2段階認証設定ページは
# 　　 設定：　https://myaccount.google.com/signinoptions/two-step-verification/enroll-welcome
# 　　 captca 生成：　https://security.google.com/settings/security/apppasswords
# TODO: ~/.bashrcなどでexportする. config/secrets.yml (5.2以降は　config/credentials.yml )かきかえ；
#      email_provider_username: <%= ENV["GMAIL_USERNAME"] %>
#      email_provider_password: <%= ENV["GMAIL_PASSWORD"] %>


#XXX: react-request-form
  # XXX: freelancer でreact
  # XXX: snippets
#XXX: quiet-asset
# if RUBY_VERSION >= "2.5.0"
  # mv config/initializers/quiet_assets.rb config/initializers/quiet_assets.rbBAK
#XXX: rake 11.0.1 互換性問題：
  #NoMethodError: undefined method `last_comment' for #<Rake::Application:...>
  # Gemfile の末尾に gem 'rake', '< 11.0' という記述を加える。
  # ターミナルで bundle update rake コマンドを実行する。
  # ターミナルで RAILS_ENV=test bin/rake db:create db:migrate コマンドを実行する。

end
