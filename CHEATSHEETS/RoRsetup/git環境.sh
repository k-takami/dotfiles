
# snippet_ssh_ssl_useragent_fowarding_unix SSH ユーザーエージェント転送
    #後悔鍵を生成するか、事前に入手することが前提です
    $ vim  ~/.ssh/config
        Host 59.106.222.237
          #IdentityFileにDLした鍵をリネームしたものを指定。既存のid_rsaとid_rsa.pubは、多分github認証につかわれているはず。
          IdentityFile ~/.ssh/id_rsa_hiblead
          User some_user
          ForwardAgent yes
    $ chmod 600 ~/.ssh/config
    # 疎通
    $ ssh ***@**** -p **** -i ~/.ssh/id_rsa_hiblead

※うまくいかない場合を想定して、VMイメージファイルをバックアップ(フォルダ毎コピー)しておくことをお勧めします。
※本手順では、MySQLのデータは変更しません(migrate しない)が、ダンプしておきたい場合は、以下のコマンドで取れます。
　mysqldump -udev -pdevdev redmine_dev

＜git接続/認証情報など＞
?@[.gitconfig]　※なければ新規作成
[apl@localdev ‾ ]$ pwd
/home/apl
[apl@localdev ‾ ]$ vi .gitconfig
===============================================
[user]
  name = hayashi.masanori　　　←ここは各自の
  email = hayashi.masanori@adniss.jp　　　←ここは各自の
[color]
  ui = true
[alias]
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:¥"%h %ad | %s%d [%an]¥" --graph --date=short
[core]
  excludesfile = ‾/.gitignore
===============================================

?A[.netrc]　※なければ新規作成
[apl@localdev ‾ ]$ vi .netrc
===============================================
machine adp.adniss.jp
login hayashi.masanori@adniss.jp　←ここは各自の
password XXXXXX　←ここは各自の
===============================================



＜git clone＞ ※配布したVMイメージに既に構築されている場合がありますので、その場合は本手順は不要です
?@ベースディレクトリの作成
/opt/lgdis

?Aclone
[apl@localdev lgdis ]$ git clone https://adp.adniss.jp/git/0000000-211.git /opt/lgdis/develop
※作業用のブランチは「develop」なので
[apl@localdev develop(develop) ]$ pwd
/opt/lgdis/develop
[apl@localdev develop(develop) ]$ git checkout -b develop origin/develop

?Bシンボリックリンク
[apl@localdev lgdis ]$ ln -s /opt/lgdis/develop/web /opt/lgdis/web

↓初回のみ start
bundle install --without postgresql sqlite
※rootでやらないとエラーがでた。初回だけ。

rake generate_secret_token



[root@localdev ‾]# rm -r /var/www/html/redmine
[root@localdev ‾]# ln -s /opt/lgdis/web/public /var/www/html/lgdis



[root@localdev ‾]# vi /etc/httpd/conf.d/passenger.conf

RailsBaseURI /lgdis
RailsEnv development
↑初回のみ end

?Chttpdリスタート
[root@localdev ‾]# service httpd restart

以下で動いていればOK
http://<VMのIP>/lgdis



■コミット手順
ローカルにリポジトリを作る
プロジェクトのパスで
	git init

全件を追加する
	git add .

ローカルリポジトリにコミットする
ローカルリポジトリのmasterブランチが勝手にできて、そこにコミットされる
	git commit -m "メッセージ"

ローカルのmasterブランチをリモートのdevelopブランチにpush
	git push https://xxxxxxx.git master:develop

ローカルを消す
	rm -rf ディレクトリ

クローンする
	git clone https://xxxxxxx.git

masterでチェックアウトされるからブランチを切り替える
	git checkout develop




