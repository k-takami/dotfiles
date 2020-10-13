
# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi


# User specific aliases and functions
# NOTE: atom-ide-ui terminal でときどきset $LANG=ja_JP.UTF-8設定が消えてしまうので手入力する状況がある
export LANG='ja_JP.UTF-8'
# コマンド実行日時を記録するフォーマット
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

#==== DOCKER & Pow ==========================
#eval $(docker-machine env)
export POW_TIMEOUT=300
# export POW_WORKERS=3
# powder (config/status|restart)

alias dkpaivl='  docker ps -a ; docker images;  docker volume ls';

#  # リサイズや清掃；
#    docker build --squash
#      サイズを小さくするには、レイヤーをまとめて一階層にした新しいイメージを作る。
# Mysql2::Error - The table 'wysiwyg_templates' is full ---> 直近変動のコンテナけす。DBのログはバイナリーじゃなければ、きえないはず
  # dkrmi $(docker volume ls -qf dangling=true) ; dkrmv $(docker image  ls -qf dangling=true) ;
alias dkprunesys='docker system prune'
alias dkpruneimg='docker images prune'
alias dkrm='    docker rm';
alias dkrmi='   docker rmi';
alias dkrmv='   docker volume rm';
alias dkcm='    docker commit';
alias dktg='    docker tag';
alias dkhs='    eocker history';
# docker login; dkcm containername tagname ; dcktg [image-name:tagname] ; dkpush [image-name:tagname]
# docker pull したものの起動：dkrunit [image-name] ; dkbash [containername]
# vim installation
  # Ubuntu系: apt-get update; apt-get install vim
  # Centos系: yum install vim
  # Alpine: apk update; apk add vim
  # Busybox : パッケージ管理ツールがそもそもない？


# Dockerfile Dockerfile に記述しておく場合は、以下のような感じ。 (apt-getの場合)
# FROM ubuntu
# RUN ["apt-get" "update"]
# RUN ["apt-get" "install" "-y" "vim"]

#paizaでのdockerコンテナ整備方法 # https://paiza.cloud/containers
# #rails, mysql, phpmyadmin のボタンをおす
# sudo systemctl enable mysql ; sudo systemctl start mysql
# rails new sample-app --database=mysql --webpack=react
# cd sample-app ; rake db:create ;
# bundle exec rails webpacker:install webpacker:install:coffee
# rails server
# #o https://localhost/phpmyadmin
# #o https://localhost-standarde-uni-1.paiza-user-free.cloud:3000/



# |prefix + ?|キーバインド一覧|
# |prefix + s|セッションの一覧表示|
# |prefix + c|新規ウィンドウ作成・追加|
# |prefix + w|ウィンドウの一覧|
# |prefix + &|ウインドウの破棄|
# |prefix + n|次のウインドウへ移動|
# |prefix + p|前のウインドウへ移動|
alias dksch='   docker search  --no-trunc';
alias dkisp='   docker inspect';
alias dkcp='    docker cp'; #fromfile <コンテナID>:/
alias dkpl='    docker login; docker pull'; #container
alias dkat='    docker attach'; #container
alias dkrunit=' docker run -itd'; # container, -d == detached
alias dkrst='   docker restart '; # container
alias dkat='    docker attach' # container
alias dkps='    docker push' # container
#TODO  docker save 771594bd57aa > ../kikan1031.tar みたいに$1$2必要
alias dksv='    docker save ' # image_name > ../*.tar name
alias dkld='    docker load < ' # *.tar name
alias dkh='     docker --help '
alias dkv='     docker --version '
# XXX: docker-compose指揮下のrailsサービスDB設定 引数にapp やwebなどymlのサービス名を指定する
alias dkcud='   docker-compose up -d '

function dkbash { # $1 == container_name/id
  dkpaivl; docker exec -it -u root $1 bash
}

function dkrstrails { # $1 == container_name/id
  docker exec -it -u root $1 bundle install
  read -p "bunles installできて、railsが入ったdockerコンテナを再起動できる状況でしたか? (y/N): " yn
  # case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac
  case "$yn" in
    [yY]) rm tmp/pids/server.pid; dkrst $1; docker attach $_ ;;
    [nN]) exit ;;
    *) exit ;;
  esac
}


function dkc_rdbseed {  #通常のbdl方法
  docker-compose run -u root app bundle install ;
  docker-compose run -u root app bin/rake db:migrate db:seed
  docker-compose run -u root app annotate --force ;
  echo "### NOTE "
  echo "###      rake:db:migrateが失敗しがちなのでdbのコンテナを再起動してから実行した方がいい"
  echo "###      bundle install失敗するときは docker exec -it -u root CONTAINERNAME bash でログインして すること"
  echo "###    : DBMSからログアウトし、ワークコンテナでerrorになるgemをGemfile*からコメントアウトしてから流すこと";
  echo "###    : migratonファイルでundefエラーになるのはシンボルで表記されていないから" ;
}

# よくあるアプリ構築手順
function dkcbuildup {
  env=${1:-'app'}
  docker-compose build $1 && docker-compose up -d $1
  dkpaivl
}

function dkc_rdbmreset { #通常のbdl方法 #  == dkrst db && dkbash app ; bundle install && bin/rails db:drop db:create ridgepole:apply db:migrate db:seed && annotate --force
  env=${1:b-'app'}
  docker-compose run -u root $1 bundle install ;
  docker-compose run -u root $1 bundle exec yarn install #<---これがないと次のエラー： OCI runtime exec failed: exec failed: (…) executable file not found in $PATH": unknown
  # docker-compose run $1 rails db:drop db:create db:schema:load  db:seed_fu
  #eg2 $ docker-compose run $1 rails db:drop db:create db:schema:load db:seed_fu
    #eg1 $ docker-compose run $1 db:drop db:create ridgepole:apply db:migrate db:seed
    #eg2 # docker-compose run $1 rake db:drop db:create ridgepole:apply db:seed_fu #全タブreload前にログインすべき
  # docker-compose run -u root $1 bin/rake db:migrate:reset db:seed;
  # docker-compose run -u root $1 bin/rake db:reset:with_data;  #<---special
  docker-compose run -u root $1 annotat e--force ;
  echo "### NOTE "
  echo "###      rake:db:migrateが失敗しがちなのでdbのコンテナを再起動してから実行した方がいい"
  echo "###      bundle install失敗するときは docker exec -it -u root CONTAINERNAME bash でログインして すること"
  echo "###    : DBMSからログアウトし、ワークコンテナでerrorになるgemをGemfile*からコメントアウトしてから流すこと";
  echo "###    : migratonファイルでundefエラーになるのはシンボルで表記されていないから" ;
}


