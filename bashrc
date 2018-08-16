# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
export LANG='ja_JP.UTF-8'
# コマンド実行日時を記録するフォーマット
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S '
#source ~/.git-prompt.sh
#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
# git config --global color.ui true


# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

## rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

## /Users/k-takami/.rvm/bin/rvm
source ~/.rvm/scripts/rvm ; type rvm | head -n 1
export PATH="$HOME/.rvm/bin:$HOME/.rvm/scripts/rvm:$PATH"
echo $GEM_HOME; echo $GEM_PATH # https://github.com/rvm/rvm/issues/2817
alias rvminfo="     rvm list; rvm gemset list; gem query -an rails;" # gem list; "
alias rvmusecreate='rvm use --create'
alias rvmusesys='   rvm use system   ; ruby -v; rails -v'
alias rvmusemine='  rvm use 2.4@5.0.1; ruby -v; '
alias rvminstallrails='gem install rails' # -v=5.0.0.1 --no-ri --no-rdoc　など・・・

#export PATH="$PATH:$DL_HOME/redis-3.0.7/src"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


export DL_HOME=~/
#export DL_HOME=~/Download
#export GIT_USERNAME=k_takami
#export GIT_USERNAME=kenichi.takami
export GIT_USERNAME=takami-appirits

  export ANT_HOME=$DL_HOME/apache-ant-1.9.6
  export M3_HOME=$DL_HOME/apache-maven-3.3.9
    export M3=$M3_HOME/bin
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.6"`
#export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"
##export PATH="$PATH:$JAVA_HOME:$ANT_HOME/bin

#/usr/local/mysql/bin

#when updgraded ruby
#export GEM_PATH=$GEM_PATH:/Library/Ruby/Gems/2.0.0/

#DOCKER
#eval $(docker-machine env)

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -p'
#alias cp='cp -pi'
#alias mv='mv -i'

# node and npm
alias npmpkglist=' npm    ls --depth=0'
alias npmpkglistg='npm -g ls --depth=0'
alias npmappclean='npm cache clean; rm -rf node_modules; rm -rf bower_components; '
alias angularinstallg='npm install; bower install; typings install'
alias angularinstall=' npm install; node_modules/bower/bin/bower install; node_modules/typings/dist/bin.js install; npm rebuild node-sass'
alias webpacklocal='sudo node_modules/webpack/bin/webpack.js'

#OS-dependent
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
    alias pkgadd='brew install'                           # パッケージのインストール
    # alias pkgrm=''                            # パッケージの削除
    # alias pkgsearch=''                        # パッケージの検索
    # alias pkglist=''                          # インストール済みパッケージの情報表示
    # alias pkgcontents=''                      # パッケージ内容の表示
    # export GEM_PATH=$GEM_PATH:/Library/Ruby/Gems/2.2.4/
elif [ "$OS" =~ "^MINGW" ]; then
  platform='windows'
fi
if [ $platform == 'osx' ] || [ $platform == 'linuxRHEL' ] ; then
  alias killosx_zombieprocess='killall -m fsevent_watch; killall -m spring ; myps'
fi

#unixコマンド
alias ll=' ls -al'
alias lat='ls -halt'
alias las='ls -alSr' 
alias rm='rm -r'
alias kill9='        kill -9 '
alias killallrails5='pkill -a thin; ' 
alias myps='ps -ef  |grep -niE "\b(memcached|unicorn|ant|redis|sidekiq|rails|ruby|thin|fsevent|spring)\b" | sort -k6'

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
# alias ksen-e='echo "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"'
# alias ksen-e='echo "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"'
# alias ksen-e='echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"'
# alias ksen-e='echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"'

alias ksen='  ksen-a; ksen-b; ksen-c; ksen-d; ksen-e; ksen-f; ksen-s'
alias incexc=' echo "--include=**  --exclude=*.sw* --exclude=*~ --exclude=log/* --exclude=*spec* --exclude=*spec* --exclude=tmp/* --exclude=*vendor/bundle* --exclude=node_module*/* --exclude-dir=vendor "'
alias nrnd=' --no-ri --no-rdoc '
alias inrb=' --include=*.*rb'
alias exvd=' --exclude-dir=vendor/'

alias REM=' : <<"REM"' #REMで終端すること
alias regrep='     grep  -nirE'
alias regrep-r='   grep  -niE'
alias regrepc1='   grep  -C1 -nirE'
alias regrepc1-r=' grep  -C1 -niE'
alias regrepc3='   grep  -C3 -nirE'
alias regrepc3-r=' grep  -C3 -niE'
alias regrepl='    grep  -lnirE'
alias regrepl-r='  grep  -lniE'

alias grepvcode='   find . |grep -viE "\.(svc|git|hg)" | grep'
alias grepvr='   grep -viE "(\..?sv|\.yml|\..?css|\.js.+|\.erb|\.NEW|\.OLD|\.BAK|\/db\/migrate|development.rb|schema.rb)" | grep'
alias grepvrsort='sort | grepvrbc . '
alias greper-pure=' grep -nirE "錦糸町" ./* | grep -v "錦糸町支店" |grep -v ".svn"'
alias filelist='    find ./* | sort | less '
alias ff='filelist'
alias ffgrep='      find . | grep -iE '

