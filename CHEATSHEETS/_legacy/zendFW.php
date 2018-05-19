[-tmp-]
[-ecolinux-config-steps-]
[-vim-]
	[-vimScript-]
	[-vimWindowTab-]
[-RubyMainOTL-]
	[-hpricot-]
[-RailsApache-]
	[-railsDebuggers-]
	[-railsDBapi-]
	[-rails_activescafhold-]
	[-hpricot-]#test
#zendFW and PHP
	#installing PHP and zendWF
		sudo apt-get install php5-cli php5 libapache2-mod-php5
		sudo apt-get install php5-cgi
		sudo apt-get install zend-framework
		#PHPを動かすためにApacheの一部を変更します。httpd.confのDirectory /usr/local/apache2/htdocs に次の一行を追加します。
		<Directory "/usr/local/apache2/htdocs ">
			～あれこれ～
			AddType application/x-httpd-php .php
			AddType application/x-httpd-php-source .phps
			DirectoryIndex index.html index.htm
		</Directory>





	#php.ini の include_path に library の場所を追加する
		sudo vi /etc/php5/cli/php.ini
		sudo vi /etc/php5/apache2/php.ini
Zend Frameworkをインストールしてみよう（環境構築／設定）

　では早速、インストールしてみましょう。インストールとはいえ特に難しい手順は不要で、ひとことで言えば「ダウンロードしたZend Frameworkのクラス群にパスを通す」だけです。
1. Zend Frameworkをダウンロードする

　本家サイトから、「Latest Release」をダウンロードします。2007年10月30日現在、バージョンは1.0.2です。ファイル形式はzipとtar.gzの2タイプから選べますが、今回はWindowsを例にインストールを行いますのでzip形式の方をダウンロードします。
Zend Frameworkダウンロード
Zend Frameworkダウンロード
2. ファイルを展開する

　ダウンロードしたファイルを展開します。次のようなファイル構成になっているはずです。

ZendFramework-1.0.2/
ZendFramework-1.0.2/demos/
ZendFramework-1.0.2/demos/Zend/
ZendFramework-1.0.2/VERSION.txt
ZendFramework-1.0.2/INSTALL.txt
ZendFramework-1.0.2/README.txt
ZendFramework-1.0.2/tests/
ZendFramework-1.0.2/library/
ZendFramework-1.0.2/library/Zend/
ZendFramework-1.0.2/NEWS.txt
ZendFramework-1.0.2/LICENSE.txt
          :
          :
          :

　この展開によって配置されるZend Frameworkのフォルダ群は、次のとおりになっています。
インストールされたZend Frameworkのフォルダ構造
フォルダ	内容
library	Zend Frameworkの各種コンポーネント
demos	デモンストレーション用コード
tests	各コンポーネントのテスト用コード
3. ライブラリへのパスを設定する

　php.iniのinclude_pathパラメータに、Zend Frameworkのlibraryフォルダへのパスを追記します（下記は展開先が「C:\Zend Framework-1.0.2」の場合）。

...
; UNIX: "/path1:/path2"
;org	include_path = ".:/usr/share/php"
;takami
include_path = ".:/usr/share/php:/usr/share/pear:/usr/share/php/libzend-framework-php/Zend"
;windows include_path = "...;C:\Zend Framework-1.0.2\library\"

...

4. Zend Framework動作のためのApache側の環境設定を行う（httpd.conf／.htaccess）

　Zend Frameworkでは、URL変換にmod_rewriteモジュールを使用しています。httpd.conf内の以下の記述のコメントを外してください。

...
LoadModule rewrite_module modules/mod_rewrite.so
...

　さらに、後述するドキュメントフォルダ内の.htaccessの設定を有効にするため、以下を追記します。

<Directory "C:/～/htdocs">
    AllowOverride All
</Directory>

　また、ドキュメントフォルダに配置する.htaccessには、「index.php」をフロントコントローラ（コラム参照）とするために、次のような設定を記述します。

RewriteEngine on
RewriteBase /
RewriteRule !\.(js|ico|gif|jpg|png|css)$ index.php

