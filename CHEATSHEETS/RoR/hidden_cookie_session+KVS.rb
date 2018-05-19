hostname変更
Linuxサーバのホスト名を変更します。


一時的にホスト名を変更する場合

#sudo hostname xxxx

これで、xxxxというホスト名に変更しました。しかし、再起動すると、この変更は無効になります。
再起動しても有効になる変更は、２箇所のファイルの変更が必要になります。

#vi /etc/hosts
127.0.0.1 xxxx localhost.localdomain localhost

#vi etc/sysconfig/network
NETWORKING=yes
HOSTNAME=xxxx
GATEWAY=192.168.0.1
※ゲートウェイの設定もここで行います。

変更が終わった後は、ネットワークの再起動を行います。
# /etc/rc.d/init.d/network restart
production.rb
  # Use a different cache store in production
  config.cache_store = :mem_cache_store, "localhost:11211", {:namespace => 'next-l'}
  #config.cache_store = :mem_cache_store, "isapp01:11211", "isapp05:11211", "isapp06:11211", "isapp07:11211", "isapp17:11211", "isapp18:11211", "isapp19:11211", "isapp20:11211", "isapp21:11211", "isapp22:11211", "isapp23:11211", "isapp24:11211", "isapp25:11211", "isapp26:11211", "isapp27:11211", "isapp28:11211", "isapp29:11211", {:namespace => 'next-l-front'}



