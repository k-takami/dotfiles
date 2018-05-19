Hatena::Diary
[rails 検索 タグ プラ][日記][検索]
  • ブログトップ
  • 記事一覧
  • ログイン
  • 無料ブログ開設

MothProgのうしろがわこのページをアンテナに追加

<[Rails][Authlogic]Authlogic 2.... | [Rails][memo]バッチファイルを...>

2009-04-06

アツイ検索プラグインSearchlogic: pagenation, sortable table

rails

※このエントリーの内容は古いバージョンに基づくもので、現行バージョン（version 2.0以降）では利用できません。現行バージョンについてはスリム
になったSearchlogic v2をいじってみた - MothProgのうしろがわをどうぞ。


Authlogicの作者が公開している-logicシリーズには、このほかSearchlogic, Settingslogic、それにごく最近公開されたResourcelogicがある。その中で
これも人気があるらしいSearchlogicを試してみたら結構アツかったので使い方をメモっておく。これを見ておおっと思った方はぜひお試しを。

例によって詳しくは公式ページをどうぞ。

  • binarylogic’s searchlogic at master - GitHub
  • Searchlogic 1.3.0 – Adding modifiers into the mix - Binary Logic

Searchlogicとは

Searchlogicは一言で言えばオールインワンの検索支援プラグインだ。具体的には

  • ページネーション
  • カラムごとにソートできるテーブルの作成
  • 複雑な検索フォームの作成支援
  • 複雑な検索sql文の作成支援
  • SQLインジェクション対策

などを一つのプラグインで対応する。

findメソッドをかなりオレオレ拡張していたり、設定がデフォルトではsqlを直に書けない（SQLインジェクション対策のため）ので、許容できない人もい
ると思うが、Searchlogicのレールに乗れば今まで苦労したルーチンがカンタンに書けてしまう（※１）。

※１　自分が問題解決法を知らなかっただけかもしれないが。

インストール

特に変わったところはない。

$ sudo gem install searchlogic

# config/environment.rb
config.gem "searchlogic"

ページネーション

ここではStudentとClubという2つのテーブルが多：１のリレーションになっており、それぞれnameというフィールド（student#name, club#name）がある
とする。したがって、各生徒のクラブ名はstudent.club.nameで取れるとする。

まずはページネーションから。たとえば、Studentのindexが以下のようになっているとする。

# app/controllers/students_controller.rb
  def index
    @students = Student.all
  end

これを以下のように書き換え、

# app/controllers/students_controller.rb
  def index
    @search = Student.new_search(params[:search])
    @search.per_page = 10
    @students = @search.all
  end

ビューにページ切り替えフォームを追加する。

# app/view/students/index.html.erb
<p>
  Page: <%=  page_select %>
</p>

page_selectはページ切り替えフォームを追加するヘルパーメソッドだ。もし、1ページあたりの項目数も変更したければpage_select_helperメソッドが使
える。

new_searchメソッドは、与えられたオプションからSearchオブジェクトを作成する。同時にSQLインジェクション対策も施される。

Searchオブジェクトは、検索条件を保存するもので、役割としてはNamedScopeに似ている。ただし、メソッドではなくそれ自体がオブジェクトなので、
NamedScopeであればStudent.some_named_scope.findと書くが、Searchオブジェクトでは@search.findや@search.allなどと書く。

（補足）Student.some_named_scope.new_searchとすることで、NamedScopeの絞り込みとSearchオブジェクトを同時に使用できる。


カラムでソートできるテーブル

Searchlogicではカラムごとのソート機能をさくっと作ることが出来る。

Studentテーブルのviewが以下のようになっているとする。

# app/view/students/index.html.erb
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Club</th>
  </tr>
<% @students.each do |student| %>
  <tr>
    <td><%=h student.id %></td>
    <td><%=h student.name %></td>
    <td><%=h student.club.name %></td>
（以下略）

thを以下のように修正する。

# app/view/students/index.html.erb
  <tr>
    <th><%= order_by_link :id -%></th>
    <th><%= order_by_link :name -%></th>
    <th><%= order_by_link :club => :name -%></th>
  </tr>

order_by_linkは、searchlogicを使用して各カラムの値でソートするオプションをつけたリンクを作成するヘルパーメソッドだ。

注目すべきは3番目のカラムで、リンク先のフィールドをハッシュで指定してソートする機能を使い、クラブ名でソートをかけている。

また、配列で指定すれば複数条件でソートできるので、クラブ名でソートするときに各クラブの生徒を名前順にしたければ、

# app/view/students/index.html.erb
    <th><%= order_by_link [{:club => :name}, :name] -%></th>

とすればいい。

もう一つ注目すべき点は、何も考えずにプラグインでソート機能とページネーション機能を同時に使用できることだ。クラブ名でソートして2ページ目に
移動すれば、そのようにソートした結果の2ページ目がきちんと表示される。

（おまけ）テストアプリ

生徒ークラブという2テーブルを使った例のメモ。

$ rails studentsearch
$ cd studentsearch
$ script/generate scaffold student name:string club:references
$ script/generate scaffold club name:string
$ script/generate migration fixtures

