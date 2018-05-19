#phusion passenger
  http://www.geocities.jp/toyprog/passenger/Phusion_Passenger_users_guide_Nginx_version.html#_installing_or_upgrading_on_red_hat_fedora_centos_or_scientificlinux
  

#NGINX
  #@centOS 6.x
  #yum環境清掃
    $ yum clean all
    $ yum makecache
  #yumリポジトリをCentOSに登録。(結果はll /etc/yum.repos.d/ で目視できる). それからyum install
    #debian
    $ sudo apt-get install nginx-extras
    #REHL
    $ sudo rpm -hiv http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
    $ sudo yum -y install nginx
  #config
    $ sudo vim /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

      # TODO: takami ref: https://qiita.com/cubicdaiya/items/d938f3354f424830630b
      # passenger_root /usr/local/lib/ruby/gems/1.8/gems/passenger-2.2.15;
    #ログ調整方法
    # ■参考情報：
    # https://qiita.com/cubicdaiya/items/d938f3354f424830630b
    # https://serverfault.com/questions/743414/how-can-i-check-if-remote-addr-ip-is-not-in-cidr-range-in-nginx
    # http://nginx.org/en/docs/http/ngx_http_geo_module.html#geo
    # http://nginx.org/en/docs/http/ngx_http_map_module.html#map

    http {
      map $remote_addr $log_ip {
          "10.0.2.2"  0;
          default     1;
      }
      access_log  /var/log/nginx/access.log  main if=$log_ip;
      server {
        ...
      }
　　　#流量制限ディレクティブlimit_req_zoneに設定名「limit_req_by_ip」:サイズは暫定10MByteを設定する
　　　#流量は50request/second. 「毎分●●requests」という意味ならば「●●r/m」という記述にすること。；
　　　#流量制限設定はlog_level: errorで503を応答させる。
　　　limit_req_zone $binary_remote_addr zone=limit_req_by_ip:10m 　　rate=50r/s;
　　　limit_req_log_level error;
　　　limit_req_status 503;
    }

　　location / {
　　　　#相対パス / に先述の流量制限オブジェクトlimit_req_by_ipを即時,リトライなし(nodelay)で適用する；
　　　　limit_req zone=limit_req_by_ip burst=1 nodelay;
　　}


  #booting
    $ sudo nginx
    # firefox localhost:8080
    $ sudo nginx -s stop
  #customization
    $ cp /usr/share/nginx/html/50x.html /usr/share/nginx/html/503.html


# UNICORN on Ruby version >= 1.9.3
  gem install unicorn


#BENCHMARKING
  $ ab -n 5 -c 5 http://localhost/
