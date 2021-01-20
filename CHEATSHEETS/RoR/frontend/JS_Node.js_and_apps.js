######################################################################################
A
### 構造：MODULE CONFIG HIERARCHY #####
httpd: node.js
  conf: package.json
    "start": "webpack-dev-server",
             => conf: webpack.config.js
                  devServer: {
                      contentBase: 'dist',
                      port: 3000,
                      proxy: {

  bundler(=dependency management): bower
    assets-compression/installer: webpack
      conf: webpack.config.js
        entry:
        output:
        loader[s]:

    rspec : jasmine
      capybara: karma
        # karmaのインストール: sudo npm install --save-dev karma;  sudo npm install -g karma-cli
                               sudo npm install --save-dev -g @types/jasmine
        # karma serverの起動        : karma start
        # karmaの case実行
           $  npm install typescript ts-node --save-dev

        #karmaの個別ファイル実行(全量＋個別)：
           $ karma start --reporters kjhtml
           #visit http://localhost:9876/debug.html
           # 各ケースをｸﾘｯｸ

        #karmaの個別ファイル実行(指定ファイル以外はskippedになる)：
           $ karma start &;
           $ karma run -- --grep=ｱﾉﾃｰｼｮﾝやｸﾗｽ名などの検索語



    transpiler:
      ts:
        conf: tsconfig.json
        fixtures: typings
                    repository 'ds':'Defitately Typed'
  rake: gulp
    gulp.task('プラグイン名',function(){}).pipe(処理DSL) ...



##################### node.js & npm ##########################################
  #instalation
    #UNIX GENERIC
      $ wget https://nodejs.org/download/release/v6.11.3/node-v6.11.3-sunos-x86.tar.gz
      $ tar -xzvf node-v0.12.8-linux-x64.tar.gz
      $ mv node-v0.12.8-linux-x64 /usr/local/
      $ ln -s /usr/local/node-v0.12.8-linux-x64/bin/node /usr/bin/node
      $ node --version
      $ curl -0 -L https://registry.npmjs.org/npm/-/npm-3.10.10.tgz
      $ tar zxvf npm-3.10.10.tgz &&  cd package && ./configure && make && make install
      $ sudo ln -sf /usr/local/node-v6.11.3-linux-x86/bin/npm /usr/bin/npm
      $ npm  --version
      $ sudo ln -sf /usr/local/node-v6.11.3-linux-x86/bin/webpack /usr/bin/webpack

    ### Windows
      # https://nodejs.org/ja/download/releases/
      curl -X GET "https://nodejs.org/download/release/v6.11.3/node-v*.**.*-x64.msi"

    ### RHEL
      $ curl -sL https://rpm.nodesource.com/setup_6.x | bash -  #<---otherwise ERROR "Cannot read property 'latest' of undefined"
      $ yum install -y gcc-c++ make nodejs epel-release           #<---epel-releaseでnpm packagesのいろんなバージョンがenablerepoで見えるようになる

  #uninstalation
    #####################Micrsoft Windows ##########################################
    set $node_bin = "" ; #REM "C:\Program Files (not via installer)\node-v7.3.0-win-x64"
    rmdir /S %HOMEDRIVE%\Program Files\nodejs
    rmdir /S %USERPROFILE%\AppData\Roaming\npm
    rmdir /S %USERPROFILE%\AppData\Roaming\npm-cache









######################################################################################

# pre-prep install
  $ sudo echo " fs.inotify.max_user_watches = 524288 " > /etc/sysctl.conf
  $ sudo sysctl -p
  #//1.3系統にnpmをバージョンアップ → ERROR: No compatible version foundエラーが出た場合の対処
  # $ npm install -g npm@1.3.0

#prep
  $ sudo npm cache clean -f
  $ su -
  $ yum remove -y nodejs npm epel-release

  #REHL
      $ yum list --showduplicates | grep npm
      $ yum install -y npm --enablerepo=epel

  #UBUNTUa(TBD)


  # root以外のﾕｰｻﾞｰにもどる

      $ sudo npm install -g npm@3.10.9 #<---latest npm installation otherwise ERROR "npm is known not to run on Node.js v0.***"
      $ sudo npm install -g angularjs-slider #ERR

      $ sudo npm install    typings@1.3.3
      $ sudo npm install -g typings@1.3.3


      $  npm install -g grunt-cli
      $ npm install -g typings
      $ sudo npm install -g typescript@1.8.10
      $ sudo npm install -g bower@1.7.9
      $ sudo npm install -g webpack@1.15.0

    $ sudo npm install -g n #// 'n' module installation
      $ sudo n stable


#app
  $ sudo npm rebuild node-sass
  $ sudo npm     install
  $ sudo mkdir ~/.config ; sudo chown -R $USER:$GROUP ~/.config
  $ sudo mkdir ~/.npm    ; sudo chown -R $USER:$GROUP ~/.npm
  $ sudo mkdir node_modules/node-sass/vendor ; sudo chown -R $USER:$GROUP node_modules/node-sass/vendor
  $ sudo mkdir node_modules/node-sass/build  ; sudo chown -R $USER:$GROUP node_modules/node-sass/build

  $      bower   install --allow-root
  $      bower   install

  $      typings install

#ここで webpackコマンドをエラーが消えるまでくりかえす
   $ sudo webpack
   $ sudo npm ls -g |less

ERROR: Module not found: Error: Cannot resolve 'file' or 'directory'
---> (1) $ sudo npm install --save resolve-url-loader --dev
---> (2) $ vim webpack.config.js
          test: /\.scss?$/,
          loaders: ['style-loader', 'css-loader', 'resolve-url-loader', 'sass-loader?sourceMap']
          // loader: ExtractTextPlugin.extract('style-loader', 'css-loader!sass-loader')

  $ sudo npm start //#firefox boots up, and shows you localhost:3000 & :3001(liteserver admin gui)
  npm installしてError: No compatible version foundエラーが出た場合の対処法
  Error: listen EADDRINUSE` って怒られるとき---> VM hyperviserのport転送待ちうけやgtuestOSのhttpd自動起動とポートがかぶるとダメ
  　　　　　　　　　　　　　　　　　　　　　　　webpackconfig.jsのsevServer::portの番号を300x番にずらせ`

    $ nodebrew install-binary 0.10.31 // Node.jsを最新の0.10系にバージョンアップ(npmはv1.4.23) → OK
#angular2
  //add 'patyts-sys' 4 config files under application project folder;
    touch package.json that defines the packages and scripts we need
    touch typings.json that identifies missing TypeScript definition files
    touch tsconfig.json to guide the TypeScript compiler
    touch systemjs.config.js that configures system.js




#-------------------------- TMP -------------
npm cache clean -f
npm install node-sass@4.5.3
npm rebuild node-sass
npm install typescript@2.5.3
npm install typings -g --save-dev
typings install
 npm i -g typings
 npm install -g  --save-dev typescript@2.5.3
 #正常ならここでtsc -v でTSコンパイラバージョン表示できる
npm install @types/node --save-dev  #★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

npm i angularjs-slider
npm install



sudo chown -R $USER:$GROUP ~/.npm
sudo chown -R $USER:$GROUP ~/.config
sudo mkdir node_modules/node-sass/build  ; sudo chown -R $USER:$GROUP node_modules/node-sass/build

typings install --save --global dt~jquery
typings install

bower install
bower install --allow-root

cp ./src/resources/svg/shoei-dummy-bookcloud.svg ./src/resources/svg/shoei-dummy-bookCloud.svg


####  `TS2307: Cannot find module` for a local file
# requireしている*.ts冒頭で　declare function require(x: string): any;　を挿入する。

####  TS2304: cannot find name ' require'
  $ npm install @types/node --save-dev  #★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  declare function require(x: string): any;


####  TS2688: Cannot find type definition file ##################################################
  typings install env~node        --save --global
  typings install dt~handlebars   --save --global
  typings install dt~highlight.js --save --global
  typings install minimatch       --save
  typings install dt~lodash       --save
  typings install dt~shelljs      --save

  $ vim tsconfig.json
    #以下を追記；
      "compilerOptions": {
        "types": ["node"],
      }


#清掃コンパイル？おまじない
mv tsconfig.json tsconfig.json__; webpack; mv tsconfig.json__ tsconfig.json; webpack;


# TS2339:  Property '***' does not exist on type '***'


# TS5023: Unknown compiler option 'types'.
   https://gitter.im/angular/protractor?at=57d08bc9f33967fc6439614c
  ===> use typescript 2.0.0,
  in typescript 2.0.0, tsconfig knows about @types installed in the node_modules folder and you can specify types in your tsconfig to match them.


# TS2503: Cannot find namespace 'angular'.
typings install --save --global dt~jquery
typings install

webpack

npm start

# Error: listen EADDRINUSE 127.0.0.1:3000 at Object.exports._errnoException (util.js:1020:11)
  ---> inetd reboot


































########################### npm  COMMANDS #############################################
公式サイト

https://npmjs.org/
ヘルプを見る
$ npm --help コマンド
node関連のバージョンを確認する
$ モジュール名 --version

package.jsonを生成する
$ npm init

パッケージをグローバルにまとめてインストールする
$ sudo npm install -g パッケージ パッケージ ...
パッケージをグローバルにバージョンを指定してインストール(しなおしやdowngrade)する
$ npm install -g パッケージ名@x.x.x; パッケージ名  -- version


パッケージをプロジェクトにインストールする
$ npm install パッケージ
$ npm i パッケージ

パッケージをグローバルからアンインストールする

$ sudo npm uninstall -g パッケージ
$ sudo npm r -g パッケージ
$ sudo npm remove -g パッケージ
$ sudo npm rm -g パッケージ
$ sudo npm un -g パッケージ
$ sudo npm unlink -g パッケージ

パッケージをプロジェクトからアンインストールする

$ npm uninstall パッケージ
$ npm remove パッケージ
$ npm un パッケージ
$ npm rm パッケージ
$ npm r パッケージ

グローバルにインストールされたパッケージを全て確認する

$ sudo npm ls -g
$ sudo npm ll -g
$ sudo npm la -g
$ sudo npm list -g

グローバルにインストールされたパッケージを個別に確認する

$ sudo npm ls -g パッケージ
$ sudo npm ll -g パッケージ
$ sudo npm la -g パッケージ
$ sudo npm list -g パッケージ

プロジェクトにインストールされたパッケージを個別に確認する

$ npm ls -g パッケージ
$ npm ll -g パッケージ
$ npm la -g パッケージ
$ npm list -g パッケージ

パッケージの情報を見る
$ npm info パッケージ名
$ npm view パッケージ名
$ npm show パッケージ名

npmのリポジトリを検索する
$ npm search キーワード
$ npm s キーワード
$ npm se キーワード













########################### ASSET MGT 'BOWER' & YEOMAN COMMANDS ###############
コマンド

同じパッケージ（バージョン違いも）をインストールすると上書き（置き換え）になる
パッケージのインストール/アンインストール

bower install パッケージ名 最新バージョンをインストール
bower install パッケージ名#バージョン 特定バージョンのインストール
bower install http://code.jquery.com/jquery-1.10.1.js Bowerに未登録のパッケージ
bower install パッケージ名1 パッケージ名2 複数を同時にインストール
bower install パッケージ名 --save インストール & bower.jsonに依存関係(dependencies)を記述
bower install パッケージ名 --save-dev 開発中にしか使わないモジュールの場合はこれ

bower uninstall パッケージ名 アンインストール
bower uninstall パッケージ名 --save アンインストール & bower.jsonのリストから削除
bower uninstall パッケージ名 --save-dev 開発中にしか使わないモジュールの場合
パッケージのアップデート、指定バージョンに置き換え

bower update インストールされたパッケージをまとめてアップデート
bower install パッケージ名#バージョン 特定バージョンを新たにインストールで上書き
bower install 名前=パッケージ名#バージョン 名前を付けて特定バージョンを新たにインストール
bower.json を参照し、一括インストール

bower install bower.jsonに記述したパッケージ(依存パッケージも再帰的に含む)をインストール
bower install --production 開発用(--save-dev オプションを付けたの)を除いてインストール
その他

bower search Bower登録された全パッケージ一覧を表示
bower search [検索キーワード] キーワードでパッケージ検索
bower list インストールされたパッケージの一覧を表示。新バージョン出てたらそれも表示
npm update -g bower bower自身のアップデート（新Ver出てたら、上の bower list で促される）
bower info パッケージ名 バージョンや情報を確認
bower -v Bower自身のバージョン確認





##################### gulp commands ###########################################
gulpを使って処理してほしいことを書きます。
gulp.task('プラグイン名',function(){});
   これで囲って中に色々書いていきます！
     gulp.src('ディレクトリ名')
     実行ファイルの場所を指定して、
     .pipe(プラグイン名())
     で動作。コンパイルなどでファイルが生成される場合は、
     .pipe(gulp.dest('ディレクトリ名'));
   では吐き出し先を指定と。

    .pipe(sass({style : 'expanded'}))
    SASS吐き出しスタイルは指定出来ます！
      形式種類 　   特徴　　　　　　　　　　　　　 　　　　　　
      nested  ネストされるので階層構造がわかりやすい
      expanded  一般的な手書きのCSSに近い
      compact   セレクタごとに1行にまとめられる
      compressed  すべてが1行にまとめられる

    最後、default！
    タスクがいっぱいあるとgulp実行時に『defaultを指定してー』と言われます。私は言われました・・・。
    その時は一番下に
    gulp.task('default', ['プラグイン名','プラグイン名']);

    見たまんまですが、保存するたびにgulp叩かなくても自動的に更新してくれるいい奴。
      sassディレの中を見てて欲しいので、
      gulp.watch('sass/*.scss', ['sass']);



########## LEGACY grunt command ##################################
#installation: $ gruntコマンド使えるようにする: $  npm install -g grunt-cli

########## puppeteer ##################################

次に `Dockerfile` を用意します。

```Dockerfile
FROM node:8.4.0

RUN apt-get update \
 && apt-get install -y \
      gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

WORKDIR /app
RUN npm i puppeteer

COPY ./script.js .

ENTRYPOINT ["node", "/app/script.js"]
```

`apt-get` コマンドでインストールするライブラリについては [Puppeteer » Troubleshooting](https://github.com/GoogleChrome/puppeteer/blob/6fcf3d914845b9271548826151199c358a25b558/docs/troubleshooting.md) の Debian Dependencies を参考にしました。このドキュメントでは前述の `puppeteer.launch()` の引数についても言及されています。

あとは `docker build` ならびに `docker run` を実行すれば OK です。サンプルプログラム実行時に撮影されたスクリーンショットの画像ファイル `example.png` が `docker run` を実行したディレクトリに配置されていれば成功です :tada:

```bash
$ docker build -t puppeteer .
$ docker run --rm -it -v $(pwd):/opt/data-volume -w /opt/data-volume puppeteer
$ open example.png
```

### Page
| name                           | meaning                                                |
| ------------------------------ | ------------------------------------------------------ |
| goto('URL')                    | URLにアクセス                                          |
| $(selector)                    | tagやcssセレクタでの絞り込み                           |
| focus(selector)                | tagやcssセレクタでの絞り込み(一つ目のエレメントを取得) |
| type(selector value)           | セレクターに入力                                       |
| click(selector)                | セレクターをクリック                                   |
| waitForNavigation(waitOptions) | オプションのタイミングまで待つ                         |
| screenshot({path: 'path.png'}) | path名でスクリーンショットを保存                       |

# Puppeteer examples


> Deprecation notice: We are moving our efforts to [theheadless.dev](https://github.com/checkly/theheadless.dev) a new free & open source knowledge base for Puppeteer AND Playwright. Idea is the same: practical examples and guides by the community. We — the team at Checkly — are going to pour a lot of love & care into this new project. Feel free to [contribute!](https://github.com/checkly/theheadless.dev/blob/master/CONTRIBUTING.md)

Puppeteer Headless Chrome examples for real life use cases. Clone this repo and run them directy with a simple `node` command.

```bash
git clone https://github.com/checkly/puppeteer-examples
cd puppeteer-examples
npm i
node 2.\ search/amazon.js
```
You can run these scripts in the [puppeteer sandbox](https://puppeteersandbox.com).


## 1. basics
The very basic on getting useful info from web page. Highlights the basic Puppeteer functions.
### alerts
Create an alert dialog and close it again.






■■■雑記■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

# visudo
# Downloading the app
  git clone http://some_body@192.168.200.200/git/ris-front
# node.js and npm
  wget https://nodejs.org/download/release/v6.11.3/node-v6.11.3-linux-x86.tar.gz
  tar zxvf node-v6.11.3-linux-x86.tar.gz
  sudo mv node-v6.11.3-linux-x64  /usr/local/
  wget https://registry.npmjs.org/npm/-/npm-3.10.10.tgz | tar zxvf &&  cd package && ./configure && make && make install
  sudo ln -sf /usr/local/node-v6.11.3-linux-x86/bin/node /usr/bin/node
  sudo ln -sf /usr/local/node-v6.11.3-linux-x86/bin/npm  /usr/bin/npm
  npm     install
  # node --version ; npm --version ; node_modules/bower/bin/bower --version ; node_modules/webpack/bin/webpack.js --help # <---先頭行にversion情報
  node_modules/bower/bin/bower     install
  node_modules/typings/dist/bin.js install
  npm rebuild node-sass


#webpackエラーをさけるための準備；git repositoryにあるコードのままではwebpackが成功しない。
  #vim tsconfig.js
    "preserveConstEnums": true,
    + "types": [ "node" ],

  # rectifing case-insensitive files so that webpack can interprete
    cp -p ./src/ts/component/dialog/mylistEditDialog.ts ./src/ts/component/dialog/mylisteditDialog.ts
    cp -p ./src/ts/constant/printoutLocation.ts ./src/ts/constant/PrintoutLocation.ts
    cp -p ./src/ts/model/bib/biblioGraphy.ts ./src/ts/model/bib/bibliography.ts
    cp -p ./src/ts/model/folderInfo.ts ./src/ts/model/folderinfo.ts
    cp -p ./src/ts/model/responseLog.ts ./src/ts/model/ResponseLog.ts
    cp -p ./src/resources/svg/shoei-dummy-bookcloud.svg ./src/resources/svg/shoei-dummy-bookCloud.svg

sudo node_modules/webpack/bin/webpack.js # npm start # http://localhost:3000




# OPTION: npm global modules
  # sudo npm install -g bower@1.8.2
  # bower   --version
  # bower install
  # sudo npm install -g typings@2.1.1
  # typings install
  # webpack --help
  # sudo webpack
#needless
  # sudo npm install -g webpack@1.13.2
  # sudo npm install -g angular@1.5.8
  # sudo npm install -g angular-mocks@1.5.8

  # sudo npm install -g typescript@2.2.2
  # sudo npm install -g @types/angular@1.6.36
  # sudo npm install -g @types/node --save-dev
  # sudo npm install    @types/node --save-dev

  # sudo npm install -g node-sass@3.12.1
  # sudo ln -sf /usr/local/node-v6.11.3-linux-x86/bin/ng      /usr/bin/ng
  # ng      --version
  # cp -p ./dist/mylistEditDialog.html ./dist/mylisteditDialog.html
  # cp -p ./src/view/part/dialog/mylistEditDialog.html ./src/view/part/dialog/mylisteditDialog.html




