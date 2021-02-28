Hatena::Diary

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
