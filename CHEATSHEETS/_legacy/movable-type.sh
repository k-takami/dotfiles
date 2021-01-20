#movable-type setup
  #installing on Windows
    #APACHE
    vim C:\Apache24\conf\httpd.conf
      DocumentRoot "c:/Apache24/html"
      <Directory "c:/Apache24/html">
      #OK    ScriptAlias /cgi-bin/ "c:/Apache24/cgi-bin/"
      #NG    ScriptAlias /cgi-bin/ "c:\Apache24\cgi-bin\"
    #PLACE MOVABLE TYPE
    vim C:\Apache24\cgi-bin\mt-config.cgi
      CGIPath        /cgi-bin/
      StaticWebPath  /mt-static/
      StaticFilePath c:/Apache24/html/mt-static
    #INSTALL ACTIVEPERL (cygwin/mingwinはだめ）
      C:\Users\some_body>PATH
      vim C:\Apache24\cgi-bin\printenv.cgi
    #adding shebang to *CGIs
      #!C:/Perl64/bin/perl
    #INSTALL MySQL as windows service (設定中に把握に手間取るゾンビプロセスが出て、再起動と設定の試行錯誤がある。円滑化のためにサービスとして常駐させるべき）
    cmd.exe "ppm"   #<---PerlPackageManager起動
      DBD-MySQL でパッケージをさがし、インストール設定にし、run実行
    open http://localhost/cgi-bin/mt #インポートしたDBのﾕｰｻﾞｰでﾛｸﾞｲﾝ
      システム＞ウェブサイト＞設定
        公開パス例）C:\Apache24\html\kss
    mysqldump -h localhost -u●● -p●● mt > outpul_file_name.sql
    
    #stats
    「cgi-bin/*/mt-check.cgi」の100行目近辺 /\$version ||= .\d+.\d+.\d+/

  #data migraton
    ★20行以内で！
    1. 環境の簡単な理解及び対象ファイルの特定（MTかコマンド配置か）
      #そもそもgitのKSPリポジトリーのﾌｧｲﾙツリーとMTサーバーのｺﾝﾃﾝﾂツリーとが
      # 構成が別物

      KSSレポジトリーではfront/ の変更だが
      [apache@localhost kss]$ find .  -newermt '20171025' -name 'photo*' | xargs ls -alt
        -rw-rw-r-- 1 apache apache  19781 11月  8 07:34 2017 ./front/public_html/photocopy.html
        -rw-rw-r-- 1 apache apache   1486 11月  8 07:34 2017 ./front/src/scss/photocopy.scss
        -rw-rw-r-- 1 apache apache  19783 11月  8 07:34 2017 ./application/src/main/webapp/test/photocopy.html
        -rw-rw-r-- 1 apache apache   1223 11月  8 07:34 2017 ./application/src/main/webapp/test/css/photocopy.css
        -rw-rw-r-- 1 apache apache 127060 11月  8 07:33 2017 ./application/src/main/webapp/test/js/photocopy.js

      MTサーバーでは/var/www/html/kss/配下の変更
        [root@fsearch-02 www]#   find .  -newermt '20171025' -name 'photo*' | xargs ls -alt
        -rw-rw-rw- 1 apache apache   1126 11月  2 16:05 ./html/kss/css/photocopy.css
        -rw-rw-rw- 1 apache apache  19955 11月  2 15:42 ./html/kss/photocopy.html
        -rw-rw-rw- 1 apache apache  83923 11月  2 12:32 ./html/kss/assets_c/2016/07/photocopy-send-thumb-45x45-2949.gif
        -rw-r--r-- 1 root   root   128527 10月 25 15:52 ./html/kss/js/photocopy.js

        
    2. バックアップ
      $ssh 10.2.74.186
      ...
      $ cd /var/www/html; sudo tar zcvf kss-mae.tgz kss
      # ここで 116MBのバックアップﾌｧｲﾙがつくられているのを確認；
       -rw-r--r--  1 root   root   116712242 11月  7 18:53 kss-mae.tgz
        $ df
        ファイルシス              1K-ブロック       使用     使用可 使用% マウント位置
        /dev/mapper/vg00-root       305547504   41308524  264238980   14% /

    3. 差分確認

    3-2: 差分ファイルの移送
      ※社内MTサーバーから検証用MTサーバーへの直接のssl通信はできない。許可する設定がない。
      
      #BTC社内PCなどにgit pull した最新版ソースのapplication配下を移送
       $ scp ./application/src/main/webapp/test/photocopy.html  tv-jo15rt@10.2.74.186:/var/www/html/kss/
       $ scp ./application/src/main/webapp/test/css/photocopy.css  tv-jo15rt@10.2.74.186:/var/www/html/kss/css
      # ctime 20127-01-01 ~ の差分全部

    4. リリース（MT修正/コマンド配置）
      /etc/init.d/httpd restart 
      または
      /etc/init.d/httpd graceful 

    5. 動作確認

    6. 動作がおかしい場合、バックアップよりロールバック
      $ cd /var/www/html; sudo tar zxvf kss-mae.tgz




#misc
  perl -MCGI -e ''
  perl -MCGI::Cookie -e ''
  perl -MImage::Size -e ''
  perl -MFile::Spec -e ''
  perl -MLWP::UserAgent -e ''
  perl -MDBI -e ''        
  perl -MDBD::mysql -e ''

#config
  vi /var/www/cgi-bin/mt-config.cgi
  mysqldump -h localhost -u●● -p●● mt > outpul_file_name.sql
#stats
「cgi-bin/*/mt-check.cgi」の100行目近辺 /\$version ||= .\d+.\d+.\d+/







