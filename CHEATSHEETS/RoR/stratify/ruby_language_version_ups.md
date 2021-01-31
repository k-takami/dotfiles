## はじめに
Rubyは毎年12月25日にアップデートされます。


##  version 2.4

### Enumerableモジュールにsumが追加された
Ruby 2.4ではEnumerableモジュールに`sum`メソッドが追加されました。
これにより、配列の中身の合計値を求めたりできます。

```ruby
[1 2 3 4].sum
#=> 10
```

デフォルトの初期値は0ですが、引数で変更できます。

```ruby
[].sum
#=> 0

[1 2 3 4].sum(5)
#=> 15
```

小数の合計値は丸め誤差が発生するので注意してください。

```ruby
[0.1 0.1 0.1].sum
#=> 0.30000000000000004
```

ただし、`sum`メソッドでは内部的に[カハンの加算アルゴリズム](https://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%8F%E3%83%B3%E3%81%AE%E5%8A%A0%E7%AE%97%E3%82%A2%E3%83%AB%E3%82%B4%E3%83%AA%E3%82%BA%E3%83%A0)が使われているため、`+`演算子で加算したときよりも高速で誤差が少なくなりやすいです。

```rb
# 要素が3の場合、誤差は同じ
[0.1 0.1 0.1].sum
#=> 0.30000000000000004
0.1 + 0.1 + 0.1
#=> 0.30000000000000004

# 要素が6の場合は+の方が誤差がない
[0.1 0.1 0.1 0.1 0.1 0.1].sum
#=> 0.6000000000000001
0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1
#=> 0.6

# 要素が10の場合はsumの方が誤差がない
array = Array.new(10 0.1)
array.sum
#=> 1.0
# 素直に+で書くとコードが長くなるのでinjectで代用
array.inject(:+)
#=> 0.9999999999999999

# 要素が99999の場合はsumの方が誤差が小さい
array = Array.new(99999 0.1)
array.sum
#=> 9999.900000000001
array.inject(:+)
#=> 9999.900000018848
```

文字列の配列を連結する場合は初期値に何らかの文字列を渡します。

```ruby
['foo' 'bar'].sum('')
#=> 'foobar'

['foo' 'bar'].sum('>>')
#=> '>>foobar'
```

配列の配列を連結することも可能です。

```ruby
[[1 2] [3 1 5]].sum([])
#=> [1 2 3 1 5]
```

Ruby単体で見たときは後方互換性の問題は生じませんが、ActiveSupport等のサードパーティgemでsumが実装されていた場合は完全に互換性があるとは限らないので注意が必要、とのことです。

参考: [Feature \#12217: Introducing Enumerable\#sum for precision compensated summation and revert r54237](https://bugs.ruby-lang.org/issues/12217)


### 整数を1桁ずつ配列に入れて返すInteger#digits

Ruby 2.4では整数を1桁ずつ配列に入れて返す`Integer#digits`メソッドが追加されました。値は1桁目、2桁目・・・の順番で格納されます。

```ruby
123.digits
#=> [3 2 1]
```

基数を指定するとn進数の1桁目、2桁目・・・と値を格納することもできます。

```ruby
0x7b.digits(16)
#=> [11 7]

123.digits(16)
#=> [11 7]
```

マイナスの値に対して`digits`を呼び出すとエラーになります。

```ruby
-123.digits
#=> Math::DomainError: out of domain
```

参考: [Feature \#12447: Integer\#digits for extracting digits of place\-value notation in any base](https://bugs.ruby-lang.org/issues/12447)

## 主に文字列・正規表現に関連する新機能

### 正規表現に文字列がマッチしたかどうかだけを返すRegexp#match?、String#match?、Symbol#match?

Ruby 2.4では正規表現に文字列がマッチしたかどうかだけを返す`Regexp#match?`メソッドが追加されました。
このメソッドは`match`メソッドよりも高速で、なおかつグローバル変数の`$~`を変更しない、という特徴もあります。

```ruby
def test_regexp_match?
  # match?メソッドはグローバル変数の$~を変更しない
  assert /\d+-\d+-\d+/.match?('2016-09-01')
  assert_nil $~

  # 以下のメソッドは$~を変更する
  assert /\d+-\d+-\d+/.match('2016-09-01')
  assert_equal '2016-09-01' $~[0]

  assert /\d+-\d+-\d+/ =~ '2016-09-02'
  assert_equal '2016-09-02' $~[0]

  assert /\d+-\d+-\d+/ === '2016-09-03'
  assert_equal '2016-09-03' $~[0]
end
```

以下の記事では`match?`メソッドと既存のメソッドの速度比較が載っています。
たとえば`match`メソッドに比べると`match?`メソッドは4.88倍速いそうです。

[New Features in Ruby 2\.4 \- BlockScore Blog](https://blog.blockscore.com/new-features-in-ruby-2-4/)

~~なお、`match`メソッドとは異なり、Stringクラスには`match?`メソッドは定義されていません。~~
rc1にてStringクラス、Symbolクラスにも`match?`メソッドが実装されました。

```rb
'2016-09-01'.match?(/\d+-\d+-\d+/)
#=> true

:hello_world.match?(/\w+_\w+/)
#=> true
```

参考: [Feature \#8110: Regex methods not changing global variables](https://bugs.ruby-lang.org/issues/8110)

### 名前付きキャプチャをハッシュとして返すMatchData#named_captures

Ruby 2.4では正規表現にマッチした名前付きキャプチャをハッシュとして返す`MatchData#named_captures`メソッドが追加されました。
ハッシュのキーはシンボルではなく文字列になります。

```ruby
def test_match_data_named_captures
  m = /(?<year>\d+)-(?<month>\d+)-(?<day>\d+)/.match('2016-09-01')
  assert_equal(
      {'year' => '2016' 'month' => '09' 'day' => '01'}
      m.named_captures
  )
end
```

参考: [Feature \#11999: MatchData\#to\_h to get a Hash from named captures](https://bugs.ruby-lang.org/issues/11999)

### MatchData#values_atで名前付きキャプチャの名前を指定できるようになった

Ruby 2.3までは`MatchData#values_at`メソッドで指定できるのは、キャプチャした文字列のインデックスだけでしたが、Ruby 2.4では名前付きキャプチャの名前を指定できるようになりました。
名前は文字列、またはシンボルで指定できます。

```ruby
def test_match_data_values_at
  m = /(?<year>\d+)-(?<month>\d+)-(?<day>\d+)/.match('2016-09-01')
  assert_equal(['2016' '01'] m.values_at(1 3))
  # Ruby 2.4からは文字列またはシンボルで名前を指定可能
  assert_equal(['2016' '01'] m.values_at('year' 'day'))
  assert_equal(['2016' '01'] m.values_at(:year :day))
end
```

参考: [Feature \#9179: MatchData\#values\_at should support named capture](https://bugs.ruby-lang.org/issues/9179)


### ハッシュの値を特定のルールで変更するHash#transform_values

Ruby 2.4ではHashクラスに`transform_values`メソッドが追加され、ハッシュの値を特定のルールで変更できるようになりました。
破壊的な変更を行う`transform_values!`メソッドもあります。

```ruby
def test_hash_transform_values
  x = {a: 1 b: 2 c: 3}
  # ハッシュの値を2乗する
  y = x.transform_values {|v| v ** 2 }
  assert_equal({a: 1 b: 4 c: 9} y)
  # 変数xの中身は変わっていない
  assert_equal({a: 1 b: 2 c: 3} x)

  # 破壊的メソッドを適用すると変数xの中身が変わる
  x.transform_values! {|v| v ** 2 }
  assert_equal({a: 1 b: 4 c: 9} x)
end
```

ちなみにこのメソッドはRuby on Rails（ActiveSupport）の同名メソッドをRuby本体にインポートしたものです。

http://api.rubyonrails.org/classes/Hash.html#method-i-transform_values

参考: [Feature \#12512: Import Hash\#transform\_values and its destructive version from ActiveSupport](https://bugs.ruby-lang.org/issues/12512)


### CSVデータでダブルクオートの不正なフォーマットを許容するliberal_parsingオプション

Ruby 2.4ではCSVデータをパースする際に、ダブルクオートを使った不正なフォーマットのCSVデータを許容する`liberal_parsing`オプションが追加されました。

ダブルクオートを使った不正なフォーマットのCSVデータというのは、たとえばこんな文字列のことです。

```
"Johnson Dwayne"Dwayne "The Rock" Johnson
```

本来であれば以下のような文字列にするのが正です。
（値にダブルクオートが含まれる場合は、ダブルクオートで囲んだ上で、ダブルクオートを重ねる）

```
"Johnson Dwayne""Dwayne ""The Rock"" Johnson"
```

以下は不正なCSVデータを`liberal_parsing`オプションを付けてパースするコード例です。

```ruby
def test_csv_liberal_parsing_option
  require 'csv'

  # ダブルクオートを使った不正なフォーマットのCSVデータを用意する
  input = '"Johnson Dwayne"Dwayne "The Rock" Johnson'

  # liberal_parsingオプションなしだとエラー
  assert_raises(CSV::MalformedCSVError) { CSV.parse_line(input) }

  # liberal_parsingオプションありだとパース可能
  assert_equal(
      ['Johnson Dwayne' 'Dwayne "The Rock" Johnson']
      CSV.parse_line(input liberal_parsing: true)
  )
end
```

参考: [Feature \#11839: CSV: liberal\_parsing option](https://bugs.ruby-lang.org/issues/11839)

### Logger.newのキーワード引数追加

Ruby 2.4では`Logger.new`のキーワード引数として`level`、`progname`、`formatter`、`datetime_format`が追加されました。

```ruby
def test_logger_options
  require 'logger'
  formatter = proc { |severity timestamp progname msg| "#{severity}:#{msg}\n\n" }
  logger = Logger.new(
      STDERR
      level: :info
      progname: :progname
      formatter: formatter
      datetime_format: "%d%b%Y@%H:%M:%S"
  )
  assert_equal Logger::INFO logger.level
  assert_equal :progname logger.progname
  assert_equal formatter logger.formatter
  assert_equal "%d%b%Y@%H:%M:%S" logger.datetime_format
end
```

ちなみに、Ruby 2.3以前ではインスタンス作成後にプロパティをセットする必要がありました。

```ruby
logger = Logger.new($stdout)
logger.level = :info
```

参考: [Feature \#12224: logger: Allow specifying log level in constructor](https://bugs.ruby-lang.org/issues/12224)

## スレッドに関連する新機能

### 別スレッドの例外を報告するかどうかを決めるThread.report_on_exceptionフラグ

Ruby 2.4では別スレッドで発生した例外を報告するかどうかを決める`Thread.report_on_exception`フラグが追加されました。
このフラグをtrueにすると、別スレッドで例外が発生した場合にその内容が報告されます。

```ruby
def without_flag
  puts 'Starting some parallel work'
  thread =
      Thread.new do
        sleep 0.1
        fail 'something very bad happened!'
      end
  sleep 0.2
  puts 'Done!'
end
# フラグ無しで実行すると、エラーが報告されない
without_flag
#=> Starting some parallel work
#=> Done!

def with_flag
  # フラグにtrueをセットする
  Thread.report_on_exception = true

  puts 'Starting some parallel work'
  thread =
      Thread.new do
        sleep 0.1
        fail 'something very bad happened!'
      end
  sleep 0.2
  puts 'Done!'
end
# フラグありで実行すると、エラーが報告される
with_flag
#=> Starting some parallel work
#=> #<Thread:0x007fe1731faf20@(irb):66 run> terminated with exception:
#=> (irb):68:in `block in bar': something very bad happened! (RuntimeError)
#=> Done!
```

上記のコードは以下の記事を参考にしました。

[New Features in Ruby 2\.4 \- BlockScore Blog](https://blog.blockscore.com/new-features-in-ruby-2-4/)

参考: [Feature \#6647: Exceptions raised in threads should be logged](https://bugs.ruby-lang.org/issues/6647)


## 文法上の変更点（これ以降はPreview 3とrc1）

### rescue修飾子付きのコードを ( ) で囲んでメソッドの引数として渡せるようになった

以下のようなコードはこれまで構文エラーになっていましたが、Ruby 2.4では実行可能になりました。

```ruby
# rescue修飾子付きのコードを ( ) で囲んでメソッドの引数として渡す
p (nil.split rescue nil)
#=> nil
```

なお、Ruby 2.3以前では`SyntaxError: syntax error unexpected modifier_rescue expecting ')'`というエラーが出て実行できませんでした。

参考： [Feature \#12686: Allowing a postposed rescue in a method argument](https://bugs.ruby-lang.org/issues/12686)

## 後方互換性が失われる変更点

### <s>roundメソッドがデフォルトで偶数丸めをするようになった</s> => halfオプションの追加のみになりました（rc1）

<s>roundメソッドで四捨五入する際のルールが「偶数丸め」になりました。</s>

preview3の時点では偶数丸めがデフォルトになっていましたが、その後の議論によりrc1ではデフォルトの挙動は従来通り（つまり0.5なら切り上げ）になりました。

[Bug \#12958: Breaking change in how \`\#round\` works \- Ruby trunk \- Ruby Issue Tracking System](https://bugs.ruby-lang.org/issues/12958)

結果として、Ruby 2.4では`round`メソッドに`half: :up`と`half: :even`のオプションが追加されただけになります。
というわけで以下はrc1の仕様に準拠した解説です。

`round`メソッドに`half`オプションが追加されました。
`half`オプションには`:up`と`:even`の2種類の値が渡せます。

- `:up` = 0.5は必ず切り上げ（デフォルト、2.3以前と同等）
- `:even` = 偶数丸め（2.4から登場した新しい仕様）

偶数丸めは「最近接丸め」「JIS丸め」「ISO丸め」とも呼ばれ、「端数がちょうど0.5なら切り捨てと切り上げのうち結果が偶数となる方へ丸める」という端数処理の考え方です。

参考： [端数処理 \- Wikipedia](https://ja.wikipedia.org/wiki/%E7%AB%AF%E6%95%B0%E5%87%A6%E7%90%86#.E6.9C.80.E8.BF.91.E6.8E.A5.E5.81.B6.E6.95.B0.E3.81.B8.E3.81.AE.E4.B8.B8.E3.82.81)

以下はデフォルトの`round`メソッドの結果と、`half: :even`を指定した場合の挙動の違いです。

```ruby
# デフォルト（0.5は必ず切り上げ）
12.5.round
# => 13
13.5.round
#=> 14

# 偶数丸め
12.5.round(half: :even)
#=> 12
13.5.round(half: :even)
#=> 14
```

なお、IntegerやRationalも`round`メソッドで`half`オプションを渡すことができます。

```ruby
# Ruby 2.4
125.round(-1 half: :even)
#=> 120
135.round(-1 half: :even)
#=> 140

(125r / 10).round(half: :even)
#=> 12
(135r / 10).round(half: :even)
#=> 14
```

参考：[Bug \#12548: Rounding modes inconsistency between round versus sprintf](https://bugs.ruby-lang.org/issues/12548)

参考：[Bug \#12958: Breaking change in how \`\#round\` works \- Ruby trunk \- Ruby Issue Tracking System](https://bugs.ruby-lang.org/issues/12958)



## irbの変更点

### プログラムの実行中にirbが開けるbinding.irbメソッドの追加

Pryを使っていると`binding.pry`というコマンドをコードに埋め込むことで、プログラムの実行中にPryを開くことができます。

これと同じように、irbでも`binding.irb`というコマンドでirbが開けるようになりました。

```ruby
# irbをrequireする
require 'irb'

s = 'hello'
puts s

# ここでirbを開く
binding.irb

puts 'bye'
```

上のコードを実行すると、次のように途中でirbが起動します。

![Screen Shot 2016-11-16 at 08.37.18.png](https://qiita-image-store.s3.amazonaws.com/0/7465/2e89060f-687c-929c-bc6b-01620869db9c.png "Screen Shot 2016-11-16 at 08.37.18.png")

参考：[Revision 56624 \- irb\.rb: Binding\#irb \* lib/irb\.rb \(Binding\#irb\): new method like Binding\#pry\.](https://bugs.ruby-lang.org/projects/ruby-trunk/repository/revisions/56624)



### Setに同じインスタンスかどうかで重複を判断するモードが追加された

Ruby 2.4ではSetクラスに`compare_by_identity`メソッドが追加されました。
このメソッドを呼び出すと、同じインスタンスかどうか（つまり`eql?`ではなく`equal?`の結果）で重複を判断します。

また、`compare_by_identity?`メソッドを使うと、どちらのモードになっているのかを確認できます。

```ruby
def test_set_compare_by_identity
  require 'set'

  set = Set.new
  values = ['a' 'a' 'b' 'b']
  set.merge(values)
  refute set.compare_by_identity?
  assert_equal ['a' 'b'] set.to_a

  set = Set.new
  values = ['a' 'a' 'b' 'b']
  set.compare_by_identity
  set.merge(values)
  assert set.compare_by_identity?
  assert_equal ['a' 'a' 'b' 'b'] set.to_a
end
```



### unpackの1要素目を返すunpack1メソッドが追加された（rc1）

Ruby 2.4では`unpack`の戻り値から1要素目だけを返す`unpack1`メソッドが追加されました。

```ruby
def test_unpack1
  # unpackは配列を返す
  assert_equal [65 66 67] "ABC".unpack("C*")

  # unpackは1要素目だけを返す
  assert_equal 65 "ABC".unpack1("C*")
end
```

[Feature \#12752: Unpacking a value from a binary requires additional '\.first' \- Ruby trunk \- Ruby Issue Tracking System](https://bugs.ruby-lang.org/issues/12752)

## ディレクトリやファイルに関連する新機能
Pathnameクラスにempty?メソッドが追加された
なお、Preview 2では`Dir`クラスと`File`クラスにも`empty?`メソッドが追加されています。


### テキストファイルを行単位で読み込む際に、chompするかどうかを指定できるようになった

`IO#gets` `IO#readline` `IO#each_line` `IO#readlines` `IO#foreach`で`chomp`オプションを指定できるようになりました。
このオプションを指定すると、最初から`chomp`した状態（つまり改行文字を削除した状態）で各行のテキストを取得できます。
File.open(tf.path) do |f|
  # chompして読み込む
  assert_equal ["abc" "def" "ghi"] f.readlines(chomp: true)
end


### Refinementsで使われているモジュールを取得する`Module.used_modules`メソッドが追加された

Ruby 2.4では現在のスコープのRefinementsで使われているモジュールを取得する`Module.used_modules`メソッドが追加されました。

```ruby
module StringPugs
  refine String do
    def pugs
      "Pugs!"
    end
  end
end

# Refinementsで使った1つ目のモジュール
using StringPugs

module Awesome
  def xxx
    'awesome'
  end
end

module SuperAwesome
  refine Awesome do
    def xxx
      "not #{super} but super-awesome"
    end
  end
end

# Refinementsで使った2つ目のモジュール
using SuperAwesome

class Person
  include Awesome

  def say
    "I am #{xxx}!"
  end
end

class RefinementsTest < Minitest::Test
  def test_used_modules
    assert_equal [StringPugs SuperAwesome] Module.used_modules
  end
end
```

参考：[Feature \#7418: Kernel\#used\_refinements](https://bugs.ruby-lang.org/issues/7418)



### 警告発生時の振る舞いをカスタマイズできるようになった

Ruby 2.4ではWarningというモジュールが組み込みライブラリに追加されました。
このモジュールには`warn`というクラスメソッドを持っています。
Rubyの実行中に警告が出力された際はこの`Warning.warn`メソッドが呼び出されるので、このメソッドをオーバーライドすると、警告の出力を取得したり加工したりすることができます。

以下は発生した警告を配列として保持し、後から取得するコード例です。

```ruby
module Warning
  # これはRuby 2.4で追加されたメソッドのオーバーライド
  def self.warn(msg)
    warnings << msg
    super
  end

  # これは独自に追加したクラスメソッド
  def self.warnings
    @warnings ||= []
  end
end

class WarningTest < Minitest::Test
  def setup
    Warning.warnings.clear
  end

  def test_warn
    # 警告を発生させるため、わざとFixnumクラスを参照する
    assert Fixnum == Integer

    # 出力された警告をちゃんと保持しているかどうかの検証
    assert_equal 1 Warning.warnings.size
    msg = Warning.warnings.first
    assert msg.include?('warning: constant ::Fixnum is deprecated')
  end
end
```

ちなみに、Warningというクラス名は普通の英単語なので、みなさん自身が既存のコードで独自に定義している可能性もあります。
既存のコードでWarningというクラスを定義していると、Ruby 2.4にアップデートしたタイミングで名前の衝突が起きてエラーになるので注意してください。

```ruby
# Ruby 2.4
class Warning
end
#=> TypeError: Warning is not a class
```

参考：[Feature \#12299: Add Warning module for customized warning handling](https://bugs.ruby-lang.org/issues/12299)




## version 2.5


## オブジェクト全般の新機能

### ブロックの実行結果がそのまま戻り値になるyield_self

Ruby 2.5ではレシーバがブロックの引数になり、ブロックの結果がそのまま戻り値になる`yield_self`が追加されました。
Kernelモジュールのメソッドなので、すべてのオブジェクト（BasicObjectを除く）で使用できます。

```ruby
# レシーバ（= 2）を受け取り、ブロックの戻り値（= 2 * 10）がメソッド全体の戻り値になる
2.yield_self { |n| n * 10 } #=> 20
```

以下は配列に含まれる文字列をカンマで連結し、さらにそれを丸括弧で囲むコード例です。

```ruby
names = ['Alice' 'Bob']
names.join(' ').yield_self { |s| "(#{s})" } #=> "(Alice Bob)"
```

ちなみに、`yield_self`についてはこちらの記事でも紹介されています。

[Ruby2\.5で導入されるyield\_selfについて \- Qiita](https://qiita.com/opt-link/items/8195f3a03859bcb10920)

- 参考: [Feature \#6721: Object\#yield\_self](https://bugs.ruby-lang.org/issues/6721)

## 文字列/正規表現に関する新機能

### 接頭辞や接尾辞を削除するdelete_prefix/delete_suffix

Ruby 2.5では文字列から接頭辞や接尾辞を削除する`delete_prefix`と`delete_suffix`が追加されました。

```ruby
'invisible'.delete_prefix('in') #=> "visible"
'pink'.delete_prefix('in') #=> "pink"

'worked'.delete_suffix('ed') #=> "work"
'medical'.delete_suffix('ed') #=> "medical"
```

- 参考: [Feature \#12694: Want a String method to remove heading substr](https://bugs.ruby-lang.org/issues/12694)
- 参考: [Feature \#13665: String\#delete\_suffix](https://bugs.ruby-lang.org/issues/13665)



## ハッシュに関する新機能

### キーを特定のルールで変換するtransform_keys/transform_keys!

Ruby 2.5ではハッシュのキーを特定のルールで変換する`transform_keys`が追加されました。

```ruby
hash = { a: 1 b: 2 }
hash.transform_keys { |k| k.to_s }
#=> { 'a' => 1 'b' => 2 }
```

`transform_keys!`はレシーバのハッシュ自身を変更させます（破壊的メソッド）。

```ruby
hash = { a: 1 b: 2 }
hash.transform_keys! { |k| k.to_s }
#=> { 'a' => 1 'b' => 2 }

hash
#=> { 'a' => 1 'b' => 2 }
```

ちなみにRuby 2.4ではハッシュの値を変換する`transform_values`メソッドが追加されていました。

```ruby
hash = {a: 1 b: 2 c: 3}
hash.transform_values {|v| v ** 2 } #=> {a: 1 b: 4 c: 9}
```

- 参考: [Feature \#13583: Adding \`Hash\#transform\_keys\` method](https://bugs.ruby-lang.org/issues/13583)



### 正しい精度で平方根を返すInteger.sqrt

`round`メソッドと同様、`Math.sqrt`メソッドも引数をFloatとして扱うために、大きな数では精度が狂うケースがありました。

```ruby
n = 10**46
# 数学的には 100000000000000000000000 が正
Math.sqrt(n).to_i #=> 99999999999999991611392
```

このようなケースではRuby 2.5で追加された`Integer.sqrt`を使うと、正しい値が返ってきます。

```ruby
n = 10**46
Integer.sqrt(n) #=> 100000000000000000000000
```

なお、平方根の値が小数になる場合は小数点以下が切り捨てられます。
引数が整数以外の数値であれば、最初に整数に変換されてから平方根を計算します。

```ruby
Math.sqrt(3)      #=> 1.7320508075688772
Integer.sqrt(3)   #=> 1
Integer.sqrt(9.9) #=> 3
```

- 参考: [Feature \#13219: bug in Math\.sqrt\(n\)\.to\_i to compute integer squareroot new word to accurately fix it](https://bugs.ruby-lang.org/issues/13219)



## ファイル/ディレクトリ操作に関する新機能

### Dir#globメソッドに起点となるディレクトリを指定できるbaseオプションが追加された

Ruby 2.5では`Dir#glob`メソッドに起点となるディレクトリを指定できるbaseオプションが追加されました。

```ruby
# ./test/dir_aディレクトリを起点とし、".rb"で終わるファイルを探す
Dir.glob('./*.rb' base: './test/dir_a')
```

- 参考: [Feature \#13056: base option to Dir\.glob](https://bugs.ruby-lang.org/issues/13056)

### "."や".."を返さないDir#children/each_childメソッド

Rubyには指定されたパス内のファイルエントリ名を返す`Dir#entries`メソッドがあります。

```ruby
Dir.entries('./test/dir_a')
#=> ['.' '..' 'code_a.rb' 'text_a.txt']
```

ただし、上の結果を見ると分かるように`entries`メソッドでは"."や".."もファイルエントリとして返却されます。

Ruby 2.5で追加された`Dir#children`メソッドを使うと、"."や".."が含まれなくなります。

```ruby
Dir.children('./test/dir_a')
#=> ['code_a.rb' 'text_a.txt']
```

`Dir#each_child`メソッドは配列ではなく、Enumeratorオブジェクトを返します。

```ruby
Dir.each_child('./test/dir_a')
#=> #<Enumerator: Dir:each_child(\"./test/dir_a\")>"

Dir.each_child('./test/dir_a').to_a
#=> ['code_a.rb' 'text_a.txt']
```

- 参考: [Feature \#11302: Dir\.entries and Dir\.foreach without \["\." "\.\."\]](https://bugs.ruby-lang.org/issues/11302)



### Pathnameクラスにインスタンスメソッドの`glob`が追加された

Ruby 2.5ではPathnameクラスにインスタンスメソッドの`glob`が追加されました。これにより、「Railsアプリのspecディレクトリ以下にある全rbファイルを、Pathnameオブジェクトの配列として取得する」というようなコードが簡潔に書けるようになります。

```ruby
# Ruby 2.4の場合
pathnames = Pathname.glob(Rails.root.join('spec/**/*.rb'))

# Ruby 2.5の場合
pathnames = Rails.root.glob('spec/**/*.rb')
```

- 参考: [Feature \#7360: Adding Pathname\#glob](https://bugs.ruby-lang.org/issues/7360)



### 例外クラス名、例外メッセージ、バックトレースが1つの文字列として返る`Exception#full_message`

Ruby 2.5では例外クラス名、例外メッセージ、バックトレースが1つの文字列として返る`Exception#full_message`メソッドが追加されました。



### `binding.irb`の機能改善

Ruby 2.4ではプログラムの実行中にirbが開ける`binding.irb`メソッドが追加されました。

- [プログラムの実行中にirbが開けるbinding\.irbメソッドの追加 (Ruby 2.4)](https://qiita.com/jnchito/items/9f9d45581816f121af07#%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0%E3%81%AE%E5%AE%9F%E8%A1%8C%E4%B8%AD%E3%81%ABirb%E3%81%8C%E9%96%8B%E3%81%91%E3%82%8Bbindingirb%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89%E3%81%AE%E8%BF%BD%E5%8A%A0)

Ruby 2.5ではこの`binding.irb`に関して以下のような機能改善が行われました。

- `require 'irb'`を明示的に書かなくても自動的にirbライブラリが読み込まれる
- 実行が停止した行の周辺コードが表示される

以下は`binding.irb`でコードを停止したときの表示例です。

```
$ ruby ./test/binding_irb_sample.rb

From: ./test/binding_irb_sample.rb @ line 6 :

     1: class Test
     2:   attr_accessor :x :y :z
     3:   def initialize(x y z)
     4:     @x = x
     5:     @y = y
 =>  6:     binding.irb
     7:     @z = z
     8:   end
     9: end
    10:
    11: Test.new(1 2 3)

irb(#<Test:0x00007f9f5f02fe08>):001:0>
```

- 参考: [Bug \#13099: Binding\#irb does not work outside of irb](https://bugs.ruby-lang.org/issues/13099)
- 参考: [Feature \#14124: Show source around binding\.irb on irb startup](https://bugs.ruby-lang.org/issues/14124)




### 英数字のみで構成されるランダムな文字列を生成する`SecureRandom.alphanumeric`

Ruby 2.5では英数字のみで構成されるランダムな文字列を生成する`SecureRandom.alphanumeric`メソッドが追加されました。

```ruby
require 'securerandom'
SecureRandom.alphanumeric #=> "cr12XFfO3FbtAHB1"
SecureRandom.alphanumeric #=> "Rg96LmqVWQ2DoNzu"
```



## version 2.6


### select/select!のエイリアスメソッドとしてfilter/filter!が追加された

Ruby 2.6ではselect/select!のエイリアスメソッドとしてfilter/filter!が追加されました。



### ランダムなバイト文字列を返すRandom.bytes

Ruby 2.6ではランダムなバイト文字列を返すRandom.bytesが追加されました。

```ruby
Random.bytes(1)
#=> "\xBD"

Random.bytes(3)
#=> "\x9A\xEE\x06"
```

- 参考: [Feature \#4938: Add Random\.bytes \[patch\]](https://bugs.ruby-lang.org/issues/4938)



## Kernelモジュールに関する新機能や変更点

### yield_selfのエイリアスメソッドとしてthenが追加された

Ruby 2.5で追加されたKernel#yield_selfのエイリアスメソッドとして、Ruby 2.6ではKernel#thenが追加されています。

yield_self/thenは、レシーバがブロックの引数になり、ブロックの結果がそのまま戻り値になるメソッドです。

```ruby
# 文字列を大文字にし、それから逆順にする
"Hello world!".then(&:upcase).then(&:reverse)
#=> "!DLROW OLLEH"
```

issueを見ていると、yield_selfという名前がしっくりきていない人が多いらしく、then以外にもいろいろと代替案が出ていました。

- 参考: [Feature \#14594: Rethink yield\_self's name](https://bugs.ruby-lang.org/issues/14594)

### Kernel#Integer等の数値変換メソッドに:exceptionオプションが追加された

RubyにはKernel#Integerのように、渡されたオブジェクトを数値に変換するメソッドがあります（大文字で始まっていますが、これはメソッドです）。

```ruby
# Integerメソッドを使って整数値に変換する
Integer(10)   #=> 10
Integer("20") #=> 20
```

数値に変換できなかった場合はこれまで必ず例外が発生していましたが、Ruby 2.6では`:exception`オプションを使って、例外発生の有無を選択できるようになりました。

```ruby
# Ruby 2.5までは変換に失敗すると例外が発生していた
Integer("abc")
#=> ArgumentError (invalid value for Integer(): "abc")

# Ruby 2.6では:exceptionオプションで例外の発生を制御できるようになった
Integer("abc" exception: false)
#=> nil
```




## ProcやMethodオブジェクトに関する新機能や変更点

### 関数を合成する`>>`メソッドと`<<`メソッド

Ruby 2.6ではProcやMethodオブジェクトに合成した関数を返す`>>`メソッドと`<<`メソッドが追加されました。

以下は`Proc#>>`を使うコード例です。

```ruby
# テキストを行ごとに分割する関数
f_split_lines = -> (str) { str.split("\n") }
# 配列をソートする関数
f_sort = -> (elements) { elements.sort }
# 配列の各要素を改行文字で連結する関数
f_join = -> (elements) { elements.join("\n") }

# Proc#>>メソッドを使って関数を合成する
f = f_split_lines >> f_sort >> f_join

# ランダムに人名が並んだテキストを用意
text = <<TEXT
carol
dave
bob
ellen
alice
TEXT

# 上で合成した関数を使って、テキストの行を並び替える
puts f.call(text)
#=> alice
#   bob
#   carol
#   dave
#   ellen

# Ruby 2.6で追加されたthenを使うのもよいかも
puts text.then(&f)
#=> alice
#   bob
#   carol
#   dave
#   ellen
```

`Method#>>`でも同じことができます。

```ruby
def split_lines(str)
  str.split("\n")
end

def sort(elements)
  elements.sort
end

def join_lines(elements)
  elements.join("\n")
end

# Method#>>メソッドを使って関数を合成する
f = method(:split_lines) >> method(:sort) >> method(:join_lines)

puts f.call(text)
#=> alice
#   bob
#   carol
#   dave
#   ellen
```

`<<`メソッドは`>>`メソッドとは逆で、右辺、左辺の順に関数を実行します。

```ruby
# f1、f2の順に実行される
f = f2 << f1
```

- 参考: [Feature \#6284: Add composition for procs](https://bugs.ruby-lang.org/issues/6284)




## ファイル操作関連の新機能や変更点

### インスタンスメソッドのDir#each_childとDir#childrenが追加された

Ruby 2.5では"."や".."を返さない、クラスメソッドのDir.each_childとDir.childrenが追加されました。

Ruby 2.6ではこれらのインスタンスメソッド版が追加されています。

```ruby
dir = Dir.new('./test/dir_a')

filenames = []
dir.each_child { |name| filenames << name }
filenames
#=> ['code_a.rb' 'text_a.txt']

dir.children
#=> ['code_a.rb' 'text_a.txt']
```

- 参考: [Feature \#13969: Dir\#each\_child](https://bugs.ruby-lang.org/issues/13969)

### 新規ファイルに排他的にアクセスする`x`オプションの追加

Ruby 2.6では、新規ファイルに排他的にアクセスできる`x`オプションが追加されました。
これを使うと、間違って既存のファイルを上書きしてしまう可能性を排除できます。

```ruby
File.exist?('./test/dir_a/text_a.txt')
#=> true

# 従来のwオプションだと誤って上書きする恐れがある
open('./test/dir_a/text_a.txt' 'w') do |f|
  # write file...
end

# xオプションを付けると、新規のファイルしか開けない
# （既存のファイルがあれば例外が発生する）
open('./test/dir_a/text_a.txt' 'wx') do |f|
  # write file...
end
#=> Errno::EEXIST: File exists @ rb_sysopen - ./test/dir_a/text_a.txt
```

`x`オプションを使わない場合は、「ファイルの存在チェックをして、なければ書き込み」というロジックを書く必要がありますが、これはロジックが増えるだけでなく、「書き込みする直前に別のプロセスが同名のファイルを作成するリスク」がゼロではありません。
`x`オプションを使えば、このリスクを確実に回避できます。

- 参考: [Feature \#11258: add 'x' mode character for O\_EXCL](https://bugs.ruby-lang.org/issues/11258)




## その他の新機能や変更点

普段あまり使わない機能についてはよいコード例が思いつかなかったので、簡単に概要を紹介するだけに留めます。
詳しい方がいたら、補足説明をお願いします！

- `$SAFE` はプロセスグローバルで扱われることになると共に、0以外を設定した後に0に戻せるようになりました（[リリースノート](https://www.ruby-lang.org/ja/news/2018/12/25/ruby-2-6-0-released/)より引用、[参考](https://bugs.ruby-lang.org/issues/14250)）
- `Binding#source_location` の追加（[リリースノート](https://www.ruby-lang.org/ja/news/2018/12/25/ruby-2-6-0-released/)、[参考1](https://bugs.ruby-lang.org/issues/14230)、[参考2](https://bugs.ruby-lang.org/issues/4352)）
- `RubyVM::AbstractSyntaxTree`（AST、抽象構文木）モジュールの追加。ただし、実験段階なので互換性は保証されていないとのこと（[リリースノート](https://www.ruby-lang.org/ja/news/2018/12/25/ruby-2-6-0-released/)参照）
- TracePoint関連のメソッドやイベントの追加（[NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS)ページ参照）
- Thread関連の仕様変更（[参考1](https://bugs.ruby-lang.org/issues/14757)、[参考2](https://bugs.ruby-lang.org/issues/14937)）




## version 2.7
---
title: サンプルコードでわかる！Ruby 2.7の主な新機能と変更点 Part 3 - 新機能と変更点の総まとめ
tags: Ruby
author: jnchito
slide: false
---


### シンタックスハイライトや自動インデントなど、irbが大きく進化した

**進化その1) シンタックスハイライトされる**
**進化その2) 自動的にインデントしてくれる**
**進化その3) 上下キーで複数行の入力履歴をまとめて行き来できる**
**進化その4) TABキーを押すと入力候補を表示してくれる**
**進化その5) TABキーを2回押すとクラスやメソッドのドキュメントを表示してくれる**

**~/.irbrcを編集してirbの設定を変更する**

冒頭のメッセージにもあったように、`~/.irbrc`に以下の設定を追加するとデフォルトの起動モードを変えられます。

```~/.irbrc
# trueなら新しいバージョン、falseなら以前のバージョンで起動
IRB.conf[:USE_MULTILINE] = true
```

自動インデントを無効化する場合は、以下の設定を追加します。

```~/.irbrc
IRB.conf[:AUTO_INDENT] = false
```

入力履歴はデフォルトで1000件保存されます。（`~/.irb_history`という履歴ファイルが作成されます）
履歴をもっと増やしたい、または減らしたい、という場合は`~/.irbrc`で好みの件数を設定できます。（nilを設定すると入力履歴が無効化されます）

```~/.irbrc
IRB.conf[:SAVE_HISTORY] = 2000
```

参考: [What's new in Interactive Ruby Shell \(IRB\) with Ruby 2\.7 – Saeloun Blog](https://blog.saeloun.com/2019/09/23/new-irb-features.html)

**2020.5.8追記：Ruby 2.7のirbがペーストすると遅すぎる問題について**

すごく便利になったRuby 2.7のirbですが、その副作用として（？）長い複数行テキストをペーストしたときにめちゃくちゃ遅くなる（最悪ハングする）という問題があります（Ruby 2.7.1で確認）。

[pasting in multiline irb is slow · Issue \#43 · ruby/irb](https://github.com/ruby/irb/issues/43)

これは`rails console`を経由した場合も同じです。

この問題を回避するためには、`--legacy`や`--nomultiline`のオプションを付けて、以前のバージョンで起動する必要があります。

```
$ irb --legacy
```

ただし、`rails console`ではこの方法が使えないため、上で紹介したように`~/.irbrc`に以下の設定を入れてください。

```~/.irbrc
IRB.conf[:USE_MULTILINE] = true
```

### カテゴリ別に警告の表示・非表示を制御できるコマンドラインオプションが追加された

Ruby 2.7では `-W` オプションが拡張され、カテゴリ別に警告の表示・非表示が制御できるようになりました。

**非推奨（deprecation）警告を非表示にする**

```
ruby -W:no-deprecated your_code.rb
```

**試験的機能（experimental feature）警告を非表示にする**


```
ruby -W:no-experimental your_code.rb
```

**RUBYOPT環境変数を使って制御する**

RUBYOPT環境変数を使って制御することもできます。

```
RUBYOPT=-W:no-deprecated bundle exec rspec
```

複数のオプションを指定したい場合は次のようにスペースで区切ります。

```
RUBYOPT='-W:no-deprecated -W:no-experimental' bundle exec rspec
```



## Comparable

### clampメソッドに範囲オブジェクトを渡せるようになった

Ruby 2.7ではclampメソッドに範囲オブジェクトが渡せるようになりました。

```ruby
# Ruby 2.6以前
-1.clamp(0 2) #=> 0
1.clamp(0 2)  #=> 1
3.clamp(0 2)  #=> 2

# Ruby 2.7からは範囲オブジェクトも渡せる
-1.clamp(0..2) #=> 0
1.clamp(0..2)  #=> 1
3.clamp(0..2)  #=> 2
```

ちなみに、clampメソッドはRuby 2.4で追加された比較的新しいメソッドです。

参考 [指定された範囲内の値を返すようにするComparable\#clamp](https://qiita.com/jnchito/items/9f9d45581816f121af07)




### select(filter)とmapを同時に行うfilter_mapメソッドが追加された

Ruby 2.7ではselect(filter)とmapを同時に行うfilter_mapメソッドが追加されました。
このメソッドを使うとブロックの戻り値が真であるものだけがmapの結果として返されます。

```ruby
numbers = [1 2 3 4 5]
# filter_mapを利用して偶数の要素だけ値を10倍する（奇数は要素から除外）
numbers.filter_map { |n| n * 10 if n.even? }
#=> [20 40]

# Ruby 2.6以前だと下のどちらかの書き方になる
numbers.select(&:even?).map { |n| n * 10 }
numbers.map { |n| n * 10 if n.even? }.compact
```

なお、破壊的な`filter_map!`メソッドは用意されていないようです。

```ruby
numbers.filter_map! { |n| n * 10 if n.even? }
#=> NoMethodError (undefined method `filter_map!' for [1 2 3 4 5]:Array)
```

### 要素ごとの個数をカウントするtallyメソッドが追加された

Ruby 2.7では要素ごとの個数をカウントするtallyメソッドが追加されました。

```ruby
order = ['ピザ' 'パスタ' 'ピザ' 'ドリア' 'ドリア']
order.tally
#=> {'ピザ' => 2 'パスタ' => 1 'ドリア' => 2}

# Ruby 2.6以前で同等のことを実現するコード例
order.each_with_object(Hash.new(0)) { |o h| h[o] += 1 }
#=> {'ピザ' => 2 'パスタ' => 1 'ドリア' => 2}
```

ちなみに、tallyという名前は線の本数で数を表現する、[tally marks](https://en.wikipedia.org/wiki/Tally_marks)（[画線法](https://ja.wikipedia.org/wiki/%E7%94%BB%E7%B7%9A%E6%B3%95)）に由来するそうで

![](https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Tally_marks_3.svg/240px-Tally_marks_3.svg.png)
![](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Tally_marks.svg/240px-Tally_marks.svg.png)

## Enumerator

### 自由なデータ変更を伴いつつ、無限のシーケンスを生成できるproduceメソッドが追加された

Ruby 2.7では自由なデータ変更を伴いつつ無限のシーケンスを生成できるproduceメソッドが追加されました。

```ruby
# 1を順番にインクリメントさせるシーケンスから最初の5つを取り出す
# （第1引数の1はシーケンスの初期値）
Enumerator.produce(1 &:succ).take(5)
#=> [1 2 3 4 5]

# 0から999までのランダムな数字を5つ作成する（初期値を与えないパターン）
Enumerator.produce { rand(1000) }.take(5)
#=> [110 725 554 755 861]
```

[こちらの記事](https://blog.saeloun.com/2019/11/27/ruby-2-7-enumerator-produce)にはproduceメソッドを使ってフィボナッチ数列を作成するコード例が載っていました。

```ruby
# https://blog.saeloun.com/2019/11/27/ruby-2-7-enumerator-produce
Enumerator.produce([0 1]) { |base_1 base_2|
  [base_2 base_1 + base_2]
}.take(10).map(&:first)
#=> [0 1 1 2 3 5 8 13 21 34]
```

### lazyなenumeratorを非lazyなenumeratorに変換するeagerメソッドが追加された

Ruby 2.7ではlazyなenumeratorを非lazyなenumeratorに変換するeagerメソッドが追加されました。

```ruby
# lazyなenumeratorを作成する
lazy = [1 2 3].lazy.map { |x| x * 2 }

# 非lazyなenumeratorに変換する
enum = lazy.eager

# Enumeratorのインスタンスになっている
# （eagerを呼ばなければEnumerator::Lazyのインスタンス）
enum.class #=> Enumerator

# 非lazyなので普通に配列で返ってくる
# （lazyのままだと、またEnumerator::Lazyが返るので、to_aする必要がある）
enum.map { |x| x / 2 }
#=> [1 2 3]
```

[Feature \#15901: Enumerator::Lazy\#eager \- Ruby master \- Ruby Issue Tracking System](https://bugs.ruby-lang.org/issues/15901)



## Fiber

### resumeすると同時にresumeされたfiber内で例外を発生させるraiseメソッドが追加された

Ruby 2.7はresumeすると同時にresumeされたfiber内で例外を発生させるraiseメソッドが追加されました。

```ruby
fib = Fiber.new do
  counter = 0
  loop { counter += Fiber.yield }
  counter
end
fib.resume
fib.resume(10)
fib.resume(100)

# raiseメソッドを使ってfiber内でStopIteration例外を発生させ、ループを終了させる
# ループが終了するとcounterの値が返ってくる
fib.raise(StopIteration)
#=> 110
```

[Feature \#10344: \[PATCH\] Implement Fiber\#raise \- Ruby master \- Ruby Issue Tracking System](https://bugs.ruby-lang.org/issues/10344)


## Module

### 定数の定義場所を返すconst_source_locationメソッドが追加された

Ruby 2.7では`Module#const_source_location`メソッドを使って、定数の定義場所を確認できるようになりました。

```ruby
module ConstantExample
  FOO = 123
end

# const_source_locationメソッドを呼ぶと、定義場所のパスと行番号が返る
ConstantExample.const_source_location(:FOO)
#=> ["(your path)/const_example.rb" 2]
```



### ruby2_keywordsメソッドが追加された（未執筆）

（僕は使い方がいまいちよくわからなかったので、@tmtmsさんの以下のブログ記事を参照してください🙏）

- [Ruby 2\.7 の変更点 \- Module \- @tmtms のメモ](https://tmtms.hatenablog.com/entry/201912/ruby27-module)
- [Ruby 2\.7 の変更点 \- 2\.7\.0\-rc2 \- @tmtms のメモ](https://tmtms.hatenablog.com/entry/201912/ruby27-rc2)


## Symbol

### start_with?メソッドとend_with?メソッドが追加された

Ruby 2.7ではSymbolクラスに`start_with?`メソッドと`end_with?`メソッドが追加されました。
文字通りレシーバであるシンボルが指定された文字列で始まっていれば（または終わっていれば）trueを、そうでなければfalseを返します。

```ruby
:foo_bar.start_with?('foo') #=> true
:foo_bar.start_with?('oo')  #=> false

:foo_bar.end_with?('bar')   #=> true
:foo_bar.end_with?('ba')    #=> false
```

ちなみに引数は文字列で指定します。シンボルで指定すると例外が発生します。

```ruby
:foo_bar.start_with?(:foo)
#=> TypeError (no implicit conversion of Symbol into String)
```

## Time

### ミリ秒以下を切り上げ/切り下げできるceil/floorメソッドが追加された

Ruby 2.7ではTimeクラスにミリ秒以下を切り上げ/切り下げできるceil/floorメソッドが追加されました。

```ruby
# ミリ秒以下に10桁の値を持つTimeオブジェクトを作成する
t = Time.utc(2010 3 30 5 43 "25.0123456789".to_r)
t.iso8601(10)
#=> 2010-03-30T05:43:25.0123456789Z

# ミリ秒以下を切り上げる
t.ceil(0).iso8601(10)
#=> 2010-03-30T05:43:26.0000000000Z
t.ceil(5).iso8601(10)
#=> 2010-03-30T05:43:25.0123500000Z

# ミリ秒以下を切り下げる
t.floor(0).iso8601(10)
#=> 2010-03-30T05:43:25.0000000000Z
t.floor(5).iso8601(10)
#=> 2010-03-30T05:43:25.0123400000Z
```



### inspectメソッドがミリ秒の情報も返すようになった

Ruby 2.7では`Time#inspect`メソッドがミリ秒の情報も返すようになりました。

```ruby
t = Time.new(2010 3 30 5 43 "25.0123456789".to_r '+09:00')

# Ruby 2.6ではinspectもto_sも返ってくる文字列は同じ
t.to_s
#=> 2010-03-30 05:43:25 +0900
t.inspect
#=> 2010-03-30 05:43:25 +0900

# Ruby 2.7ではinspectメソッドがミリ秒以下の情報も返す
t.inspect
#=> 2010-03-30 05:43:25 123456789/10000000000 +0900
```


Ruby 2.3〜2.6の新機能は以下の記事にまとめてあります。
こちらもあわせてどうぞ。

- [サンプルコードでわかる！Ruby 2\.3の主な新機能 \- Qiita](https://qiita.com/jnchito/items/0faac073cb77417d61c7)
- [サンプルコードでわかる！Ruby 2\.4の新機能と変更点 \- Qiita](https://qiita.com/jnchito/items/9f9d45581816f121af07)
- [サンプルコードでわかる！Ruby 2\.5の主な新機能と変更点 Part 1 \- Qiita](https://qiita.com/jnchito/items/f182b6f0093a6a3701a1)
- [サンプルコードでわかる！Ruby 2\.5の主な新機能と変更点 Part 2 \- Qiita](https://qiita.com/jnchito/items/0d2d17a79a3e82fe3815)
- [サンプルコードでわかる！Ruby 2\.6の主な新機能と変更点 \- Qiita](https://qiita.com/jnchito/items/ce11cb7fccdf4b66af24)













