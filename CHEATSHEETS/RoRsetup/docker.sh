※コンテナビルドで何日も時間浪費するおそれ大。：コンテナにログインできないのが最大のバッドノウハウ、。Windowsでコンテナが起動してログインできただけでもラッキー
※UNIXとWindows Docker, Windows Docker Toolbox(=coreOS)に互換性を期待しないほうがよい。
　DockerはGoogleのLINUX用ソフトウエア。一種のshrinkソフトウエアでしかない。
※HDDスペースは節約しない方が賢い。コンテナのクリーンにつくるのは多大な時間と専門知識がいる。バッドノウハウの塊。
※コンテナをイメージ化しても、そこからまた似たようなコンテナをつくることになる。
※buildでエラーになった個所だけコメントアウト、が最適解。イメージをつかうので多分Dockerファイル、はマウントディレクトリ配下以外はコメントアウトしてよさそう。


# G1.ツールのインストール
  # For Windows
    # Docker公式サイトからインストーラをダウンロードし、インストールする。
    # https://www.docker.com/products/docker-toolbox
      # docker toolbox はVTサポートのあるBIOS対応機種じゃないと動作せず。
  # dockerはWin10ProでHyperVがないと動作せず 　
  #VHDD拡張
  $ docker-machine stop default
  $ docker-machine rm default
  $ docker-machine -D create -d virtualbox --virtualbox-disk-size "200000" default

  Docker ToolBox MAnager:　cf: https://www.jhipster.tech/tips/020_tip_using_docker_containers_as_localhost_on_mac_and_windows.html
    Open VirtualBox Manager
    Select your Docker Machine VirtualBox image (e.g.: default)
    Open Settings -> Network -> Advanced -> Port Forwarding
    Add your app name, the desired host port and your guest port
      127.0.0.1   3000        3000
    $ docker-machine start default
    $ eval $(docker-machine env default)
    $ dkrstrails some_New_container_name
    $ docker stats　　#<---メモリー使用量みれる Win+DockerToolBox(25MB RAM) + Rails container(400MB) くらい消費しそう
  くらい消費しそう


  $ dkrmi compose失敗したloadしたイメージ名
  $ docker load -i compose失敗したイメージ名.tar
　　 # docker tag loadしたイメージ名 compose失敗したloadしたイメージ名:TAG名 # <--- 必要に応じてrename
  $ vi  docker-compose.yml
 	  FROM: compose失敗したloadしたイメージ名:TAG名 # <--- rename
    CMD ["bash"]

  $ docker-compose up -d  #<--- buildも自動実行してくれる
    # 最初のCOPY以下の全命令が失敗するならばtar cvf all.tar ./*;  docker cp all.tar container_name:/app/ ; yarn install ;0
     mkdir log;  chmod -R 777 ./ ; bundle exec rails assets:precompile
  # コンテナできたら、KinematicでConfigure Volumesで共有フォルダーをenableし、そこに全部のソースをコピーし、上の手順をくりかえす




# For macOS (old)
    # Windowsと同様、Docker公式サイトからインストーラをダウンロードするか、以下を実行する。
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask cask # virtualbox
    brew install docker docker
    # OSX　container場所(VMsizeはpreference->Disk)：　/Users/user/Library/Containers/com.docker.docker/Data/vms/0/
    # Preference->Diskで64GBにしとくといい。
      起動中のコンテナがあるなら、止めてからresizeできる。
      そうしないとno space left on device警告が頻発する。
        全体管理領域は/Library/Containers/com.docker.docker//Data/vms/0/Docker.raw (旧バージョンでは*.qcow2|*.dcow2)がわりあて領域。
# 2. リポジトリのクローン
#   コマンドプロンプト(Windows)、ターミナル(macOS)で以下を実行。
  git clone --recursive git@github-ext.dena.jp:Thelxinoe/platinum-dev-env.git

  # 2.1 public-keyでエラーが出たとき
    # Permission denied (publickey). fatal: Could not read from remote repository.
    # Please make sure you have the correct access rights and the repository exists.
    # Git clone時に上記のようなエラーが出たら 公開鍵をGitHubに登録する。 http://qiita.com/shizuma/items/2b2f873a0034839e47ce 鍵の生成はTeratermからも行える。

    # 設定 ＞ SSH鍵生成
    #   鍵の種類＝RSA ビット数＝2048 で鍵を生成し、 公開鍵の保存、秘密鍵の保存で 公開鍵（id_rsa.pub）と秘密鍵（rsa.pub）を保存する。


### イメージ（snapshot）作成方法と移設方法:
  $ docker commit some_container
  $ docker save compose失敗したイメージ名.tar some_container
  # tar zcvf などしてもよし、移行先PCにイメージ移送




