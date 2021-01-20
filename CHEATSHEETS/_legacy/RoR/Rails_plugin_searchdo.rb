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

プロフィール

shunsuk

shunsuk はてなダイアリープラス利用中