function dkc_rdbinit {
  local options=${2:-web} ;
  docker-compose run -u root app bundle install ;
  docker-compose run -u root app bin/rake db:create db:migrate db:seed;
  docker-compose run -u root app annotate --force ;
}


# https://stackoverflow.com/questions/35575674/how-to-save-all-docker-images-and-copy-to-another-machine
function dki_saveall2tar {
  # If you want to save multiples images in one .tar file:
  # IDS=$(docker images | awk '{if ($1 ~ /^(debian|centos)/) print $3}')
  # docker save $IDS -o ./allinone_dockersimages.tar
  docker images | awk '{if ($1 ~ /^(.)/) print $1 " " $2 " " $3 }' | tr -c "a-z A-Z0-9_.\n-" "%" | while read REPOSITORY TAG IMAGE_ID
  do
    echo "== Saving $REPOSITORY $TAG $IMAGE_ID =="
    docker  save   -o ./$REPOSITORY-$TAG-$IMAGE_ID.tar $IMAGE_ID
  done

  echo "== Docker Image Lists are as follows =="
  echo "`docker images | sed '1d' | awk '{print $1 " " $2 " " $3}' ` "
  docker images | sed '1d' | awk '{print $1 " " $2 " " $3}' > dki_saveall2gtar.txt
  lat
}

function dki_loadallfromtar {
  while read REPOSITORY TAG IMAGE_ID
  do
    echo "== Tagging $REPOSITORY $TAG $IMAGE_ID =="
    docker tag "$IMAGE_ID" "$REPOSITORY:$TAG"
  done < dki_saveall2gtar.txt
}

#migration file修正反映: gem install annotate; 　annotate --force

# # image 削除
#  # $ docker ps -a で消したいコンテナID/image_nameしらべて、docker コンテナ消して、それからイメージをけす；
#  $ docker rm containter_id ; docker rmi image_name/image_id
#  # ロールバックならば docker tag {image_prefix} で
#  $ docker commit {container_name} {適当なcontainer名}
#
#
# # image 作成
#  # docker tag {image_id} docker_user_name/repo_name
#  docker tag cb65473b7a65 belltakami/alpine-ruby
# # 履歴確認はIMAGE-NAMEで
#  $ docker history {適当なimage名}
#
#  #docker hubの既存イメージ検索 (filterでイメージが自動構築されたかどうか、公式なのかしぼれる)
#  $ docker search --no-trunc ruby  --filter stars=3 --filter "is-automated=true" # --filter "is-official=true"
#  # 以下のコマンドは、コンテナtestvmを、一時停止無しでDockerイメージを作成してます。
#  $ docker commit --pause=false {container_name} {image_name:tag}
#  #作成したコンテナcontainerXをDockerイメージ「imageX:tag」で起動
#  $ docker run -d --name {new_container_name} image_name:tag
#  #設定情報をJSON形式で見る：Cmd が内部で実行されているデーモン情報
#  $docker inspect container_name |less
#
#  docker exec -it コンテナ名 コマンド
#  # なんらかのコマンドを外部から注入して実行する ex. rake db:migrate など
#  docker run --rm container_name rake db:migrate
#  # なんらかのコマンドを内部に入って実行する
#  docker exec -it container_name bash
#  #TODO: コンテナ結合＆ポートフォワーディング指定でコンテナ作成 先ほど作ったイメージでtestappコンテナを作成し起動させます。
#    $docker run -it --name testapp --link mysql:mysql -d -p 8080:80 myuser/centos:1.0
#  #SCP: $ docker cp
#    $docker cp ~/Desktop/test.txt testapp:test.txt
#  # pull-> run it -> save & load -> push
#  # imageをファイルで授受：docker save コマンドと docker load コマンドを使うと良い。
#    $ docker search --no-trunc rails --filter stars=3 # "is-automated=true" "is-official=true"
#    $ docker login
#    $ docker pull frolvlad/alpine-ruby
#    $ docker run -it frolvlad/alpine-ruby
#    # ^p^qで抜ける、docker attach container_id_or_name で入る
#    $ docker push belltakami/alpine-ruby
#    $ docker save repository:tag  > example_save.tar
#    $ docker load < example_save.tar

# dockerコンテナのhost/guest mout point 確認
  # $ docker inspect container_name | grep "Mounts" -C10


#==== ~/.rvm/bin/rvm ==========================
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
## rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
#export PATH="$PATH:$DL_HOME/redis-3.0.7/src"
eval "$(rbenv init -)" #<--- ~/.rbenv/*** & /usr/local/bin にPATH を通してから eval

if [ -f ~/.atom ] ; then
  source ~/.rvm/scripts/rvm ; type rvm | head -n 1
  export PATH="$HOME/.rvm/bin:$HOME/.rvm/scripts/rvm:$PATH"
  alias rvminfo="     rvm list; rvm gemset list; gem query -an rails;" # gem list; "
  alias rvmusecreate='rvm use --create'
  alias rvmusesys='   rvm use system   ; ruby -v; rails -v'
  alias rvmusemine='  rvm use 2.4@5.0.1; ruby -v; '
fi
alias rvminstallrails='gem install rails' # -v=5.0.0.1 --no-ri --no-rdoc　など・・・
#when updgraded ruby
#export GEM_PATH=$GEM_PATH:/Library/Ruby/Gems/2.0.0/
echo "GEM_HOME / GEM_PATH are :  $GEM_HOME / $GEM_PATH " # https://github.com/rvm/rvm/issues/2817

if type python > /dev/null 2>&1; then # コマンドが存在すれば
  export PATH="$PATH:$HOME/Library/Python/2.7/bin"
fi


