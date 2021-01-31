
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