#app/db/migrate/.....create_fixtures.rb
class CreateFixtures < ActiveRecord::Migration
  def self.up
    %w(baseball soccer tennis basketball).each do |name|
      Club.create(:name=>name)
    end

    %w(Ana Bill Claudette Danny Erika Fred Grace Henri Ida Joaquin Kate Larry Mindy Nicholas Odette Peter Rose Sam Teresa Victor).shuffle.each do |e|
      Student.create(:name=>e, :club_id=>rand(4) + 1)
    end
  end

  def self.down
    Club.delete_all
    Student.delete_all
  end
end

#app/models/club.rb
class Club < ActiveRecord::Base
  has_many :students
end

※Studentクラスのbelongs_toは上記scaffoldで作成される

$ rake db:migrate

Permalink | コメント(0) | トラックバック(1) | 16:53 アツイ検索プラグインSearchlogic: pagenation, sortable table - MothProgのうしろがわを含
むブックマークはてなブックマーク - アツイ検索プラグインSearchlogic: pagenation, sortable table - MothProgのうしろがわアツイ検索プラグイン
Searchlogic: pagenation, sortable table - MothProgのうしろがわのブックマークコメント

コメントを書く

[ ][ ]スパム対策のためのダミーです。もし見えても何も入力しないでください
ゲスト [               ] [icon-userm][               ] [icon-useru][               ]
[                                                            ]
[                                                            ]
[                                                            ]
[captcha] 画像認証
[          ]
[投稿]

トラックバック - http://d.hatena.ne.jp/mothprog/20090406/1239004381

  • MothProgのうしろがわ - スリムになったSearchLogic v2をいじってみ...

リンク元

  • 54 http://www.google.co.jp/search?hl=ja&client=firefox-a&rls=org.mozilla:ja:official&hs=vFl&q=redirect_back_or_default+store_location&
    btnG=検索&lr=lang_ja
  • 28 http://www.google.co.jp/search?q=Searchlogic&lr=lang_ja&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:ja-JP-mac:official&client=firefox-a
  • 9 http://www.google.co.jp/search?hl=ja&lr=lang_ja&client=firefox-a&rls=org.mozilla:ja-JP-mac:official&hs=8UF&num=50&q=rails+検索+プラ
    グイン&revid=720897676&ei=V3fmSeXbJ4SUkAXf1vGSBw&sa=X&oi=revisions_inline&r
  • 9 http://www.google.co.jp/search?hl=ja&q=rails+ソート可能なテーブル作成&btnG=検索&lr=
  • 9 http://www.google.co.jp/search?q=Rails+Searchlogic&lr=lang_ja&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:ja:official&client=firefox-a
  • 9 http://www.google.co.jp/search?q=Searchlogic&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a
  • 7 http://www.google.co.jp/search?hl=ja&source=hp&q=rails+searchlogic&lr=lang_ja&aq=1&oq=rails+search
  • 7 http://www.google.co.jp/search?q=rails+searchlogic&ie=utf-8&oe=utf-8&aq=t&rls=com.ubuntu:ja:unofficial&client=firefox-a
  • 6 http://www.google.co.jp/search?hl=ja&q=Rails+テーブル+ソート&lr=&btnG=Google+検索
  • 6 http://www.google.com/search?client=safari&rls=en&q=rails+searchlogic&ie=UTF-8&oe=UTF-8

<[Rails][Authlogic]Authlogic 2.... | [Rails][memo]バッチファイルを...>
カレンダー

<<    2009/04  >>
日 月 火 水 木 金 土
         1  2  3  4
5  6  7  8  9  10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30

最新タイトル

  • [Rails]ビューをRSpecでテストする際の覚え書き
  • [Rails]スリムになったSearchlogic v2をいじってみた
  • [Rails][memo]awesome_nested_set
  • [Sinatra]自己流でSinatraとRSpecとWebratとCucumber使ってみた。あとDataMapperも
  • [Rails][memo]RSpecで最近地味に便利になった点（＋追記）
  • [Rails]Factory Girlのように手軽にフィクスチャを作れるプラグインを試しに作ってみた
  • [Rails][memo]バッチファイルを実行する
  • [rails]アツイ検索プラグインSearchlogic: pagenation, sortable table
  • [Rails][Authlogic]Authlogic 2.0+Authlogic OpenId 1.0によるOpenID認証が非常に簡単な件（＋α）
  • [Rails][Authlogic]Authlogicのメッセージを日本語化する

最近のコメント

  • 2009-03-31 mothprog
  • 2009-03-31 toby

最近のトラックバック

  • 2009-03-31 おもしろWEBサービス開発日記 - Railsの認証プラグイン Authlogic ...
  • 2009-03-31 h1mesuke’s hoge-log - Railsノート - Authlogic を読む (1) - Aut...
  • 2009-03-31 Life on Rails - Ruby on Railsのプラグイン(gem)まとめ
  • 2009-04-03 kurizoの日記 - i18n
  • 2009-04-03 kurizoの日記 - Rails 日本語化

日記の検索
[rails 検索 タグ プラ][検索]
(*)詳細 ( )一覧
プロフィール

mothprog

生物学と情報学の狭間で生きる

