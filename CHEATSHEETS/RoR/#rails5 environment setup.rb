#LinuxMint 17
	$ sudo add-apt-repository -y ppa:brightbox/ruby-ng
	$ sudo apt-get update
#RVM

# npm & webpacker & yarn
  $ echo "gem 'webpacker'" >> Gemfile
  $ bdl
  # or rails new --webpack if RAILS_VERSION >= 5.0

  $ curl -o- -L https://yarnpkg.com/install.sh | bash
  $ bin/rake webpacker:install
      new file:   app/javascript/packs/application.js
      new file:   bin/webpack
      new file:   bin/webpack-watcher
      new file:   bin/yarn
      new file:   config/webpack/development.js
      new file:   config/webpack/production.js
      new file:   config/webpack/shared.js
      new file:   vendor/package.json
      new file:   vendor/yarn.lock

  #asset compile
      $ bin/webpack
  #起動(8080 port)
      $ bin/webpack-dev-server &
      $ rails s
  # コマンド
    npm                                   yarn
    npm install                           yarn install
    (N/A)                                 yarn install --flat
    (N/A)                                 yarn install -har
    (N/A)                                 yarn install -no-lockfile
    (N/A)                                 yarn install --pure-lockfile
    npm install [package]                 (N/A)
    npm install --save [package]          yarn add [package]
    npm install --save-dev                yarn add [package] --dev
    (N/A)                                 yarn add [package] --peer
    npm install --save-optional [package] yarn add [package] --optional
    npm install --save-exact [package]    yarn add [package] --exact
    (N/A)                                 yarn add [package] --exact
    (N/A)                                 yarn add [package] --tilde
    npm install --global [package]        yarn global add [package]
    npm uninstall [package]               (N/A)
    npm uninstall --save [package]        yarn remove [package]

    npm uninstall --save-dev [package]    yarn remove [package]
    (N/A)                                 yarn upgrade [package]


    rake webpacker                          # Lists all available tasks in Webpacker
    rake webpacker:binstubs                 # Installs Webpacker binstubs in this application
    rake webpacker:check_binstubs           # Verifies that webpack & webpack-dev-server are present
    rake webpacker:check_node               # Verifies if Node.js is installed
    rake webpacker:check_yarn               # Verifies if Yarn is installed
    rake webpacker:clobber                  # Remove the webpack compiled output directory
    rake webpacker:compile                  # Compile JavaScript packs using webpack for production with digests
    rake webpacker:info                     # Provide information on Webpacker's environment
    rake webpacker:install                  # Install Webpacker in this application
    rake webpacker:install:angular          # Install everything needed for Angular
    rake webpacker:install:coffee           # Install everything needed for Coffee
    rake webpacker:install:elm              # Install everything needed for Elm
    rake webpacker:install:erb              # Install everything needed for Erb
    rake webpacker:install:react            # Install everything needed for React
    rake webpacker:install:stimulus         # Install everything needed for Stimulus
    rake webpacker:install:typescript       # Install everything needed for Typescript
    rake webpacker:install:vue              # Install everything needed for Vue
    rake webpacker:verify_install           # Verifies if Webpacker is installed
    rake webpacker:yarn_install             # Support for older Rails versions



