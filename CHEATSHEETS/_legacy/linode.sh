PaaS
#heroku
	禁則
		*search "How to deploy [frameforkname/gemsname\pluginname] to Heroku" first of all.
		*install framefowk/gem/plugin  before creating project assuming deployment onto Heroku
	gem install heroku
	ssh-keygen -t rsa
		pbcopy <  ~/.ssh/id_rsa.pub  #clipboard
		
	heroku keys:add /root/.ssh/id_rsa.pub
	//すでにデプロイされてるものを取得
	git clone git@heroku.com:tkt-redmine.git
	//すでにデプロイされてるものを取得 createしたばあいはgit repo名も表示される
	heroku [(create|destroy|rename)] [heroku_app_name]
	//origin以外のremote repoとしてheroku-repoを登録してpush
	// git clone とかして持ってきたときには明示的に追加する
	git remote add heroku git@heroku.com:[app-name].git
	git push heroku master
	//ここでheroku側のBundle install & bootupがおきるが､RDBMSがpostgresql以外はこけ
	るので事前点検すべし
#linode
	#linode new-plugin/mdule配備手順
		ローカルにデプロイ演習DB作っておいて演習する。
		いろいろmigrationむけrake task ommandはあるが、rake:db:migrateでエラーになるファイルをさけつつガリガリやってDBtable作成を目視確認するのがはやみち。
			rake db:migrate:plugin                                 # Migrate a specified plugin.
			rake db:migrate:plugins                                # Migrate plugins to current status.
			rake db:migrate:redo                                   # Rollbacks the database one migration and re migrate up.
			rake db:migrate_plugins                                # Migrates installed plugins.
			rake db:migrate:upgrade_plugin_migrations              # For engines coming from Rails version < 2.0 or for those previously updated to work with Sven Fuch's fork of engines, you need to upgrade the schema info table
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
	#r2chnn deploy log
		cd ~;rm vimhomeold.tar*;tar -cvf vimhomeold.tar .vim* *vim* .ve_* MyWiki/ .*rc  ;gzip vimhomeold.tar; cd -
			cd ~/RoRapps/; tar -cvf 2chnrg-latest.tar  2chnrg ;gzip 2chnrg-latest.tar; cd -
		cd ~/RoRapps/; tar -cvf 2chnrg-dev.tar 2chnrg/ ;gzip 2chnrg-dev.tar;cd -
		cd ~/RoRapps/; tar -cvf dev232plain.best.tar dev232plain/ ;gzip dev232plain.best.tar; cd -
		sftp xxx.xxx.xxx ;(su password & root password) --> mput *gz /root
		gem install chronic packet
			ruby script/plugin install http://svn.devjavu.com/backgroundrb/trunk
			rake backgroundrb:setup; rake db:migrate
		ruby script/server -p 80 -b 74.207.240.145 -e production
			ruby lib/scraper.rb 2nn
		Ubuntu Hardy に ImageMagick RMagick をインストールす
			くどいくらいやる。リポジトリの場所の改廃が早いため-->    
				% sudo aptitude update
				% sudo aptitude install imagemagick libmagick9-dev
			ヴァージョン合わせる。そしてローカルコンパイルに数十分かかる-->    
				% sudo gem1.8 install rmagick -v 1.15.13
			確認は，
				$ irb
				irb(main):001:0> require 'rubygems'
				=> true
				irb(main):002:0> require 'RMagick'
				=> true
		file_column plugin to rails app
			"webからfile_column.tar.gz をダウンロード、展開、file_colmnにフォルダー名かきかえ
			EDIT: /home/you/RoRapps/2chnrg/vendor/plugins/file-column/lib/file_column.rb
				#org       my_options = FileColumn::init_options(options, Inflector.underscore(self.name).to_s, attr.to_s)
					my_options = FileColumn::init_options(options, self.name.to_s.underscore, attr.to_s)
			grep -RI "1.2" ./MAN*/*htm*>tmpgrep.txt
			#tar tvf xvf cvf zZ option is buggy.
		==============================================================================
		#wget
			wget -o wgetlog.txt -S -x -r --level=2 -k -p -A --accept=htm,html,shtml,jpg,jpeg,gif,png
				http://www.asahi-net.or.jp/~aa4t-nngk/ipttut/output/index.html
			wget -O - -q ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest | grep ipv4 | grep JP | grep -v grep | perl -a -F'/\|/' -n -l -e 'BEGIN{ print "order deny,allow\ndeny from all\n" } $mask = 32; $square = 0; $value = $F[4]; while($value != 1){ $value /= 2; $square++ } print "allow from $F[3]/" . ($mask - $square)' > /path/to/.htaccess
		#mySQL
			#Linode  sudo apt-get install mysql-server mysql-client libmysqlclient15-dev libmysql-ruby1.8 -y
				
				you@ecolnux:~/RoRapps/2chnrg/lib$ ps -ef |grep sql
				root      3300     1  0 17:29 ?        00:00:00 /bin/sh /usr/bin/mysqld_safe 
				mysql     3446  3300  0 17:29 ?        00:00:01 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --port=3306 --socket=/var/run/mysqld/mysqld.sock
				root      3447  3300  0 17:29 ?        00:00:00 logger -p daemon.err -t mysqld_safe -i -t mysqld
			#Linode >  mysqladmin create r2chnn -u root -p
			
			#cf.  rails -d mysql [pj-name]
			#utf-8
				解決方法その3 root になれるなら MySQL のデフォルト文字コードを UTF-8 に変更する。 /etc/my.cnf か /etc/mysql/my.cnf を開き（ない場合は
					mysql が起動するときの設定ファイルを探す）、MySQLのデフォルト文字コードを UTF-8 に変更する。
					# vi /etc/my.cnf
					[mysqld]
					default-character-set = utf8
					[mysql]
					default-character-set = utf8
					[mysqldump]
					default-character-set = utf8
			#edit config/database.yml 
				development:
					adapter: sqlite3
					database: db/development.sqlite3
					pool: 5
					timeout: 5000
				dev:
					adapter: mysql
					username: "root"
					database: r2chnn
					socket: /var/run/mysqld/mysqld.sock
					timeout: 5000
					password: "alison"
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
				| 1 row in set (0.00 sec)   
				| id | first_name | last_name | email                | homepage | about | signature | password_hash                            | password_salt                            | ip   | agent | referer | remember_me | token_key | token_expiration | anonymous | created_at          | updated_at          | verified_at         | deleted_at |
				| +----+------------+-----------+----------------------+----------+-------+-----------+------------------------------------------+------------------------------------------+------+-------+---------+-------------+-----------+------------------+-----------+---------------------+---------------------+---------------------+------------+
				| +----+------------+-----------+----------------------+----------+-------+-----------+------------------------------------------+------------------------------------------+------+-------+---------+-------------+-----------+------------------+-----------+---------------------+---------------------+---------------------+------------+
				| |  1 | some_body | NULL      | some_body@gmail.com | NULL     | NULL  | NULL      | d9e778c53529bcf488846230be0f6bf6f3a922d4 | 9ee11fa50003a673b6c783263a61770f37254b55 | NULL | NULL  | NULL    | NULL        | NULL      | NULL             |         0 | 2009-07-25 09:19:17 | 2009-07-25 09:19:17 | 2009-07-25 09:19:16 | NULL       |
			#Linode  sudo apt-get install mysql-server mysql-client libmysqlclient15-dev libmysql-ruby1.8 -y
				you@ecolnux:~/RoRapps/2chnrg/lib$ ps -ef |grep sql
				root      3300     1  0 17:29 ?        00:00:00 /bin/sh /usr/bin/mysqld_safe
				mysql     3446  3300  0 17:29 ?        00:00:01 /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --port=3306 --socket=/var/run/mysqld/mysqld.sock
				root      3447  3300  0 17:29 ?        00:00:00 logger -p daemon.err -t mysqld_safe -i -t mysqld
			#Linode >  mysqladmin create r2chnn -u root -p 
			#Linode >  rake adva:install:core;rake adva:uninstall engines=blog
			#Linode >  rake db:migrate
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
					全部バックアップ：$ mysqldump -A -hlocalhost -uroot >mysqldumpAll_local_root.sql
						http://qiita.com/PlanetMeron/items/3a41e14607a65bc9b60c
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
		
			
