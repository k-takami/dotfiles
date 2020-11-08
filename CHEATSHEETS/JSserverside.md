---
title: JavaScriptをやっているとnpm/yarn/gulp/grunt/webpackなど、たくさんのツールがあって混乱したので、それぞれの役割と違いをざっくりとまとめた
tags: JavaScript npm YARN gulp webpack
author: uchiko
slide: false
---

## はじめに

JavaScriptをやっているとたくさんのツールに出くわしますね。各ツールをググると詳細な使い方などが出てくるのですが、それぞれのツールのざっくりとした役割と違いが分からないので、__どのツールとどのツールを組み合わせて使うことが正しいのか__ がいまいち分かりませんでした。

本記事では、各ツールのざっくりとした役割と違いについてまとめてみました。


## 3つの役割で分類

各ツールについて調べてみると、以下のような役割を1つ以上持っているのではないかと考えました。

- パッケージ管理
- タスクランナー
- ビルドヘルパー

実際に分類してみると以下のようになるでしょうか。


|        |  パッケージ管理 |  タスクランナー | ビルドヘルパー |
|-----------------:|:------------------:|:------------------:|:-----:|
|__bower__ | o |  - | - |
| __npm__ | o |  o | - |
| __yarn__ | o |  o | - |
| __gulp__ | - | o | o |
| __grunt__ | - |  o | o |
| __webpack__ | - | - | o |


各役割において、それぞれのツールの違いをざっくりと見ていきます。


## パッケージ管理

パッケージ管理は、パッケージのインストールや依存関係の管理をするツールです。パッケージ管理ツールは、npmとyarnがありますが、違いは速度くらいでしょうか。yarnがnpmよりも早いようです。

npmから乗り換えてわかったYarnの4つのメリット
https://ics.media/entry/19384/

gulp/grunt/webpackなどはパッケージなので、npmやyarnでインストールすることになります。


## タスクランナー

タスクランナーは、まとまった処理を `タスク` として定義して、タスク単位で実行するツールです。

それぞれのツールで、タスクの定義方法に違いがあります。

npm と yarn は、 `package.json`の `scripts` で定義します。

```json:package.json
{
   "scripts": {
      "start": "npm run watch",
      "test": "mocha --compilers js:babel-register test/**/*.test.js",
      "app": "electron --debug=5858 src/"
   }
}
```

gulp は、 `gulpfile.js` で、`gulp.task`を使って定義します。

```js:gulpfile.js
const gulp = require('gulp');
const sass = require('gulp-sass');

// sassという名前のタスクを作成
gulp.task('sass', function(){
  gulp.src('./src/sass/*.scss')
    .pipe(sass({outputStyle: 'expanded'}))
    .pipe(gulp.dest('./dist/css/'));
});
```

grunt は、 `Gruntfile.js` で、 `grunt.registerTask`を使って定義します。

```js:Gruntfile.js
module.exports = function (grunt) {

  grunt.registerTask('hello', 'description here', function() {
    grunt.log.writeln('hello! hello!');
  });

  grunt.registerTask('default', [ 'hello' ]);

};
```


## ビルドヘルパー

ビルドヘルパーは、以下のような処理の流れを記述するため文法(DSL)を用意しているツールです。

- CSSファイルやJSファイルを1つにまとめたり圧縮したりする処理
- SCSSやTypescriptなどのメタ言語をコンパイルする処理


次のような処理の流れを、各ツールでどのように記述していくか見ていきます。

- TypeScriptをコンパイルする処理
- JSファイルを圧縮する処理

gulp の定義。

```js:gulpfile.js
var gulp = require("gulp");
var ts = require("gulp-typescript"); // TypeScriptをコンパイルするプラグイン
var uglify = require('gulp-uglify'); // JSファイルをminifyするプラグイン
var config = require("../config");   // 各種設定

gulp.task("tsc", function() {
  gulp.src(config.ts.src)
    .pipe(ts(config.ts.options))
    .js
    .pipe(gulp.dest(config.ts.dest))
    .pipe(uglify(config.uglify.options))
    .pipe(gulp.dest(config.uglify.dest));
});
```

grunt の定義。

```js:Gruntfile.js
module.exports = function(grunt) {
    // config
    grunt.initConfig({
        typescript: {
            build: {
                src: ['src/main/ts/**/*.ts'],
                dest: 'build/js/app.js'
            }
        },
        uglify: {
            build: {
                files: {
                    'build/js/app.min.js': ['build/js/app.js']
                },
                options: {
                    sourceMap: true
                }
            }
        }
    });

    // plugin
    grunt.loadNpmTasks('grunt-typescript');     // TypeScriptをコンパイルするプラグイン
    grunt.loadNpmTasks('grunt-contrib-uglify'); // JSファイルをminifyするプラグイン

    // tasks
    grunt.registerTask('default', ['typescript', 'uglify']);
};
```

webpack の定義。

```js:webpack.config.js
module.exports = {
  entry: './src/Index.tsx',
  output: {
    filename: './dist/bundle.js'
  },

  devtool: 'source-map',

  resolve: {
    extensions: ['.ts', '.tsx', '.js']
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({ // JSファイルをminifyするプラグイン
      minimize: true,
      sourceMap: true,
      include: /\.min\.js$/,
    })
  ],
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: [
          {loader: 'ts-loader'}
        ]
      }
    ]
  }
};
```

## 各ツールの比較と組み合わせ例

「パッケージ管理」であれば `npm` か `yarn` のどちらを使うのか。
「ビルドヘルパー」であれば `gulp` か `grunt` か `webpack` のどれを使うのか。
もし「ビルドヘルパー」として `webpack` を選択するのだとしたら、「タスクランナー」として `npm` か `yarn` を選択することになるでしょうか。


## まとめ

よく出くわすツールのそれぞれの役割と違いについて、ざっくりとまとめてみました。「パッケージ管理」「タスクランナー」「ビルドヘルパー」という役割で分類することによって、各ツールの違いが把握しやくすなったように思います。

今後も新しいツールが出てくるたびに、この分類を基に理解していけば、混乱せずに済むのではないかと考えています。