#==== node and npm ==========================
if [ -f ~/.config/yarn ] ; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
alias npmpkglist=' npm    ls --depth=0'
alias npmpkglistg='npm -g ls --depth=0'
alias npmappclean='npm cache clean; rm -rf node_modules; rm -rf bower_components; '
alias angularinstallg='npm install; bower install; typings install'
alias angularinstall=' npm install; node_modules/bower/bin/bower install; node_modules/typings/dist/bin.js install; npm rebuild node-sass'
alias webpacklocal='sudo node_modules/webpack/bin/webpack.js'

#FIXME:  export DL_HOME=~/
export DL_HOME=~/Download

#==== JVM ==========================
  # export ANT_HOME=$DL_HOME/apache-ant-1.9.6
  # export M3_HOME=$DL_HOME/apache-maven-3.3.9
    # export M3=$M3_HOME/bin
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.6"`
#export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"
##export PATH="$PATH:$JAVA_HOME:$ANT_HOME/bin



#==== OS-dependent ==========================
# OS detection ref: https://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
# OS="`uname`"
platform='unknown'
# if [ $OS == 'Linux' ]; then
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -f /etc/redhat-release ] ; then
    platform='linuxRHEL'
    alias pkgadd='            yum install'        # パッケージのインストール
    alias pkgrm='             yum remove'         # パッケージの削除
    alias pkgsearch='         yum search'         # パッケージの検索
    alias pkglist='           yum list installed' # インストール済みパッケージの情報表示
    alias pkgcontents='       yum info'           # パッケージ内容の表示
    alias supkgadd='sudo      yum install'        # パッケージのインストール
    alias supkgrm='sudo       yum remove'         # パッケージの削除
    alias supkgsearch='sudo   yum search'         # パッケージの検索
    alias supkglist='sudo     yum list installed' # インストール済みパッケージの情報表示
    alias supkgcontents='sudo yum info'           # パッケージ内容の表示
    #centOS コマンド
    alias sr='su - root'
    alias svh=' service httpd'
    alias svmq='service mysql'
  elif [ -f /etc/debian_version ] ; then
    platform='linuxDebian'
    alias pkgadd='               apt-get install'  # パッケージのインストール
    alias pkgrm='                apt-get remove'   # パッケージの削除
    alias pkgsearch='            apt-cache search' # パッケージの検索
    alias pkgsearch_chef='       apt-cache policy' # パッケージの検索(Ansible/Chef使用時）
    alias pkglist='              dpkg -l'          # インストール済みパッケージの情報表示
    alias pkgupdate='            apt-get update'   # パッケージDBの更新
    alias supkgadd='sudo         apt-get install'  # パッケージのインストール
    alias supkgrm='sudo          apt-get remove'   # パッケージの削除
    alias supkgsearch='sudo      apt-cache search' # パッケージの検索
    alias supkgsearch_chef='sudo apt-cache policy' # パッケージの検索(Ansible/Chef使用時）
    alias supkglist='sudo        dpkg -l'          # インストール済みパッケージの情報表示
    alias supkgupdate='sudo      apt-get update'   # パッケージDBの更新
    # alias pkgcontents=''                         # パッケージ内容の表示
  fi
# elif [ "$OS" == 'Darwin' ]; then
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform='osx'
    alias pkgadd='brew install'                        # パッケージのインストール
    alias pkgrm='sudo uninstall file:///Applications/' # パッケージの削除
    # alias pkgsearch=''                               # パッケージの検索
    # alias pkglist=''                                 # インストール済みパッケージの情報表示
    # alias pkgcontents=''                             # パッケージ内容の表示
    # export GEM_PATH=$GEM_PATH:/Library/Ruby/Gems/2.2.4/
# elif [ "$OS" =~ "^MINGW" ]; then
elif [[ "$OSTYPE" == "msys"* ]]; then
  platform='windows'
fi
if [ $platform == 'osx' ] || [ $platform == 'linuxRHEL' ] ; then
  alias killosx_zombieprocess='killall -m fsevent_watch; killall -m spring ; myps'
fi


#==== unix UNIX コマンド ==========================
# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -p'
#FIXME:
#alias cp='cp -pi'
#alias mv='mv -i'
alias ll=' ls -al'
alias lat='ls -halt'
alias las='ls -alSr'
alias rm='rm -r'
alias portps='lsof -i:' #-i:3000みたく空文字なしに入力
alias kill9='        kill -9 '
alias killallrails5='pkill -a thin; '
alias myps='ps -ef  |$grepbin -n$regexopt "\b(memcached|unicorn|ant|redis|sidekiq|rails|ruby|thin|fsevent|spring)\b" | sort -k6'
alias duck='du -ck' #kilobyte-totalを表示

alias vims='  vim     -S ~/session-'
alias vimsve='vim +VE -S ~/session-'
alias vimve=' vim +VE '
alias vimd='  vim -d '
alias histail='history |tail -n 50'
#line below have to be followed by url:443 like http://192.168.25.171:443/
alias wgetssh=' wget -d --secure-protocol=SSLv3 --no-check-certificate --keep-session-cookies --save-cookies cookies.txt '
alias TODAY='echo `date '+%Y%m%d'`'
alias xvf='for i in *.tar.gz; do tar zxvf $i -C ./ ; done'
#sort: nUMERIZE, rEVERSE, kOLUMN-NUMBER
alias greptodo='greper "#TODO:" ./* --include=*.*rb* --exclude=DD*.* --exclude=NG*.* --exclude=Copy*.*  --exclude=EX*.* --exclude-dir=vendor -C1'
alias sortnk=' sort -n  -k'
alias sortk='  sort     -k'
alias sortn='  sort -n'
alias sortnr=' sort -nr'
alias sortnrk='sort -nr -k'
alias duhls1wcl='du -h; ls -1 ./ | wc -l ' #count files in current dir:
alias dusbh='    du -sbh  '                #count file size under some dir
alias ls1wcl='ls -1 ./ | wc -l ' #count files in current dir:

alias cdd=' cd ~/dotfiles'
alias cdthere='cd $_'
alias myvim='cdd; vim -S ~/sessionATOMMAN'
alias nrnd=' --no-ri --no-rdoc '
alias no_spec=' echo "--exclude=*spec* "'
function inclrb { echo "--include=*rb --include=*.yml --include=*html* --include=*.*coffee --include=*.*js --include=*.*sass --include=*.*css --exclude-dir=vendor --exclude-dir=tmp/* --exclude-dir=node_module "; }
function nogabage { echo "--exclude=*.sw* --exclude=*.log --exclude=*.dev --exclude=*.*201* --exclude=*.*rev* --exclude=*.*-* --exclude=*.lock --exclude=*.org --exclude=*DEV --exclude=*BAK  --exclude=*.bak "; }
function exclnonapp { echo " --exclude-dir=vendor  --exclude-dir=lib --exclude=*.log "; }

