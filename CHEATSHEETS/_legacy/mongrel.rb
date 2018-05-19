
#mod_rails-passenger RailsMaxPoolSize =2でもlinode360で不安: mongrel cluster N=3 で50K/dayこえたら検討
#-----------------------------------------------------------------------------
you@ecolnux:~/RoRapps/2chnrg$ vmstat -S M
	you@ecolnux:~/RoRapps/2chnrg$ passenger Node=1 below
	procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
	 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
	 3  0    196      8      1     27    0    0    27    19  144   98  9 14 75  2
	you@ecolnux:~/RoRapps/2chnrg$ mongrel_cluster Node=1 below
	procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
	 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
	 2  0    126     13      4     41    0    0    27    19  144   98  9 14 75  2
	you@ecolnux:~/RoRapps/2chnrg$ mongrel_cluster Node=2 below
	procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
	 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
	 4  0    126      6      3     32    0    0    27    19  144   99  9 14 75  2
	-------------------------------------------------------------------------------
##Mongrel
	mongrelはスレッド起動などが無いため、1ポート1プロセス。後述するmongrel_cluster+Apache mod_proxyと併用します。
	# mongrel & mongrel_clusterのインストール。
		sudo gem install mongrel mongrel_cluster --include-dependencies
		cd RAILS_ROOT
		mongrel_rails stop
	#Apache2 状況確認
		/usr/local/apache2/bin/httpd -l
	#Apache2 rebuild
		wget http://example.com/path/to/httpd-2.2.3.tar.bz2
		tar jxf httpd-2.2.3.tar.bz2
		cd httpd-2.2.3
		#sudo ./configure --enable-proxy --enable-proxy-balancer
		sudo ./configure --enable-proxy --enable-proxy-balancer --enable-so --enable-ssl --with-ssl=/usr/bin/openssl --enable-modules=most
		sudo make
		sudo make install
	#case of DSO installable module
		apache2 mod_rewriteを後から追加（インストール）
		PHPをインストール済みの場合、あとからapacheを再インストールは大変です。*DSOでインストールされているか？を確認。されていればOK。
		/usr/local/apache2/bin/httpd -lを実行
			Compiled-in modules:
			http_core.c
			mod_so.c 　これがあれば makeをしないで追加できる

		*mod_rewriteをインストール
		ソースをDLした場所（例）に/home//source/httpd-2.2./modules/mappers/mod_xxx.cがあるか確認
			find -name * ./ |grep xxx

		cd /home//source/httpd-2.2./xxx/XXX/
		$ /usr/local/apache2/bin/apxs -i -a -c ./mod_xxx.c

		apacheの再起動で有効

	#一度設定ファイル(config/mongrel_cluster.yml)を作るようです。
		#Linode: mongrel_rails cluster::configure -a 127.0.0.1 -e production -p 3000 -N 3 -n10
			Writing configuration file to config/mongrel_cluster.yml.
			you@ecolnux:~/RoRapps/2chnrg$ cat config/mongrel_cluster.yml
			--- 
			address: 127.0.0.1
			log_file: log/mongrel.log
			port: "3000"
			num_procs: "10"
			environment: production
			pid_file: tmp/pids/mongrel.pid
			servers: 3
		#mongrel_cluster startでは、単に複数ポートでmongrelが起動しているだけ
		mongrel_rails cluster::start -v --clean
			mongrel_rails cluster::stop
		#手動起動	-Bを付けるとデバッグモードです。これつけるとかなり遅い。-n10で10個のスレッド起動ができる。
		mongrel_rails start -a 127.0.0.1 -d production -p 3000 -B
		#ロードバランスさせる必要があります。それはapacheのmod_proxyで実現。
		conf/httpd-proxy.conf & httpd.conf


		you@ecolnux:/usr/local/apache2/conf$ mongrel_rails start -h
			Usage: mongrel_rails <command> [options]
				-e, --environment ENV            Rails environment to run as
				-d, --daemonize                  Run daemonized in the background
				-p, --port PORT                  Which port to bind to
				-a, --address ADDR               Address to bind to
				-l, --log FILE                   Where to write log messages
				-P, --pid FILE                   Where to write the PID
				-n, --num-processors INT         Number of processors active before clients denied
				-o, --timeout TIME               Time to wait (in seconds) before killing a stalled thread
				-t, --throttle TIME              Time to pause (in hundredths of a second) between accepting clients
				-m, --mime PATH                  A YAML file that lists additional MIME types
				-c, --chdir PATH                 Change to dir before starting (will be expanded)
				-r, --root PATH                  Set the document root (default 'public')
				-B, --debug                      Enable debugging mode
				-C, --config PATH                Use a config file
				-S, --script PATH                Load the given file as an extra config script
				-G, --generate PATH              Generate a config file for use with -C
					--user USER
												 User to run as
					--group GROUP
												 Group to run as
					--prefix PATH
												 URL prefix for Rails app
				-h, --help                       Show this message
					--version                    Show version

		you@ecolnux:/usr/local/apache2/conf$ mongrel_rails cluster::configure -h
			Usage: mongrel_rails <command> [options]
				-e, --environment ENV            Rails environment to run as
				-p, --port PORT                  Starting port to bind to
				-a, --address ADDR               Address to bind to
				-l, --log FILE                   Where to write log messages
				-P, --pid FILE                   Where to write the PID
				-c, --chdir PATH                 Change to dir before starting (will be expanded)
				-o, --timeout TIME               Time to wait (in seconds) before killing a stalled thread
				-t, --throttle TIME              Time to pause (in hundredths of a second) between accepting clients
				-m, --mime PATH                  A YAML file that lists additional MIME types
				-r, --root PATH                  Set the document root (default 'public')
				-n, --num-procs INT              Number of processor threads to use
				-B, --debug                      Enable debugging mode
				-S, --script PATH                Load the given file as an extra config script.
				-N, --num-servers INT            Number of Mongrel servers
				-C, --config PATH                Path to cluster configuration file
					--user USER
												 User to run as
					--group GROUP
												 Group to run as
					--prefix PREFIX
												 Rails prefix to use
				-h, --help                       Show this message
					--version                    Show version

	■トラブルシューティング

	Railsはデフォルトのままでルートにアクセスするとdispacherがpublic/index.htmlに読み替えてWelcome Abord画面を表示するんだけど、これが不要だったからpublic/index.htmlを削除していた。これが直接的な原因っぽい。
	空ファイルでも良いのでindex.htmlを置いておけばエラーは出なくなるはず、という事でやってみた結果、エラーは出なくなった。


	$ mongrel_rails ?prefix /yuki
	こうすることで、link_toなどのHelperが正しいURLを作成できる

	Publicがおかしいので

	$ cd public
	$ ln -s . yuki
	自身へリンク、これでPublic内のImagesなども見れた

	script/serverコマンドは以下のように起動するサーバを指定できる。

	# ruby script/server webrick

	サーバを指定しない場合は、以下の優先順位を元に起動するサーバを決定する。

	   1. Mongrel
		  2. Lighttpd
			 3. WEBrick

			 よってMongrelをインストール後もscript/serverスクリプトを使えるが、

			 Mongrel専用の起動スクリプトを使うとscript/serverスクリプトには無いオプションを使うことが出来る。

			 # mongrel_rails start --prefix /myapp

			 のようにprefixオプションを使うと、http://localhost:3000/myappがアプリケーションルートになる。

			 アプリケーションごとに異なるprefixをつければ、ドメインが一つしかない場合でも手軽に複数のRailsアプリケーションを公開することが出来る。

	ProxyRequests Off
	<Proxy *>
	  Order deny,allow
		Allow from all
	</Proxy>
	ProxyPass / http://localhost:3000/

	以下の内容についてはapacheのmod_proxy、mod_proxy_balancerが有効になっていることが前提です。またパスは環境によって異なると思いますので参考までに。

	備忘録兼ねてますので途中の冗長な作業も書いてますがあしからず、です。

	■apacheのリバースプロキシの設定

	/etc/httpd/conf.d/のproxy.confの内容を以下のように変更します（ファイルがなければ作成）。

		# cd /etc/httpd/conf.d/
		# vi proxy.conf 

		ProxyRequests Off
		<proxy *>
		Order deny,allow
		Allow from all
		</proxy>

		ProxyPass /myapp1 balancer://mycluster1 lbmethod=byrequests
		ProxyPassReverse /myapp1 balancer://mycluster1
		<proxy balancer://mycluster1>
		BalancerMember http://127.0.0.1:3000/myapp1 loadfactor=10
		BalancerMember http://127.0.0.1:3001/myapp1 loadfactor=10
		BalancerMember http://127.0.0.1:3002/myapp1 loadfactor=10
		</proxy>

		ProxyPass /myapp2 balancer://mycluster2 lbmethod=byrequests
		ProxyPassReverse /myapp2 balancer://mycluster2
		<proxy balancer://mycluster2>
		BalancerMember http://127.0.0.1:4000/myapp2 loadfactor=10
		BalancerMember http://127.0.0.1:4001/myapp2 loadfactor=10
		BalancerMember http://127.0.0.1:4002/myapp2 loadfactor=10
		</proxy>

		#ロードバランス管理画面の設定
		<location /balancer-manager>
		SetHandler balancer-manager
		Order Deny,Allow
		Deny from all
		Allow from *.*. #管理画面を使用するクライアントやネットワークを指定
		</location> 

	これでmyapp1とmyapp2という二つのRailsアプリをそれぞれクラスタリングした状態でたてられます。

	ポート80で入った要求を、/myapp1ならポート3000?3002に /myapp2ならポート4000?4002に振り分けてやる訳です。

	※上の設定の場合、ロードバランサーの管理画面のURLは http://hoge/balancer-manager となります。

	proxy.confを修正したら設定を反映するためにapacheを再起動します。

		# cd /etc/rc.d/init.d
		# ./httpd restart 

	■mongrelのクラスター起動

		# cd hoge/myapp1
		# mongrel_rails cluster::configure -e production -p 3000 -N 3 ?prefix /myapp1
		# mongrel_rails cluster::start

		# cd hoge/myapp2
		# mongrel_rails cluster::configure -e production -p 4000 -N 3 ?prefix /myapp2
		# mongrel_rails cluster::start 

	※停止の時は mongrel_rails cluster::stop

	?rabbitonigiri
	(posted in the Ruby on Rails category)
	このエントリをdel.icio.usに追加このエントリをはてなブックマークに追加

	Find this post interesting? Besides commenting below, you can follow responses with the RSS 2.0 feed or trackback from your own site.
	2 Responses to “【Rails】mongrel cluster＆apacheのリバースプロキシで複数のアプリ共存”

	   1. maru says:
		  2月 29, 2008, 3:33:08

		  あん。
		  ?prefix /myapp1
		  じゃん
		  -prefix /myapp1
		  じゃなくて。

		  バージョン違いのせいかなー？



