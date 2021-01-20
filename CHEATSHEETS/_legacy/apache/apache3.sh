mod_proxy [https://httpd.apache.org/docs/2.2/ja/mod/mod_proxy.html#proxypass]
	/etc/httpd/conf.d/mod_proxy_balancer.iss.conf に
	ProxyPass /information/ http://isrep02/information/
	が設定れていて、別サーバーisrep02へとHTTPリクエストをリダイレクトしている。
	（検証サーバーではこの設定はコメントアウトされている）
/etc/httpd/conf.d/mod_proxy_balancer.conf例
$ sudo chmod 644 /etc/httpd/conf.d/mod_proxy_balancer.conf

$ cat /etc/httpd/conf.d/mod_proxy_balancer.issconf

# ProxyPassMatch ^/(|books(.*)$|api(.*)|mobile(.*)|trans(.*)|sp(.*)|denied(.*)|signup(.*)|login(.*)|logout(.*)|reset_password(.*)|activate(.*)|password
#<Proxy balancer://passenger/>
    # BalancerMember http://isdev02:80 timeout=310 retry=3
#</Proxy>

# Header add Set-Cookie "ROUTEID=.%{BALANCER_WORKER_ROUTE}e; path=/"  env=BALANCER_ROUTE_CHANGED
# <VirtualHost *:1081>
  #ServerName localhost
  # To Enju-Management
  # ProxyPass /admin/ balancer://admin/ nofailover=on timeout=4
#  <Proxy balancer://admin/>
#    BalancerMember http://localhost:3000/admin timeout=310 retry=3 # route=admin
    # ProxySet stickysession=ROUTEID
#  </Proxy>
# </VirtualHost>


