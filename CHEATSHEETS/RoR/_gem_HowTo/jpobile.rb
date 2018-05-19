インストール

Rails の Version に応じて選択してください。
Rails 2.3.2
pluginとしてインストールする場合

リリース版:
	% ./script/plugin install git://github.com/darashi/jpmobile.git -r 'tag x.x.x'
	(x.x.xはバージョン)

開発版:
	% ./script/plugin install git://github.com/darashi/jpmobile.git
gemでインストールする場合
	# gem install jpmobile
	としてgemをインストールした後
		RAILS_ROOT/config/environment.rb の Rails::Initializer.run do |config| 〜 end 内に
		config.gem "jpmobile"
	の行を追加する。 

	request.mobile?
とします。これはcontrollerやviewの中で使用できます。
　jpmobileの機能の多くは、requestを拡張する形で実現されています。
	request.mobile
とすると、携帯電話に対応するインスタンスが返ります。PCからのアクセスであればnilが返ります。
　どのキャリアなのかを判別するときは、
	case request.mobile
	when Jpmobile::Mobile::Docomo
	# for DoCoMo
	when Jpmobile::Mobile::Au
	# for au
	when Jpmobile::Mobile::Softbank
	# for SoftBank
	when Jpmobile::Mobile::Willcom
	# for Willcom
	when Jpmobile::Mobile::Emobile
	# for EMOBILE
	else
	# for PC
	end

とするとよいでしょう。特定のキャリアかどうかを判別する場合には、
	request.mobile.docomo?
と書くこともできます。
　jpmobileが提供するインターフェイスの雰囲気はつかめましたか。詳しい使い方は次回以降で説明していくことにして、本稿では残るjpmobileの機能の概略を紹介します。
・端末位置情報の取得
　携帯電話のGPS利用を支援するための機能です。位置情報を取得するために必要なHTML片を作成するためのヘルパーや、携帯電話から渡される位置情報を統一的なインターフェイスで扱う方法、測地系の相互変換を行うライブラリを含みます。
・端末製造番号と契約者番号の取得
　端末の製造番号や契約者番号を取得するために必要なヘルパーや、端末から送信された情報に統一的なインターフェイスでアクセスする方法を提供します。
・IPアドレスの検証
　端末がキャリアの公開しているIPアドレス帯域からアクセスしてきているかを確認します。
・セッションIDの付加（Trans SID機能）
　クッキーが利用できない環境下でセッションを維持するために、URLやフォームにセッションIDを付加して引き回す方法を提供します。
・携帯電話ビューへの自動振り分け
　規約に従ったファイル名でテンプレートを配置するだけで、携帯電話のキャリアに合わせて固有のviewを送出できるようになります。
・ディスプレイ情報の取得
　端末のディスプレイサイズや色数などの情報に、統一的なインターフェイスでアクセスできます。
・文字コード／絵文字の相互変換
　通信相手の携帯電話に合わせて、適切な文字コードでページを送出します。また、絵文字をキャリアごとに自動的に変換して送出します。
jpmobileの歴史
　jpmobileがどのようにして開発されてきたのかについて触れたいと思います。jpmobileのルーツは、スープカレーが大好きな筆者が、「スープカレー店位置情報サイト soupcurry.info」を構築するために書いたコードです。
関連リンク：
リンク 	スープカレー店位置情報サイト soupcurry.info
http://soupcurry.info
　soupcurry.infoはいますぐスープカレーを食べたい、そんなときに携帯電話から使えるWebサイトです。 soupcurry.infoには、携帯電話用サイトを構築する際に共通して使えるような汎用的な処理がたくさんありました。これらをプラグインの形で切り出したものがjpmobileです。DRY: Don't Repeat Yourselfの産物です。
　公開してから多くのフィードバックをいただき、Railsのバージョンアップに一喜一憂しながら（Railsの動作に深く依存するコードがRailsのバージョンアップによって動かなくなることも時々ありました）、緩やかに改善を続けてきました。
　また、2008年6月に行われた日本Ruby会議2008でjpmobileについて発表する機会をいただきました（このときの記録はWebに公開されています、次節のリンクをご覧ください）。
　jpmobileは個人的な目的のために作られたプラグインでしたが、私の想像する以上に多くの方が使ってくださっていることを認識することになりました。また、Ruby会議の昼休みの時間を利用してjpmobile会議を行いました。
　これらを機に、仕様を議論しながら開発していける体制にシフトしていこうとしています。開発の拠点をGitHubに移し、開発のためのインフラを整備しつつあります。パッチを提供していただきつつ、IRCで議論しつつ、開発を進めてきています。PCでの絵文字表示、iPhone対応など、まだ実現できていない機能もたくさんありますので、コツコツと開発を進めていきたいと考えています。
情報へのポインタ
　最後にjpmobileの情報を得るためのポインタをまとめて示します。開発の中心はIRC、GitHubです。
　イントロダクションとしては日本Ruby会議2008の録画、発表資料がお勧めです。 実際に利用する際にはRDocによるリファレンスと、jpmobileのソースコード、テストケースを参照してください。
・http://jpmobile-rails.org
　jpmobileのメインサイトです。ほかの情報へのリンクやIssue Trackerがあります。
・http://jpmobile.rubyforge.org/rdoc
　RDocで生成されたリファレンスがあります。
・日本Ruby会議2008 メインセッション「ガラパゴスに線路を敷こう: 携帯電話用RailsプラグインJpmobile」
　http://www.nicovideo.jp/watch/sm3823512
　http://www.slideshare.net/dara/railsjpmobile/
　http://jp.rubyist.net/RubyKaigi2008/?MainSession#l34
　日本Ruby会議2008にてjpmobileについて発表した際の録画と発表資料です。
・http://github.com/darashi/jpmobile
　jpmobileのリポジトリです。GitHubを利用して開発を行っています。
・http://groups.google.com/group/jpmobile
　メーリングリストです。告知や議論に利用しています。
・irc.freenode.net #jpmobile
　IRCを利用してjpmobileの仕様などについて議論しています。現状ここが一番活発です。
　本稿ではjpmobileとは何か、そして何を目指しているのか、何ができるのかを紹介しました。また、jpmobileのインストールの方法と機能の概略、それからjpmobileについて情報を得る方法を紹介しました。
　次回以降、jpmobileを使って簡単なアプリケーションを作りながら、その使い方について解説していく予定です。
　携帯電話やRailsを取り巻く状況が時々刻々と変わって行く中、jpmobileもまた変わり続けています。厄介なものを簡単に扱えるようにしようというjpmobileの性質上、統一感のあるインターフェイスを作ろうとすると、その仕様一つを決めるだけでも多くの困難が伴います。ぜひ、皆さまのお知恵とお力をお借りできればと思います。
　われこそは！ と思われた方は、ぜひIRCやMLにて議論にご参加いただければと思います。そしてGitHubでコードをforkしていただければ幸いです。皆さまからのすてきなpull requestをお待ちしています。
