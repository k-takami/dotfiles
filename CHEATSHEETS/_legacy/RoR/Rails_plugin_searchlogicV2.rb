Hatena::Diary
[                    ][日記][検索]
  • ブログトップ
  • 記事一覧
  • ログイン
  • 無料ブログ開設

MothProgのうしろがわこのページをアンテナに追加

<[Rails][memo]awesome_nested_se... | [Rails]ビューをRSpecでテストす...>

2009-08-19

スリムになったSearchlogic v2をいじってみた

Rails

SearchlogicはBen Johnson (binarylogic) 氏による使い勝手の良いActiveRecord（以下AR）拡張プラグインだ。使ってみて面白かったので、だいぶ前に
ここでアツイ検索プラグインSearchlogic: pagenation, sortable table - MothProgのうしろがわというエントリーを書いた。ところが、その後編を書く
前に発表になったSearchlogic version 2（以下Searchlogic v2）では、根底の「ロジック」は変わっていないものの、インターフェースやアプローチは
全く異なっていた。

そこで、前回の続きのかわりに、Searchlogic v2の機能をざっとまとめてみた。あわせて、Searchlogicでなにが拡張されるのかを示すために、
ActiveRecordの検索機能についても、ちょこっと覚え書きしておくことにした。

今回も例によって以下の作者によるページをもとに書いているので、正確なところはこちらをどうぞ。すばらしいプラグインに感謝。

  • Searchlogic v2 officially released - Binary Logic
  • binarylogic’s searchlogic at master - GitHub

以下の紹介例では、学生Student（多）ークラブClub（１）という関連をもったテーブルを使って説明する。Studentは、名前を示すname、学年を示す
grade、クラブのIDをもつ。Clubはとりあえず名前nameだけをもつ。

ActiveRecordにおける検索機能

検索の基本、findメソッド

ActiveRecordで最も頻繁に行う処理は、テーブル内のレコード検索だろう。その基本となるのはAR#findメソッドで、以下のようなおなじみのコードを頻
繁に書くことになる。

# 最初の１つを得る
# conditions節に配列を用いる
student  = Student.find(:first, :conditions=>["name = ?", "Ana"])
# conditions節にハッシュを用いる
student  = Student.find(:first, :conditions=>{:name=>"Ana"})

# 全てのレコードを得る
students = Student.find(:all, :conditions=>["name = ?", "Ana"])
students = Student.find(:all, :conditions=>{:name=>"Ana"})

最近では、find(:first), find(:all)のショートカットとして、AR#all, AR#firstメソッドが定義され、ちょっとだけ略記できるようになった。

student  = Student.first(:conditions=>{:name=>"Ana"})
students = Student.all(:conditions=>{:name=>"Ana"})

上の例のように、あるフィールドの値が一致する最初の１つのレコードを得る場合には、動的に定義されるfind_by_xxxという形のメソッド（動的ファイ
ンダ）も使える。複数のフィールドの値で一致するレコードの場合には、find_by_xxx_and_yyyと表記することもできる。

student = Student.find_by_name("Ana")
student = Student.find_by_name_and_grade("Ana", 2)

便利な新機能、named_scope

Rails2.1以降では、findメソッドに加えて、named_scopeという新たな検索方法が提供されている。named_scopeは、モデルクラスで、検索条件としての
findメソッドの引数を名前をつけて設定する機能だ。上の例だと、

class Student
  named_scope :search_ana, :conditions=>{:name=>"Ana"}
  named_scope :search_name, lambda{|n| :conditions=>{:name=>n}}
end

などとする。１つめの例は、conditionsに"Ana"という固定の引数を与えた例、２つめは実行時に引数を取ってconditionsの引数を動的に与える例だ。引
数やロジックを与えるときは、上記のようにブロックで指定し、その返値として定義する。

どちらにせよ、定義したnamed_scopeは、findメソッドで検索する際に、フィルターとして利用する。つまり、以下のように、findメソッド（あるいはそ
のショートカットのfirst, allメソッド）にチェインするようにすればよい。