# TROUBLESHOOTNG
  #基本
    *********************************************************
    ===> OSX のdocker/ Kinematicsを再起動　<---important !!!
    *********************************************************

  # ERROR: network docker_machine_network_name has active endpoints
    docker stop
    docker stop container_name; docker rm container_name
    docker ps

  # "error while creating volume path" "/var/lib/docker/"
    ===> それでもダメならば、docker volume remove postgresqlのボリューム で消して ; docker-compose up -d dbのサービス ; dkc_rdbmreset ;
  # Could not find XXXX in any of the sources エラー
    ===> host側の.bundle/configを消す。ホスト側のbundlerファイル残骸が影響

  # ERROR: f: Error starting userland proxy: Bind for 0.0.0.0:3**** failed: port is already allocated

    ===> development.rb コピペ移植ミスでコメント文がエラーになってコンテナ再起動失敗
    　　字義通りエラーを解釈するとポート先約中なので、lsof コマンドで見つけてkillする
      　$ lsof -i:3000
        $ kill

  #最終手段  docker-compose build SERVICENAME ; docker-compose up -d  SERVICENAME
    # line below is DANGEROUS when docker container got broken.
    # prune system, and checkout production branch to compose basic container, and check docker-bach login, then move back to original branch and perform bundle install
  # docker-compose build app && docker-compose up -d app
  #ファイルシステム見えない時など　クリーンな最終手段：
  # docker rm CONTAINER, docker rmi IMAGE


  bad-knowhow: 作成したDockerイメージからコンテナ作成/単体起動
  docker run -dit --hostname apo_mpms_ap_1 --name apo_mpms_ap_1 apo_mpms_ap_1_bak:latest -p 9000:80 --link mysql:5.7 /bin/bash --login


# 4.Virtualbox 連携
  brew install docker-machine
	# virtualbox連携：Dockerホストを開始・停止・環境表示・接続表示作成する。
	docker-machine (start|restart|stop|env|ip|create) ; docker ps
	# Virtual BoxでDockerホストを作成する。
	docker-machine create --driver virtualbox default
	# DockerホストのIPどアドレスを表示する。
	docker-machine ip
  `eval $(docker-machine env)`

  # 4.1実行(Windows)
    docker-machine env > docker-env.bat
    docker-env.bat


======================

用語集
	Dockerホスト Dockerが動いている仮想環境
  イメージ＝snapshot
  コンテナ＝VM Dockerfile=shellscript/playbook プロセスやネットワークが隔離された空間。 環境の作成や破棄が簡単になる。
  dockercompose.yml=*.vmx


======================

# Dockerコマンド https://qiita.com/teradonburi/items/8c23806e20ec8efc0ef4
  # 運用管理
    apt-get clean;

    # 3. Rails 連携
      # 以下は"docker-compose.yml"があるディレクトリで実行 "-d"は--detach, つまりbackground実行；
      docker run image_name bundle install
      docker-compose run image_name bundle install
      docker-compose run -d container_name rake db:create
      docker-compose run -d container_name rake db:migrate
      docker-compose run container_name rails s
      # デバッグ環境：
        # Gemfile
          gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
          gem 'pry-rails'
          gem 'pry-byebug'
        # development.rb
          stdin_open: true
          tty: true
        # アプリルートに.pryrc, .byebygrc
          https://budougumi0617.github.io/2017/09/02/debug-rails-on-docker/
        **byebug**
          # dockerプロセス名にシェルをアタッチする。抜ける時はCtrl+P -Ctrl-Q
          # ドカタッチ
          docker attach new_container_name

        #mysql #osx
        $ mysql.server start &

  ---
title: Dockerでホストとコンテナ間でのファイルコピー
tags: docker
author: gologo13
slide: false
---

## コンテナからホストへのコピー

docker cp コマンドが使えます。

```sh
$ sudo docker cp <コンテナID>:/etc/my.cnf my.cnf
```


## ホストからコンテナへのコピー

（追記：2016/01/22）
[Docker 1.8](http://blog.docker.com/2015/08/docker-1-8-content-trust-toolbox-registry-orchestration/)からホストからコンテナへのコピーも docker cp コマンドでサポートされるようになりました！
https://docs.docker.com/engine/reference/commandline/cp/

```
$ sudo docker cp my.cnf <コンテナID>:/etc/my.cnf
```

~~こちらは ```docker cp``` コマンドで実現することはできません。~~
~~現状、Dockerfile に記述して、コピーするしかないみたいです。~~

~~`ADD my.cnf /etc/my.cnf`~~


~~ちなみに、```docker cp```コマンドでホストからコンテナへのコピーをサポートしてほしいという要望がコミュニティ内でも根強くあるみたいです。~~

~~[dotcloud/docker #905](https://github.com/dotcloud/docker/issues/905)~~