　これで、cssファイルやgifファイルといったリソース以外のリクエストは、すべてフロントコントローラ「index.php」に渡されるようになります。index.phpをルートに配置しない場合には、RewriteBaseの行でベースとなるURLパスを明示的に指定し（例えばindex.phpを「C:/～/htdocs/zf」以下に配置するなら「RewriteBase /zf」とする）、.htaccessもindex.phpと同じフォルダに配置します。
フロントコントローラとリクエストの処理
　Zend FrameworkのMVC機能では、symfonyなど他のPHPのMVCフレームワーク同様にドキュメントフォルダにある「index.php」が、まずすべてのリクエストを受け付けています。この「index.php」は「フロントコントローラ」と言い、MVCのCに値する部分の総元締めと言うべき存在です。そこで必要となる処理が判断され、該当する「アクションコントローラ」に以後の処理が受け渡されます。アクションコントローラとは、実際にリクエストに対する必要な処理（アクション）を実行する存在です。
　また、リクエストの内容を判断して受け渡し先を決定する処理を「ルーティング」、実際の受け渡しを「ディスパッチ」と言います。
リクエスト処理の大まかな流れ
リクエスト処理の大まかな流れ
　以上が、Zend FrameworkのMVCでのCの部分（Zend_Controllerコンポーネント）における、リクエスト処理の大まかな流れです。これらについては、改めて本連載「Zend_Controller」についての回で解説する予定です。

5. Zend Frameworkインストール確認

　それでは、ここまでが問題なく行われているか確認してみましょう。以下のファイルを作成し、Apacheのドキュメントフォルダに配置します。
index.php

<?php
require_once 'Zend/Version.php'; //ライブラリの読み込み
echo Zend_Version::VERSION; //現在のZend Frameworkのバージョンを表示

　このファイルにアクセスし（http://localhost/index.php）、Zend Frameworkのバージョンが表示されれば、インストールは問題なく行われています。
インストール確認
インストール確認
コーディング規約

　上記の動作確認用ファイルもそうですが、Zend Frameworkではそのコーディング規約によりPHPコードのみのファイルは末尾の「?>」を入れません。入れてしまうと、ファイルの最後にある空白文字が出力に影響する恐れがあります。

　この「?>」に対するものも始め、Zend FrameworkにはZend Framework上で開発を行う開発チームのための指針としての「コーディング規約」が定められています。コーディング規約により、コードの品質保持・バグの減少／保守の容易性の確保を図るねらいがあります。例えばPHPファイルの書式に関しては「?>」に関するものの他に

    * 字下げは空白4文字
    * 1行の長さを80文字までにする
    * 行末は、ラインフィード (LF) のみ

　があります。

　その他、以下の項目についてコーディング規約が定められています。

    * 命名規約
          o クラス
          o インターフェイス
          o ファイル名
          o 関数およびメソッド
          o 変数
          o 定数
    * コーディングスタイル
          o PHP コードの境界
          o 文字列
          o 配列
          o クラス
          o 関数およびメソッド
          o 制御構造
          o インラインドキュメント

　詳細は本家サイト内「Zend Framework PHP 標準コーディング規約」を参照してください。

# php.ini の include_path に library の場所を追加する
	sudo vi /etc/php5/cli/php.ini
	sudo vi /etc/php5/apache2/php.ini