#利用例
student = Student.search_ana.first
student = Student.search_name("Ana").first

さらに、Rails2.3では、動的ファインダfind_by_xxxに対応する動的スコープscoped_by_xxxが定義されているので、上記の場合は宣言無しに

student = Student.scoped_by_name("Ana").first

と書くこともできて便利だ。

named_scopeのメリット

個人的には、named_scopeを使うメリットは２つあると思う。

  • 検索条件をモデルクラスにカプセル化できること。モデルに関するコードを局在化できるため、テストも含めてメンテナンス性があがるし、検索条件
    の再利用も容易になる。

  • 複数のnamed_scopeをチェインできること。名前だけでなく学年でも検索したいとき、findでは

students = Student.find(:all, :conditions=>{:name=>"Ana"}).find(:all, :conditions=>{:grade=>2})

とは書けない。なぜなら、find文はARのクラスメソッドだが、その返値はARインスタンス（first）またはその配列（all）だからだ。そのため、
conditions節を追記するか、複数条件を動的ファインダで表現するfind_by_xxx_and_yyyを利用して、

students = Student.find(:all, :conditions=>{:name=>"Ana", :grade=>2})
students = Student.find_by_name_and_grade("Ana", 2)

と書かないといけない。

同じことをnamed_scopeでやると、

class Student
  named_scope :search_name_and_grade, lambda{|n, g| :name=>s, :grade=>g}
  ....

students = Student.search_name_and_grade("Ana", 2).all

# 2.3 以降
students = Student.scoped_by_name_and_grade("Ana", 2).all

としてもいいし、二つの条件をわけてnamed_scopeとして定義しておき、

class Student
  named_scope :search_name, lambda{|n| :conditions=>{:name=>n}}
  named_scope :search_grade, lambda{|g| :conditions=>{:grade=>g}}
  ....

students = Student.search_name("Ana").search_grade(2).all

# 2.3 以降
students = Student.scoped_by_name("Ana").scoped_by_grade(2).all

と書くこともできる。さらに絞り込みたければ、他のnamed_scopeあるいはfind文をチェインしていけばよい。

named_scopeを使うと、複雑な条件を単純な条件のチェインで表現できるので、ここでも検索条件の再利用効率とメンテナンス性をあげられるだろう。ま
たnamed_scopeをチェインした場合でも、SQL呼び出しは全体で1回になるのでパフォーマンス上も安心だ。

Searchlogic v2

Searchlogic v2の概要

ようやくSearchlogic v2の話に移れる。新しくなったSearchlogicは、一言で言えばnamed_scopeを大幅に拡張するプラグインで、様々な検索条件を動的ス
コープよりも簡潔かつ柔軟に書けるようになっている。

上記のname="Ana"という検索条件をSearchlogic風に書いてみる。

Student.name_equals("Ana").all

これは、Rails2.3の動的スコープのscoped_by_xxxがxxx_equalsに変わっただけだが、メソッド名が「フィールド名(name)＋演算子(equals_to)」となって
いることに注意が必要だ。実は、この構造がSearchlogic v2のミソになっている。ARの動的ファインダや動的スコープは、引数が完全一致する時しか使え
なかったが、Searchlogicでは演算子の部分を変えることで、それ以外の条件も記述できる。たとえば：

Student.name_does_not_equal("Ana") #否定
Student.name_begins_with("A")      #前方一致
Student.name_ends_with("a")        #後方一致
Student.name_like("n")             #部分一致
Student.name_null

といった具合だ。同様に、数値であればgrade_greater_thanなどが使える（くわしくはドキュメントを参照）。

Searchlogic v2が返すのはnamed_scopeなので、使い方は普通のnamed_scopeと変わりなく、以下のようにすればよい。

student = Student.name_equals("Ana").first

Searchlogic v1とv2

