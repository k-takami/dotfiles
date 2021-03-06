#Version1.2.x and 2.x-----------------------------------
		minorio のプログラミング・メモ
		RSS2
		<[OSX][Ruby on Rails][WEB制作] ... | [Ruby on Rails][Rails 2.0] Rai...>
		2008-04-26
		■[OSX][Rails 2.0][RadRails][Ruby on Rails] Aptana RadRails を使った Scaffold の作成（RAILS 2.0 の場合） 14:12

	どうも『RailsによるアジャイルWebアプリケーション開発 第2版』の6.1章の通りにやっても Scaffold がうまく作成されないようなので、Rails 2.0 流のやり方をメモしておく。

		* phpMyAdmin で depot_development という名のデータベースを作っておき、RadRails で新規 Rails プロジェクトとして depot を作成
		* depot/config/database.yml ファイルを開いてデータベースのユーザー名、パスワード、ソケットなどを適切に設定

	本ではこのあと、モデルの作成（データベースマイグレーション）、コントローラーの作成、Scaffold の作成と進むことになっているのだけど、
	Rails 2.0 の場合、ここを scaffold 一発でやってしまえばいいみたい。
	Ruby エクスプローラーで depot プロジェクトが選択されていることを確認した上で、「ジェネレーター」タブから scaffold を選択、パラメーターに
	product title:string description:text image_url:string

	と入れて実行。
	これでマイグレーションファイル（db/migrate/20080427053115_create_products.rb）、
	コントローラーファイル（app/controllers/products_controller.rb）も一気に生成される。
	Rails 2.0のscaffoldを使ってみた
	教科書の例では admin コントローラーから product というモデルを操作するという構造になっているのだけど、2.0 の scaffold を使うとコントローラー名とモデル名も自動的に関連づけられるみたいだ（この場合はモデル名 product に対して、コントローラー名、View名が products と複数形になる）。
	scaffold のあと、「Rake タスク」タブから db:migrate を実行すると、データベースにテーブルが作成される。
	サーバー（WEBrick サーバー）を起動してブラウザーから http://127.0.0.1:3000/products にアクセスすると、空の Product リストが表示され、レコードの追加、修正、削除などのページが自動生成されていることが確認できた。
	教科書も Rails 2.0 対応だったらよかったんだけど・・。けっこういろいろ変わっているようなので、もう１冊そういう本を買っておいてもいいかも。

	Rails 2.0 - 初心者がすべきことは？

		作者 Rick DeNatale, 翻訳者 岡田 英久 投稿日 2008年1月8日 午前6時24分
		Rails 2.0.0、2.0.1、そして 2.0.2 という最近の矢継ぎ早なリリースに伴い、Rails サポートディスカッショングループには新しい Rails ユーザからの多くの問い合わせ(source)が届いている。彼らは Dave Tomas 氏と David Heinemeier Hansson 氏が執筆した書籍『 Agile Web Development with Rails 』（訳書のタイトルは『 Rails によるアジャイル Web アプリケーション開発』）のような有名なチュートリアルに従うことに疑問を感じている。書名の頭文字をとって一般に AWDR と呼ばれている Tomas 氏と Hansson 氏のその書籍は、すでに第二版が出版されているが、それも一年前のことで、 Rails 1.2 しかカバーしていない。
		Rails 2.0 と前バージョンである Rails 1.2 との違いは、Rails 1.2 と Rails 1.1 との間の違いに比べれば微々たるものだが、そこには疑うことを知らない新規ユーザをつまずかせるのに十分な大きさの落とし穴がある。
		Rails 2.0 のテーマのひとつはフレームワークのスリム化である。それにより、これまでは標準だったいくつかの機能がコア部分から削除され、プラグインとして提供されるようになった。
		1.2 をベースにしたチュートリアルに従っている人はそこでつまずく可能性がある。次に二つの例を挙げる。

		   1. 多くのチュートリアルではデータベースに MySQL を使っている。それは MySQL が Rails のデフォルトだったからだが、Rails 2.0.3 ではデフォルトが SQLite3 に変更(source)された。AWDR は後ろのほうで SQLite3 の使い方について説明しているが、チュートリアルを辿っている新規ユーザにとっては、問題にぶつかった時点でそれを自力で解決するための備えにはならないかもしれない。
		   2. AWDR の最初のほうで Rails のダイナミックな scaffold 機能を使用するが、現在のバージョンでは scaffold は次のようにプラグインをインストールした後でないと使用することができない。
						script/plugin install scaffolding

			  このように Rails 2.0 で削除された機能には他に、AJAX を使ったインプレイスエディタやオートコンプリート、そして有名な act as モデル拡張のいくつかが含まれる。
			  削除された機能を提供していると思われるものを利用可能なプラグインの中から探したければ、記のコマンドを実行するとよい。
						script/plugin list

					you@ecolnux:~/RoRapps/2chnrg$ ruby script/plugin list
					account_location              http://dev.rubyonrails.com/svn/rails/plugins/account_location/
					acts_as_list                  http://dev.rubyonrails.com/svn/rails/plugins/acts_as_list/
					acts_as_nested_set            http://dev.rubyonrails.com/svn/rails/plugins/acts_as_nested_set/
					acts_as_tree                  http://dev.rubyonrails.com/svn/rails/plugins/acts_as_tree/
					atom_feed_helper              http://dev.rubyonrails.com/svn/rails/plugins/atom_feed_helper/
					auto_complete                 http://dev.rubyonrails.com/svn/rails/plugins/auto_complete/
					continuous_builder            http://dev.rubyonrails.com/svn/rails/plugins/continuous_builder/
					deadlock_retry                http://dev.rubyonrails.com/svn/rails/plugins/deadlock_retry/
					exception_notification        http://dev.rubyonrails.com/svn/rails/plugins/exception_notification/
					http_authentication           http://dev.rubyonrails.com/svn/rails/plugins/http_authentication/
					in_place_editing              http://dev.rubyonrails.com/svn/rails/plugins/in_place_editing/
					javascript_test               http://dev.rubyonrails.com/svn/rails/plugins/javascript_test/
					legacy                        http://dev.rubyonrails.com/svn/rails/plugins/legacy/
					localization                  http://dev.rubyonrails.com/svn/rails/plugins/localization/
					open_id_authentication        http://dev.rubyonrails.com/svn/rails/plugins/open_id_authentication/
					scaffolding                   http://dev.rubyonrails.com/svn/rails/plugins/scaffolding/
					scriptaculous_slider          http://dev.rubyonrails.com/svn/rails/plugins/scriptaculous_slider/
					ssl_requirement               http://dev.rubyonrails.com/svn/rails/plugins/ssl_requirement/
					token_generator               http://dev.rubyonrails.com/svn/rails/plugins/token_generator/
					tzinfo_timezone               http://dev.rubyonrails.com/svn/rails/plugins/tzinfo_timezone/
					tztime                        http://dev.rubyonrails.com/svn/rails/plugins/tztime/
					upload_progress               http://dev.rubyonrails.com/svn/rails/plugins/upload_progress/
					lib                           svn://rubyforge.org/var/svn/betternestedset/trunk/lib/
					test                          svn://rubyforge.org/var/svn/betternestedset/trunk/test/
					lib                           svn://rubyforge.org/var/svn/betternestedset/trunk/lib/
					test                          svn://rubyforge.org/var/svn/betternestedset/trunk/test/
					comatose                      http://mattmccray.com/svn/rails/plugins/comatose/
					doozer                        http://mattmccray.com/svn/rails/plugins/doozer/
					encrypted_column              http://mattmccray.com/svn/rails/plugins/encrypted_column/
					gravatar_helper               http://mattmccray.com/svn/rails/plugins/gravatar_helper/
					labeled_form_builder          http://mattmccray.com/svn/rails/plugins/labeled_form_builder/
					radiant_behavior_filters      http://mattmccray.com/svn/rails/plugins/radiant_behavior_filters/
					radiant_mailer_behavior       http://mattmccray.com/svn/rails/plugins/radiant_mailer_behavior/
					radiant_password_protected_behaviorhttp://mattmccray.com/svn/rails/plugins/radiant_password_protected_behavior/
					rendered_column               http://mattmccray.com/svn/rails/plugins/rendered_column/
					tags                          http://mattmccray.com/svn/rails/plugins/tags/
					theme_support                 http://mattmccray.com/svn/rails/plugins/theme_support/
					comatose                      http://mattmccray.com/svn/rails/plugins/comatose/
					doozer                        http://mattmccray.com/svn/rails/plugins/doozer/
					encrypted_column              http://mattmccray.com/svn/rails/plugins/encrypted_column/
					gravatar_helper               http://mattmccray.com/svn/rails/plugins/gravatar_helper/
					labeled_form_builder          http://mattmccray.com/svn/rails/plugins/labeled_form_builder/
					radiant_behavior_filters      http://mattmccray.com/svn/rails/plugins/radiant_behavior_filters/
					radiant_mailer_behavior       http://mattmccray.com/svn/rails/plugins/radiant_mailer_behavior/
					radiant_password_protected_behaviorhttp://mattmccray.com/svn/rails/plugins/radiant_password_protected_behavior/
					rendered_column               http://mattmccray.com/svn/rails/plugins/rendered_column/
					tags                          http://mattmccray.com/svn/rails/plugins/tags/
					theme_support                 http://mattmccray.com/svn/rails/plugins/theme_support/

		別の選択肢は Rails 1.2.6 を使ってチュートリアルを一通り終え、その後で 2.0 への移行を検討することだ。
		まずは次のコマンドを実行して Rails 1.2.6 をインストールしよう。
			gem install rails --version 1.2.6

	次に、すでにインストール済の Rails 2.0.x 用 gems パッケージを削除するか、もしくはプロジェクトを作成する際の Rails コマンドで次のようにバージョン番号を指定すればよい。
		gems を使ってインストールしたほとんどのコマンドは gem 内のコードを実行するラッパーである。
	それらのコマンドでは、左右にアンダースコアを付加したバージョン番号を最初の引数として与えて実行することにより、gem のバージョンを指定することができる。
		rails _1.2.6_ my_rails_project

		Obie Fernandez 氏(source)が書いた『 The Rails Way (source)』のように、現時点で入手可能な Rails 2.0 対応書籍もすでにいくつか存在する。
		しかし、今までのところ、それらは全て多少 Rails に触れた経験をもっているユーザのための情報源を目指しているように思える。
		古い Rails 文献のいくつかは、時が経てば必ず更新されて、新しいチュートリアルが盛り込まれることになるだろう。
		さしあたり Rails の新規ユーザに与えられている選択肢は二つだ。前バージョンからの変更点にぶつかったらひたすら苦労して切り抜けるか、
		あるいは恐らくより賢明な方法として、ある程度のレベルに達するまではチュートリアルに合わせたバージョンの Rails を利用するかである。
		原文はこちらです：http://www.infoq.com/news/2007/12/rails-20-docs

	Old vs. New

	work$ rails exchange
	work$ rails -d mysql exchange
	exchange$ ruby script/generate scaffold Movie title:string description:text one_sheet_url:string
	  * Installed Rails
		#gem install rails --include-dependencies

	  * Created an aplication with the rails command
		$rails exchange

	  * Created the databases for the application with the rake command
		$ rake db:create:all

	  * Used the script/generate command to create the scaffolding for the application
		$ ruby script/generate scaffold Movie title:string description:text one_sheet_url:string

	  * Created the database table using the generated migration file
		$ rake db:migrate

	  * Started the webserver with the script/server command
		$ ruby script/server

	  * Pointed our web browser to the application and started entering and editing data
		http://localhost:3000/movies




