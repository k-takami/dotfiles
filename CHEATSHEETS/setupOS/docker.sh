# G1.ツールのインストール
  # For Windows
    # Docker公式サイトからインストーラをダウンロードし、インストールする。
    # https://www.docker.com/products/docker-toolbox
  # For macOS (old)
    # Windowsと同様、Docker公式サイトからインストーラをダウンロードするか、以下を実行する。
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask cask # virtualbox
    brew install docker docker
    # OSX　container場所(VMsizeはpreference->Disk)：　/Users/user/Library/Containers/com.docker.docker/Data/vms/0/

# 2. リポジトリのクローン
#   コマンドプロンプト(Windows)、ターミナル(macOS)で以下を実行。
  git clone --recursive git@github-ext.dena.jp:Thelxinoe/platinum-dev-env.git

  # 2.1 public-keyでエラーが出たとき
    # Permission denied (publickey). fatal: Could not read from remote repository.
    # Please make sure you have the correct access rights and the repository exists.
    # Git clone時に上記のようなエラーが出たら 公開鍵をGitHubに登録する。 http://qiita.com/shizuma/items/2b2f873a0034839e47ce 鍵の生成はTeratermからも行える。

    # 設定 ＞ SSH鍵生成
    #   鍵の種類＝RSA ビット数＝2048 で鍵を生成し、 公開鍵の保存、秘密鍵の保存で 公開鍵（id_rsa.pub）と秘密鍵（rsa.pub）を保存する。

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

  #最終手段  docker-compose build SERVICENAME ; docker-compose up -d  SERVICENAME

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