Searchlogic v1とv2は、「フィールド名＋演算子」の形で検索条件が簡潔に書けること、検索条件自体を変数として保持できることは共通している。ただ
し、v1では検索条件変数のクラスがオリジナルなSearchlogic::Cache::[モデル名]Searchであるのに対し、v2ではARデフォルトのnamed_scopeを使ってい
る。これにより、役割の重複したクラスを作成することによりコード量を減らし、他のプラグインやARとの親和性も高めることができた。

また、Searchlogic v1は、様々な機能を実装したオールインワンなプラグインだったが、v2ではページネーションなどAR本体あるいは他のプラグインでカ
バーできる部分が削除された。これにより、プラグインの方向性がより明確になり、機能を把握しやすくなったと思う。

これらの方針で完全に書き直した結果、Searchlogic v2はv1とは完全に別物になり、コードは2300行から400行に減ったという。確かに出来ることは減っ
たが、以上のような理由で使い勝手はむしろ向上したように私は感じる。

少し複雑な例

Searchlogic v2では、このほか、AND/ORによる複数の条件、並び替え、関連テーブルの値の参照も動的スコープとして定義できる。ざっと例をあげてみる
。

#OR条件は_anyプレフィックスを末尾につける
#:conditions=>["name Like '%?%' OR name LIKE '%?%'", 'a', 'b']と同義
students = Students.name_like_any("a", "b")

#AND条件は_allプレフィックスを末尾につける
#:conditions=>["name Like '%?%' AND name LIKE '%?%'", 'a', 'b']と同義
students = Students.name_like_all("a", "b")

#ソート条件はascend_by_xxx, descend_by_xxxで
students = Students.ascend_by_name.all

#関連テーブル名＋フィールド名で関連テーブルの値を参照
# Student has_one :club
# Club has_many :students とする

students = Student.club_name_equals("basketball")

これらの記法を使うと、「名前がa, bのどちらかを含み、バスケットボール部に入っている生徒を名前順に出力する」という検索条件は、

students = Student.name_like_any("a", "b").club_name_equals("basketball").ascend_by_name.all

と書ける。同じものをAR#findのオプションで書くと以下のようになり、SQLで直に書いた方がマシに思えてしまう。

students = Student.all(:conditions=>["(students.name LIKE ? OR students.name LIKE ?) AND clubs.name=?", "%a%", "%b%", "basketball"], :order=>"students.name ASC", :include=>:club)

Searchlogic v2を使うことで、かなり複雑な条件を簡潔に書くことができる。

Searchlogic v2は関連テーブル情報へのアクセスも高速化できる。関連テーブルにアクセスする際に、Searchlogic v2では「関連テーブル名＋フィールド
名」を、findでは:includeオプションを用いるが、前者は後者よりも5倍程度高速だという（公式ドキュメント参照）。

searchメソッド

Searchlogicには、上記のように動的スコープ風の「フィールド名＋演算子」という形とは別に、findのように検索条件をハッシュの引数として指定する
searchメソッドが定義されている。これを使うと、

students = Student.search(:name_equals=>"Ana").all
students = Student.search(:name=>"Ana").all
students = Student.search(:name_like=>"n").all

のように、Searchlogic v2の記法である「フィールド名＋演算子」のハッシュでnamed_scopeを生成できる。2番目の例のように「_equals」は省略しても
構わない。もちろん、返値はnamed_scopeなので、その結果は他のnamed_scopeやfindメソッドにチェインできる。

Searchlogicで記述できないこと

もちろん、Searchlogic v2では書けない条件もある。たとえば、複数のフィールドのOR条件、たとえば「名前がAnaか、学年が2（name = 'Ana' OR grade
= 2）」といった条件は書くことが出来ない。また、SQLで、列記した値に含まれる場合（たとえば、grade in (1,2)など）も書けないが、これについては
ticketがあって目下議論が進められているようだ（Issues - binarylogic/searchlogic - GitHub）。






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