# ruby -rrexml/document -ryaml -e ' puts YAML.dump(REXML::Document.new(open("some/full/path.xml"  )))'

alias fzfp="fzf --inline-info --preview 'head -100 {}'"
grepbin="hw"  ; regexopt="iaN"
#grepbin="grep"; regexopt="irE"
echo "====== YOU ARE NOW USING 'hw' INSTERAD OF 'grep' by $grepbin VARIABLE NOW ======"
# $1検索語　$2場所 regrep の$2がなければ、./*で補完
# alias greper-pure=' $grepbin -n$regexopt "錦糸町" ./* | grep -v "錦糸町支店" |grep -v ".svn"'
# function greper   {                           $grepbin     -n$regexopt  $@          ; }
# function greperrb {                           $grepbin     -n$regexopt  `inclrb` `nogabage` $@ ; }
function grepe    {                             $grepbin     -ni   $@          ; }
function regreprb {     local options=${2:-*} ; $grepbin     -n$regexopt  `inclrb` `nogabage` $1 $options ; }
function regrepl  {     local options=${2:-*} ; $grepbin     -ln$regexopt $1 $options ; }
function regrepc1_r {   local options=${2:-*} ; $grepbin -C1 -n$regexopt  $1 $options ; }
function regrepc3_r {   local options=${2:-*} ; $grepbin -C3 -n$regexopt  $1 $options ; }
function regrep_nosub { local options=${2:-*} ; $grepbin     -ni   $1 $options ; }
function regrepl_r {    local options=${2:-*} ; $grepbin     -ln$regexopt $1 $options ; }
function regrepc1 {     local options=${2:-*} ; $grepbin -C1 -n$regexopt  $1 $options ; }
function regrepc3 {     local options=${2:-*} ; $grepbin -C3 -n$regexopt  $1 $options ; }

