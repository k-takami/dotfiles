# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
# NOTE: atom-ide-ui terminal でときどきset $LANG=ja_JP.UTF-8設定が消えてしまうので手入力する状況がある
export LANG='ja_JP.UTF-8'
# コマンド実行日時を記録するフォーマット
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S '
#source ~/.git-prompt.sh
#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
# git config --global color.ui true

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=


#==== DOCKER & Pow ==========================
#eval $(docker-machine env)
export POW_TIMEOUT=300
# export POW_WORKERS=3
# powder (config/status|restart)

alias dkpadi='  docker ps -a ; docker images;  docker volume ls';
#  # リサイズや清掃；
#    docker build --squash
#      サイズを小さくするには、レイヤーをまとめて一階層にした新しいイメージを作る。
alias dkprunesys='docker system prune'
alias dkpruneimg='docker images prune'
alias dkrm='    docker rm';
alias dkrmi='   docker rmi';
alias dkrmv='   docker volume rm';
alias dkcm='    docker commit';
alias dktg='    docker tag';
alias dkhs='    docker history';
alias dksch='   docker search  --no-trunc';
alias dkisp='   docker inspect';
alias dkcp='    docker cp';
alias dkpl='    docker login;                     docker pull';
alias dkrunit=' docker run -itd'; # -d = detached
alias dkps='    docker push'
#TODO  docker save 771594bd57aa > ../kikan1031.tar みたいに$1$2必要
alias dksv='    docker save ' # image_name > ../*.tar name
alias dkld='    docker load < ' # *.tar name
alias dkh='     docker --help '
alias dkv='     docker --version '
# XXX: docker-compose指揮下のrailsサービスDB設定 引数にapp やwebなどymlのサービス名を指定すること

