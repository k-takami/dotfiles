Hatena::Diary
[rails 検索 タグ プラ][日記][検索]
  • ブログトップ
  • 記事一覧
  • ログイン
  • 無料ブログ開設

このブログは証明できない。

<[ふりかえり]熊本Ruby混浴露天温... | [Ruby][.NET]今日もブラウザ上で...>

2009-04-06

■[Rails]Railsの全文検索は、Hyper Estraierとsearch_doプラグインで超簡単

N-gram方式の全文検索エンジンHyper Estrailer。

  • 全文検索システム Hyper Estraier

とりあえず、インストールしてください。LinuxならyumでOK。yumが使えないならrpmでもOK。MacならMacPortsでOK。ダメならソースをコンパイル。


Hyper Estraierはライブラリとしても使えるし、サーバーとしても使えます。Railsのsearch_doプラグインでは、サーバーとして使っています。


適当なディレクトリに移動して。

$ estmaster init casket
$ estmaster start casket

デーモンとして起動するなら。

$ estmaster start -bg casket

initでcasketディレクトリが作られます。この中にインデックスなどが格納されます。startでサーバー起動。http://localhost:1978/master_uiにアクセ
スして（admin, adminで入れる）、ノードを作成。


次にRails側。search_doプラグインをインストール。

$ script/plugin install git://github.com/moro/search_do.git


config/database.ymlの設定。

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

nodeの設定の仕様がビミョーだったので、プラグインのコードを勝手に改造。絶望はしてない。

  • Railsの全文検索にはacts_as_searchableじゃなくてsearch_do - このブログは証明できない。


全文検索したいmodelの設定。

class Entry< ActiveRecord::Base
  acts_as_searchable :searchable_fields => [:title, :body]
end

acts_as_searchableのときのコードがそのまま使えます。


script/consoleに入って、インデックスの作成。

>> Entry.reindex!


これで、全文検索できてしまいます。

Entry.fulltext_search("ニート")


will_paginateプラグインを使ったページ処理も超簡単。

  • Railsで全文検索(search_do)＋ページ処理(will_paginate) - このブログは証明できない。


Railsで全文検索するには、Tritonn + acts_as_tritonnという選択肢もあります。でも、TritonnだとMySQL自体を置き換えないといけないし、InnoDBでは
なくMyISAMを使わないといけません。Hyper Estrailerなら、MySQL側にはまったく影響がないというメリットがあります。あ、でも、パフォーマンスは
Tritonnの方が上だったような。


とにかくHyper Estraier + search_doの全文検索は超簡単！

Permalink | コメント(0) | トラックバック(3) | 21:24 Railsの全文検索は、Hyper Estraierとsearch_doプラグインで超簡単 - このブログは証明でき
ない。を含むブックマークはてなブックマーク - Railsの全文検索は、Hyper Estraierとsearch_doプラグインで超簡単 - このブログは証明できない。 
Railsの全文検索は、Hyper Estraierとsearch_doプラグインで超簡単 - このブログは証明できない。のブックマークコメント

コメントを書く

[ ][ ]スパム対策のためのダミーです。もし見えても何も入力しないでください
ゲスト [               ] [icon-userm][               ] [icon-useru][               ]
[                                                            ]
[                                                            ]
[                                                            ]
[captcha] 画像認証
[          ]
[投稿]

トラックバック - http://d.hatena.ne.jp/shunsuk/20090406/1239020647

  • 医者を志す妻を応援する夫の日記 - Railsの全文検索にはacts_as_sea...
  • 医者を志す妻を応援する夫の日記 - Railsで全文検索(search_do)＋ペ...
  • 医者を志す妻を応援する夫の日記 - MacPortsでインストールしてるソ...

リンク元

  • 17 http://www.google.co.jp/search?sourceid=navclient&hl=ja&ie=UTF-8&rlz=1T4DAJP_jaJP268JP268&q=C#+クイックソート
  • 10 http://www.google.co.jp/search?hl=ja&client=firefox-a&rls=org.mozilla:ja:official&hs=MOI&q=xpからimac風&btnG=検索&lr=lang_ja
  • 9 http://reader.livedoor.com/reader/
  • 8 http://www.google.co.jp/search?q=vista+高速化&hl=ja&lr=lang_ja&client=firefox-a&rls=org.mozilla:ja:official&hs=PSV&start=10&sa=N
  • 7 http://www.google.co.jp/search?hl=ja&lr=lang_ja&client=firefox-a&rls=org.mozilla:ja:official&q=vista+hosts+紊????&revid=22203112&ei=
    rwnaSa2KOozy6gOEi_iCCw&sa=X&oi=revisions_inline&resnum=0&ct=top-revision&cd=1
  • 5 http://www.google.com/search?hl=ja&lr=lang_ja&ie=UTF-8&oe=UTF-8&q=vista+XP&num=50
  • 4 http://www.google.co.jp/search?hl=ja&rlz=1T4SUNA_jaJP277JP277&q=vista+高速化+ツール&revid=2004617837&ei=bazaSeP7OJeMkAXmuOirCA&sa=X&
    oi=revisions_inline&resnum=1&ct=broad-revision&cd=8
  • 3 http://72.14.235.132/search?q=cache:Pb8tnuFCyT0J:plus-alpha-space.cocolog-nifty.com/blog/2009/01/post-688d.html+アメブロ　クローラー
    　カウント&cd=1&hl
  • 3 http://ezsch.ezweb.ne.jp/search/ezGoogleMain.php?query=医者+日常&start-index=4&adpage=3&mode=03
  • 3 http://search.nifty.com/websearch/search?cflg=検索&select=2&q=Vista+Window+defender+停止方法&ck=&ss=up

<[ふりかえり]熊本Ruby混浴露天温... | [Ruby][.NET]今日もブラウザ上で...>
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
[rails 検索 タグ プラ][検索]
(*)詳細 ( )一覧
カレンダー

<<    2009/04  >>
日 月 火 水 木 金 土
         1  2  3  4
5  6  7  8  9  10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30

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