Railsでデバッグをする７つの方法
  ------------------
  記事の引越しから漏れていたのでサルベージ。
  secondlifeさんの記事 に反応して後で書こうかなあと思っていたら、大分時間がたってしまいましたが、めげずに書いてみます。
  1. p/pp
      こちらはRailsに限らず良く使われている方法ですが、RailsではWebサーバをフォアグラウンドプロセスとして立ち上げた状態で使う感じになります。
    ???1? $ ./script/server
  p/ppに慣れている人にはわかりやすくて良いと思います。
  2. logger.deb ug
      さて、続いてlogger.deb ugを使う方法です。
      ???1? logger.debug "something interesting information"
      p/ppの代わりにlogger.deb ugを呼ぶ事で、結果がlog/develo pment.logなどのlog/$RAILS_ENV. logファイルに書き出されます。 書き出されたファイルを、
      ???1? $ tail -f log/development.log
      しておくと、p/ppでデバッグする時と同じような感じでデバッグ出力を見る事が出来ます。また、出力結果はlogファイルとして残っているので、後で参照する事もできます。
  3. script/con sole
      script/con soleは、実行時にデータベースの中身がどうなっているかを知りたい時に非常に便利です。script/con soleコマンドを実行すると、Railsの環境を読み込んだ状態でirbが立ち上がるので、ActiveRecordを使ってfindしたりcreateしたりdestroy_al lしたり、好きなようにDBをいじる事ができます。本当に素晴らしい機能ですね。
  4. script/bre akpointer
      script/con soleはとても素晴らしいのですが、アクション実行中のsessionの状態を調べたりするのには使えません。そんな時は、script/bre akpointerを使う事ができます。
      ???1? $ ./script/breakpointer
      まず、あらかじめbreakpoint erを立ち上げておきます。続いて、状態を確認したい場所にbreakpoint を仕込みます。
      ???1? class FooController &lt; ApplicationController
      ???2?   def bar
      ???3?     # something
      ???4?     breakpoint
      ???5?     # something
      ???6?   end
      あとは、ブラウザからアクセスしてbarアクションを実行すると、待ち受けていたbreakpoint erでirbが立ち上がるので、必要な情報を自由に閲覧・操作する事ができます。
  5. better rails debugger
      script/bre akpointerはとても便利ですが、ステップ実行が出来ないという問題があります。 実際にステップ実行がどうしても必要という場面はあまり無いのですが、あればあったほうが便利ですね。そんな時は、ruby-debug というGemを使います。
      これは前回のRails勉強会のときにyuguiさんから教えていただいた方法なのですが、まずはruby-debug をインストールします。
      ???1? # gem install ruby-debug
      次に、ブレークポイントを仕込みます。
      ???1? class FooController &lt; ApplicationController
      ???2?   def bar
      ???3?     # something
      ???4?     debugger
      ???5?     # something
      ???6?   end
      あとは、p/ppデバッグをするときのようにWebrickやMongrel等のWebサーバをフォアグラウンドで立ち上げ、目的のコードが実行されるようにブラウザからアクセスします。
      すると、Webサーバのプロセス上でdebug.rb（と似たような感じのもの）が立ち上がるので、通常のrubyスクリプトを デバッグする時と同じ要領でデバッグを行う事ができます。
  6. test/autot est
      Ruby on Railsでは、テスト用のフレームワークがはじめから使える状態になっています。
      テスト駆動開発では、テストを書いてから実装を書きますが、適当な動作検証用のコードをテストとして書くことで、デバッグに使う事もできます。この際、毎回テストをrakeコマンドから実行するのは時間が掛かるので、ZenTestのautotestを使うのがお勧めです。
      autotestを使うと、編集されたファイルに関連するテストだけを実行してくれるので、rakeコマンドを実行するよりも軽快なレスポンスが得られます。さらにredgreenを併用すると気分良くデバッグを行う事ができるのでお勧め。
  7. tail -f log/develo pment.log&; autotest
      最後に、僕が今使っている方法を紹介します。 開発用とは別に一つターミナルを立ち上げて、RAILS_ROOT で以下のコマンドを実行。
      ???1? $ tail -f log/development.log&amp;; autotest
      こうしておくと、プログラムやテストコードを編集した時はautotestの出力が表示され、ブラウザからアクセスした時にはロガーの出力が表示されます。 基本的に両者が同時に行われる事は無いので、一つのターミナルを有効利用する事ができておすすめ。
  というわけで、Railsでデバッグを行う方法の紹介でした。
  posted by {Png} genki on Wed 21 Nov 2007 at 12:38
  Similar Articles:
  +++++++++++++++++
    1. FireBug for IE? by {Png} genki
    2. Seven Debugging Tools of Rails by {Png} genki
    3. Rails 2.0でデバッグをする新しいやり方 by {Png} genki
    4. Railsのドキュメントが要らなくなる（事もある）方法 by {Png} genki
    5. XcodeのgdbでObjective-Cのメソッドを呼び出す by {Png} genki
  January 2008 December February
    * 31
  11th Fri


