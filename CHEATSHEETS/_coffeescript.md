---
title: CoffeeScriptチートシート
tags: Coffee js CoffeeScript
author: KentFujii
slide: false
---

＊自分用メモ。随時更新

## 文法

### console.log
```
console.log 'aaa'
```
### 変数とスコープ
```
myVariable = "test"
console.log myVariable
```

```
exports = this
exports.MyVariable = "foo-bar"
console.log exports
```

### 関数

```
times = (a, b) -> a * b
console.log times(1, 2)
```

```
sum = (nums...) ->
  result = 0
  nums.forEach (n) -> result += n
  result
console.log sum(1, 2, 3)
```

### オブジェクトと配列

```
object1 = {one: 1, twi: 2}
object2 = one: 1, two: 2
object3 =
  one: 1
  two: 2
console.log object1
console.log object2
console.log object3
```
```
array1 = [1, 2, 3]
array2 = [
  1
  2
  3
]
array3 = [1,2,3,]
console.log array1
console.log array2
console.log array3
```

### 条件分岐

```
if true == true
  console.log "We're ok"
if true != true then console.log "Panic"
if 1 < 0 then console.log "Ok" else console.log "Y2K!"
```

### 文字列の挿入

```
favorite_color = "Blue. no, yel.."
question = "Bridgekeeper: What... is your favorite color?
            Galahd: #{favorite_color}
            Bridgekeeper: Wrong!
           "
console.log question
```

### ループ

```
for name in ["Roger the pickpocket", "Rodrick the robber"]
  console.log "Release #{name}"
for name, i in ["Roger the pickpocket", "Rodrick the robber"]
  console.log "#{i}.Release #{name}"
console.log prisoner for prisoner in ["Roger", "Roderick", "Brian"]
prisoners = ["Roger", "Roderick", "Brian"]
console.log prisoner for prisoner in prisoners when prisoner[0] is "R"
names = sam: 'seaborn', donna: 'moss'
console.log ("#{first} #{last}") for first, last of names
num = 6
minstrel = while num -= 1
  console.log  num + " Brave Sir Robin ran away"
```

### 配列

```
range = [1..5]
console.log range
firstTwo = ["one", "two", "three"][0..1]
console.log firstTwo
numbers = [0..9]
numbers[3..5] = [-3, -4, -5]
console.log numbers
words = ["rattled", "roudy", "rebbles", "ranks"]
console.log "Stop wagging me" if "ranks" in words
```

##クラス


### インスタンスプロパティ

```
class Animal
  price: 5
  sell: "aaa"
animal = new Animal
console.log animal.sell
```

### 静的プロパティ

```
class Animal
  this.find = (name) ->
    name
console.log Animal.find("Parrot")
```

### 継承

```
class Animal
  constructor: (@name) ->
  alive: ->
    false
class Parrot extends Animal
  constructor: ->
    super("Parrot")
  dead: ->
    not @alive()
dog = new Animal('Max')
parrot = new Parrot('Nic')
console.log dog.alive
console.log parrot.dead
```

```
class Animal
  constructor: (@name) ->
class Parrot extends Animal
Animal::rip = true
parrot = new Parrot("Macaw")
console.log "This parrot is no more" if parrot.rip
```

## イディオム

### each

```
arr = [1,2,3,]
for val in arr then console.log val
obj =
  king: 'King'
  queen: 'Queen'
  jack: 'Jack'
for key,val of obj
  console.log val
```

### map

```
arr = [1,2,3,]
result = arr.map (i) -> i * 2
result = (item * 2 for item in arr)
console.log result
```

### select

```
arr = [1,2,3,4,5,6,]
result = (item for item in arr when item % 2 == 0)
console.log result
```

### includes

```
arr = [1,2,3,4,5,6,]
included = 2 in arr
console.log included
```

### property iteration

```
object = {one: 1, two: 2}
console.log ("#{key} = #{value}") for key, value of object
```

### Min/Max

```
max = (Math.max [1,2,3,4,5,]...)
min = (Math.min [1,2,3,4,5,]...)
console.log max
console.log min
```

