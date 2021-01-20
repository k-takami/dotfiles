#apache
	Apache2.0----------------------------------------------
		$ ./configure --prefix=[path:default=/usr/local/apache2]
		$ sudo make
		$ sudo make install
		$ PREFIX/bin/apachectl start
		//compiling install webmin
			sh setup.sh
			sudo /usr/local/apache2/bin/apachectl start
			sudo /usr/local/apache2/bin/httpd start
		ERROR premature end of script headers
			--> /usr/bin/perl --
			--> change \n into LF
			attempt to invoke directory as script: /.../htdocs/hogehoge/cgi-bin/
			Apache2.0では、 SetHandler server-parsedの命令文を入れると、DirectoryIndex命令が効かなくなるようです。Turbo Desktop 10に、Apacheの2.0をソースコードからコンパイルすると、ブラウザは同じように「ファイル未検出（404）」のエラーを返します。Apacheが起動する時に、「SetHandler server-parsed文があると、DirectoryIndex命令は無効になりますよ」といったメッセージを出してくれれば、話は分かるのですが・・・。
			-----------------------------------------------------------------
			■変更後
			<Directory "/home/aaa/cgi-bin/">
			　　AddHandler perl-script .cgi
			　　PerlResponseHandler ModPerl::Registry
			　　PerlOptions +ParseHeaders
			　　Options ExecCGI +MultiViews
			</Directory>
			■設定3で追記した通常のCGIで動作させるDirecitoryディレクティブは削除
			------------------------------------------------
		#password CGI
			unzip password
			chmod -R 777 /usr/local/apache2/cgi-bin/*
			DrectoryIndexã<80><80>ã<83>¼ã<83>¼ï¼<9e>ã<80><80>index.cgi index.html index.html.var
			index　ーー＞　index.cgi index.html index.html.var
			#ftp://some_body.vs.land.to/
			http://some_body.vs.land.to/view.cgi?href=0&id=takami&pass=vlml8877
		#module-check
			sudo  /usr/local/apache2/bin/httpd -l
	
	#webmin-operaton
		tail /root/2chnrg/log/backgroundrb_11006.log -n 50; vmstat -S M ;ps -ef|grep back;ps -ef|grep script/server
apache2 on windows
	DL : https://www.apachehaus.com/cgi-bin/download.plx
	展開されたApache**ディレクトリーをc:直下に移動
	C:\Apache**\bin\httpd.exeを起動。そのほかのexeは腐っていてつかえない。
Mysql on Windows
	login from GIT-BASH: 
		$ "/C/Program Files (x86)/MySQL/MySQL Server 5.7/bin/mysql.exe" "--defaults-file=C:\ProgramData\MySQL\MySQL Server 5.7\my.ini" "-uroot" "-p" "--default-character-set=utf8"
		Enter password: ****
	Welcome to the MySQL monitor.  Commands end with ; or \g.