-------------------------------------------------------------------------------
##Passenger(mod_rails) by Lai HongLi & Ninh Bui
	■使ってみて
		なぜかNewsサイトではスタイルシートが有効化されない。
		あと速度がめちゃくちゃ遅かった。
		設定の問題かもしれないのでもう少しいじってみる。
	■参考リンク
		公式サイト　http://www.modrails.com/install.html
		マニュアル　http://www.modrails.com/documentation/Users%20guide.html
		http://rails20.jp/2008/04/passenger/

	■Prep
		passengerはmod_rewriteとmod_aliasと衝突する。
		mod_rewriteを使いたい場合、RailsAllowModRewriteを使えばよい。ただし、先述の問題を回避するために、.htaccessを削除するかリライトルールを書き換える必要がある。


		mod_rails(passenger)で起動すると、143Mほど確保		Linode 360 =360MB
		cf.　mongrelで動かしてみると、44Mほどメモリ確保
	　･passengerはrootでは動かないので、かならずrailsのディレクトリ以下の所有ユーザーはroot以外(apacheなど)にしておく
	   error ":nonexistence がでる。
		Railsアプリケーションが動作するユーザーは$RAILS_ROOT/config/environment.rbのオーナーとなりますが、 environment.rbがrootの場合はnobodyユーザーで動作します。このとき、オーナーがrootである$RAILS_ROOT/log ディレクトリや$RAILS_ROOT/tmpディレクトリに書き込みができず、アプリケーションが動作しないことがあります。
		useradd you
		passwd you
		chown -R you:you /root/2chnrg
		mkdir /home/you
	　* apache MPW(multi-process-worker)

	■ざっと手順だけ
	   1. Railsアプリを適当な場所にUP
	   2. DocumentRoot以下に[RAILSROOT]/publicへのシンボリックリンクを作成
	   3. httpd.confに設定を追加
	   4. Apache再起動

	■passengerをインストールsudo su /rootで全行程
		sudo su
		#Apacheはソースから入れたので環境変数を定義しておく。
		export APXS2=/usr/local/apache2/bin/apxs;export PATH=/usr/local/apache2/bin/:$PATH
		sudo gem install fastthread passenger
		passenger-install-apache2-module
		passengerのインストールが完成したら、apacheに組み込む。
			* GNU C++ compiler... not found
			* Ruby development headers... found
			* OpenSSL support for Ruby... found
			* RubyGems... found
			* Rake... found at /usr/bin/rake
			* Apache 2... found at /usr/sbin/apache2
			* Apache 2 development headers... not found
			* Apache Portable Runtime (APR) development headers... not found
			* fastthread... found
		not found(赤字）がある場合は、それぞれインストールをする。
		今回のケースだと次のとおり
			% sudo apt-get install build-essential
			% sudo apt-get  install apache2-threaded-dev 
	  


		$ sudo apt-get install apache2-prefork-dev
	　色々ないけど、教えてやるよーという親切インストーラー教えてくれた結果が以下
			Installation instructions for required software
			* To install Apache 2 development headers:
			Please run yum install httpd-devel as root.
		   * To install Apache Portable Runtime (APR) development headers:
			Please run yum install apr-devel as root.
			* To install Apache Portable Runtime Utility (APU) development headers:
			Please download it from http://httpd.apache.org/
			(APR Utility is an integrated part of Apache.)

	　自分の場合、yum install httpd-develでapr-develもインストールされた。
	　インストール終了。その後もhttpd.confに追記する箇所や、バーチャル設定の書き方を教えてくれるのでメモ。

			The Apache 2 module was successfully installed.
		
			Please edit your Apache configuration file, and add these lines:
		
			LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.2.2/ext/apache2/mod_passenger.so
			PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.2.2
			PassengerRuby /usr/bin/ruby
		
			Deploying a Ruby on Rails application: an example
		
			Suppose you have a Ruby on Rails application in /somewhere. Add a virtual host
			to your Apache configuration file, and set its DocumentRoot to
			/somewhere/public, like this:

	■ append to httpd.conf
	   LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.2.4/ext/apache2/mod_passenger.so
	   PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.2.4
		PassengerRuby /usr/bin/ruby1.8

	■Virtualhost設定例：
			<VirtualHost *:80>
			ServerName www.yourhost.com
			DocumentRoot /somewhere/public # <-- be sure to point to 'public'!
			</VirtualHost>
	■Virtualhost設定例a2：http://hogerails/redmine
		<VirtualHost *:80>
		 ServerName hogerails
		 DocumentRoot /var/hoge/rails
		 RailsBaseURI /redmine
		 RailsBaseURI /hogesys
		</VirtualHost>
		この設定の場合、/var/hoge/rails/redmineとしてシンボリックリンクを作ればOKです

		# モジュールとサイトを有効にする
		$ sudo a2enmod rails
		% sudo a2ensite [virtual-host-name]
		Apacheの再起動
		% sudo /etc/init.d/apache2 restart
	■トラブルシューティング
	　･下記のようなエラーがhttpdのエラーログに出ていたら
		 *** Passenger ERROR (ext/common/ApplicationPoolServer.h:602):
		Cannot execute /usr/lib/ruby/gems/1.8/gems/passenger-2.2.2/ext/apache2/ApplicationPoolServerExecutable: 許可がありません (13)
		[Wed May 13 11:22:46 2009] [notice] SELinux policy enabled; httpd running as context root:system_r:httpd_t:s0
		[Wed May 13 11:22:46 2009] [notice] suEXEC mechanism enabled (wrapper: /usr/sbin/suexec)
	　以下のように対応
		#setenforce 0
		
	   *undefined method `cache_template_loading=' for ActionView::Base:Class
		config/environments/production.rbの以下の記述をコメントアウト
		# config.action_view.cache_template_loading = true

	   *CGI::Session::CookieStore::TamperedWithCookie ?
		ブラウザのクッキーをクリア

	   *no such file to load -- application
		config/environments以下の設定ファイル
		#config.cache_classes = true	#"require"でモジュールをロード
		config.cache_classes = false	#falseにすると"load"を使う everytime

	   *route missing	500
		# in config/environments/production.rb
		（略）
		config.action_controller.relative_url_root='/hogesys'

	## Passengerのチューニング
	いずれもhttpd.conf中で設定します。なお、これらはApache全体に対する設定であり、バーチャルホストごとの指定はできません。
		RailsMaxPoolSize Apacheサーバ上で生成するRailsのインスタンス数を設定します。
		デフォルト値は20ですが、メモリが少ない環境では減らすことを検討してください。アクセスが集中した際にメモリが不足して極端にレスポンスが悪化する恐れがあります。"Passenger Users Guide":http://www.modrails.com/documentation/Users%20guide.html では、メモリ256MBのVPS環境では2、2GBのメモリを搭載したサーバでは30が推奨されています。
		RailsPoolIdleTime Railsインスタンスへのリクエストがこの設定値以上の時間無かった場合に、インスタンスを終了させます。
		デフォルト値は120(秒)です。この値が小さすぎると、インスタンスの生成・終了が頻繁に行われることになりレスポンスが悪化します。逆に大きすぎると必要以上に長時間メモリを占有されてしまいます。Passenger Users Guideでは、ユーザーのwebサイト上の平均滞在時間の2倍を推奨しています。例えば1回のRedmine上での平均的な作業時間が5分の場合、推奨設定値は600(秒)です。
	Passenger 2.0.6以降でGlobal Queuingを有効にするには、Apacheの設定ファイルで以下の設定を行います。
		PassengerUseGlobalQueue on
	passenger-statusコマンド
	autoindex: Aliasを切ったディレクトリに対して PassengerEnabled off