function regrep {
  local options=${@:2} ;
  $grepbin -n$regexopt $1 $options ;
}
function regreprb {
  local options=${@:2} ;
  $grepbin -n$regexopt $1 $options `inclrb` `nogabage` ;
}
function greprc {
  local options=${@:2} ;
  $grepbin -ni  $1 ~/dotfiles/*                      $options #--exclude=*.htm* --exclude=*.json ;--include=*rc
  $grepbin -ni  $1 ~/dotfiles/SI/pj-dependent.bashrc $options #--exclude=*.htm* --exclude=*.json ;
}
function greprcrbonly { greprc `inclrb` `nogabage` $@ ; }
# TODO function ; lat $2 にする
#  ffgrep \/.*OLD$ |grep -v scaffold | xargs  -J% cp -f % ~/dotfiles/SI/BAK/ORO/hokenryoKanri ; lat $3
#  #grep結果ファイル中文字列をかきかえ
# $ regrepl attr_accessible app nogabage exclnonapp |xargs -n1 ruby  -pi.bak -e  '$_.gsub!(/attr_accessible/, "attr_accessor")'
#  #URL Query-stringsクエリー文字列 抽象化：Percona pt-query-digest fingerprint/distill互換
#    ls some*_log.201* |xargs  ruby -p -e  '$_.gsub!(/=[%\s\w]+( |&)/, "=?\\1")'  -i

function grepdf {
  # ex) greprc serchword -C1 `inclrb` `nogabage`
  local options=${@:2} ;
  $grepbin -n$regexopt  $1 ~/dotfiles/* #--include=*rc $options --exclude=*.htm* --exclude=*.json ;
  $grepbin -n$regexopt $1 ~/dotfiles/SI              $options #--exclude=*.htm* --exclude=*.json ;
  $grepbin -n$regexopt $1 ~/dotfiles/SCRIPTS         $options #--exclude=*.htm* --exclude=*.json ;
  $grepbin -n$regexopt $1 ~/dotfiles/CHEATSHEETS     $options #--exclude=*.htm* --exclude=*.json ;
  $grepbin -n$regexopt $1 ~/dotfiles/vim/snippets    $options #--exclude=*.htm* --exclude=*.json ;
  # echo "grep -n$regexopt $1 ~/dotfiles/vim/snippets  $options ### ";
}

function greprails { # gempath内部のgrep
local gempath=`which gem | xargs ruby -e "puts ARGV[0].gsub(/(rubies|bin.gem)/, 'gems') "` ;
  $grepbin -n$regexopt "def \w*$1" $gempath ;
}

function sshpubkey_osx {  #$1 == email@address  #, for github
  env=${1:-'belltakami@gmail.com'}
  ssh-keygen -t rsa -b 4096 -C "$1"
  ll ~/.ssh/
  cat ~/.ssh/id_rsa.pub &&  pbcopy < ~/.ssh/id_rsa.pub
  echo "コピーしましたよ"
  read -p "vim ~/.gitconfigでname, email, user編集しますか？(y/N): " yn
  case "$yn" in
    [yY]) vim ~/.gitconfig ;;
    [nN]) exit ;;
    *) exit ;;
  esac
}

GIT_PS1_SHOWDIRTYSTATE=true
source /usr/local/etc/bash_completion.d/git-prompt.sh
export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '
source /usr/local/etc/bash_completion.d/git-completion.bash
# git config --global color.ui true
#source ~/.git-prompt.sh
# export PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
#export GIT_USERNAME=k_takami
#export GIT_USERNAME=kenichi.takami
# TODO: .
  # ~/dotfiles/development.rb >> config/development.rb

alias vimclean='rm ~/*.sw* ; cd ~/dotfiles ; git status ; cd - ;'
alias ror_snip_list='sh ~/dotfiles/SCRIPTS/list_snipets4snipmate.sh ruby rails erb javascript'
alias ror_lns_gitignore='ln -s ~/dotfiles/gitignore .gitignore'

alias grepvcode='   find . |grep -viE "\.(svc|git|hg)" | grep'
alias grepvr='   grep -viE "(\..?sv|\.yml|\..?css|\.js.+|\.erb|\.NEW|\.OLD|\.BAK|\/db\/migrate|development.rb|schema.rb)" | grep'
alias grepvrsort='sort | grepvrbc . '

#SYNC WITH after fugitive.vim grep.vim
alias gst='      git status' #Gstatus
alias gwr='      git add' #Gwrite
alias gdi='      git diff' #gdif
alias gbl='      git blame' #Gblame
alias grm='      git rm'
alias gcfggettmturl=' git config --get remote.origin.url'


#GREP everything # リモートgrep検索は gilostheir
alias grep-hist='    history |$grepbin -n$regexopt'
alias grep-ps='      ps -ef  |$grepbin -n$regexopt'
alias grep-env='     env | $grepbin'
alias grep-gst='     git status |$grepbin -n$regexopt'
alias grep-gem='     gem list | $grepbin'
alias grep-pkglist=' pkglist | $grepbin -$regexopt '

#git/ mercurial / patchコマンド http://uguisu.skr.jp/Windows/diff_patch.html http://d.hatena.ne.jp/mrgoofy33/20101019/1287500809
alias patchp=' patch    -p0 <' #[patch-name] to apply on
alias patchrp='patch -R -p0 <' #[patch-name] to reverse(=undo)
alias gibr='      git branch'
alias gibr-d='    git branch -D' #削除
alias gibr-m='    git branch -m' #旧ブランチ名　新ブランチ名
alias gibr-a='    git branch -a'
alias gicm='      git commit'
alias gicmm='     git commit -m' #modify
alias gico='      git checkout'
alias gico-='     git checkout -'
alias gico-b='    git checkout -b'
# alias tgstb=' gst;gibr'
alias gstbh='gst;gibr;git log |head -n 5; echo -e "\n *** 直近コミットしたファイルは以下***"; gisw --name-only'
alias sbh='  gstbh'
alias precommiton=' mv .git/hooks/pre-commitMAE .git/hooks/pre-commit'
alias precommitoff='mv .git/hooks/pre-commit .git/hooks/pre-commitMAE'

alias hgdi='      hg diff -c'
alias gdic='     git diff --cached'
alias gdiclas='  gdic --name-only |xargs ls -alSr'
alias gdicgrep=' gdic --name-only |xargs $grepbin -$regexopt  '
alias gdilas='   gdi  --name-only |xargs ls -alSr'
alias gdicgrep=' gdic --name-only |xargs $grepbin -n$regexopt '
# patch作成用  gitの場合は--no-prefixは内部的に自動付与らしい
alias gdicnp='          git diff --cached --no-prefix'
alias gdilight='        git diff --no-prefix --ignore-all-space --ignore-blank-lines --ignore-cr-at-eol'
alias gdicnpURDPD='     git diff --cached --no-prefix > ~/Downloads/gdicnpURDPD.diff'
alias gdicnpURDPDlight='git diff --cached --no-prefix --ignore-all-space --ignore-blank-lines --ignore-cr-at-eol > ~/Downloads/gdicnpURDPD.diff'
alias gdinp='           git diff          --no-prefix'
alias gdinpURDPD='      git diff          --no-prefix > ~/Downloads/gdicnpURDPD.diff'
alias gdinpURDPDlight=' git diff          --no-prefix --ignore-all-space --ignore-blank-lines --ignore-cr-at-eol > ~/Downloads/gdicnpURDPD.diff'
alias gdino='     gdi  --name-only'
alias gdicno='    gdic --name-only'
alias diffbbq='   diff -rwBbq '
#  diff - -x ".hg" ginger ginger_mae/ |sort
alias hgbl='      hg blame -lund'
# cf: https://www.wikivs.com/wiki/Git_vs_Mercurial:w
alias gplo='      git pull origin'

# gplo $1 && gdi $1 Gemfile db

alias gclone='    git clone'
alias gcloneb='   git clone -b ' # ブランチ名 https://リポジトリのアドレス
alias gpso='      git push origin'
alias gpsdelo=' git push --delete origin' #[branch-name] to delete リモートブランチ削除
alias gisw='      git show'
alias gish='      git stash'
alias gishcl='    git stash clear'
alias gishls='    git stash list'
alias gishsw='    git stash show'
alias gishsv='    git stash save'
alias gishpp='    git stash pop'
alias gishdd='    git stash drop'    # スタックの一番上にある変更を削除する
alias gishdi='    git diff stash@{0}' #後にfile特定の引数もつけていい
#git関連検索
alias gilo='      git log '
alias gilos_brief='git log -S'
alias gilos='     git log -p --full-diff -S'
alias gilohd='    git log |head -n 50'
alias gilono='      git log --name-only'
#alias gilogrep
alias gilotheir=' git log --all --stat --branches=* --remotes=* ' #followed by filename[s]
alias gilostheir='git log --all --stat --branches=* --remotes=* -S'
alias mygilo='    git log --committer=$GIT_USERNAME'
alias gilosmine=' git log --committer=$GIT_USERNAME -S'
#    コミットの中で"hogehoge"という文字列を含む行が変更されたものだけ表示 ：例  $ tig -S"hogehoge" filename

# $ git checkout master           # master ブランチへ切り替え
# $ git pull --rebase             # 最新化(前述の設定により --rebase は省略可能)
# $ git checkout feature/xxxxxx   # push したい自分のブランチへ切り替え
alias girbplo='   git pull --rebase origin'  # 引数にリモートブランチ名。1rebase後になにか消失ファイルがないか点検。本来はマージ履歴をのこさない --ff をつけるべきかも？
alias girbmst='   git rebase master --no-ff'  # 最新化した master ブランチに対して自分のブランチをリベース
alias girbcntn='  git rebase --continue'
alias girbabt='   git rebase --abort' #rebase abort
alias gimgabt='   git merge  --abort' #pull/merge abort
alias girbihd='   git rebase -i' # to be follwed by HEAD~~ or HEAD~~~~~~回数分
alias fixup='gicmm "tmp" ; gishsv;  girbihd HEAD~~ ; gilono ; gishpp; '
alias gichpi='    git cherry-pick'

alias hgst='      hg status'
alias hgstfile='  hg status --rev '
#hg status --rev -3: |grepe "(apple|yml|setting|const|system)"
#git変更コマンド
alias gicma='     git commit --amend'
#git 矛盾解消コマンド
alias gicothr='      git checkout --theirs'
alias gicoour='      git checkout --ours'
alias girstmg='      git reset --merge'
alias girstHEAD='    git reset HEAD -- '
alias girsthard='    git reset --hard ' #HEAD^ や　HEAD@{n}を追記 :自分のコミットをN回とりけした状態にロールバック ワークファイル破棄
alias girstsoft='    git reset --soft ' #HEAD^ や　HEAD@{n}を追記 :自分のコミットをN回とりけした状態にロールバック ワークファイル保持
alias girmc='        git rm --cached'        #stagingとりけし
alias gicostsh0='    git checkout stash@{0}'
alias gicostsh0lots='git checkout stash@{0} Gemfile Gemfile.lock config/environments/development.rb config/database.yml .gitignore ; git reset HEAD -- Gemfile Gemfile.lock config/environments/development.rb config/database.yml .gitignore;'

#railsコマンド
alias railscaf=' rails generate scaffold ' # branches　など複数形
alias railscaf_docker='docker exec -it CONTAINERNAME bin/rails g scaffold Parent::ChildClass '
alias railscaf_docker_destroy='docker exec -it CONTAINERNAME bin/rails d  scaffold Parent::ChildClass '

alias bdl='            bundle exec'
alias bdli='           bundle install'
# オフライン環境では --local オプションを付けることでrubygems.org等を見に行かずに、vendor/cacheフォルダを見るようになります。
alias bdlilocal='      bundle install --local'
alias bdlilikerails12='bundle install --path vendor/bundle'
alias bdlupclean='     bundle update; bundle clean' #一括削除清掃
# ローカルから普通にもどすときは
# $ rm -rf vendor/bundle/ Gemfile.lock .bundle/config ; bdl; rails s;
alias ror5dbdrop='DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=development  rake db:drop'
alias ds1='DISABLE_SPRING=1 '
alias bx='             ds1 bundle exec '
alias bxs='            ds1 bx rspec'
alias bxrdbm='         ds1 bx rake db:migrate'
alias bxrdbs='         ds1 bx rake db:seed'
alias gplombxrdbmrdbs='git pull; bxrdbm; bxrdbs'

alias bxrdbmtest='     ds1 bx rake db:migrate RAILS_ENV=test'
alias bxrdbmdown='     ds1 bx rake db:migrate:down'
alias gplobxbi='       gplo master; bxrdbm; bundle install'
alias rrg='            ds1 bx rake routes |grep '
alias asset_cleancomplie="RAILS_ENV=development rake assets:clean assets:precompile"
#ステップ数概算
# $grepbin -n$regexopt "def \w" .  --include=**  --exclude=*.sw* --exclude=*~ --exclude=*.log > ../../GrepDef.txt
# find . -name "*.rb" -o -name "*.yml" | xargs wc -l
# rake stats
# rake -T |grep ridge
# rake ridgepole:apply[rails_env]         # Apply Schemafile to the database
# rake ridgepole:export[rails_env]        # Export the database schema to Schemafile

# gemバージョン　正規表現検索
alias gemquery="     gem query -ban "
alias gemqueryremote="     gem query -ran "
#rubocop
alias rbc='         ds1 rubocop'
alias rbca='        ds1 rubocop -a'
# alias rbc18='       rubocop -c ~/dotfiles/RAILS_ROOT/.rubocop.yml.tokyo_realistic_v1.8'
# alias rbca18='      rubocop -c ~/dotfiles/RAILS_ROOT/.rubocop.yml.tokyo_realistic_v1.8 -a'
alias rbp='         rails_best_practices'
export REGEXP_RBC_IGNORE="(app\/views|wrapper|\.xlsx|\.xls|\.js|\.coffee|\..?css|\.csv|\.tsv|\.png|\.svg|\.yml|schema.rb|structure.sql|Gemfile|.gitignore)"
export REGEXP_MYBUG="^\+.*(\?i|i\b|binding.pry|byebug|debugger|takami)"
alias rbwc='ruby -wc'
alias rbwcstaged='  gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs -n1 ruby -wc'
alias rbwcdev='     gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs -n1 ruby -wc'
alias rbcrails='    gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs rubocop '
alias rbcrailsauto='gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs rubocop -a '
alias rbprails='    gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs rails_best_practices'
alias mytestsingle='ds1 bx rake spec:test RAILS_ENV=mobi-connect-test'
alias mybugstaged=' gdicnp |grepe $REGEXP_MYBUG -C2 '
alias mybug='       git show |grepe $REGEXP_MYBUG -C1 ; gdicnp |grepe $REGEXP_MYBUG -C1 ; gdi |grepe $REGEXP_MYBUG --exclude=development.rb --exclude=*Gemfile* -C1'
alias raspell=' ruby ~/dotfiles/SI/SCRIPTS/ror_02_raspell.rb'
alias mybugallstaged='rbcrails; mybugstaged; rbwcstaged; echo "●Windows表示、スマホ表示、yarn.lockとpackage.jsonをproductionモードで動作確認"' #rbprails; #raspell;
alias mybugall='      rbcrails; mybug      ; raspell; rbwcstaged; rbprails;'
alias mybug_migration_yyyymmdd='find db/migrate/*create_*  |xargs -n1 git blame |grep' # add /yyyy-mm-dd?/ date to find DANGEROUS MIGRATION FILE
#alias mybugall_and_migrationyyyymmdd='mybugall; mybug_migration_yyyymmdd'

#tig
alias mytig='   tig     --committer=k_takami'
alias mytigbug='tig     --committer=k_takami --grep=正 --grep=bug.fix '
alias tigbug='  tig                          --grep=正 --grep=bug.fix '

#OSS DBMS
alias dbimportmysql='mysql -u root -h localhost < ' # -D databasenameをつけなきゃいけない　面倒臭いmysqimportコマンドではないのに注意。
alias dbloginpsql='psql -U postgres'

#apache
alias list_apachemod='sudo apachectl -M |sort'

umask 002

#ヘッダーフレーム修正→rail4scaf→ (routes.rb)-> モデリングとdb:migrate→　aptanaでMVCそれぞれcompare with ひながたMVC
  #@M
  #class ****** #< ActiveRecord::Base
  #  include ActiveModel::Model
  #@CFG
  #  migration.****.rb --> *.rb.bak
  #@C
  #  layout 'main_frame'
  #  def index
  #      @*****s = [] #******.all
  # (...)
  #
  #
  # private
  #
  # Use callbacks to share common setup or constraints between actions.
  # def **** #インデントそろえるrubocop対策



#変数展開コマンド #######################################################
# パターン  動作  典型的な使用例
# ${変数#パターン}  文字列先頭の最短マッチ部分を削除  単に先頭の固定文字列を削除するとき使う
# ${変数##パターン} 文字列先頭の最長マッチ部分を削除  ${HOGE##*/}でbasename
# ${変数%パターン}  文字列末尾の最短マッチ部分を削除  ${HOGE%/*}でdirname。単に末尾の固定文字列を削除するときにも使う
# ${変数%%パターン} 文字列末尾の最長マッチ部分を削除  あまり使わない
# ${変数/検索文字列/置換文字列} 最初にマッチしたもののみ文字列を置換
# ${変数//検索文字列/置換文字列}  全ての文字列を置換  ${HOGE//foo/bar}