# filezend-test.zip をダウンロードして、解凍する
    * /home/shimizu/workspace/zend-test 以下に置かれることが前提になっています
    * PDT (eclipse 版の PHP 開発環境）にそのままインポートできます

# バーチャルホストの設定をする
	cd /etc/apache2/sites-available$
	sudo ln -s /home/shimizu/workspace/zend-test/zend-test .
	sudo a2ensite zend-test
	sudo /etc/init.d/apache2 restart

# /etc/hosts ファイルに zend-test.homelinux.lc 用の設定を追加する
		* 自宅なら 127.0.0.1 をとりあえず割り当てておく
# http://zend-test.homelinux.lc にアクセスしてみましょう



公式マニュアルに沿って作った一番単純なアプリケーションの構造はこのようになっています。
    * zend-test/
    * zend-test/application
    * zend-test/application/controllers
    * zend-test/application/controllers/ErrorController.php
    * zend-test/application/controllers/IndexController.php
    * zend-test/application/views
    * zend-test/application/views/scripts
    * zend-test/application/views/scripts/index
    * zend-test/application/views/scripts/index/index.phtml
    * zend-test/application/views/scripts/error
    * zend-test/application/views/scripts/error/error.phtml
    * zend-test/html
    * zend-test/html/.htaccess
    * zend-test/html/index.php






Zend Framework公式サイトからアーカイブをダウンロードして展開していきます。

	mitsuki@ubuntu:~$ sudo su - <- スーパーユーザになる
	root@ubuntu:~# cd /usr/lib/php5 <- ディレクトリ移動
	root@ubuntu:/usr/lib/php5# wget http://framework.zend.com/releases/ZendFramework-1.8.0/ZendFramework-1.8.0.tar.gz <- ZFアーカイブをダウンロード
	--2009-05-11 22:29:42--  http://framework.zend.com/releases/ZendFramework-1.8.0/ZendFramework-1.8.0.tar.gz
	framework.zend.com をDNSに問いあわせています... 64.255.169.102
	framework.zend.com|64.255.169.102|:80 に接続しています... 接続しました。
	HTTP による接続要求を送信しました、応答を待っています... 200 OK
	長さ: 21724265 (21M) [application/x-gzip]
	`ZendFramework-1.8.0.tar.gz' に保存中

	100%[======================================>] 21,724,265   105K/s   時間 4m 49s

	2009-05-11 22:34:32 (73.3 KB/s) - `ZendFramework-1.8.0.tar.gz' へ保存完了 [21724265/21724265]
	root@ubuntu:/usr/lib/php5# tar zxvf ZendFramework-1.8.0.tar.gz <- ダウンロードしたファイルを解凍
	　　　・
	　　　・(中略)
	　　　・
	ZendFramework-1.8.0/tests/Zend/Translate/Adapter/_files/failed3.mo
	ZendFramework-1.8.0/tests/Zend/Translate/Adapter/_files/translation_en.tmx
	ZendFramework-1.8.0/tests/Zend/Translate/Adapter/_files/translation_en2.mo
	root@ubuntu:/usr/lib/php5# rm -f ZendFramework-1.8.0.tar.gz <- 解凍が済んだらアーカイブを削除
	root@ubuntu:/usr/lib/php5# mv ZendFramework-1.8.0 ZendFramework <- ディレクトリ名にバージョン番号が入っているのは不便なのでリネーム
	root@ubuntu:/usr/lib/php5# exit <- 一般ユーザに戻る
	logout


続けてphp.iniにインクルードパスの設定を追加する。

mitsuki@ubuntu:~$ gksudo gedit /etc/php5/apache2/php.ini


include_path = ".:/usr/share/php:/usr/share/pear"
   ↓↓↓
include_path = ".:/usr/share/php:/usr/share/pear:/usr/lib/php5/ZendFramework/library"


ModRewriteを有効にしてApache2を再起動。

mitsuki@ubuntu:~$ sudo a2enmod rewrite <- mod_rewriteを有効にする
Enabling module rewrite.
Run '/etc/init.d/apache2 restart' to activate new configuration!
mitsuki@ubuntu:~$ sudo /etc/init.d/apache2 restart <- Apache2再起動
 * Restarting web server apache2                           [ OK ]


ZendFrameworkが正常に動作するかを確認するためにテストスクリプト作成。

mitsuki@ubuntu:~$ cd public_html <- 自分のドキュメントルートに移動
mitsuki@ubuntu:~/public_html$ gedit .htaccess <- .htaccessファイル作成


.htaccessファイルに以下のコードを記述して保存。2行目は各自の環境に合わせて変更する必要があります。例えば、このテストスクリプトをhttp://{サーバ}IP/~user/でアクセスできる環境に設置する場合にはRewriteBase /~user/と記述します。

RewriteEngine on
RewriteBase /~mitsuki/
RewriteRule !\.(js|ico|gif|jpg|png|css)$ index.php


フロントコントローラ(index.php)を作成。

mitsuki@ubuntu:~/public_html$ gedit index.php


index.phpファイルに以下のコードを記述して保存。Zend Frameworkのコーディングルールでは最後の?>は記述しないことになっているので注意しましょう。

<?php
require_once 'Zend/Version.php';
echo Zend_Version::VERSION;


ブラウザでhttp://{サーバIP}/~mitsuki/にアクセスしてZend Frameworkのバージョン(今回は1.8.0)が表示されればOKです。

最後にテスト用スクリプトを削除しておきましょう。

mitsuki@ubuntu:~/public_html$ rm -f index.php .htaccess




