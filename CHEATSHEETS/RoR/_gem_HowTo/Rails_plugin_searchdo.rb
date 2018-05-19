Hatena::Diary
[                    ][日記][検索]
  • ブログトップ
  • 記事一覧
  • ログイン
  • 無料ブログ開設

このブログは証明できない。

<[Rails]Railsで多対多のモデルを... | [Rails]will_paginateはgemじゃ...>

2009-03-24

■[Rails]Railsの全文検索にはacts_as_searchableじゃなくてsearch_do

Hyper Estraierを使った全文検索。acts_as_searchable使って頑張ってみました。が、何度やってもインデックスが作成されません。なんと、
acts_as_searchableはRails 2.1以降では使えないそうな。。


acts_as_searchableの代わりになるのが、search_doです。acts_as_searchableの派生らしく、アプリ側のコードを修正せずに使えます。

  • Railsの全文検索は、Hyper Estraierとsearch_doプラグインで超簡単 - このブログは証明できない。


ところが、1箇所おかしなところが。fulltext_searchをしても、結果が取得できません。


ソースコードを追って、原因究明。


config/database.ymlでこんなカンジで設定します。

development:
  adapter: mysql
  encoding: utf8
  database: test
  pool: 5
  username: test
  password: test
  estraier:
    host: localhost
    user: admin
    password: admin
    port: 1978
    node: sample

nodeを指定しているのですが、これがそのまま使われていません。ここで指定したnode + モデルのテーブル名が使われています。なんで、こんな仕様に
なってるんだろう？


とりあえず、search_doのコードを修正。

vendor/plugins/search_do/lib/search_do/backends/hyper_estraier.rb

def calculate_node_name(config)
  node_prefix = config['node_prefix'] || config['node'] || RAILS_ENV
  "#{node_prefix}_#{@ar_class.table_name}"
end

このメソッドを修正。こんなカンジでいいんじゃない？

def calculate_node_name(config)
  config['node_prefix'] || config['node'] || RAILS_ENV
end

やったー！動いたー！


今のところsearch_doに関する情報って少ないですね。私はコードを読まないヘタレプログラマーなので、ソース嫁って言われるとツライ。。。.NETプロ
グラマーって、オープンソースのコード読む機会が少ない気がしません？自分だけ？

Permalink | コメント(0) | トラックバック(3) | 20:14 Railsの全文検索にはacts_as_searchableじゃなくてsearch_do - このブログは証明できない。
を含むブックマークはてなブックマーク - Railsの全文検索にはacts_as_searchableじゃなくてsearch_do - このブログは証明できない。 Railsの全文検
索にはacts_as_searchableじゃなくてsearch_do - このブログは証明できない。のブックマークコメント

コメントを書く

[ ][ ]スパム対策のためのダミーです。もし見えても何も入力しないでください
ゲスト [               ] [icon-userm][               ] [icon-useru][               ]
[                                                            ]
[                                                            ]
[                                                            ]
[captcha] 画像認証
[          ]
[投稿]

トラックバック - http://d.hatena.ne.jp/shunsuk/20090324/1237893278

  • 医者を志す妻を応援する夫の日記 - Railsのお仕事と、MacBookのキー...
  • 医者を志す妻を応援する夫の日記 - Railsで全文検索(search_do)＋ペ...
  • 医者を志す妻を応援する夫の日記 - Railsの全文検索は、Hyper Estra...