function backuprorapp { # 引数である、下層のRails.rootフォルダーを圧縮
  local chomped1=${1%\/} ;  # 行末スラッシュ削除
  tar zcvf $chomped1-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" --exclude=vendor/* --exclude=node_modules $chomped1;lat;
  #XXX --exclude node_modules
}


function backupgitonly { # 今のRails.rootフォルダー名を引数にして呼ぶ。上階に.gitを圧縮
  local chomped1=${1%\/} ;  # 行末スラッシュ削除
  cd $chomped1
  tar zcvf ../$chomped1.git-`date '+%Y%m%d_%H%M'`.tar.gz .git ; lat ..
}

#remote-branch fetch
function gicob_remotebranch { # $1==new_branch_name , $2==origin_name
  env=${1:-'XXX'} #第1引数がなければdefault_name
  env=${2:-'origin'} #第2引数がなければorigin
  git fetch
  gishsv ; gico-b $1 origin/$1 ; gishpp; gst; gibr;
  # igit version 2.17仕様でgit 1.6でつかえるというstackoverflowの情報の"-t"おぷしょんが使えなかった; gishsv ; gico -t $2/$1 ; gishpp; gst; gibr;
}


#今いるブランチを最新化して新ブランチ作成
function gplogicob { # $1==base_branch  optional $2==new_branch_name
  env=${2:-'fix_new'} #第2引数がなければdefault_name
  gishsv && gico $1 && gplo $1 && gico-b $env && gishpp && gibr
}
function backupgirbplodkrakeannotate { #Rails.rootで実行 引数= girreponameリモートブランチ名 docker-container名
  cd .. ;
  backupgitonly $1;
  girbplo $2
  echo " ###TODO: bundle install &&  bin/rake db:reset:with_data && annotate --force をコンテナで実行してください"
  echo " ###TODO: bundle install &&  bundle install && bin/rails db:drop db:create ridgepole:apply db:migrate db:seed をコンテナで実行してください"
  docker exec -it -u root $3 bash;
}