function dkc_rdbseed {
  docker-compose run -u root app bundle install ;
  docker-compose run -u root app bin/rake db:migrate db:seed
  docker-compose run -u root app annotate --force ;
  echo "### NOTE "
  echo "###      bundle install失敗するときは docker exec -it -u root CONTAINERNAME bash でログインして すること"
  echo "###    : DBMSからログアウトし、ワークコンテナでerrorになるgemをGemfile*からコメントアウトしてから流すこと";
  echo "###    : migratonファイルでundefエラーになるのはシンボルで表記されていないから" ;
}
function dkc_rdbmreset {
  docker-compose run -u root app bundle install ;
  docker-compose run -u root app bin/rake db:migrate:reset db:seed;
  docker-compose run -u root app annotate --force ;
  echo "### NOTE "
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
#  docker run container_name rake db:migrate
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




#==== ~/.rvm/bin/rvm ==========================
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
## rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#export PATH="$PATH:$DL_HOME/redis-3.0.7/src"


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
#export GIT_USERNAME=k_takami
#export GIT_USERNAME=kenichi.takami


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
OS="`uname`"
platform='unknown'
if [ $OS == 'Linux' ]; then
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
    # alias pkgcontents=''                           # パッケージ内容の表示
  fi
elif [ "$OS" == 'Darwin' ]; then
    platform='osx'
    alias pkgadd='brew install'                        # パッケージのインストール
    alias pkgrm='sudo uninstall file:///Applications/' # パッケージの削除
    # alias pkgsearch=''                               # パッケージの検索
    # alias pkglist=''                                 # インストール済みパッケージの情報表示
    # alias pkgcontents=''                             # パッケージ内容の表示
    # export GEM_PATH=$GEM_PATH:/Library/Ruby/Gems/2.2.4/
elif [ "$OS" =~ "^MINGW" ]; then
  platform='windows'
fi
if [ $platform == 'osx' ] || [ $platform == 'linuxRHEL' ] ; then
  alias killosx_zombieprocess='killall -m fsevent_watch; killall -m spring ; myps'
fi


#==== unixコマンド ==========================
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
alias kill9='        kill -9 '
alias killallrails5='pkill -a thin; '
alias myps='ps -ef  |grep -niE "\b(memcached|unicorn|ant|redis|sidekiq|rails|ruby|thin|fsevent|spring)\b" | sort -k6'
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
# 特定ファイルだけ展開： $ sudo tar zxvf 対象tarball.tgz full/path/to/the/specified/file/in/the/tarball
alias findp0x0mv0='find -print0 | xargs -0 mv -t ./ ' #一括移動 -print0と -0は呼応。NULL区切り
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

alias ksen-f='echo "^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^"'
alias ksen-b='echo "================================================================================="'
alias ksen-a='echo "/////////////////////////////////////////////////////////////////////////////////"'
alias ksen-s='echo "★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"'
alias ksen-c='echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"'
alias ksen-d='echo "#################################################################################"'
alias ksen-e='echo "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■"'
alias ksen='  ksen-a; ksen-b; ksen-c; ksen-d; ksen-e; ksen-f; ksen-s'
# alias ksen-e='echo "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"'
# alias ksen-e='echo "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"'
# alias ksen-e='echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"'
# alias ksen-e='echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"'
alias REM=' : <<"REM"' #REMで終端すること

#  #grep結果ファイル中文字列をかきかえ
# $ regrepl attr_accessible app nogabage appfilesonly |xargs -n1 ruby  -pi.bak -e  '$_.gsub!(/attr_accessible/, "attr_accessor")'

# ruby -rrexml/document -ryaml -e ' puts YAML.dump(REXML::Document.new(open("some/full/path.xml"  )))'

#  #URL Query-stringsクエリー文字列 抽象化：Percona pt-query-digest fingerprint/distill互換
#    ls some*_log.201* |xargs  ruby -p -e  '$_.gsub!(/=[%\s\w]+( |&)/, "=?\\1")'  -i

alias cdd=' cd ~/dotfiles'
alias nrnd=' --no-ri --no-rdoc '
alias no_spec=' echo "--exclude=*spec* "'
function includerb { echo "--include=*rb --include=*.yml --include=*.yml --include=*.*css --exclude-dir=vendor --exclude-dir=tmp/* --exclude-dir=node_module "; }
function nogabage { echo "--exclude=*.sw* --exclude=*.log --exclude=*.dev --exclude=*.*201* --exclude=*.*rev* --exclude=*.*-* --exclude=*.lock --exclude=*.org --exclude=*DEV --exclude=*BAK  --exclude=*.bak "; }
function appfilesonly { echo " --exclude-dir=vendor  --exclude-dir=lib --exclude=*.log "; }
# TODO: OSX/BSDならば文字中の空白を.変換、このロジックをregrepとgreperに応用して統合整理 -c3 -cr系も整理
function greprc {
  local options=${@:2} ;
  grep -niE --include=*rc $1 ~/dotfiles/*                      $options;
  grep -niE               $1 ~/dotfiles/SI/pj-dependent.bashrc $options;
}

function greprcrbonly { greprc `includerb` `nogabage` $@ ; }

function grepdf {
  # ex) greprc serchword -C1 `includerb` `nogabage`
  local options=${@:2} ;
  grep -niE  $1 ~/dotfiles/* --include=*rc $options;
  grep -nirE $1 ~/dotfiles/SI              $options;
  grep -nirE $1 ~/dotfiles/SCRIPTS         $options;
  grep -nirE $1 ~/dotfiles/CHEATSHEETS     $options;
  grep -nirE $1 ~/dotfiles/vim/snippets    $options;
  # echo "grep -nirE $1 ~/dotfiles/vim/snippets  $options ### ";
}

function greprails {
local gempath=`which gem | xargs ruby -e "puts ARGV[0].gsub(/(rubies|bin.gem)/, 'gems') "` ;
  grep -nirE "def \w*$1" $gempath ;
}

# $1検索語　$2場所 regrep の$2がなければ、./*で補完
# alias greper-pure=' grep -nirE "錦糸町" ./* | grep -v "錦糸町支店" |grep -v ".svn"'
function grepe    {                             grep     -niE   $@          ; }
function greper   {                             grep     -nirE  $@          ; }
function greperrb {                             grep     -nirE  `includerb` `nogabage` $@ ; }
function regrep   {     local options=${2:-*} ; grep     -nirE  $1 $options ; }
function regreprb {     local options=${2:-*} ; grep     -nirE  `includerb` `nogabage` $1 $options ; }
function regrep_nosub { local options=${2:-*} ; grep     -niE   $1 $options ; }
function regrepl  {     local options=${2:-*} ; grep     -lnirE $1 $options ; }
function regrepl-r {    local options=${2:-*} ; grep     -lniE  $1 $options ; }
function regrepc1 {     local options=${2:-*} ; grep -C1 -niE   $1 $options ; }
function regrepc3 {     local options=${2:-*} ; grep -C3 -niE   $1 $options ; }
function regrepc1-r {   local options=${2:-*} ; grep -C1 -nirE  $1 $options ; }
function regrepc3-r {   local options=${2:-*} ; grep -C3 -nirE  $1 $options ; }
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


#GREP everything
alias grep-hist='    history |grep -niE'
alias grep-ps='      ps -ef  |grep -niE'
alias grep-env='     env | grep'
alias grep-gst='     git status |grep -niE'
alias grep-gem='     gem list | grep'
alias grep-pkglist=' pkglist | grep -iE '

#git/ mercurial / patchコマンド http://uguisu.skr.jp/Windows/diff_patch.html http://d.hatena.ne.jp/mrgoofy33/20101019/1287500809
alias patchp=' patch    -p0 <' #[patch-name] to apply on
alias patchrp='patch -R -p0 <' #[patch-name] to reverse(=undo)
alias patch_cleaning='ffgrep "\.(rej|orig)" | xargs -n1 rm'
alias gibr='      git branch'
alias gibr-d='    git branch -D' #削除
alias gibr-m='    git branch -m' #旧ブランチ名　新ブランチ名
alias gicm='      git commit'
alias gicmm='     git commit -m' #modify
alias gico='      git checkout'
alias gico-='     git checkout -'
alias gico-b='    git checkout -b'
alias hgdi='      hg diff -c'
alias gdic='     git diff --cached'
alias gdiclas='  gdic --name-only |xargs ls -alSr'
alias gdilas='   gdi  --name-only |xargs ls -alSr'
alias gdicgrep=' gdic --name-only |xargs grep -niE '
# patch作成用  gitの場合は--no-prefixは内部的に自動付与らしい
alias gdicnp='     git diff --cached --no-prefix'
alias gdilight='        git diff --no-prefix --ignore-all-space --ignore-blank-lines --ignore-cr-at-eol'
alias gdicnpURDPD='     git diff --cached --no-prefix > ~/Downloads/gdicnpURDPD.diff'
alias gdicnpURDPDlight='git diff --cached --no-prefix --ignore-all-space --ignore-blank-lines --ignore-cr-at-eol > ~/Downloads/gdicnpURDPD.diff'

alias gdinp='    git diff          --no-prefix'
alias gdino='    gdi --name-only'
alias diffbbq='   diff -rwBbq '
#  diff - -x ".hg" ginger ginger_mae/ |sort
alias hgbl='      hg blame -lund'
# cf: https://www.wikivs.com/wiki/Git_vs_Mercurial:w
alias gplo='      git pull origin'
alias gclone='    git clone'
alias gcloneb='   git clone -b ' # ブランチ名 https://リポジトリのアドレス
alias gpso='      git push origin'
alias gpsdelo=' git push --delete origin' #[branch-name] to delete
alias gisw='      git show'
alias gish='      git stash'
alias gishcl='    git stash clear'
alias gishls='    git stash list'
alias gishsw='    git stash show'
alias gishsv='    git stash save'
alias gishpp='    git stash pop'
#git関連検索
alias gilo='      git log '
alias gilos='     git log -S'
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
alias gplomrbs='  git pull --rebase origin master'  # 本来はマージ履歴をのこさない --ff をつけるべきかも？
alias girbmst='   git rebase master --no-ff'  # 最新化した master ブランチに対して自分のブランチをリベース
alias girbcntne=' git rebase --continue'
alias girbabt='   git rebase --abort'
alias girbihd='   git rebase -i' # to be follwed by HEAD~~ or HEAD~~~~~~回数分
alias fixup='gicmm "tmp" ; gishsv;  girbihd HEAD~~ ; gilono ; gishpp; '

alias hgst='      hg status'
alias hgstfile='  hg status --rev '
#hg status --rev -3: |grepe "(apple|yml|setting|const|system)"
#git変更コマンド
alias gicma='     git commit --amend'
#git 矛盾解消コマンド
alias gicothr='      git checkout --theirs'
alias gicoour='      git checkout --ours'
alias girstmg='      git reset --merge'
alias girsthdHD-n='  git reset --hard HEAD~' #nを追記 :自分のコミットをN回とりけした状態にロールバック
alias girstsftHD@n='git reset --soft HEAD@' #commitとりけし {1}など
alias girmc='        git rm --cached'        #stagingとりけし
alias gicostsh0='    git checkout stash@{0}'
alias girstHD='      git reset HEAD -- '
alias gicostsh0lots='git checkout stash@{0} Gemfile Gemfile.lock config/environments/development.rb config/database.yml .gitignore ; git reset HEAD -- Gemfile Gemfile.lock config/environments/development.rb config/database.yml .gitignore;'

#railsコマンド
alias rail4scaf=' rails generate scaffold ' # branches　など複数形
alias bdl='            bundle install'
# オフライン環境では --local オプションを付けることでrubygems.org等を見に行かずに、vendor/cacheフォルダを見るようになります。
alias bdllocal='       bundle install --local'
alias bdllikerails12=' bundle install --path vendor/bundle'
# ローカルから普通にもどすときは
# $ rm -rf vendor/bundle/ Gemfile.lock .bundle/config ; bdl; rails s;
alias ds1='DISABLE_SPRING=1 '
alias bx='             ds1 bundle exec '
alias bxs='            ds1 bx rspec'
alias bxrdbm='         ds1 bx rake db:migrate'
alias bxrdbs='         ds1 bx rake db:seed'
alias gplombxrdbmrdbs='git pull; bxrdbm; bxrdbs'
alias bxrdbmtest='     ds1 bx rake db:migrate RAILS_ENV=test'
alias bxrdbmdown='     ds1 bx rake db:migrate:down'
alias gplobxbi='       gplo master; bxrdbm; bundle install'
alias rrg='         ds1 bx rake routes |grep '

# gemバージョン　正規表現検索
alias gemquery="     gem query -ban "
alias gemqueryremote="     gem query -ran "
#rubocop
alias rbc='         ds1 rubocop'
alias rbca='        ds1 rubocop -a'
# alias rbc18='       rubocop -c ~/dotfiles/RAILS_ROOT/.rubocop.yml.tokyo_realistic_v1.8'
# alias rbca18='      rubocop -c ~/dotfiles/RAILS_ROOT/.rubocop.yml.tokyo_realistic_v1.8 -a'
alias rbp='         rails_best_practices'
export REGEXP_RBC_IGNORE="(app\/views|wrapper|\.js|\.coffee|\..?css|\.yml|schema.rb|structure.sql|Gemfile|.gitignore)"
alias rbwcstaged='  gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs -n1 ruby -wc'
alias rbwcdev='     gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs -n1 ruby -wc'
alias rbcrails='    gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs rubocop '
alias rbcrailsauto='gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs rubocop -a '
alias rbprails='    gdic --name-only |grep -v -E $REGEXP_RBC_IGNORE | xargs rails_best_practices'
alias mytestsingle='ds1 bx rake spec:test RAILS_ENV=mobi-connect-test'
export REGEXP_MYBUG="^\+.*(\?i|i\b|binding.pry|byebug|debugger|takami)"
alias mybugstaged=' gdicnp |grepe $REGEXP_MYBUG -C2 '
alias mybug='       git show |grepe $REGEXP_MYBUG -C1 ; gdicnp |grepe $REGEXP_MYBUG -C1 ; gdi |grepe $REGEXP_MYBUG --exclude=development.rb --exclude=*Gemfile* -C1'
alias raspell=' ruby ~/.SCRIPTS/raspell.rb'
alias mybugallstaged='rbcrails; mybugstaged; raspell; rbwcstaged; rbprails;'
alias mybugall='      rbcrails; mybug      ; raspell; rbwcstaged; rbprails;'
alias mybug_migration_yyyymmdd='find db/migrate/*create_*  |xargs -n1 git blame |grep' # add /yyyy-mm-dd?/ date to find DANGEROUS MIGRATION FILE
#alias mybugall_and_migrationyyyymmdd='mybugall; mybug_migration_yyyymmdd'

#tig
alias mytig='   tig     --committer=k_takami'
alias mytigbug='tig     --committer=k_takami --grep=正 --grep=bug.fix '
alias tigbug='  tig                          --grep=正 --grep=bug.fix '

#OSS DBMS
alias dbimportmysql='mysql -u root -h localhost < '
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

function tarziprorapp {
  local chomped1=${1%\/} ;  # 行末スラッシュ削除
  tar zcvf $chomped1-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" --exclude=vendor/* --exclude=node_modules $chomped1;lat;
  #XXX --exclude node_modules
}

function tarziprorgitonly {
  local chomped1=${1%\/} ;  # 行末スラッシュ削除
  cd $chomped1
  tar zcvf ../$chomped1-git-`date '+%Y%m%d'`.tar.gz .git ; lat ..
  cd -
}

function tarzipdotfiles {
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
function chomR {
  sudo chown -R $1 $3 ;  sudo chmod -R $2 $3
}
function nocomments {
  # grep結果から-vでコメントや空行を除外
  grep -vE '\\s*\\#+.*(byebug|debugger)' | grep -v '^$'
}

function grepsnippets {
  grep -nirE $1 ~/dotfiles/vim/snippets $2;
}
function grepremotegems {
 echo 'gem list ***GEMNAME*** --remote --all';
}

alias ff='    find ./* | sort | less '
alias ffgrep='find . | grep -iE '

function rmbak {
  ffgrep .bak |xargs -n1 rm $_ ;
  find . | grep -E "DEV$" |xargs -n1 rm $_ ;
  find . | grep -E "`TODAY`$" |xargs -n1 rm $_ ;
}


#source ~/.git-prompt.sh
#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

#ステップ数概算
# grep -nirE "def \w" .  --include=**  --exclude=*.sw* --exclude=*~ --exclude=*.log > ../../GrepDef.txt
# find . -name "*.rb" -o -name "*.yml" | xargs wc -l
# rake stats

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
# TODO: .
# ~/.atom/packages/visual-rails-generator/lib/visual-rails-generator.coffee +22
  # # default: 'bundle exec',
  # default: 'docker exec -it PPetd_bqq',
# ~/.atom/packages/visual-rails-generator/lib/scaffold_model_view.coffeea +170
    # command  += before_string
  # command += " bin/rails g "

function openatomfromvimsession {
  local outfile=openatomfromvimsession.sh
  grep -E "bufexists.* | buffer " $1 |xargs -n1 echo "atom -a $_" |sort |uniq > $outfile
  vim $outfile; sh $outfile; rm  $outfile; lat;
}
#保存時に空白削除
# Under your Atom Preferences go to Packages tab and search for whitespace. Click on the whitespace package and uncheck Ensure Single Trailing Newline option


#Google 2-Step Verification tool 'oathtool'
alias 2stepveri='oathtool --totp -b ' #このあとにwebsiteごとのキー生成画面で表示されるbase32の文字をスペースなしで引数として入力 %s/ //  #<  sudo apt-get install oathtool

# ==== リハビリコマンド ==========================
alias rehabilli='cat ~/dotfiles/SI/REHABILI/* |less'

# ==== PJ-dependent unixコマンド ==========================
source ~/dotfiles/SI/pj-dependent.bashrc
