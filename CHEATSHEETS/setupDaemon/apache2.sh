Apache
moduleの全コンパイルを実行
enable-mod-shared=allでも外部ライブラリに依存するものはコンパイルされないため、全モジュール込みのコンパイルには以下を利用
	# sudo ./configure --enable-so --enable-modules=all  (下の指定しないときこのmostを利用) 
	# sudo ./configure --enable-so --enable-ssl --with-ssl=/usr/local/ssl --enable-modules=most  (下の指定しないときこのmostを利用) 
				 --enable-mods-shared="all ssl cache proxy authn_alias mem_cache file_cache charset_lite dav_lock disk_cache"
	# sudo make
	# sudo make install

その他のサンプル
	# sudo ./configure --enable-so --enable-mods-shared=all --enable-ssl
			   --enable-proxy --enable-proxy-connect --enable-proxy-ftp
			   --enable-proxy-http --enable-proxy-ajp --enable-proxy-balancer

※mod_SSL をインストールするには、予めOpenSSLをインストールしておき、./configureに追加で「--with-ssl=/usr/local/ssl」の設定が必要です。す
※configureで下記のエラーがでる場合場
configure: error: ... Error, SSL/TLS libraries were missing or unusable
この場合には、「--with-ssl=/usr/local/src/openssl-0.9.8l」などと、インストール元をしている場合が多い。
	注意）一部のmoduleの名前がバージョンによって、変更されていたりします。
	mod_access.so  廃止    ->   mod_authz_host.so  など
できあがったhttpdに何のmodが同梱されているかを確認してみる。
	/usr/local/apache2/bin/httpd -l






		


	