function backupdotfiles {  # ~/dotfilesフォルダーに移動して~に圧縮
  cdd;  mv SI ../; mv vim ../ ; mv SI.tar.zip ../ ;
  # OSX/BSD can use --exclude-vcs option below;
  tar zcvf ../dotfiles-`date '+%Y%m%d'`.tar.gz ./*  --exclude-vcs ;
  mv ../SI ./ ; mv ../vim . ; mv ../SI.tar.zip ./ ;
  lat ..; lat ; gst;
}

function killmyps {
  # myps検索pid以外をgrepしてkill
  kill -9 `myps | grep -v grep | ruby -ane 'p $F[1].to_i'`
}
function chomR { #引数 group:owner 777 targetdir
  sudo chown -R $1 $3 ;  sudo chmod -R $2 $3
}
function nocomments { # grep結果から-vでコメントや空行を除外
  grep -vE '\\s*\\#+.*(byebug|debugger)' | grep -v '^$'
}

function grepsnippets {
  $grepbin -n$regexopt $1 ~/dotfiles/vim/snippets $2;
}
function grepremotegems {
 echo 'gem list ***GEMNAME*** --remote --all';
}

alias ff='    find ./* | sort | less '
alias ffgrep='find . | $grepbin -$regexopt'
#  ff | $grepbin NEW |wc -l    <--- ファイル数



# 特定ファイルだけ展開： $ sudo tar zxvf 対象tarball.tgz full/path/to/the/specified/file/in/the/tarball
alias findp0x0mv0='find -print0 | xargs -0 mv -t ./ ' #一括移動 -print0と -0は呼応。NULL区切り
alias matchcopy="| xargs -J% cp -f % "

alias rmpatch='ffgrep "\.(rej|orig)" | xargs -n1 rm'
function rmbak {
  ffgrep .bak |xargs -n1 rm $_ ;
  find . | $grepbin $regexopt "DEV$" |xargs -n1 rm $_ ;
  find . | $grepbin $regexopt "`TODAY`$" |xargs -n1 rm $_ ;
}

#ATOM環境
function atom_backup {
  local target=ATOM
  apm list --installed --bare > SI/$target/packages.txt
  cp ~/.$target/keymap.cson     SI/$target/
  cp ~/.$target/config.cson     SI/$target/
  cp ~/.$target/snippets.cson   SI/$target/
  cdd; gwr $target/ ; gst; lat  SI/$target/
  cd -
}
alias atom_restore='apm install --packages-file ~/dotfiles/SI/ATOM/packages.txt; cp ~/dotfiles/SI/ATOM/keymap.cson ~/.atom/'
alias atomvim_sync='cdd; gishsv; gplo; gishpp; cd - ; gdinpURDPD; apm -h; echo "### ATOMでseync sessions restoreをする ###'
function patch_back {   # $1=git commit hash, そこからの差分ファイルをコピる
  NEW_SRC=~/Downloads/PATCH/
  rm -rf $NEW_SRC
  if [ ! -d $NEW_SRC ]; then
    mkdir $NEW_SRC
  fi
  gdicno $1 | xargs -J % cp -f % $NEW_SRC
  cp ~/sessionATOMMAN $NEW_SRC
  cd $NEW_SRC; rm SI.tar.zip ../日報.tgz
  lat; tar zcvf ../日報.tgz ./* ; lat ..;
  cd -
}

# XXX: .
# cp ~/sessionATOMMAN
# ~/.atom/packages/visual-rails-generator/lib/visual-rails-generator.coffee +22
  # # default: 'bundle exec',
  # default: 'docker exec -it PPetd_bqq',
# ~/.atom/packages/visual-rails-generator/lib/scaffold_model_view.coffeea +170
    # command  += before_string
  # command += " bin/rails g "

# docker snapshot taking
# $ docker checkpoint create dsc_app 20181228
# Error response from daemon: checkpoint not support on containers with tty

function openatomfromvimsession {
  local outfile=openatomfromvimsession.sh
  $grepbin -$regexopt  "bufexists.* | buffer " $1 |xargs -n1 echo "atom -a $_" |sort |uniq > $outfile
  vim $outfile; sh $outfile; rm  $outfile; lat;
}
#保存時に空白削除
# Under your Atom Preferences go to Packages tab and search for whitespace. Click on the whitespace package and uncheck Ensure Single Trailing Newline option


#Google 2-Step Verification tool 'oathtool'
alias 2stepveri='oathtool --totp -b ' #このあとにwebsiteごとのキー生成画面で表示されるbase32の文字をスペースなしで引数として入力 %s/ //  #<  sudo apt-get install oathtool

#1-liner
# alias rorapp rails new example --skip-bundle && cd example && bundle install --path=vendor/bundle**
# CSVimport      ActiveImportclass.import! (CSV.read('vendor/some.csv') )
# #RoR " JSONloading:    File.open("#{Rails.root}/spec/fixtures/pmsapi_mock.json"){ |file| json = JSON.load(file) }


# ==== リハビリコマンド ==========================
alias rehabilli='cat ~/dotfiles/SI/REHABILI/* |less'

# ==== PJ-dependent unixコマンド ==========================
source ~/dotfiles/SI/pj-dependent.bashrc


alias REM=' : <<"REM"' #REMで終端すること
alias ksen-a='echo "/////////////////////////////////////////////////////////////////////////////////"'
alias ksen-b='echo "================================================================================="'
alias ksen-c='echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"'
alias ksen-d='echo "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"'
alias ksen-e='echo "#################################################################################"'
alias ksen-f='echo "★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"'
alias ksen-g='echo "﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏"'
alias ksen-h='echo "〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜"'
alias ksen-i='echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"'
# alias ksen-e='echo "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"'
# alias ksen-e='echo "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"'
# alias ksen-e='echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"'
# alias ksen-e='echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"'
alias ksen='  ksen-a; ksen-b; ksen-c; ksen-d; ksen-e; ksen-f; ksen-g; ksen-h; ksen-i'

function ksendebug {  #debugmessage関数 引数にrb, js
  extention=${1:-'rb'}
  if [[ $extention == 'rb' ]]; then
    command='Rails.logger.info'
  elif [[ $extention == 'js' ]]; then
    command='console.log'
  elif [[ $extention == 'sh' ]]; then
    command='echo'
  fi
  msg=$(cat <<-MSG1
  \n
  ${command}("=======cp1======@=========#{}");\n
  ${command}("=======cp2======@=========#{}");\n
  ${command}("=======cp3======@=========#{}");\n
  ${command}("=======cp4======@=========#{}");\n
  ${command}("=======cp5======@=========#{}");\n
  ${command}("=======cp5======@=========#{}");\n
  ${command}("=======cp6======@=========#{}");\n
  ${command}("=======cp7======@=========#{}");\n
  ${command}("=======cp8======@=========#{}");\n
  ${command}("=======cp9======@=========#{}");\n
MSG1)
  if [[ $extention == 'sh' ]]; then
    # ${extention/./_}  # 最初にマッチした対象を置換
    # ${extention//./_} # すべてにマッチした対象を置換する
    # ${extention#*/}   # 最初にマッチした対象（*/）を削除
    # ${extention##*/}  # すべてにマッチした対象（*/）を削除
    tmp1=${msg//\(/ }
    tmp2=${tmp1//\)/ }
    echo -e $tmp2
  else
    echo -e $msg
  fi
};


# 設定と解説は　~/dotfiles/tmux.conf で
# 基本はctrl+q - |-spacex マウスを使ってのペイン調整

# ~/.bash_profile
# # 初回シェル時のみ tmux実行
# if [ $SHLVL = 1 ]; then
#   tmux
# fi
alias tmls='  tmux ls'
alias tma='   tmux a'
alias tmat='  tmux a -t'
alias tmks='  tmux kill-session'
alias tmumxman=' man tmux'


function dksh { # $1 == container_name/id
  # 現在のペインIDを退避
  local pane_id=$(tmux display -p '#{pane_id}')
  # 接続先ホスト名に応じて背景色を切り替え
  if [[   `echo $1 | grep 'ap_'` ]] ; then
    tmux select-pane -P 'bg=colour150,fg=black'
  elif [[ `echo $1 | grep 'db_'` ]] ; then
    tmux select-pane -P 'bg=colour250,fg=black'
  fi
  dkpaivl; docker exec -it -u root $1 sh
  # デフォルトの背景色に戻す
  tmux select-pane -t $pane_id -P 'default'
}

function ssh() {
  # tmux起動時
  if [[ -n $(printenv TMUX) ]] ; then
    # 現在のペインIDを退避
    local pane_id=$(tmux display -p '#{pane_id}')
    # 接続先ホスト名に応じて背景色を切り替え
    if [[   `echo $1 | grep '\.202'` ]] ; then
      tmux select-pane -P 'bg=colour52,fg=white'
    elif [[ `echo $1 | grep '\.237'` ]] ; then
      tmux select-pane -P 'bg=colour58,fg=white'
    elif [[ `echo $1 | grep '\.dev\.'` ]] ; then
      tmux select-pane -P 'bg=colour95,fg=white'
    fi
    # 通常通りssh続行
    command ssh $@
    # デフォルトの背景色に戻す
    tmux select-pane -t $pane_id -P 'default'
  else
    command ssh $@
  fi
}