#SYNC WITH after fugitive.vim grep.vim
alias gst='      git status' #Gstatus
alias gwr='      git add' #Gwrite
alias gdi='      git diff' #gdif
alias gbl='      git blame' #Gblame
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
alias gdicnp='   git diff --cached --no-prefix'
alias gdinp='    git diff          --no-prefix'
alias gdino='    gdi --name-only'
alias diffbbq='   diff -rwBbq '
#  diff - -x ".hg" ginger ginger_mae/ |sort
alias hgbl='      hg blame -lund'
# cf: https://www.wikivs.com/wiki/Git_vs_Mercurial:w
alias gplo='      git pull origin'
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
alias gilos='     git log -S'
alias gilohd='    git log |head -n 50'
alias gilono='      git log --name-only'
#alias gilogrep
alias gilotheir=' git log --all --stat --branches=* --remotes=* ' #followed by filename[s]
alias gilostheir='git log --all --stat --branches=* --remotes=* -S'
alias mygilo='    git log --committer=$GIT_USERNAME'
alias gilosmine=' git log --committer=$GIT_USERNAME -S'
  #    コミットの中で"hogehoge"という文字列を含む行が変更されたものだけ表示 ：例  $ tig -S"hogehoge" filename
alias gplomrbs='  git pull origin master --rebase'
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
# alias rbc18='       rubocop -c ~/.dotfiles/RAILS_ROOT/.rubocop.yml.tokyo_realistic_v1.8'
# alias rbca18='      rubocop -c ~/.dotfiles/RAILS_ROOT/.rubocop.yml.tokyo_realistic_v1.8 -a'
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


alias mysqldbimport='mysql -u root -h localhost < '
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

function tarzip_rorapp {
  tar zcvf $1-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" --exclude=vendor/* $1;lat;
}

function killmyps {
  # myps検索pid以外をgrepしてkill 
  kill -9 `myps | grep -v grep | ruby -ane 'p $F[1].to_i'`
}
function includerb {
  echo "--include=*rb --include=*.yml --include=*.yml --include=*.*css --exclude-dir=vendor";
}
function nogabage {
  echo "--exclude=*.sw* --exclude=*.log --exclude=*.dev --exclude=*.*201* --exclude=*.*rev* --exclude=*.*-* --exclude=*.lock --exclude=*.org --exclude=*DEV --exclude=*BAK  --exclude=*.bak ";
}
function appfilesonly {
  echo "  --exclude-dir=vendor  --exclude-dir=lib --exclude=*.log ";
}
function greprc {
  local options=${@:2} ;
  grep -niE  $1 ~/.dotfiles/* --include=*rc        $options;
  grep -niE  $1 ~/.dotfiles/SI/pj-dependent.bashrc $options;
}

#  #grep結果ファイル中文字列をかきかえ
# $ regrepl attr_accessible app nogabage appfilesonly |xargs -n1 ruby  -pi.bak -e  '$_.gsub!(/attr_accessible/, "attr_accessor")'

# ruby -rrexml/document -ryaml -e ' puts YAML.dump(REXML::Document.new(open("some/full/path.xml"  )))'

#  #URL Query-stringsクエリー文字列 抽象化：Percona pt-query-digest fingerprint/distill互換
#    ls some*_log.201* |xargs  ruby -p -e  '$_.gsub!(/=[%\s\w]+( |&)/, "=?\\1")'  -i

function greprcrbonly {
  greprc  $@ `includerb` `nogabage`  ;
}

function grepdf {
  # ex) greprc serchword -C1 `includerb` `nogabage`
  local options=${@:2} ;
  grep -niE  $1 ~/.dotfiles/* --include=*rc $options;
  grep -nirE $1 ~/.dotfiles/SI              $options;
  grep -nirE $1 ~/.dotfiles/SCRIPTS         $options;
  grep -nirE $1 ~/.dotfiles/CHEATSHEETS     $options;
  grep -nirE $1 ~/.dotfiles/vim/snippets    $options;
  # echo "grep -nirE $1 ~/.dotfiles/vim/snippets  $options ### ";
}

function greprails {
local gempath=`which gem | xargs ruby -e "puts ARGV[0].gsub(/(rubies|bin.gem)/, 'gems') "` ;
  grep -nirE "def \w*$1" $gempath ;
}

function chomR {
  sudo chown -R $1 $3 ;  sudo chmod -R $2 $3
}
function nocomments {
  # grep結果から-vでコメントや空行を除外 
  grep -vE '\\s*\\#+.*(byebug|debugger)' | grep -v '^$'
}

function grepsnippets {
  grep -nirE $1 ~/.dotfiles/vim/snippets $2;
}
function grepremotegems {
 echo 'gem list ***GEMNAME*** --remote --all';
}
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




alias vimclean='rm ~/*.sw* ; cd ~/.dotfiles ; git status ; cd - ;'
alias ror_snip_list='sh ~/.dotfiles/SCRIPTS/list_snipets4snipmate.sh ruby rails erb javascript'
alias ror_lns_gitignore='ln -s ~/.dotfiles/gitignore .gitignore'

#Google 2-Step Verification tool 'oathtool'
alias 2stepveri='oathtool --totp -b ' #このあとにwebsiteごとのキー生成画面で表示されるbase32の文字をスペースなしで引数として入力 %s/ //  #<  sudo apt-get install oathtool

# CONFIDENTIAL PJ-dependent unixコマンド #############################
# bashrc をデフォルトから汚したくない！と思う人は（まれでしょうが）
source ~/.dotfiles/SI/pj-dependent.bashrc
cd ~/.dotfiles
