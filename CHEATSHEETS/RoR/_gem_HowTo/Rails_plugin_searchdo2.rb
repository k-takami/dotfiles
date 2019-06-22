Hatena::Diary

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

プロフィール

shunsuk

shunsuk はてなダイアリープラス利用中
