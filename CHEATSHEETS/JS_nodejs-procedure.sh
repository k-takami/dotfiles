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

