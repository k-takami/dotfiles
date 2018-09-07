1.ツールのインストール
  For Windows
  Docker公式サイトからインストーラをダウンロードし、インストールする。
  https://www.docker.com/products/docker-toolbox
For macOS (old)
  Windowsと同様、Docker公式サイトからインストーラをダウンロードするか、以下を実行する。
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
  brew install cask virtualbox
  brew install docker
  brew install docker-compose
  brew install docker-machine



2. リポジトリのクローン
  コマンドプロンプト(Windows)、ターミナル(macOS)で以下を実行。
  git clone --recursive git@github-ext.dena.jp:Thelxinoe/platinum-dev-env.git

2.1 public-keyでエラーが出たとき
  Permission denied (publickey).
  fatal: Could not read from remote repository.

  Please make sure you have the correct access rights
  and the repository exists.
  Git clone時に上記のようなエラーが出たら 公開鍵をGitHubに登録する。 http://qiita.com/shizuma/items/2b2f873a0034839e47ce 鍵の生成はTeratermからも行える。

設定 ＞ SSH鍵生成
  鍵の種類＝RSA
  ビット数＝2048
  で鍵を生成し、
  公開鍵の保存、秘密鍵の保存で
  公開鍵（id_rsa.pub）と秘密鍵（rsa.pub）を保存する。

3.実行
  docker-machine create --driver virtualbox default
  `eval $(docker-machine env)`
  # 以下は"docker-compose.yml"があるディレクトリで実行
  docker-compose run cms rake db:create
  docker-compose run cms rake db:migrate
  docker-compose up -d
3.1実行(Windows)
  docker-machine create --driver virtualbox default
  docker-machine env > docker-env.bat
  docker-env.bat
# 以下は"docker-compose.yml"があるディレクトリで実行
docker-compose run -d cms rake db:create
docker-compose run -d cms rake db:migrate
docker-compose up -d

`$ docker-compose run cms bundle install`
`$ docker-compose run cms rails s`

**MEMO**
マイページ	次回fumfum（https://mycode.jp/my.html ） dummy account

docker-compose down
ERROR: network platinumdevenv_default has active endpoints 
 544  docker stop
  545  docker stop platinumdevenv_cms_run_11
  546  docker rm platinumdevenv_cms_run_11
  547  docker-compose ps


#mysql #osx
$ mysql.server start &


docker-compose run --service-ports cms rails s

用語集
	Dockerホスト Dockerが動いている仮想環境。 今回の場合、VirtualBox上にある。
	Dockerコンテナ プロセスやネットワークが隔離された空間。 環境の作成や破棄が簡単になる。


Dockerコマンド https://qiita.com/teradonburi/items/8c23806e20ec8efc0ef4
  # docker ps で表示される右端の列のコンテナ名を確認
  # docker exec -it コンテナ名 コマンド
   　eg) docker exec -it loohcs_wordpress.test_1 bash  

	# なんらかのコマンドを実行する ex. rake db:migrate など
	docker-compose run web rake db:migrate
	# docker-compose run ${コンテナ名} ${なんらかのコマンド}

	# Virtual BoxでDockerホストを作成する。
	docker-machine create --driver virtualbox default
	# Dockerホストの環境変数を出力する。
	docker-machine env
	# Dockerホストを起動する。
	docker-machine start
	# Dockerホストを停止する。
	docker-machine stop
	# DockerホストのIPどアドレスを表示する。
	docker-machine ip
	# Dockerコンテナを作成して起動する
	docker-compose up -d
	# Dockerコンテナを停止して破棄する。`= docker stop & docker rm`
	`docker-compose down`
	
  #コンテナ結合＆ポートフォワーディング指定でコンテナ作成 先ほど作ったイメージでtestappコンテナを作成し起動させます。
    $docker run -it --name testapp --link mysql:mysql -d -p 8080:80 myuser/centos:1.0 
  #SCP: $ docker cp
    $docker cp ~/Desktop/test.txt testapp:test.txt

  # imageをファイルで授受：docker save コマンドと docker load コマンドを使うと良い。

  **特定コンテナ再起動　＆　コンテナプロセス一覧**
    ` docker (start|stop|restart) platinumdevenv_cms_1 ; docker ps`
      eg) 
  $ docker attach platinumdevenv_cms_1
    docker-compose build
    docker rm [container-name] OR docker-compose down**

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
      docker attach platinumdevenv_cms_1

  # 運用管理
    apt-get clean;
    docker build --squash
      サイズを小さくするには、レイヤーをまとめて一階層にした新しいイメージを作る。
    docker system prune: (new in 1.13): 
      ---> deletes all stopped containers, all idle volumes
    docker save < image_name> /docker load < image_name> 
      ---> これはレイヤーをまとめず保持するだけなので事前整頓必要
    docker export <コンテナ ID> | docker import - <イメージ名>:<タグ> 
      ---> ただしdocker build(Dockerfile)でイメージに付与した属性 VOLUME、EXPOSE、ENVなどは消失。
      保持されるのはファイルシステムだけと考えておけばいいと思います。



OSX　container場所(VMsizeはpreference->Disk)：　/Users/user/Library/Containers/com.docker.docker/Data/vms/0/ 
	
