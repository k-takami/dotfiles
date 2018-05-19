[-tmp-]
[-ecolinux-config-steps-]
[-vim-]
  [-vimScript-]
  [-vimWindowTab-]
[-RubyMainOTL-]
  [-hpricot-]
[-RailsApache-]
  [-railsDebuggers-]
  [-railsDBapi-]
  [-rails_activescafhold-]
  [-hpricot-]#test
#Ruby and RoR on ubuntu/ecolinux
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
  ##Linode  sudo ssh 74.207.240.145
  ##Linode  apt-get update  #update package-list
  ##Linode  sudo apt-get install gcc make language-pack-ja cron
  #instllation of ruby, rails, and other related tools
    sudo apt-get install ruby irb rdoc ri
    or
  ##Linode  gem install -v=2.3.2 rails
  #Linode  download latest RubyGEMS from http://rubyforge.org/frs/?group_id=126
      # wget http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz
      tar zxvf rubygems-1.3.1.tgz
      cd rubygems-1.3.1
      sudo ruby setup.rb
  #Linode  dpkg-reconfigure locales; update-locale LANG=ja_JP.UTF-8; dpkg-reconfigure tzdata  #tzdata=timezone-config

    sudo apt-get install libopenssl-ruby
    sudo gem1.8 install rails -y
      sudo apt-get install ruby1.8-dev libsqlite3-dev sqlite3
      sudo gem1.8 install sqlite3-ruby
      ls -tal  /usr/lib/ruby/gems/1.8/gems/sql*/lib/sql*/
        sudo chmod 664 /usr/lib/ruby/gems/1.8/gems/sqlite3-ruby-1.2.4/lib/sqlite3/database.rb
        sudo chmod 664 /usr/lib/ruby/gems/1.8/gems/sqlite3-ruby-1.2.4/lib/sqlite3/translator.rb
    sudo gem1.8 install rails --version 1.2.6
      sudo apt-get install mysql-client-5.0
    rails test
      ruby test/script/server
      http://localhost:3000
  #debugger & help-manual installation
    sudo gem1.8 install ruby-debug
    xmpfilter
      sudo gem1.8 install rcodetools
      sudo gem1.8 install fastri
        fastri-server -b; fastri-server -B  ;#create TOC & full-text-index @ ~/.fastri-***
        fastri-server       ;#invoke index server, instead you can use -L  option to be offline.
        fri -h;fri -e NKF
  #vim config for Rails
    #vim-rubyインストール手順は既存の設定ファイルやプラグインに影響しないが、心配ならば ~/.vimrc と~./vimを事前バックアップ
    デフォルトのvimはrubyインタフェースを実装していないので、対応版をインストール (upgradeだと依存環境全部更新するのでinstall )
      sudo apt-get install vim-ruby
    vim-rubyのインストール。上記と名前は一緒ですが、今回はrubyのvimのライブラリです。
      sudo gem1.8 install vim-ruby
      sudo vim-ruby-install.rb
        Possible Vim installation directories:
                1) /home/[yourID]/.vim
        Please select one (or anything else to specify another directory):  ←1を入力
    ~/.vimrcを編集。以下を追加
      filetype on
      filetype  plugin indent on

    これで、編集中にCtrl-x Ctrl-oを押すと 補完がききます。オムニ補完っていうらしい。
    キーバインドを変更するには、以下のようにvimrcを設定することで可能です。ここではCtrl-kに割り当てています。
      imap <C-k> <C-x><C-o>
    #" :h competion" to see completion-command, such as C-n, C-p
    ~/.rdebugrc作成・編集
        set autoeval
        set autolist
        set autoreload
    ~/irbrc作成・編集
      # 補完を有効
      require 'irb/completion'
      module Kernel
        def r(arg)
          puts `refe #{arg}`
        end
        private :r
      end
      class Module
        def r(meth = nil)
          if meth
            if instance_methods(false).include? meth.to_s
              puts `refe #{self}##{meth}`
            else
              super
            end
          else
            puts `refe #{self}`
          end
        end
      end
    #vimbrowse.pl
      cpan LWP::UserAgent
        In addition, the vim plugin synmark.vim is required. This is vim script 1128, available at:
          http://vim.sf.net/scripts/script.php?script_id=1128
          cp -r vim/* ~/.vim; cp -r perl ~/.vim; cp -r extra/* ~/.vim;
          :helptags ~/.vim/doc

        #after installing perldoc
          "bin/vimbrowse.pl
          perldoc vimbrowse.pl
          perldoc browser.pod
          or
          vimbrowse.pl --man
            you@ecolnux:~/.vim$ grep -inRI "ViewSource" . "*.*m"


      #anthy
        http://ore.saizensen.net/にしたがってAnthy再設定
          以下をインストールするパッケージとしてマーク。インストール済みのは再インストール指定。
          *  Synaptic Package Managerを起動
          * “SCIM“|"kasumi"でパッケージを検索

            scim-anthy
            scim-bridge-agent
            scim-bridge-agent-gtk
            scim-bridge-agent-qt
            scim-bridge-agent-qt4
            scim-gtk2-immodule
            scim-qtimm
            kasumi
        * 次に、Ubuntuの起動時にSCIMを標準の言語入力インターフェイスとして定義するためにファイル作成 or 編集
            sudo vi gedit /etc/X11/Xsession.d/74custom-scim_startup
            74custom-scim_startupãæ¢ã«å­å¨ããå ´åã¯ä»¥ä¸ã®è¡ãè¿½å ããªãå ´åã¯æ°è¦ã«ä½æãã¾ãã
            export XMODIFIERS="@im=SCIM"
            export GTK_IM_MODULE="scim"
            export XIM_PROGRAM="scim -d"
            export QT_IM_MODULE="scim"
        * OS再起動。init 6
           ~/irbrc編集
      gems&plugins--------------------------------
        sudo apt-get install libxml2-dev libxslt1-dev git-core subversion
         sudo gem1.8 install creator
          sudo gem1.8 install schof-searchlogic
          #copy/edit config/configgb.yml
            sudo rake gems:install schof-searchlogic
          sudo gem1.8 install railroad --local
          sudo gem1.8 install jpmobile-0.0.4.gem --local
            RAILS_ROOT/config/environment.rb の Rails::Initializer.run do |config| 〜 end 内に
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

        #my_admin
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
  #rails plugins to install
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

  #Heroku-----------------------------------------------------------------------------------------------------------------
       sudo gem1.8 install heroku
       sudo gem1.8 install herokugarden
         ssh-keygen -t rsa
          Generating public/private rsa key pair.
          Enter file in which to save the key (/home/you/.ssh/id_rsa):
          Created directory '/home/you/.ssh'.
          Enter passphrase (empty for no passphrase):
          Enter same passphrase again:
          Your identification has been saved in /home/you/.ssh/id_rsa.
          Your public key has been saved in /home/you/.ssh/id_rsa.pub.
          The key fingerprint is:
          e6:22:07:46:2e:48:1a:48:14:65:76:a4:3e:bd:30:ea you@ecolnux
          The key's randomart image is:
          +--[ RSA 2048]----+
          |.+o+.o           |
          |o o o            |
          |o. ..            |
          |oo.o.            |
          |o .=+.  S        |
          |  .o+..o         |
          | .  ..o .        |
          |.    o .         |
          | E               |
          +-----------------+

        heroku keys:add
        git init
        git add .
        git commit -m "new app"
        heroku create  /  herokugarden create

          Enter your Heroku credentials.
          Email: some_body@gmail.com
          Password:
          Uploading ssh public key /home/you/.ssh/id_rsa.pub
          Created http://untitled-f2fa5a.herokugard1en.com/ | git@herokugarden.com:untitled-f2fa5a.git
            Git remote heroku added

          Created http://cold-wind-71.heroku.com/ | git@heroku.com:cold-wind-71.git

        git push heroku master

          Enter passphrase for key '/home/you/.ssh/id_rsa':
          Counting objects: 686, done.
          Compressing objects: 100% (606/606), done.
          Writing objects: 100% (686/686), 1.44 MiB | 3 KiB/s, done.
          Total 686 (delta 60), reused 0 (delta 0)

          -----> Heroku receiving push
          -----> Rails app detected
               Compiled slug size is 1.3MB
          -----> Launching........ done
               App deployed to Heroku

          .To git@heroku.com:cold-wind-71.git
           * [new branch]      master -> master

        heroku rake db:migrate
          error-->edit config/environment.rb
        heroku open



        #repeat
          git push heroku

        #heroku&git commande---------------------------------------------------------------------------------------------
            503  heroku keys
            you@ecolnux:~/RoRapps/takamisoft2$ heroku keys
            === 1 key for some_body@gmail.com
            ssh-rsa AAAAB3NzaC...vF7ojbsQ== you@ecolnux

            504  heroku list
            you@ecolnux:~/RoRapps/takamisoft2$ heroku list
            radiant-journey-14
            gentle-planet-73

            heroku destroy [--app appname]
              heroku destroy --app gentle-planet-73

            505  heroku info [appnameIntheList]
            you@ecolnux:~/RoRapps/takamisoft2$ heroku info radiant-journey-14
            === radiant-journey-14
            Web URL:        http://radiant-journey-14.heroku.com/
            Git Repo:       git@heroku.com:radiant-journey-14.git
            Collaborators:  some_body@gmail.com
            you@ecolnux:~/RoRapps/takamisoft2$ heroku info gentle-planet-73
            === gentle-planet-73
            Web URL:        http://gentle-planet-73.heroku.com/
            Git Repo:       git@heroku.com:gentle-planet-73.git
            Collaborators:  some_body@gmail.com

           git remote add heroku git@heroku.com:appname.git

               git-remote [-v | --verbose]
               git-remote add [-t <branch>] [-m <master>] [-f] [--mirror] <name> <url>
               git-remote rm <name>
               git-remote update [group]
               git-remote show [-n] <name>
               git-remote prune [-n | --dry-run] <name>
          usage: git [--version] [--exec-path[=GIT_EXEC_PATH]] [-p|--paginate|--no-pager] [--bare] [--git-dir=GIT_DIR] [--work-tree=GIT_WORK_TREE] [--help
          ] COMMAND [ARGS]

          The most commonly used git commands are:
             add        Add file contents to the index
             bisect     Find the change that introduced a bug by binary search
             branch     List, create, or delete branches
             checkout   Checkout a branch or paths to the working tree
             clone      Clone a repository into a new directory
             commit     Record changes to the repository
             diff       Show changes between commits, commit and working tree, etc
             fetch      Download objects and refs from another repository
             grep       Print lines matching a pattern
             init       Create an empty git repository or reinitialize an existing one
             log        Show commit logs
             merge      Join two or more development histories together
             mv         Move or rename a file, a directory, or a symlink
             pull       Fetch from and merge with another repository or a local branch
             push       Update remote refs along with associated objects
             rebase     Forward-port local commits to the updated upstream head
             reset      Reset current HEAD to the specified state
             rm         Remove files from the working tree and from the index
             show       Show various types of objects
             status     Show the working tree status
             tag        Create, list, delete or verify a tag object signed with GPG


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
      # PostgreSQLè¨­å®ã

        # passwd postgres ##postgresã¦ã¼ã¶ã¼ã®ãã¹ã¯ã¼ããè¨­å®ã
        # su postgres
        $ psql template1
          template1=# alter user postgres with password '******'; ## ******ã¯é©å½ãªãã¹ã¯ã¼ããè¨­å®ã
          template1=# \q ## \qã§çµäºã
        $ createuser -AdPE hoge ## hogeã¯é©å½ãªä¸è¬ã¦ã¼ã¶ã¼ã¸ãä¸è¬ã¦ã¼ã¶ã¸ã®ãã¼ã¿ãã¼ã¹ä½ææ¨©éè¨­å®ã
        $ vi /etc/postgresql/8.3/main/postgresql.conf
          listen_addresses = 'localhost'
          â
          listen_addresses = '*' ##'*'ã¸å¤æ´ã
        $ vi /etc/postgresql/8.3/main/pg_hba.conf
          ##ä»¥ä¸ããã¡ã¤ã«æä¸é¨ã¸è¿½å ã192.168.11.1ã¯åèªãããã¯ã¼ã¯ç°å¢ã¸ã
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

#mySQL
  #Linode  sudo apt-get install mysql-server mysql-client libmysqlclient15-dev libmysql-ruby1.8 -y
    you@ecolnux:~/RoRapps/2chnrg/lib$ ps -ef |grep sql
    root      3300     1  0 17:29 ?        00:00:00 /bin/sh /usr/bin/mysqld_safe
    mysql     3446  3300  0 17:29 ?        00:00:01 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --port=3306 --socket=/var/run/mysqld/mysqld.sock
    root      3447  3300  0 17:29 ?        00:00:00 logger -p daemon.err -t mysqld_safe -i -t mysqld
  #Linode >  mysqladmin create r2chnn -u root -p
  #cf.  rails -d mysql [pj-name]
  #edit config/database.yml
    development:
      adapter: sqlite3
      database: db/development.sqlite3
      pool: 5
      timeout: 5000
    dev:
      adapter: mysql
      database: r2chnn
      username: "root"
      password: "alison"
      timeout: 5000
      socket: /var/run/mysqld/mysqld.sock
      #encoding: utf8
  cp config/environment/development.rb config/environment/dev.rb
  >  mysql -u root -p
     show databases;
     use [DBname];
     show tables;
     describe [table-name];
    \h  help
    \q  quit
    status

  mysql> select * from users ;
    +----+------------+-----------+----------------------+----------+-------+-----------+------------------------------------------+------------------------------------------+------+-------+---------+-------------+-----------+------------------+-----------+---------------------+---------------------+---------------------+------------+
    | id | first_name | last_name | email                | homepage | about | signature | password_hash                            | password_salt                            | ip   | agent | referer | remember_me | token_key | token_expiration | anonymous | created_at          | updated_at          | verified_at         | deleted_at |
    | +----+------------+-----------+----------------------+----------+-------+-----------+------------------------------------------+------------------------------------------+------+-------+---------+-------------+-----------+------------------+-----------+---------------------+---------------------+---------------------+------------+
    | |  1 | some_body | NULL      | some_body@gmail.com | NULL     | NULL  | NULL      | d9e778c53529bcf488846230be0f6bf6f3a922d4 | 9ee11fa50003a673b6c783263a61770f37254b55 | NULL | NULL  | NULL    | NULL        | NULL      | NULL             |         0 | 2009-07-25 09:19:17 | 2009-07-25 09:19:17 | 2009-07-25 09:19:16 | NULL       |
    | +----+------------+-----------+----------------------+----------+-------+-----------+------------------------------------------+------------------------------------------+------+-------+---------+-------------+-----------+------------------+-----------+---------------------+---------------------+---------------------+------------+
    | 1 row in set (0.00 sec)
    |

   MySQL インポートとエクスポート（テキストデータ） Submitted by sasaki on 月曜, 2007-01-15 15:44
     #erace all existing rows
       mysql -u root -p
       use r2chnn;
       delete from kokuekis;
     ■テキストTAB形式でのエクスポート
        データベースmydbのempテーブルからタブ区切りのテキストデータでエクスポートする。
         $ sudo mysql -B --skip-column-names -D mydb -e 'select * from emp;' -u tanaka -p > out.txt
         $ sudo mysql -B --skip-column-names -D r2chnn -e 'select * from kokuekis;' -u root -p > test.txt
        --skip-column-namesを削除して実行すれば、カラム名も出力されるので便利。
     #vi replace mysq-export&import
      %s/】\t\t/】\t\t2009\//gc
      %s/】\t\t2009\/03/】\t\t2010\/03/gc
      %s/】\t\t2009\/02/】\t\t2010\/02/gc
      %s/】\t\t2009\/01/】\t\t2010\/01/gc
        #置換もれがあるのでvi上でチェック
      #文字化け対策
      ■テキストデータのインポート mysqlimport編
        データベースmydbのempテーブルにテキストデータをインポートする。
          tar cvf tbl.tar *tbl.*; #<----sftp with binmode
          SHOW VARIABLES LIKE 'character_set%';
            SHOW VARIABLES LIKE 'character_set%';
            +--------------------------+----------------------------+
            | Variable_name            | Value                      |
            | +--------------------------+----------------------------+
            | | character_set_client     | latin1                     |
            | | character_set_connection | latin1                     |
            | | character_set_database   | utf8                       |
            | | character_set_filesystem | binary                     |
            | | character_set_results    | latin1                     |
            | | character_set_server     | latin1                     |
            | | character_set_system     | utf8                       |
            | | character_sets_dir       | /usr/share/mysql/charsets/ |
            | +--------------------------+----------------------------+
            • 解決方法その3 root になれるなら MySQL のデフォルト文字コードを UTF-8 に変更する。 /etc/my.cnf か /etc/mysql/my.cnf を開き（ない場合は mysql が起動するときの設定ファイルを探す）、MySQLのデフォルト文字コードを UTF-8 に変更する。
            # vi /etc/my.cnf
            [mysqld]
            default-character-set = utf8
            [mysql]
            default-character-set = utf8
            [mysqldump]
            default-character-set = utf8
          $ sudo mysqlimport --local mydb emp.txt -u root -p
          $ sudo mysqlimport --local r2chnn kokuekis.tbl.tsv -u root -p
         select * from kokuekis where sbm > 900;
       mydb：　データベース名
       emp.sql：　テーブル名.sql（中身はテキストタブのデータ）
       テキストエディタやExcel等で、TEXT-TAB形式で書き出した後、「テーブル名.txt」へ変更する
       --localを指定しないと、「Access denied」エラーが発生する。
#文字化けutf-8
  解決方法その3 root になれるなら MySQL のデフォルト文字コードを UTF-8 に変更する。 /etc/my.cnf か /etc/mysql/my.cnf を開き（ない場合は
    mysql が起動するときの設定ファイルを探す）、MySQLのデフォルト文字コードを UTF-8 に変更する。
    # vi /etc/my.cnf
    [mysqld]
    default-character-set = utf8
    [mysql]
    default-character-set = utf8
    [mysqldump]
    default-character-set = utf8

#ruby/RAILS COMMAND-----------------------------------------------------------------------------------------------------------------
  **create "rails test" add for troubleshooting such as installation of plugins.
  *never use "new/create/destroy/list/index/update/edit/" for controller/model/action name. otherwise Rails router get confused.
  *don't use "_" character for DB table/coolumn name. this way U can easily tell "_" of helper/plugin method name.
  *WiFI connection must check every 10 minutes before every donloading.
  *search "How to deploy [frameforkname/gemsname\pluginname] to Heroku" first of all.
  *install framefowk/gem/plugin  before creating project assuming deployment onto Heroku
  *don't read japanese docment until you stuck into a trouble. it's waste of time.
  #
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

  * phpMyAdmin で depot_development という名のデータベースを作っておき、RadRails で新規 Rails プロジェクトとして depot を作成
  * depot/config/database.yml ファイルを開いてデータベースのユーザー名、パスワード、ソケットなどを適切に設定
  Instead of using the command
  work$ rails exchange
  use the command
  work$ rails -d mysql exchange

  #basic steps of making rails page
    What has been done so far?
      * Installed Rails
      #gem install rails --include-dependencies
      * Created an aplication with the rails command
      $rails exchange
      * Created the databases for the application with the rake command
      $ rake db:create:all
      * Used the script/generate command to create the scaffolding for the application
      $ ruby script/generate scaffold Movie title:string description:text one_sheet_url:string
      * Created the database table using the generated migration file
      $ rake db:migrate
      * Started the webserver with the script/server command
      $ ruby script/server
      * Pointed our web browser to the application and started entering and editing data
      http://localhost:3000/movies

    0)  note that rails url generatio follows "/C[controller-name]/V[view & method/action-name]/Mo[model & filetype parameter-name]/" format.
    1)  create "/app/controllers/[contoller-name]_controller.rb
        ruby script/generte controller [contoller-name] [optional:method/action-name]

    3)  if you need a DB table to be called from rhtml, perform followings in advance:
        ruby script/generte model [model-name]
        #edit app/models/[model-name].rb to add columns ant its attribution.
          t.column  :title  :string
          t.column  :description  :text
          ...
        rake db:migrate

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
            route map.resources :movies
            *create app/controllers/movies_controller.rb
             :
            create app/views/movies/index.html.erb
            create app/views/movies/show.html.erb
            create app/views/movies/new.html.erb
            create app/views/movies/edit.html.erb
            create app/views/layouts/movies.html.erb
            create app/helpers/movies_helper.rb
            create public/stylesheets/scaffold.css dependency model
             :
            *create app/models/movie.rb
            create db/migrate/001_create_movies.rb
             :
            create test/unit/movie_test.rb
            create test/fixtures/movies.yml
            create test/functional/movies_controller_test.rb
             :
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
            `./script/generate scaffold post title:string body:text published:boolean`
            `./script/generate scaffold purchase order_id:integer amount:decimal`

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

  #fri/qri tutorial
    fastri-server       ;#invoke index server
    #vim      C-],  <S-K> means "!man [word nder cursor]
    #command-line  [fq]ri -h;[fq]ri -e NKF
    #OBSOLETE: ri tutorial
      ri WWW::Mechanize::FileResponse
      ri --gems WWW::Mechaniz
      ri --gems mail -l
  #Rdoc local genelation like javadoc----------------------------------------------------------------------------------
    cd railsapi/
    rake rails:freeze:gems
    echo >vendor/rails/activesupport/README
    rake doc:rails
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
    Rails debugger
      喜ばしいことに、Rails 2.0ではruby-debug を使ったdebuggerが正式に採用されました。 これの使い方は非常に簡単です。
      まずは、以下のようにブレークポイントをコード中に書き込みます。
           1  def some_method
           2    debugger # breakpoint
           3  end
        #@erb/rhtml       print "<% require 'ruby-debug' %>" print "<% debugger %>"

      続いて、Webサーバをデバッグモードで実行します。
           1  % ./script/server -u
      (rdb:)  $LOADED_FEATURES
      (rdb:2) info variables
          info instance_variables
      (rdb:2) info global_variables
           :  :



#redmine
  rake db:migrate
    #adva-cmsとはDBtable 'comments'が衝突してmigrate頓挫する。両方のcommentsテーブルは構成がにていて、ADVA-CMSのcommentsテーブルの方が多くのカラムを持つが、包含関係ではない。
    したがって互換性もなく、共存させたければADVA-CMSとRedmineのマイグレーションファイルをマージしてからmigrateするハックが必要。DBtable 'boards'も同様。
    comments
    boards
  admin/adminで初回ログイン
  open-IDつかいたいならば -->  sudo gem install ruby-openid
#redmine-overwriting-upgrade
  0.8.x series & 0.9.x series ---> DBに互換性なし
  sudo gem1.8 uninstall rack
  #rackup0.1, synatraもけす

  sudo gem1.8 install --version '= 1.0.1' rack
  rake db:migrate
  #vim /config/environment.rb
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    secret = Array.new(60){chars[rand(chars.size)]}.join
    config.action_controller.session = { :key => "_hello_session", :secret => secret }
#redmine plugin making つまるところ以下の手順でプラグインが開発できる。
  See: http://rails-engines.org/
  1. script/generate redmine_plugin でプラグインの雛形を作る
    ruby script/generate redmine_plugin r2chnn
  1b file-copy
    railsでつくったMVCをREDMINE/vendor/plugins 配下にコピーし差をうめ 　　
    元RailsAppのRAILS_ROOT/lib はREDMINE_ROOT/libにコピー
    元RailsAppのRAILS_ROOT/public/* はREDMINE_ROOT/public にコピー
    元RailsAppのRAILS_ROOT/public/images/* はREDMINE_ROOT/public/images/ にコピー
    元RailsAppのRAILS_ROOT/vendor/plugins/* はREDMINE_ROOT/vendor/lugins/ にコピー(ただしRedmineのbootエラーが出るプラグインはどこかに退避させる）
  2. init.rb を編集する
    Redmine::Plugin.register :redmine_continuous_deployment do
      name 'Redmine Continuous Deployment plugin'
      author 'Takayuki Kyowa'
      description 'Redmine Continuous Deployment plugin'
      version '0.0.1'

    #メニューの追加先をプロジェクトメニューにしています 初期設定で最も重要なのは表示メニューへの追加です。追加可能な表示箇所は以下の4つに分類さ れます。
       1. トップメニュー（top_menu）
       2. アカウントメニュー（account_menu）
       3. プロジェクト非選択時のアプリケーションメニュー（application_menu）
       4. プロジェクト選択時メニュー（project_menu）（①）。プロジェクトメニューa project-IDが必須にな ります。
    #:paramオプションで:project_idを指定するとURLにプロジェクトIDが付与されます(②)。
      menu :project_menu, :deploy_history,  # ①
         { :controller => 'deployments', :action => 'index' }, :caption => "デプロイ", :last => true,
         :param => :project_id # ②
      #プロジェクトメニューはデフォルトで非表示にな っているため，permissionメソッドで表示/非表示を制御します(③)。
      #注意事項：URLを直打ちするとpermissionはきかない。一般公開を目的としたプラグインを作成する場合には指定せず権限の管理画面（/roles/report）からロール毎に表示／非表示を設定します。

        permission
        :deploy_histories,              # パーミッションの名前。パーミッション全体で一意でなければならない。
        { :deployments => [ :index ] }, # 制御対象の画面をあらわすハッシュ。menuメソッドで指定したコントローラ / アクションを指定する。
        :public => true                 # trueにすると常に表示される。

    end

    #例
    class ModelName < ActiveRecord::Migration
      def self.up
      create_table :deploy_histories do |t|
        t.column :project_id, :integer    # デプロイ時のプロジェクト
        t.column :deployer_id, :integer   # デプロイしたユーザ
        t.column :changeset_id, :integer  # デプロイ時のチェンジセット（リビジョン）
        t.column :started_on, :datetime   # 開始時間
        t.column :deployed_on, :datetime  # 終了時間
        t.column :return_code, :integer   # デプロイの実行結果。コマンドの終了ステータスを保存する。
        t.column :log, :text              # デプロイのログ
      end
      end

      def self.down
      drop_table :deploy_histories
      end
    end

    一通り作成したらmigrateを実行します。
    $ RAILS_ENV=production rake db:migrate_plugins

  3. 共通設定移植
    application_contoroller の独自共通メソッド
    config/database.yml
    config/environments.rb
    config/routes.rb
  3. Contoroller 移植(@project を基点にプロジェクトの情報を得る)
    #これをいれるとredmine標準layout   layout 'base'
      unloadable
      before_filter :find_project #, :authorize  <----会員専用ページ
      ...
    private
      def find_project
      @project=Project.find(params[:id])
      end
    class
    EOF
    #プロジェクト配下では@projectインスタンス変数が必須になる為，URLで渡されたプロジェクトIDからProjectモデルのインスタンスを取得し，
    @projectイ ンスタンス変数にセットしています。基本的にすべての画面で必要になるため，before_filterで記述しています（①）。

  4. View を書く
      値の取得例：<%= button_to "デプロイ！", { :action => "deploy", :project_id => params[:project_id] } %>
      def hogehoge
        @project = Project.find(params[:project_id])
      end
    PG:redmine:plugin: setting/*erb のファイル名はインストール済みプラグインの名前空間で衝突しない独特名にしないと、早番順同名ファイルがよみこまれたりする。
    #PLUGIN_ROOT/app/views/で
      <%#  takami disabled below due to 'stack level too deep' error%>
      <%#  <%= stylesheet_link_tag 'scaffold' +|%>
  5. PLUGINROT/lang/nn.yml  config/locales 言語ファイルを書く
    lang/en.yml
      en:
        button_exec_deploy: Deploy!
        text_confirm_deploy: Are you sure you want to deploy?
    lang/ja.yml
      ja:
        button_exec_deploy: デプロイ！
        text_confirm_deploy: デプロイします。よろしいですか？

    アプリ側からメッセージを読み込むには「l」というメソッドの引数に言語ファイルで定義したラベルを指定します。
    app/views/deployments/index.html.erb
      <%= button_to l(:button_exec_deploy), { :action => "deploy", :project_id => params[:project_id] }, :confirm => l(:text_confirm_deploy) %>

  6. /home/you/RoRapps/redmine-0.9.5/app/controllers/settings_controller.rb

  rake db:migrate_plugins


  #Redmineで名前空間内衝突をおこし、そのままつかえない人気プラグイン
    #Paperclip::Attachment:Classと redmine-0.8.4/app/models/attachment.rbのAttachment:Classと名前衝突、誤動作
      /home/you/RoRapps/redmine-0.8.4/app/models/attachment.rb:34: undefined method `table_name' for Paperclip::Attachment:Class (NoMethodError)
    #jpmobile (* 0.9.5はbootエラーなし。)
      /home/you/RoRapps/redmine-0.8.4/vendor/plugins/jpmobile/lib/jpmobile/hook_action_view.rb:26: undefined method `find_template' for class `ActionView::PathSet' (NameError)
    --> require '/usr/lib/ruby/gems/1.8/gems/jpmobile-0.0.4/lib/jpmobile.rb'  #some_body
    #XXX_path, XXX_urlの書き換え
  #if redmine 0.8.x系 then
    environments.rb /config/environmnts/[envname]rb config.plugin_reload=true

  #redmine-gmail-combo
    #ruby script/plugin install git://github.com/collectiveidea/action_mailer_optional_tls.git
    i#config/email.ymlはタブをスペースに変換すること。
#linode new-plugin/mdule配備手順
  ローカルにデプロイ演習DB作っておいて演習する。
  いろいろmigrationむけrake task ommandはあるが、rake:db:migrateでエラーになるファイルをさけつつガリガリやってDBtable作成を目視確認するのがはやみち。
    rake db:migrate:plugin                                 # Migrate a specified plugin.
    rake db:migrate:plugins                                # Migrate plugins to current status.
    rake db:migrate:redo                                   # Rollbacks the database one migration and re migrate up.
    rake db:migrate_plugins                                # Migrates installed plugins.
    rake db:migrate:upgrade_plugin_migrations              # For engines coming from Rails version < 2.0 or for those previously updated to work with Sven Fuch's fork of engines, you need to upgrade the schema info table

#@editable はwiki_controller-->iMixinWikiController::def indexとよばれる。document_controllerではこのながれはない。

#redminePG: http://localhost:3000/projects/convert/documents?sort_by=author  きかない docusmnt/index ではattachments.authorでソートするので添付ファイル泣ければ動作しない
#Linode環境移行手順
  #db-migration
    /root/TMPDIR/DBbak/r2chnn_core_selected_tables.gz
    /root/redmine-0.9.5/config/database.yml
  #httpd-env
    /usr/local/apache2/conf/extra/httpd-proxy.conf
    /usr/local/apache2/conf/httpd.conf
    /root/redmine-0.9.5/config/environments/development.rb
    /root/redmine-0.9.5/config/environments/production.rb
  #appdir & cronpath
    /root/redmine-0.9.5/lib/R2chnnInitfork.rb
#webalizer-------------------------------------------------------------------------------
  #かならずshellで作業。vimのシェルコマンドではうまくslinkがつくられない
  #cd #{RAILS_ROOT}/public
  !sudo ln -s var/log/webalizer webalizer
~

  #1liner
    ruby test.rb yomikaku.txt >new ;sort     new >new2
    ruby test.rb yomikaku.txt >new ;sort -b new >new2

    -e … このオプションのあとにスクリプト片を与えると、ファイルからスクリプトを読み込むのではなくそれをそのまま実行してくれます。
      ruby -e ‘print “Hello World!¥n”‘     画面にHello World!が表示されます
      ruby -ne ‘gsub(/ +/, “¥t”)’ <filename  ファイル中のスペースの連続をTSVタブに置換
      ruby -ne ‘$_.upcase!’ <filename    ファイル中のアルファベットをすべて大文字に


    -p … このオプション（引数なし）を与えると、プログラム全体が

      while gets
        …
        print $_
      end


    FILE SPACING:

    # double space a file
      $  ruby -pe 'puts' < file.txt
    # triple space a file
      $  ruby -pe '2.times {puts}' < file.txt
    # undo double-spacing (w/ and w/o whitespace in lines)
      $  ruby -lne 'BEGIN{$/="\n\n"}; puts $_' < file.txt
      $  ruby -ne 'BEGIN{$/="\n\n"}; puts $_.chomp' < file.txt
      $  ruby -e 'puts STDIN.readlines.to_s.gsub(/\n\n/, "\n")' < file.txt

    NUMBERING:

    # number each line of a file (left justified).
      $  ruby -ne 'printf("%-6s%s", $., $_)' < file.txt
    # number each line of a file (right justified).
      $  ruby -ne 'printf("%6s%s", $., $_)' < file.txt
    # number each line of a file, only print non-blank lines
      $  ruby -e 'while gets; end; puts $.' < file.txt
    # count lines (emulates 'wc -l')
      $  ruby -ne 'END {puts $.}' < file.txt
      $  ruby -e 'while gets; end; puts $.' < file.txt

    TEXT CONVERSION AND SUBSTITUTION:

    # convert DOS newlines (CR/LF) to Unix format (LF)
    # - strip newline regardless; re-print with unix EOL
      $  ruby -ne 'BEGIN{$\="\n"}; print $_.chomp' < file.txt

    # convert Unix newlines (LF) to DOS format (CR/LF)
    # - strip newline regardless; re-print with dos EOL
      $  ruby -ne 'BEGIN{$\="\r\n"}; print $_.chomp' < file.txt

    # delete leading whitespace (spaces/tabs/etc) from beginning of each line
      $  ruby -pe 'gsub(/^\s+/, "")' < file.txt

    # delete trailing whitespace (spaces/tabs/etc) from end of each line
    # - strip newline regardless; replace with default platform record separator
      $  ruby -pe 'gsub(/\s+$/, $/)' < file.txt

    # delete BOTH leading and trailing whitespace from each line
      $  ruby -pe 'gsub(/^\s+/, "").gsub(/\s+$/, $/)' < file.txt

    # insert 5 blank spaces at the beginning of each line (ie. page offset)
      $  ruby -pe 'gsub(/%/, "   ")' < file.txt
      FAILS! $  ruby -pe 'gsub(/%/, 5.times{putc " "})' < file.txt

    # align all text flush right on a 79-column width
      $  ruby -ne 'printf("%79s", $_)' < file.txt

    # center all text in middle of 79-column width
      $  ruby -ne 'puts $_.chomp.center(79)' < file.txt
      $  ruby -lne 'puts $_.center(79)' < file.txt

    # substitute (find and replace) "foo" with "bar" on each line
      $  ruby -pe 'gsub(/foo/, "bar")' < file.txt

    # substitute "foo" with "bar" ONLY for lines which contain "baz"
      $  ruby -pe 'gsub(/foo/, "bar") if $_ =~ /baz/' < file.txt

    # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
      $  ruby -pe 'gsub(/foo/, "bar") unless $_ =~ /baz/' < file.txt

    # substitute "foo" or "bar" or "baz".... with "baq"
      $  ruby -pe 'gsub(/(foo|bar|baz)/, "baq")' < file.txt

    # reverse order of lines (emulates 'tac') IMPROVE
      $  ruby -ne 'BEGIN{@arr=Array.new}; @arr.push $_; END{puts @arr.reverse}' < file.txt

    # reverse each character on the line (emulates 'rev')
      $  ruby -ne 'puts $_.chomp.reverse' < file.txt
      $  ruby -lne 'puts $_.reverse' < file.txt

    # join pairs of lines side-by-side (like 'paste')
      $  ruby -pe '$_ = $_.chomp + " " + gets if $. % 2' < file.txt

    # if a line ends with a backslash, append the next line to it
      $  ruby -pe 'while $_.match(/\\$/); $_ = $_.chomp.chop + gets; end' < file.txt
      $  ruby -e 'puts STDIN.readlines.to_s.gsub(/\\\n/, "")' < file.txt

    # if a line begins with an equal sign, append it to the previous line (Unix)
      $  ruby -e 'puts STDIN.readlines.to_s.gsub(/\n=/, "")' < file.txt

    # add a blank line every 5 lines (after lines 5, 10, 15, etc)
      $  ruby -pe 'puts if $. % 6 == 0' < file.txt

    SELECTIVE PRINTING OF CERTAIN LINES

    # print first 10 lines of a file (emulate 'head')
      $  ruby -pe 'exit if $. > 10' < file.txt

    # print first line of a file (emulate 'head -1')
      $  ruby -pe 'puts $_; exit' < file.txt

    # print the last 10 lines of a file (emulate 'tail'); NOTE reads entire file!
      $  ruby -e 'puts STDIN.readlines.reverse!.slice(0,10).reverse!' < file.txt

    # print the last 2 lines of a file (emulate 'tail -2'); NOTE reads entire file!
      $  ruby -e 'puts STDIN.readlines.reverse!.slice(0,2).reverse!' < file.txt

    # print the last line of a file (emulates 'tail -1')
      $  ruby -ne 'line = $_; END {puts line}' < file.txt

    # print only lines that match a regular expression (emulates 'grep')
      $  ruby -pe 'next unless $_ =~ /regexp/' < file.txt

    # print only lines that DO NOT match a regular expression (emulates 'grep')
      $  ruby -pe 'next if $_ =~ /regexp/' < file.txt

    # print the line immediately before a regexp, but not the regex matching line
      $  ruby -ne 'puts @prev if $_ =~ /regex/; @prev = $_;' < file.txt

    # print the line immediately after a regexp, but not the regex matching line
      $  ruby -ne 'puts $_ if @prev =~ /regex/; @prev = $_;' < file.txt

    # grep for foo AND bar AND baz (in any order)
      $  ruby -pe 'next unless $_ =~ /foo/ && $_ =~ /bar/ && $_ =~ /baz/' < file.txt

    # grep for foo AND bar AND baz (in order)
      $  ruby -pe 'next unless $_ =~ /foo.*bar.*baz/' < file.txt

    # grep for foo OR bar OR baz
      $  ruby -pe 'next unless $_ =~ /(foo|bar|baz)/' < file.txt

    # print paragraph if it contains regexp; blank lines separate paragraphs
      $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /regexp/' < file.txt

    # print paragraph if it contains foo AND bar AND baz (in any order); blank lines separate paragraphs
      $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /foo/ && $_ =~ /bar/ && $_ =~ /baz/' < file.txt

    # print paragraph if it contains foo AND bar AND baz (in order); blank lines separate paragraphs
      $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /(foo.*bar.*baz)/' < file.txt

    # print paragraph if it contains foo OR bar OR baz; blank lines separate paragraphs
      $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /(foo|bar|baz)/' < file.txt

    # print only lines of 65 characters or greater
      $  ruby -pe 'next unless $_.chomp.length >= 65' < file.txt
      $  ruby -lpe 'next unless $_.length >= 65' < file.txt

    # print only lines of 65 characters or less
      $  ruby -pe 'next unless $_.chomp.length < 65' < file.txt
      $  ruby -lpe 'next unless $_.length < 65' < file.txt

    # print section of file from regex to end of file
      $  ruby -pe '@found=true if $_ =~ /regex/; next unless @found' < file.txt

    # print section of file based on line numbers (eg. lines 2-7 inclusive)
      $  ruby -pe 'next unless $. >= 2 && $. <= 7' < file.txt

    # print line number 52
      $  ruby -pe 'next unless $. == 52' < file.txt

    # print every 3rd line starting at line 4
      $  ruby -pe 'next unless $. >= 4 && $. % 3 == 0' < file.txt

    # print section of file between two regular expressions, /foo/ and /bar/
      $  ruby -ne '@found=true if $_ =~ /foo/; next unless @found; puts $_; exit if $_ =~ /bar/' < file.txt

    SELECTIVE DELETION OF CERTAIN LINES

    # print all of file except between two regular expressions, /foo/ and /bar/
      $  ruby -ne '@found = true if $_ =~ /foo/; puts $_ unless @found; @found = false if $_ =~ /bar/' < file.txt

    # print file and remove duplicate, consecutive lines from a file (emulates 'uniq')
      $  ruby -ne 'puts $_ unless $_ == @prev; @prev = $_' < file.txt

    # print file and remove duplicate, non-consecutive lines from a file (careful of memory!)
      $  ruby -e 'puts STDIN.readlines.sort.uniq!.to_s' < file.txt

    # print file except for first 10 lines
      $  ruby -pe 'next if $. <= 10' < file.txt

    # print file except for last line
      $  ruby -e 'lines=STDIN.readlines; puts lines[0,lines.size-1]' < file.txt

    # print file except for last 2 lines
      $  ruby -e 'lines=STDIN.readlines; puts lines[0,lines.size-2]' < file.txt

    # print file except for last 10 lines
      $  ruby -e 'lines=STDIN.readlines; puts lines[0,lines.size-10]' < file.txt

    # print file except for every 8th line
      $  ruby -pe 'next if $. % 8 == 0' < file.txt

    # print file except for blank lines
      $  ruby -pe 'next if $_ =~ /^\s*$/' < file.txt

    # delete all consecutive blank lines from a file except the first
      $  ruby -e 'BEGIN{$/=nil}; puts STDIN.readlines.to_s.gsub(/\n(\n)+/, "\n\n")' < file.txt

    # delete all consecutive blank lines from a file except for the first 2
      $  ruby -e 'BEGIN{$/=nil}; puts STDIN.readlines.to_s.gsub(/\n(\n)+/, "\n\n")' < file.txt

    # delete all leading blank lines at top of file
      $  ruby -pe '@lineFound = true if $_ !~ /^\s*$/; next if !@lineFound' < file.txt