リンク元

  • 12 http://www.google.co.jp/search?hl=ja&q=vista+高速化+ツール&meta=lr=&aq=8r&oq=vista+こ
  • 10 http://www.google.co.jp/search?hl=ja&client=firefox-a&rls=org.mozilla:ja:official&hs=SGk&q=EXT3　win&btnG=検索&lr=lang_ja
  • 10 http://www.google.co.jp/search?hl=ja&lr=lang_ja&client=firefox-a&rlz=1R1GGGL_ja&hs=bom&q=vista+高速化&start=10&sa=N
  • 9 http://www.google.co.jp/search?sourceid=navclient&hl=ja&ie=UTF-8&rlz=1T4GGLG_jaJP304JP304&q=ＸＰからvista
  • 6 http://search.yahoo.co.jp/search?p=エキスパートアライアンス+携帯電話&search_x=1&tid=top_ga1_sa&ei=UTF-8&aq=5&oq=エキス?%
  • 4 http://ezsch.ezweb.ne.jp/search/ezGoogleMain.php?query=高校入学&start-index=49&adpage=8&mode=02
  • 4 http://machine.livedoor.biz/archives/51174400.html
  • 4 http://www.google.co.jp/search?hl=ja&lr=&q=windows+vista+高速化&revid=341619284&ei=J-_ISeO_KceIkAXHpNngAg&sa=X&oi=revisions_inline&
    resnum=0&ct=broad-revision&cd=5
  • 4 http://www.google.com/search?hl=ja&lr=lang_ja&ie=UTF-8&oe=UTF-8&q=KPF&num=50
  • 3 http://reader.livedoor.com/reader/

<[Rails]Railsで多対多のモデルを... | [Rails]will_paginateはgemじゃ...>
プロフィール

shunsuk

shunsuk はてなダイアリープラス利用中

サイバーレコードCTO／フリープログラマー

Twitterはこちら。
shunsuk on Twitter

プロフィールはこちら。
shunsuk's profile

[2010040814]

日記の検索
[                    ][検索]
(*)詳細 ( )一覧
カレンダー

<<    2009/03  >>
日 月 火 水 木 金 土
1  2  3  4  5  6  7
8  9  10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

最新タイトル

  • [こころ]人生を自由にするための考え方。(Pre-Alpha)
  • [Rails]Railsでテーブルに列を追加するメモ。
  • [現況]リア充なシマウマ。
  • [ふりかえり]TweetMoreとKindle DXと英語と音楽。
  • [Web]Twitterで140文字以上つぶやける「TweetMore」をリリースしました。
  • [iPhone]Xcodeでアプリのプロジェクトにライブラリのプロジェクトを追加したりね。
  • [IT]オープンソースソフトウェアが出てくる自動販売機「Freedom Toaster」
  • [Rails]RailsでセッションデータをDBに保存する情熱。
  • [Ruby]よそでは読めない？Ruby関連エントリーのまとめ。
  • [雑記]プログラマーが好きそうな邦楽77曲。

カテゴリー

  • 応援
  • 現況
  • 勉強法
  • 健康
  • こころ
  • 教育
  • マネー
  • 雑記
  • ビジネス
  • IT
  • ふりかえり
  • 数学塾
  • 技術系
  • PHP
  • JavaScript
  • Ruby
  • .NET
  • ハック
  • 英語
  • Linux
  • Vim
  • ガジェット
  • Scheme
  • 書評
  • SICP
  • 起業
  • Haskell
  • 将棋
  • Rails
  • PC
  • Mac
  • Web
  • IT講座
  • デザイン
  • Emacs
  • AIR
  • iPhone
  • GAE
  • Python
  • 話
  • 科学
  • 妄想
  • DB
  • プログラミング
  • Android
  • LISP

あわせて読みたいブログパーツ
最近のコメント

  • 2010-05-02 shunsuk
  • 2010-05-02 shunsuk
  • 2010-05-02 rintaromasuda
  • 2009-10-12 ac
  • 2008-11-21 へたれ獣医

最近のトラックバック

  • 2010-04-07 人のブログの間違いが気になって……
  • 2009-01-04 会者定離で以降 - OpenSolaris2009.06のemacs環境のRubyな設定、ref...
  • 2009-07-14 Windows機にSnow Leopard 10.6.3 をインストールする方法
  • 2010-03-18 Nao_uの日記 - コンピューターサイエンスを学びたくなった読むコピ...
  • 2008-04-24 新・たけぞう瀕死の日記 - Radiantのプラグインを作ってみた

リンク集

  • 株式会社サイバーレコード
  • アートセラピーカウンセリング【Twin Bells】
  • 彩・カラープレイス
  • ゆきバーサルデザイン
  • 自転車の修理やさん

カウンター
counter