### destructuring assignment

```
someObject = {a: 'value for a', b: 'value for b'}
{a, b} = someObject
console.log "a is '#{a}', b is '#{b}'"
```

*参考図書:* [The Little Book on CoffeeScript ](http://www.amazon.co.jp/Little-Book-CoffeeScript-Alex-MacCaw-ebook-y/dp/B006ZYZCRQ/ref=sr_1_1?ie=UTF8&qid=1449408753&sr=8-1&keywords=little+book+coffeescript)




### Intro

* No semicolons, use new line
* No curly braces, use indentation
* No parentheses required to invoke function

    ```
    function1 function2 param1, param2
    =
    function1(function2(param1, param2));
    ```

    * HOWEVER - use them usually, better readability, and `@someFunction` very is different to `@someFunction()`

* Functions return the final line

### Operators and aliases

* `==` becomes `===`
* `!=` becomes `!==`
* `is` becomes `===`
* `isnt` becomes `!==`

* `not` alias to `!`
* `and` alias to `&&`
* `or` alias to `||`

* `on` and `yes` alias for `true`
* `off` and `no` alias for `false`

* `unless` is inverse of `if`

* `@` alias to `this`
* `@property` alias to `this.property`

### Strings

* Single quotes = Literal
* Double quotes = Allow for interpolated values, eg:

`“The variable is #{variable} - awesome"`

#### Multiline strings

```
mobyDick = "Call me Ishmael. Some years ago --
  never mind how long precisely -- having little
  or no money in my purse, and nothing particular
  to interest me on shore, I thought I would sail
  about a little and see the watery part of the
  world..."
```

Line breaks are converted into a single space. Indentation is ignored.

#### Blocks trings

Use block strings to hold formatted or indentation-sensitive text:

```
html = """
       <strong>
         cup of coffeescript
       </strong>
```

The indentation level that begins the first block is maintained through-out

#### Block comments

```
###
Line 1
Line 2
###

//becomes...

/*
Line 1
Line 2
*/
```

### Functions

Parameters in parentheses, an arrow, then the function body

```
square = (x) -> x * x

weatherReport = (location) ->
  [location, 72, "Mostly Sunny"]

//JS:

square = function(x) {
  return x * x;
};
```

*Note: There is no need to write ‘return'*

#### Default values

```
fill=(container, liquid ="coffee")
```

### Arrays and objects

Many styles:

```
ong = ["do", "re", "mi", "fa", "so"]

address: [
  "Via Roma 42R"
  "Bellagio, Italy 22021"
]

singers = {Jagger: "Rock”, Elvis: "Roll"}

kids =
  brother:
    name: "Max"
    age:  11
  sister:
    name: "Ida"
    age:  9

yearsOld = max: 10, ida: 9, tim: 11
```

### If, else, unless, and conditional assignment

```
if happy and knowsIt
  clapsHands()
else
  showIt()

mood = greatlyImproved if singing
date = if friday then sue else jill
```

### Loops and comprehensions

* Use `in` to loop over values
* Use `of` to loop over keys

```

for element in array
  # code here


# Loops through food array, assigning ‘food’ to each, and calling eat(food);
eat food for food in [‘toast’, ‘cheese’, ‘chocolate’, ‘wine’] when food isnt ‘chocolate'

shortNames = (name for name in list when name.length < 5)

events = (x for x in [0..10] by 2)

buy() while supply > demand
sell() until supply > demand
```

### Chained comparisons

```
healthy = 200 > cholesterol > 60
```

### Exceptions

```
try
   nonexistent / undefined
catch error
   “The error is: #{error}"
finally
    cleanUp()
```

# Exisential operator

`variable?` returns true unless it is null or undefined

```
solipsism = true if mind? and not world?

footprints = yeti ? “bear” //If ‘yeti’ exists, footprints = yeti, otherwise footprints = “bear"

speed ?= 15 //if ‘speed’ exists, speed = speed, otherwise speed = 15

zip = lottery.drawWinner?().address?.zipcode

```

### Class

```
class Animal
  constructor: (name) ->
    @name = name

  move: (meters) ->
    alert @name + " moved #{meters}m."

class Snake extends Animal
  move: ->
    alert "Slithering..."
    super 5

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"

sam.move()
tom.move()
```

This:

```
constructor: (name) ->
  @name = name
```

Can be shortened to:

```
constructor: (@name) ->
```

### Destructuring Assignment

```
weatherReport = (location) ->
  [location, 72, "Mostly Sunny"]

[city, temp, forecast] = weatherReport "Berkeley, CA"
```

### Switch statements

```
switch day
  when "Mon" then go work
  when "Tue" then go relax
  when "Thu" then go iceFishing
  when "Fri", "Sat"
    if day is bingoDay
      go bingo
      go dancing
  when "Sun" then go church
  else go work
```

Can be cleaner than if statements:

```
score = 76
grade = switch
  when score < 60 then 'F'
  when score < 70 then 'D'
  when score < 80 then 'C'
  when score < 90 then 'B'
  else 'A'
```


---
title: CoffeeScriptでjQueryを使う時「あれ、どう書くの？」パターン
tags: CoffeeScript jQuery laravel
author: yukiyukki
slide: false
---
仕事でlaravelを使うことになり、
それならばとJavascriptについても基本のElixirでサポートしているCoffeeScriptで記述することになりました。

その際CoffeeScriptからjQueryを使用する際記述方法に躓いた箇所がいくつかあったので、参考にまとめておきます :relaxed:
（随時増やすかも）

# on()メソッド
「CoffeeScript jQuery」などでググると、たいていサンプルとして出てくるのは$(element).click()の書き方です。
しかし、最近のjQueryではイベントのバインドについてはon()メソッドの使用を勧められていますので、こちらの書き方を使いましょう。

```js:普通のjQuery
// example-a
$('#hoge').on('click', function() {
  something();
});

// example-b
$('#hoge').on('click', function(ev) {
  ev.preventDefault();
  something();
});

// example-c
$(document).on('click', '.fuga', function() {
  something(this);
});
```

```coffeescript:Coffee
# example-a
$('#hoge').on 'click', ->
  something()

# example-b
$('#hoge').on 'click', (ev) ->
  ev.preventDefault()
  something()

# example-c
$(document).on 'click', '.fuga', ->
  something @
```
# animateメソッド
```js:普通のjQuery
// ありがちなアニメーション
$('.hoge').animate({ width: '100px'}, 'fast');

// ページトップへスクロールする奴
$('body, html').animate({ scrollTop: 0}, 'slow');
```

```coffeescript:Coffee
# ありがちなアニメーション
$('.hoge').animate { width: '100px' }, 'fast'

# ページトップへスクロールするよ
$('body, html').animate { scrollTop: 0 }, 'slow'
```
# メソッドチェーンや、CSSプロパティ指定
```coffeescript:Coffee
$ 'fuga'
  .addClass 'active'
  .css
    'top': '20px'
    'left': '300px'
    'width': '320px'
    'height': '120px'
  .html '適当なhtml'
```

他に何かしら思いついたら、追加していくかもしれません。


==========


###

目次

1.  [**1** 訳注](#TOC-2)
2.  [**2** 基本](#TOC-3)
3.  [**3** 代入](#TOC-4)
4.  [**4** 条件分岐（if, else など）](#TOC-if-else-)
5.  [**5** 演算子（and, or, not など）](#TOC-and-or-not-)
6.  [**6** 繰り返し（while, until）](#TOC-while-until-)
7.  [**7** 関数（function）](#TOC-function-)
8.  [**8** 配列とオブジェクト](#TOC-5)
9.  [**9** スコープ](#TOC-6)
10.  [**10** 可変長引数（Splats）](#TOC-Splats-)
11.  [**11** 配列内包（Array comprehensions）と範囲指定（Range）](#TOC-Array-comprehensions-Range-)
12.  [**12** 配列の範囲指定抽出・置換](#TOC-7)
13.  [**13** 全ては式（できるだけ）](#TOC-8)
14.  [**14** 存在演算子（Existential Operator）](#TOC-Existential-Operator-)
15.  [**15** クラス, 継承, super](#TOC-super)
16.  [**16** 分割代入](#TOC-9)
17.  [**17** 関数バインディング](#TOC-10)
18.  [**18** JavaScriptの埋め込み](#TOC-JavaScript-)
19.  [**19** Switch, When, Else](#TOC-Switch-When-Else)
20.  [**20** Try, Catch, Finally](#TOC-Try-Catch-Finally)
21.  [**21** 連結比較式](#TOC-11)
22.  [**22** 文字列中の式展開, ヒアドキュメント, ブロックコメント](#TOC-12)
23.  [**23** 拡張正規表現](#TOC-13)

### 訳注

サンプルコードなどは[本家のリファレンス](http://jashkenas.github.com/coffee-script/)のものを引用しつつ、勝手＆適当に翻訳しています。

間違いなどあればコメント欄などでご指摘下さい。

CoffeeScriptのバージョンが1.0.1の時のものです。

### 基本

行末のセミコロン `;` は不要。ただし1行に複数の式を書くときは `;` で区切る。



関数に引数を渡す括弧 `(...)` は不要。 `print "coffee"` のように関数を呼べる。ただし引数が無い場合は空の括弧 `( )` が必要。



関数やif文、switch文、try/catch文などでブロックを中括弧 `{...}` で囲む代わりに、Pythonのようにインデントを揃えることでブロックを表現する。なのでインデントは超重要。

### 代入

変数宣言の var は不要。

「`=`」で代入する。（バージョン0.9より前は : だった）



`number   = 42`

`opposite = true`

### 条件分岐（if, else など）

後置のifが使える。



`number = -42 if opposite`



if文の括弧 `( )` や中括弧 `{ }` は不要。

演算子に「and」や「or」を使える。



`if happy and knowsIt`

`  clapsHands()`

`  chaChaCha()`

`else`

`  showIt()`



1行で if/else も書ける。この場合のif文は値を返す。



`date = if friday then sue else jill`



`options || (options = defaults)` の省略記法



`options or= defaults`



値の有無 （null, undefined以外なら真）



`alert "I knew it!" if elvis?`

### 演算子（and, or, not など）

*   等号の「==」は言語によって意味が異なったりして紛らわしく、よくトラブルの元になるので、コンパイル時に「===」に変換される。
*   同様に「!=」は「!==」に変換される。
*   「unless」は「if not 〜」に。
*   1行でif/else文やswitch/when文を書くときは「then」を使う
*   「this.property」は「@property」と書ける
*   「in」 は配列内の値の有無を調べるのに使う
*   「of」 はオブジェクト内の値の有無を調べるのに使う


| 演算子のエイリアス |            |     |     |
| ------------------ | ---------- | --- | --- |
| CoffeeScript       | JavaScript |     |     |
| is                 | Err:510    |     |     |
| isnt               | !==        |     |     |
| not                | !          |     |     |
| and                | &&         |     |     |
| or                 |            |     |     |
| true, yes, on      | true       |     |     |
| false, no, off     | false      |     |     |
| @, this            | this       |     |     |
| of                 | in         |     |     |
| in                 | 無し       |     |     |


`launch() if ignition is on

`

`volume = 10 if band isnt SpinalTap`

`
letTheWildRumpusBegin() unless answer is no`

`
if car.speed < limit then accelerate()`

`
winner = yes if pick in [47, 92, 13]`

`
print inspect "My name is " + @name`

### 繰り返し（while, until）

後置のwhileとuntilが使える。



`# Econ 101（経済学の一番初歩の講座）`

`if this.studyingEconomics`

`  buy()  while supply > demand`

`  sell() until supply > demand`



while, until文は値（配列）を返す。



\# Nursery Rhyme（子守唄）

`num = 6`

`lyrics = while num -= 1`

`  num + " little monkeys, jumping on the bed.`

`    One fell out and bumped his head."`



### 関数（function）

`(引数) -> 式`


という形で書く。 return は不要。

引数がないときは `()` も省略可能。



square = (x) -> x \* x

`cube   = (x) -> square(x) * x`



引数はデフォルト値を持てる。



`fill = (container, liquid = "coffee") ->`

`  "Filling the #{container} with #{liquid}..."`



### 配列とオブジェクト

普通のJavaScriptと同じように書ける。



`song = ["do", "re", "mi", "fa", "so"]`

`singers = {Jagger: "Rock", Elvis: "Roll"}`



「`,`」の代わりに改行でも良い。



`matrix = [`

`  1, 0, 1`

`  0, 0, 1`

`  1, 1, 0`

`]`



オブジェクトはYAMLのように書ける。



`kids =`

`  brother:`

`    name: "Max"`

`    age:  11`

`  sister:`

`    name: "Ida"`

`    age:  9`

`math =`

`  root:   Math.sqrt`

`  square: square`

`  cube:   (x) -> x * square x`



クォートで囲まなくてもオブジェクトのプロパティ名に「class」を使える。



`$('.account').attr class: 'active'`

### スコープ

スコープはRubyと同じ。var は不要。



`outer = 1`

`changeNumbers = ->`

`  inner = -1                # inner は関数内で宣言される。`

`  outer = 10                # この場合 outer は宣言されず、外のスコープのouterが上書きされる。`

`inner = changeNumbers()     # inner は10になる`



CoffeeScript の出力は `(function(){ ... })();` で囲まれる。

### 可変長引数（Splats）

可変長の引数を取りたいときは変数名に「`...`」を付ける。



`race = (winner, runners...) ->`

`  print winner, runners`



配列を可変長の引数として渡すときも「`...`」を使える。



`gold = silver = rest = "unknown"`



`awardMedals = (first, second, others...) ->`

`  gold   = first`

`  silver = second`

`  rest   = others`



`contenders = [`

`  "Michael Phelps"`

`  "Liu Xiang"`

`  "Yao Ming"`

`  "Allyson Felix"`

`  "Shawn Johnson"`

`  "Roman Sebrle"`

`  "Guo Jingjing"`

`  "Tyson Gay"`

`  "Asafa Powell"`

`  "Usain Bolt"`

`]`



`awardMedals contenders...`



### 配列内包（Array comprehensions）と範囲指定（Range）

Pythonのように配列内包表記ができる。

JavaScriptのforループと異なり、配列内包は式なので値（配列）を返す。

eachやforEach, map, select, filterなど色んなループ処理で配列内包を使える。



`cubes = (math.cube num for num in list)`



`eat food for food in ['toast', 'cheese', 'wine']     `\# 注：eatは関数。eat(food) になる。



最初と最後の値が分かっているなら、配列内包で範囲記法（Range）が使える。



`countdown = (num for num in [10..1])`



関数の最後で、単に副作用するループで終わる場合、意図せず配列内包の結果を返してしまわないように注意。

そのような場合は関数の最後で何か明示的に値（trueやnull）を返すようにするとよい。



内包表記はオブジェクトのキーと値を回すのにも使える。

配列の値ではなくオブジェクトのプロパティを渡すときは「`in`」ではなく「`of`」を使う。


`yearsOld = max: 10, ida: 9, tim: 11

ages = for child, age of yearsOld
  child + " is " + age`



もし、何らかの理由で「`for (key in obj) ...`」というループを使いたいときは、代わりに「`for all key, value of object`」という書き方をする。

### 配列の範囲指定抽出・置換

配列から一部を取り出すのに範囲表記（Range）が使える。

2つのドットは最後の値を含む：例えば `(3..6)` は `(3, 4, 5, 6)` になる。
3つのドットは最後の値を含まない：例えば `(3...6)` は `(3, 4, 5)` になる。



`numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

copy = numbers[0...numbers.length]

middle = copy[3..6]`



配列の一部を置き換えるのにも範囲指定記法が使える。



`numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]`



`numbers[3..6] = [-3, -4, -5, -6]`



ただし、文字列では範囲指定置換は使えない。（範囲指定取り出しはできる）

### 全ては式（できるだけ）

関数の`return`は不要で、代わりに最後の値が返される。

CoffeScriptでは全ての文を「式」として扱える（できるだけそうしようとしている）。

例えば、以下のように関数の最後のif文は値を返す。



`grade = (student) ->`

`  if student.excellentWork`

`    "A+"`

`  else if student.okayStuff`

`    if student.triedHard then "B" else "B-"`

`  else`

`    "C"`



`eldest = if 24 > 21 then "Liz" else "Ike"`



関数は常に最後の値を返すが、明示的に return を書く事で関数の途中で値を返すこともできる。



式の中では、初めて出てきた変数にも（varで宣言しなくても）代入できる。実際にコンパイルされたJavaScriptではスコープの最初で変数宣言されている。



`six = (one = 1) + (two = 2) + (three = 3)     # => 6`



CoffeeScriptでは式になるが、JavaScriptでは式にならないような文はクロージャーでラップすることにより式に変換される。

そうすることで、例えば配列内包の結果を変数に入れるといったことができる。



`# The first ten global properties.`

`globals = (name for name of window)[0...10]`



try/catch文も引数として渡すことができる。



`alert(`

`  try`

`    nonexistent / undefined`

`  catch error`

`    "And the error is ... " + error`

`)`



ただし、breakやcontinue、returnなど、式に変換できないJavaScriptの文もある。

CoffeeScriptではそのような文は変換されない。



### 存在演算子（Existential Operator）

JavaScriptで変数に値が入っているかどうかを調べるのはやや面倒で、「 `if (variable)` 」だけだと値が0や空文字, falseのときも偽になるのでうまくいかない。

CoffeeScriptの存在演算子「`?`」を使うと、（Rubyっぽく）値がnullやundefined以外の時は true を返すようになる。



数値や文字列などを条件付き代入するのにも使える。



`solipsism = true if mind? and not world?`



`speed ?= 75`



`footprints = yeti ? "bear"`



プロパティの値が`null`や`undefined`かもしれないとき、プロパティチェーンをドット「.」でつなぐ代わりに「?」を使える。

もし全てのプロパティが存在すれば普通に結果が返ってくるし、チェーンが途中で途切れればTypeErrorが発生する代わりにundefinedが返る。



`zip = lottery.drawWinner?().address?.zipcode
`
\## 訳注：lotteryオブジェクトにdrawWinnerメソッドが存在し、そのメソッドの返り値にaddressプロパティが存在すればzipcodeを返す



### クラス, 継承, super

JavaScriptのプロトタイプの継承は少しやりにくい。Base2、Prototype.js、JS.Classといったライブラリでは標準的なクラスの継承っぽい書き方ができるようになっている。これらのライブラリではいずれも継承のためのシンタックスシュガーを使えるが、素のJavaScriptの継承機能では `super` （親メソッド）を呼びにくく、プロトタイプチェーンを保ったまま継承しにくい。



関数を何度もプロトタイプに加えていく代わりに、CoffeeScriptでは `class `の中でクラス名や親クラス、プロトタイプのプロパティ、コンストラクタなどを簡単に書ける。



また、リフレクションをしやすくするためコンストラクタ関数には名前がつけられる。下のサンプルコードの最初のクラス（Animal）では「`this.constructor.name is "Animal"`」は真となる。



`class Animal`

`  constructor: (@name) ->`



`  move: (meters) ->`

`    alert @name + " moved " + meters + "m."`



`class Snake extends Animal`

`  move: ->`

`    alert "Slithering..."`

`    super 5`



`class Horse extends Animal`

`  move: ->`

`    alert "Galloping..."`

`    super 45`



`sam = new Snake "Sammy the Python"`

`tom = new Horse "Tommy the Palomino"`



`sam.move()`

`tom.move()

`



JavaScriptの標準的なプロトタイプを書くが苦手な人向けに、ローレベルな便利機能がある。

「`extends`」演算子で簡単にプロトタイプを設定することができ、さらに「`::`」でオブジェクトのプロトタイプにアクセスできる（下の例）。

また、「`super()`」で同名の親メソッドを呼べる。



`String::dasherize = ->`

`  this.replace /_/g, "-"

"one_two".dasherize()     # => "one-two"`



クラス定義は（動的に）実行可能なコードで、面白いメタプログラミングもできる。

クラス定義の中では「this（もしくは@）」はクラスオブジェクト自身（コンストラクタ関数）であり、「`@property: value`」で静的変数（クラス変数）に代入でき、「`@attr 'title'`」のようにして親クラスで定義された関数を呼べる。



（ちょっと分かりにくいので追記すると）インスタンス変数、インスタンスメソッド、クラス変数、クラスメソッドはそれぞれ以下のように定義する。



`class Hoge`

`  someInstanceProp: "hoge"       # インスタンス変数`

`  someInstanceMethod: ->         # インスタンスメソッド`

`    @callAnotherInstanceMethod() # インスタンスメソッドを呼ぶ`

`    alert @someInstanceProp      # ==> "hoge"`



`  @someClassProp: "hogehoge"     # クラス変数`

`  @someClassMethod: ->           # クラスメソッド`

`    @callAnotherClassMethod()    # 同一クラスのクラスメソッドを呼ぶ`

`    alert @someClassProp         # ==> "hogehoge"`



### 分割代入

複雑な配列やオブジェクトから簡単に値を取り出すのに、CoffeeScriptではECMAScript Harmonyの[分割代入](http://wiki.ecmascript.org/doku.php?id=harmony:destructuring)記法を使える。下の例のように、配列やオブジェクトを別の値（配列やオブジェクト）に代入すると、右の値と左の変数がお互いマッチするように代入することができる。最も単純な利用法としては、並列代入に使える。



`theBait   = 1000`

`theSwitch = 0`



`[theBait, theSwitch] = [theSwitch, theBait]     # => theBaitは0に、theSwitchは1000になる`



多値を返す関数で使うと便利。



`weatherReport = (location) ->`

`  # Make an Ajax request to fetch the weather...`

`  [location, 72, "Mostly Sunny"]`



`[city, temp, forecast] = weatherReport "Berkeley, CA"`



分割代入は配列やオブジェクトがネストしていても使うことができ、深い階層の値も取り出せる。



`futurists =`

`  sculptor: "Umberto Boccioni"`

`  painter:  "Vladimir Burliuk"`

`  poet:`

`    name:   "F.T. Marinetti"`

`    address: [`

`      "Via Roma 42R"`

`      "Bellagio, Italy 22021"`

`    ]`



`{poet: {name, address: [street, city]}} = futurists`



分割代入は可変長引数（splats）とも併せて使える。



`tag = "<impossible>"`



`[open, contents..., close] = tag.split("")`



### 関数バインディング

JavaScriptでは、「this」は関数が属しているオブジェクトを指す。関数をコールバックとして渡したり、別のオブジェクトに移動したら、 this の元の値は失われる。



CoffeeScriptでは太い矢印 「\=>」も関数定義に使うことができ、その場に this を束縛できる。この機能は、PrototypeやjQueryのようなコールバック関数を用いるライブラリで、eachのようなイテレータやイベントハンドラを渡すとき便利である。太い矢印「`=>`」で定義された関数は、それが定義された場所の this のプロパティを参照できる。



`Account = (customer, cart) ->`

`  @customer = customer`

`  @cart = cart`



`  $('.shopping_cart').bind 'click', (event) =>`

`    @customer.purchase @cart`



もし上の例でコールバック関数の定義に「`->`」を使うと、@customer は未定義（undefined）のcustomerプロパティを参照し、purchase() の呼び出しで例外を投げる。

### JavaScriptの埋め込み

できれば使わないに越したことはないが、JavaScriptのコードをCoffeeScriptの中で使いたいときは、バッククオート「\`」で囲むとよい。



``hi = `function() {``

`  return [document.title, "Hello JavaScript"].join(": ");`

``}` ``



### Switch, When, Else

JavaScriptのSwitch文は少し厄介で、うっかり次のcaseに飛んでしまわないように、全てのcase文の最後でbreakする必要がある。CoffeeScriptではbreakが無くても次のcaseに飛んでしまわないようになっており、代入で使うときはswitch文が値を返すようになっている。

switch文の書式は「switch 条件、when節、else デフォルトケース」となる。



Rubyのように、CoffeeScriptのwhen節は複数の値を取ることができる（下の例の when "Fri", "Sat"）。もしいずれかの値にマッチしたらその節が実行される。



`switch day`

`  when "Mon" then go work`

`  when "Tue" then go relax`

`  when "Thu" then go iceFishing`

`  when "Fri", "Sat"`

`    if day is bingoDay`

`      go bingo`

`      go dancing`

`  when "Sun" then go church`

`  else go work`



### Try, Catch, Finally

try/catch文はJavaScriptとほぼ同じ（ただしCoffeeScriptでは式として使える）。



`try`

`  allHellBreaksLoose()`

`  catsAndDogsLivingTogether()`

`catch error`

`  print error`

`finally`

`  cleanUp()`



### 連結比較式

Pythonのように連結比較式を使うことができ、値がある範囲内にあるかどうかを簡単に調べられる。



`cholesterol = 127`



`healthy = 200 > cholesterol > 60`



### 文字列中の式展開, ヒアドキュメント, ブロックコメント

Rubyと同様に文字列中の式展開ができる。 `#{ ... }` を使うことで、ダブルクオートされた文字列の中に変数や式を書ける。シングルクオート文字列の中では、 `#{ ... }` も文字列として扱われる。



`author = "Wittgenstein"`

`quote  = "A picture is a fact. -- #{ author }"`



`sentence = "#{ 22 / 7 } is a decent approximation of π"`



複数行の文字列も使える。



`mobyDick = "Call me Ishmael. Some years ago --`

` never mind how long precisely -- having little`

` or no money in my purse, and nothing particular`

` to interest me on shore, I thought I would sail`

` about a little and see the watery part of the`

` world..."`



ヒアドキュメントは、改行やインデントが重要なテキストを書くのに使われる。

ヒアドキュメント内のインデントは開始位置（`'''`）に揃えられるため、コード全体のインデントを崩さない。



`html = '''`

`       <strong>`

`         cup of coffeescript`

`       </strong>`

`       '''`



ダブルクオートヒアドキュメント（`"""`で囲まれた複数行文字列）では、ダブルクオート文字列と同様に `#{ ... }` で式展開ができる。



ブロックコメント（`###`で囲まれた複数行コメント）は生成されたJavaScript内にそのまま表示される。

ファイルの先頭にライセンスを埋め込みたい場合など、生成されたJavaScriptにコメントを残したいときに使える。



`###`

`CoffeeScript Compiler v1.0.1`

`Released under the MIT License`

`###`



### 拡張正規表現

ヒアドキュメントやヒアコメントと同様に、CoffeeScriptではヒア正規表現（heregexes）も使える。

Perlの `/x` 修飾子のような拡張正規表現で、正規表現中の空白文字を無視し、正規表現中にコメントを書ける。ただしCoffeeScriptでは `/x` 修飾子の代わりに `///` で正規表現を囲む。

ヒア正規表現を使うことで、複雑な正規表現を読みやすくすることができる。



以下、CoffeeScriptのソースからの引用：

`OPERATOR = /// ^ (`

`  ?: [-=]>             # function`

`   | [-+*/%<>&|^!?=]=  # compound assign / compare`

`   | >>>=?             # zero-fill right shift`

`   | ([-+:])\1         # doubles`

`   | ([&|<>])\2=?      # logic / shift`

`   | \?\.              # soak access`

`   | \.{2,3}           # range or splat`

`) ///`




