#デバッグとログ関連
  >>> import pdb; pdb.set_trace()
  print "AAA",                # 最後の引数の後ろにカンマ(,)をつけると、改行しません。
  print("hoge" end="") #=> 末尾の改行なしで出力
#演算子
  a in b           # a が b に含まれる (a, b は共に文字列、または、b はリストやタプル)
  a not in b       # a が b に含まれない (a, b は共に文字列、または、b はリストやタプル)
  a[n:m:s]      # 文字列 a の中の n 番目から m 番目までの文字列を s個とばしで取り出します
  a // b        # 切り捨て除算
  a //= b       # a = a // b に同じ
#withブロック
with を用いると、withブロックが終了した際に、オブジェクトの終了処理が自動的に呼ばれます。
  with open("test.txt") as f:
      print f.read()
#オブジェクト一括消去
del x, y, z  オブジェクトx, y, zを削除します。



有理数

==========================================

---
title: ruby でこう書くのは、python ならこう書く、のメモ
tags: Ruby Python
author: Nabetani
slide: false
---
ruby に慣れていて python に慣れていないんだけど、python を書く機会が増えてきたので備忘録のような感じで。

python は完全に初心者。
python 3。python 2.x のことは気にしないことにした。

手元の処理系

* ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]
* Python 3.5.2 :: Anaconda 4.2.0 (x86_64)

で確認している

#長さ

```ruby:ruby
ary_len = [1,2,3].size # [1,2,3].length でもいい
hash_len = {a:1}.size # {a:1}.length でもいい
string_len = "hoge".size # "hoge".length でもいい

range_len = (1..9).size # Range#length はない。
```

```python3:python3
ary_len = len([1,2,3])
dic_len = len({"a":1})
string_len = len("hoge")
range_len = len(range(1,10)) # 1〜9
```

まあこの辺りは簡単。

# Object の周辺

## 型

```ruby:ruby
[].class #=> Array
1.class #=> Integer
[].is_a?(Enumerable) #=> true
Enumerable===[] #=> true
Enumerable==="" #=> false
[1,1.0,1r,1i].map{ |x| x.is_a?( Numeric ) } #=> [true, true, true, true]
```

```python3:python3
type([]) #=> <class 'list'>
type(1) #=> <class 'int'>
```
ruby の `Enumerable` かどうかに相当しそうな処理は、以下の通り：

```python3:python3
from collections import Iterable
isinstance([], Iterable) #=> True
isinstance("", Iterable) #=> True
```

※ special thanks to 大樹さん( http://twitter.com/WniKwo/status/838737021719883776 )

ruby の文字列は Enumerable じゃないけど、python の文字列は Iterable なので要注意。

python で ruby の `Numeric` のようなクラスを使う例は下記：

```python3:python3
from numbers import Number
[isinstance(x,Number) for x in [1.0, 1, ""]] #=> [True,True,False]
```

※ special thanks to 大樹さん( http://twitter.com/WniKwo/status/838742967426809856 )

Number と Iterable。import すると基底クラスの名前にアクセスできるようになるということだろうか。

## 複製

```ruby:ruby
copied = [1,2,3].dup
```

```python3:python3
import copy
copied = copy.copy([1,2,3])
```

一般的なオブジェクトの複製には、python では import が必要。
とはいえ、リストのコピーは以下のイディオム、メソッド、コンストラクタが使える：

```python3:python3
copied1 = [1,2,3][:] # たぶんこれが普通。
copied2 = [1,2,3].copy()
copied3 = list([1,2,3]) # たぶんコンストラクタ
```

dict にも copy メソッドがある：

```python3:python3
copied = {1:2}.copy()
copied = dict({1:2}) # たぶんコンストラクタ
```

※ special thanks to 大樹さん ( http://twitter.com/WniKwo/status/838745054864793600 )
※ special thanks to cielavenir さん( http://qiita.com/Nabetani/items/50b0f6533a15d8fb2ae5#comment-293cb5a474296a799d72 )

しかし。numpy の array は `[:]` でコピーにならない。

```python3
import numpy as np
a=np.array([1,2,3])
b=a[:]
b[2]=100
print(a) #=> [  1   2 100]
```

罠だね。コピーしたい場合には `b=a.copy()` のように copy メソッドを使うか、コンストラクタを使う。


## 比較

```ruby:ruby
[]==[] #=> true 普通の比較
[].equal?([]) #=> false 同じオブジェクトを指しているかどうか
```

```python3:python3
[]==[] #=> true 普通の比較
[] is [] #=> false 同じオブジェクトを指しているかどうか
```

## 文字列化

```ruby:ruby
"hoge".to_s #=> 「hoge」
"hoge".inspect #=> 「"hoge"」
65.chr #=> "A"
```

```python3:python3
str("hoge") #=>「hoge」
repr("hoge") #=> 「'hoge'」
chr(65) #=> "A"
```

※ special thanks to cielavenir さん : http://qiita.com/Nabetani/items/50b0f6533a15d8fb2ae5#comment-5281280cd4820f63f52f


# Array の周辺

## range から list/array への変換

```ruby:ruby
(1..10).to_a #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
[*1..10] #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

```python3:python3
list(range(1,11)) #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

※ special thanks to あんちもん2 さん : http://twitter.com/antimon2/status/838192408873488385


## 部分を取り出す

```ruby:ruby
[*10..100][10,3] #=> [20, 21, 22]
[*10..100][10..12] #=> [20, 21, 22]
```

```python3:python3
list(range(10,101))[10:13] #=> [20, 21, 22]
```
他に書き方はないのかなぁ。

## 部分の変更

```ruby:ruby
a=[*1..5]
a[2,2]=9 # a[2,2]=[9] でも同じ。
a # => [1, 2, 9, 5]
```

```python3:python3
a=list(range(1,6))
a[2:4]=[9] # a[2:4]=9 とは書けない
a #=> [1, 2, 9, 5]
```

ruby は、`a[2,2]=9` とか `a[2..3]=[9]` とか、いろいろ書き方があるけど、python は上記の一種類だけかな。

## 最後

```ruby:ruby
[1,2,3][-1] #=> 3
[1,2,3].last #=> 3
[1,3,5,7,9].last(2) #=> [7, 9]
```

```python3:python3
[1,2,3][-1] #=> 3
[1,3,5,7,9][-2:] #=> [7,9]
```

python に last メソッドはないみたい。

## push / unshift

```ruby:ruby
a=[1,2,3]
a.push 9
a.unshift 8
a #=> [8,1,2,3,9]
```

```python3:python3
a=[1,2,3]
a.append(9)
a.insert(0,8)
a #=> [8,1,2,3,9]
```

python には、先頭に追加する専用のメソッドはないみたい。

## pop / shift

```ruby:ruby
a=[1,2,3,4]
b = a.pop
c = a.shift
[ a, b, c ] #=> [[2, 3], 4, 1]

d=[1,2,3,4]
e=d.pop(2) # 先頭の２個を e に移動
[d,e] #=> [[1,2],[3,4]]

```

```python3:python3
a=[1,2,3,4]
b = a.pop()
c = a.pop(0)
[ a, b, c ] #=> [[2, 3], 4, 1]

d=[1,2,3,4]
e=d[-2:]
d[-2:]=[]
[d,e] #=> [[1,2],[3,4]]
```

python は pop にどこから取ってくるかの引数があって、0 を指定すると `shift` の動きになる。
python の `d[-2:]=[]` は、`del d[-2:]` でもいい。

※ special thanks to cielavenir さん : http://qiita.com/Nabetani/items/50b0f6533a15d8fb2ae5#comment-25eff4b893d11a726f51

ruby の `d.pop(2)` に相当するメソッドは python にはない模様。

## map

```ruby:ruby
[1,2,3].map{ |x| x*2 } #=> [2,4,6]
%w( 1 2 3 ).map(&:to_i) #=> [1,2,3]
```

```python3:python3
[x*2 for x in [1,2,3]] #=> [2,4,6]
list(map(int,["1","2","3"])) #=>[1,2,3]
```

## inject / reduce

```ruby:ruby
[1,2,3].inject(0){ |acc,x| acc+x } #=> 6
[1,2,3].inject(0, &:+) #=> 6
```

```python3:python3
import functools
functools.reduce(lambda x,y:x+y, [1,2,3], 0) #=> 6
functools.reduce(int.__add__, [1,2,3], 0) #=> 6
```

上記の例は、`int.__add__` ではなく、`operator.add` を使ったほうが良い。

special thanks to antimon2 さん：see http://qiita.com/Nabetani/items/50b0f6533a15d8fb2ae5#comment-bb3beb6fe012b4ebefe6

## select

```ruby:ruby
[1,2,3,4].select{ |x| x.even? } #=> [2, 4]
```

```python3:python3
[x for x in [1,2,3,4] if x%2==0 ] #=>[2, 4]
```

## 最大値

```ruby:ruby
[1,5,13,21].max #=> 21
[1,5,13,21].max_by{ |x| x % 10 } #=> 5
```

```python3:python3
max([1,5,13,21]) #=> 21
max([1,5,13,21],key=lambda x:x%10 ) #=> 5
```

## flatten

```ruby:ruby
[1,[[2,3],4],5].flatten #=> [1,2,3,4,5]
```

python に flatten はないらしい。
see http://d.hatena.ne.jp/xef/20121027/p2

## uniq

```ruby:ruby
%w( f o o b a r b a z ).uniq #=>  ["f", "o", "b", "a", "r", "z"]
```

```python3:python3
list(set("foobarbaz")) #=> ['z', 'f', 'b', 'a', 'o', 'r'] 順番が保存されない
```

順番を保存したい場合は [Python Tips：リストから重複した要素を削除したい](http://www.lifewithpython.com/2013/11/python-remove-duplicates-from-lists.html) のようにする



## 非破壊的 sort

```ruby:ruby
[1,5,13,20].sort_by{ |x| x%10 } #=> [20,1,13,5]
```

```python3:python3
sorted([1,5,13,20], key=lambda x:x % 10 ) #=> [20, 1, 13, 5]
```

python の sort は安定。ruby の sort は安定ではない。

## 逆順

```ruby:ruby
a=[1,3,5,7]
a.reverse #=> [7,5,3,1] 非破壊的
a.reverse! # 破壊的に逆順
a #=> [7,5,3,1]
```

```python:python3
a=[1,3,5,7]
list(reversed(a)) #=>[7, 5, 3, 1] 非破壊的
a[::-1] #=> [7, 5, 3, 1] 非破壊的
a.reverse() # 破壊的に逆順
a #=> [7,5,3,1]
```

素人には「`::-1`」は思いつかない。
`reversed` の返戻値は、`list_reverseiterator` であって、`list` ではないので要注意。

## zip

```ruby:ruby
[1,2,3].zip(%w(a b c)) #=> [[1, "a"], [2, "b"], [3, "c"]]
[1,2,3].zip(%w(a b)) #=> [[1, "a"], [2, "b"], [3, nil]]
```

```python3:python3
list(zip([1,2,3],["a","b","c"])) #=> [(1, 'a'), (2, 'b'), (3, 'c')]
list(zip([1,2,3],["a","b"])) #=> [(1, 'a'), (2, 'b')]
```

ruby はレシーバに合わせられる。
python は短い方に合わせられる。

python は、`zip` しただけだと `list` にはならない。`list` のコンストラクタに渡すとタプルのリストになる。


# 乱数

## サンプリング

```ruby:ruby
[1,2,3].sample #=> 1 or 2 or 3
[1,3,5].sample(2) #=> [5,3], [1,5] など。重複しない。
```

```python3:python3
import random
random.choice( [1,2,3] ) #=> 1 or 2 or 3
random.sample( [1,3,5], k=2 ) #=> [5,3], [1,5] など。重複しない。
```

## 0以上1未満の浮動小数点数

```ruby:ruby
rand
```

```python3:python3
import random
random.random()
```

## 0以上10未満の整数

```ruby:ruby
rand(10)
```

あるいは

```ruby:ruby
rng=Random.new
rng.rand(10)
rng.rand(0..9)
rng.rand(0...10)
```

```python3:python3
import random
random.randint(0,9)
```

python の範囲指定は両端含む。

#制御構造

## if文

```ruby:ruby
a=if 1.even?
  "foo"
elsif 1.odd?
  "bar"
else
  "baz"
end
```

```python3:python3
if 1%2==0:
    a="foo"
elif 1%2==1:
    a="bar"
else:
    a="baz"
```

python は ruby と違って if 文は値を持たない。ruby の `elsif` は、python は `elif`。また、後置ifはない。

## case〜when

python には、case〜when や switch〜case に相当する制御構造はない。

## 繰り返し

```ruby:ruby
10.times do |num|
  do_something
end

loop do # 無限ループ
  break if some_condition
end
```

```python:python3
for num in range(10):
  do_something()

while True: # 無限ループ
  if some_condition():
    break
```


# リテラル

全般的に、ruby はリテラルがたくさんあるけど python には(rubyとくらべると)あまりない。

## 有理数

```ruby:ruby
a=1.3r #=> (13/10)
```

```python3:python3
import fractions
fractions.Fraction(13,10) #=> 13/10 に相当する値
```

有理数リテラルは python にはない。

## 正規表現

```ruby:ruby
/.\s./.match("hello, world")[0] #=> ", w"
```


```python3:python3
import re
re.search( r".\s.", "hello, world" ).group(0) #=> ', w'
```



正規表現リテラルは python にはない。r"" の は生の文字列という意味の r。

## 文字列リテラル内の式展開

```ruby:ruby
"3**10=#{3**10}" #=>  "3**10=59049"
```

```python3:python3
"3**10=%d" % 3**10 #=>  "3**10=59049"
```
python に式展開はない( 3.6 にはあるようです。[special thanks to norioc さん]( http://qiita.com/Nabetani/items/50b0f6533a15d8fb2ae5#comment-8d953dd1a02dbd398891 ))。printf のようなことをする必要がある。

# 入出力

## バッファのフラッシュ

```ruby:ruby
print("hoge")
$stdout.flush()
```

```python
print("hoge", end="", flush=True)
```

`import sys` として `sys.stdout.flush()` としてもよい。

## print と puts

```ruby:ruby
print("hoge") #=> 末尾の改行なしで出力
puts("hoge") #=> 末尾の改行ありで出力
```

```python3:python3
print("hoge", end="") #=> 末尾の改行なしで出力
print("hoge") #=> 末尾の改行ありで出力
```


## ファイルやディレクトリの存在

```ruby
File.exist?("foo") #=> foo が file または directory なら true
File.file?("foo") #=> foo が file なら true
File.directory?("foo") #=> foo が directory なら true
```

```python3:python3
import os
os.path.exists("foo") #=> foo が file または directory なら true
os.path.isfile("foo") #=> foo が file なら true
os.path.isdir("foo") #=> foo が directory なら true
```

~~python には ruby の `File.exist?` に相当するメソッドはなさそう。~~
os.path.exists があることに気づいていなかった。
@tokyo_gs さん、ありがとうございます。

## ファイル open/close

```ruby:ruby
a=File.open("hoge.txt"){ |f| f.read(10) }
```

```python3:python3
with open("hoge.txt") as f:
    a=f.read(10)
```

python は、with を使うとファイルを自動的に閉じてくれる。

## ファイルへの書き込み。

`f` は `open` で取れるファイルだとして：

```ruby:ruby
f.puts("hoge") # 末尾に改行がつく
f.print("fuga") # 末尾に改行がつかない
f.write("piyo") # 末尾に改行がつかない
```

```python:python3
print("piyo", file=f) # 末尾に改行がつく
f.write("hoge") # 末尾に改行がつかない
f.write("piyo\n") # 末尾に改行をつけるもう一つの方法
```

python は、`f.print(略)` とは書けない。
`print(略, file=f)` は、すごく意外だった。


# 未分類

## 条件演算

```ruby:ruby
cond=true
val = cond ? "iftrue" : "iffalse"
```

```python3:python3
cond=True
val = "iftrue" if cond else "iffalse"
```

python の条件演算は、いまのところ全然慣れられそうにない。

## combination

```ruby:ruby
[1,2,3].combination(2).to_a #=> [[1, 2], [1, 3], [2, 3]]
```

```python3:python3
import itertools
list(itertools.combinations([1,2,3],2)) #=> [(1, 2), (1, 3), (2, 3)]
```

python は複数形。タプルになるところがポイント。
`permutations` もある。

## Thread

```ruby:ruby
Array.new(4){ |ix| Thread.new{ print ix } }.each(&:join) #=> 2103 とか
```

```python3:python3
import threading
ts=[threading.Thread(target=(lambda x=x:print(x))) for x in range(4)]
for t in ts:
   t.start()
for t in ts:
   t.join()
```

~~ruby のブロックは変数をキャプチャする際、値の参照を利用するので普通（個人の感想です）に書けばうまくいく。~~

＜2018/3/17 訂正＞
ruby でうまくいくのは、ix という変数がスコープの中に閉じ込められていて毎回生成されるからだと思う。
＜／2018/3/17 訂正＞

python の方は デフォルト引数が怪しげだけど、lambda を使うのなら、こうしたり、二重にしたりしないとうまくいかない。理由は、python の lambda は、変数の参照をキャプチャするから。（合ってるよね？）
これが気持ち悪い人は、lambda を使わず target にメソッドを指定すれば良い。

※ spechal thanks to antimon2 さん : see http://qiita.com/Nabetani/items/50b0f6533a15d8fb2ae5#comment-c27e1b9d252c25853f0b


## uuid

```ruby:ruby
require 'securerandom'
SecureRandom.uuid #=> => "72568c47-e6e0-4f21-a8b5-dad3d72831b2"
```

```python3:python3
import uuid
str(uuid.uuid4()) #=> '9414a2d6-b954-4519-bf88-47828d6d2577'
```

secrets というモジュールでセキュアな乱数を作れるが、 python 3.6 以降。しかも uuid をつくる I/F はない模様。

python の uuid は、`uuid1()`, `uuid3()`, `uuid4()`, `uuid5()` がある。
`uuid4()` が ruby の `SecureRandom.uuid` に相当すると思われる。

##文字列の join

スレッドの join じゃなくて、配列の要素をコンマとかでつなげるやつ。

```ruby:ruby
[1,"hoge",2.34].join(",") #=> "1,hoge,2.34"
```

```python:python3
",".join([str(x) for x in [ 1, "hoge", 2.34 ] ] ) #=> '1,hoge,2.34'
```

ruby は join すると勝手に文字列になるけど、python は文字列しか join できない。
レシーバが逆なのは知っていたけど、勝手に文字列化してくれないのは知らなかった。

##文字列の split

```ruby:ruby
"a,b,c".split(",") # => ["a", "b", "c"]
"a-b+c".split(/\W/) # => ["a", "b", "c"]
```

```python:python3
import re
"a,b,c".split(",") #=> ["a", "b", "c"]
re.split(r"\W", "a+b-c") #=> ["a", "b", "c"]
re.compile( r"\W" ).split( "a+b-c" ) #=> ["a", "b", "c"]
```

正規表現か否かで呼び方を変える必要がある。

`"a,b,c".split( re.compile(r"\W") )` とは書けないところが残念。

# 最後に

加筆予定。
もっと良い書き方があるよ！　という意見募集。


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---
title: ruby 2.6 が出たので触ってみて、python と比較してみた
tags: Ruby Python プログラミング プログラミング初心者
author: suzuki-hoge
slide: false
---
※ この記事はちょー長いです。垂れ流しアウトプットです。そして割とニッチなネタが多いです。
※ けどやって良かった。頭の整理と手を動かす良い機会になった。

## はじめに
### どうも
python 歴は 5-6 年ですが、ruby は 3 日のド素人です。

ruby ってなんか`put`とか`@`とか`| do |`とか出てくるやつでしょ？
みたいな状況からごにょごにょと 3 時間ほど書いて、たのしい Ruby を 2 時間くらいで流し読みして、そっから 12 時間くらいでまとめました。

前から ruby が気になっていて、[2.6 のリリースノート](https://www.ruby-lang.org/ja/news/2018/12/25/ruby-2-6-0-released/)が面白そうだったので休みに一気にやってみました。

ちなみに python は新人の半ばくらいの時に vim のプラグインを作りたくて python ruby perl からひとつ選ぶってなったときに、「プログラミングなんてなーんもわからん。とりあえずなんか名前がカッコイイ。」って理由で始めました。

### 向き不向きがあるので、選択肢を増やしたい
ruby と python のどちらが優れている！とかやる気は毛頭なくて、「〜〜するんならこっちの方が楽そう」ってのが理解できたら良いな、と思う。

例えば僕は「何か作ろ」ってなったとき、大体こんな感じで言語を決める。
（会社の制約や集団の経験言語も考慮しているので、ひとつの例として...）

まず                           | ざっと                                        | んで
:--                            | :--                                           | :--
大体どう作るか当たりが付いてる | 自分専用 and IO 少なめ                        | haskell
                               | 他の人のローカルでも叩くことがある            | python
                               | 思いついたクラス設計の検証をしたい            | scala
                               | gradle 関係 and 文字列やリスト操作多め        | groovy
                               | gradle 関係 and クラスや高階関数多め          | java (+ javaslang + lombok)
                               | 会社の適当なインフラで web る                 | php
                               | テキスト整形 and 他人がそれを再現しなくて良い | vim
                               | クソネタ作って Lightning Talk する            | js (+ github-pages)
悩みながらになりそう...        | チャレンジする気分                            | haskell
                               | ちょっと大きい                                | scala
                               | さっさと動かしたい                            | python
else                           |                                               | python

python に落ちることが多いし、得意で好きなんだけど、どうしても気にくわないことがある！

これ！！

```python:python
>>> lines = ['main.py', 'main.rb', 'readme']

>>> map(lambda line: 'python' if line == 'py' else 'ruby', map(lambda line: line.split('.')[1], filter(lambda line: '.' in line, lines)))
# => ['python', 'ruby']
```

辛い！！ネストすんの辛いわ！！別に書けるけど！！読むとき目線移動大変なんだよ！！最初に読むのここだよ！？

```python:python
#                                                                                               v ここ！！
>>> map(lambda line: 'python' if line == 'py' else 'ruby', map(lambda line: line.split('.')[1], filter(lambda line: '.' in line, lines)))
#                                                          ^ んで次ここ！！
```

そんなわけで変数に`@`とか`$`とかあってめんどそう、`&:`みたいな呪文怖い、`do |x|`？`| do | x`？って思って避けてた ruby を、チェインができるのでやってみることにした。

ちなみに、自分が ruby を使う状況で使わないだろうと思ったこととかは飛ばした。

+ 継承とか
+ mix-in とか extend とか
+ 例外
+ 特異メソッドとか
+ ブロックつきメソッドの自作（欲しくなったらやる）
+ ファイルモジュール（これはいつも linux コマンドの発行でやっちゃう）
+ 日付まわり

あ、ruby は 2.6.0 で python は 2.7.14 です。（なんとなくずっと 2.7 使ってる...）

あとはひたすら垂れ流します。

## 文字列
### 出力
まずはここから。

#### ruby
名前  | 特徴            | 1   | "1" | "foo\tbar"     | [1, 2, 3]   | 用途
:--   | :--             | :-- | :-- | :--            | :--         | :--
p     | .inspect + 改行 | 1   | "1" | "foo\tbar"     | [1, 2, 3]   | デバッグ
puts  | .to_s + 改行    | 1   | 1   | foo&#x0009;bar | 1<br>2<br>3 | 人間に見せる
print | .to_s           | 1   | 1   | foo&#x0009;bar | [1, 2, 3]   | 人間に見せる

`pp`はとりあえず要らないかな、って思って略。

`to_s`書いても自作クラスが`p`で使ってくれない、って思ったけど`inspect`なんてのがあるのか。

とりあえず開発中は`p`で良さげ。
haskell の`print`と`putStrLn`と`putStr`と似てる。

#### python
python は print しかないので特に迷うことはない。

改行したくなければ`print x,`ってやるって覚えてるとちょい便利、くらい。

### 組み立て
よく使うので個人的にはかなり大事なポイント。

#### ruby
（ここでは`p`じゃあなくて`puts`を使う）

変数や特殊文字が入らないなら、`'`も`"`も同じで、片方を中でそのまま使える。

```ruby:ruby
puts "I'm John."           # => I'm John.
puts '{"name": "John"}'    # => {"name": "John"}
```

特殊文字や式展開は`"`じゃあないと無効。

```ruby:ruby
name = 'John'

puts 'win path is doc\readme.md'    # => win path is doc\readme.md
puts "win path is doc\readme.md"    # => eadme.md is doc

puts 'my name is #{name}.'    # => my name is #{name}.
puts "my name is #{name}."    # => my name is John.
```

ってことは... json 作るのちょっとめんどい？？

```ruby:ruby
puts "{\"message\": \"I'm #{name}.\"}"    # => {"message": "I'm John."}
```

here document があるので、これなら良い？？

```ruby:ruby
puts <<EOS
{"message": "I'm #{name}."}               # => {"message": "I'm John."}
EOS
```

groovy と似てるかな。
式展開は素直に書けて良い感じ。

#### python
python は`'`と`"`に違いはない。どっちかを外側にしてもう片方を中で使えるのも ruby と同じ。

```python:python
print "I'm John."              # => I'm John.
print '{"name": "John"}'       # => {"name": "John"}
```

変数展開がどちらででもできるのが好きだけど、展開場所の指定は ruby の方がすっきりしてると思う。
（`.format`や`locals()`等の細かいことは略。）

```python:python
name = 'John'

print 'my name is %s.' % name    # => my name is John.
print "my name is %s." % name    # => my name is John.
```

ruby の`'`に相当するものは、`r''`（もしくは`r""`）になる。raw string の r だろな。

```python:python
print r'win path is doc\readme.md'    # => win path is doc\readme.md
print  'win path is doc\readme.md'    # => eadme.md is doc
```

here document は`"""`で囲う。１行でも可能。この場合は中で`"`と`'`が使える。

```python:python
print """{"message": "I'm %s."}""" % name # => {"message": "I'm John."}
```

json や linux コマンドを組み立てるときに便利。
`"""`は地味だけど python の好きなところのひとつ。

### 日本語
こりゃあ ruby の方が試すまでもなく楽だろね。

#### ruby
```ruby:japanese.rb
puts "仕様書.doc\nmain.rb\ntest.rb"
```

こんなスクリプトに対してコマンドラインから叩くと、当然予想通り動く。

```
$ ruby japanese.rb | grep rb
main.rb
test.rb
```

2.0 以降は標準で utf-8 らしい。

#### python
```python:japanese.py
# -*- coding: utf-8 -*-

print u'仕様書.doc\nmain.py\ntest.py'
```

```
$ python japanese.py
仕様書.doc
main.py
test.py
```

問題ないと思いきや、怒られる。

```
$ python japanese.py | grep py
Traceback (most recent call last):
  File "japanese.py", line 6, in <module>
    print u'仕様書.doc\nmain.py\ntest.py'
UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-2: ordinal not in range(128)
```

コマンドラインに出力するときと、`|` に繋いだりして出力するときで挙動が違う。
あと vi の中から叩いたりしても同様。

```python:japanese.py
# -*- coding: utf-8 -*-

import sys, codecs
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)

print u'仕様書.doc\nmain.py\ntest.py'
```

こうする。妙に大変。知ってた。

## インタプリタ
### 型を調べる
#### ruby
```ruby:ruby
irb(main):001:0> 'foo'.class
=> String

irb(main):004:0> 'foo'.chomp.class
=> String

irb(main):010:0> 'foo'.start_with?.class
=> FalseClass
```

なんだけど、どうも思ってたのとちょっと違う...?? これ評価結果に`.class`してるよね...
メソッドか属性値なのか知りたくなったりしないのかな...??

#### python
```python:python
>>> type('foo')
<type 'str'>

>>> type('foo'.strip)
<type 'builtin_function_or_method'>

>>> type(os.path)
<type 'module'>

>>> type(os.path.join)
<type 'function'>
```

とりあえず混乱したら`type`して一息付く感じ。これだけで大分手がかりになる。

### 属性を調べる
#### ruby
```ruby:ruby
> class Foo
>   def name()
>     'foo'
>   end
> end

> foo = Foo.new()

> foo.methods
=> [:name, :instance_variable_defined?, .. 略.. :__send__]

> ''.methods
=> [:to_r, :encode, :encode!, :include?, :%, .. 略 ..]
```

これは python と似た感覚で使えそう。ちょっと長いけど。

#### python
```python:python
>>> class Foo:
...   def name(self):
...     return 'foo'

>>> foo = Foo()

>>> dir(foo)
['__doc__', '__module__', 'name']

>>> dir(str)
['__add__', '__class__', ..略.. 'upper', 'zfill']
```

`type`と合わせて使う。

### help
#### ruby
```ruby:ruby
> help String#match

(from ruby core)
------------------------------------------------------------------------
  str.match(pattern)        -> matchdata or nil
  str.match(pattern, pos)   -> matchdata or nil

------------------------------------------------------------------------

Converts pattern to a Regexp (if it isn't already one),
then invokes its match method on str.  If the second parameter is
present, it specifies the position in the string to begin the search.

  'hello'.match('(.)\1')      #=> #<MatchData "ll" 1:"l">
  'hello'.match('(.)\1')[0]   #=> "ll"
  'hello'.match(/(.)\1/)[0]   #=> "ll"
  'hello'.match(/(.)\1/, 3)   #=> nil
  'hello'.match('xx')         #=> nil
```

`help`でとりあえず起動してから色々探すってこともできる。

#### python
実は知らなくて、ruby の本読んでいて「へー、python にもあんのかな？」って思って叩いたら良いのがあったｗ

```python:python
>>> help(map)

Help on built-in function map in module __builtin__:

map(...)
    map(function, sequence[, sequence, ...]) -> list

    Return a list of the results of applying the function to the items of
    the argument sequence(s).  If more than one sequence is given, the
    function is called with an argument list consisting of the corresponding
    item of each sequence, substituting None for missing values when not all
    sequences have the same length.  If the function is None, return a list of
    the items of the sequence (or a list of tuples if more than one sequence).
```

良いことを知ったｗ

## file
### 読み込み
#### ruby
あんま自信ない...

```ruby:ruby
lines = File.read('foo.txt').split()
p lines                                 # => ["foo", "bar", "bla bla bla", "pon"]
```

これ、close してないことになる？
`.open`して`File`オブジェクトを一度手に入れて、`.read`したら`.close`するか、ブロックを渡す必要があるんだよね？
ブロックを渡す方は、要はローンパターンだよね。

これで確認できるのか自信ないけど、`.close`を書き換えて試してみた。

```ruby:ruby
class File
    def close;      puts 'close!!!';   end
    def write(str); STDOUT.write(str); end
end

f = File.open('foo.txt')
f.close                                                 # => close!!!

File.open('foo.txt', 'r') {}                            # => close!!!

lines = File.read('foo.txt') {}                         # =>

lines = File.read('foo.txt').split                      # =>

lines = File.open('foo.txt', 'r') {|f| f.read.split}    # => close!!!

lines = File.open('foo.txt', &:read).split              # => close!!!
```

ちゃんと close させるには`open`経由しないとだめなの？ならなんで`File#read`があるの？
ちょっとしたスクリプトならあんま気にしない感じなの？

#### python
こうとか。

```python:python
with open('foo.txt', 'r') as f:
    lines = f.read().splitlines()

with open('foo.txt', 'r') as f:
    lines = map(str.strip, f)
```

下のは最近教えてもらった。

慣れるまでちょい変な感じがしたけど、シンプルだと思う。慣れたからかな？

## モジュール
正直ここはそんなに興味ないので、ruby の`require`をちょっとだけ。

### 読み込み
#### ruby
```ruby:ruby
puts 'foo'

if 1 == 1
    require './japanese'
    require './japanese'
end

puts 'bar'
```

```
$ ruby import.rb
foo
仕様書.doc
main.rb
test.rb
bar
```

冒頭じゃあなくても書けるし、２度は読み込まれないっぽい。python と同じ。

冒頭じゃあなくても良いのは地味に好きで、例えば`if`に落ちた時だけ`require`するとかができる。
そうすると影響が小さくしやすくて読みやすいし消しやすくて好き。（統合開発環境とか全く使ってないのでそこら辺も手作業。）

ただ、名前が競合したりするのは気にしないのかな？

```ruby:imported_one.rb
def n()
    'n (one)'
end

def one()
    'one'
end
```

```ruby:imported_two.rb
def n()
    'n (two)'
end

def two()
    'two'
end
```

```ruby:ruby
require './imported_one'
require './imported_two'

puts n                    # => n (two)
```

#### python
名前が被ったり、手元のローカル変数と被るのが気になるときはメソッド単位で`import`するか、モジュール名を略さない。

```python:python
from imported_one import *
from imported_two import *

print n()                 # => n (two)
```

```python:python
from imported_one import n, one
from imported_two import two

print n()                 # => n (one)
```

```python:python
import imported_one
import imported_two

print imported_one.n()    # => n (one)
```

python の方が融通が利くけど、この`import`の`.`とか`from`が難しすぎる面もあるので、どっちもどっちなのかな？ -> [Pythonのimportについてまとめる](https://qiita.com/suzuki-hoge/items/f951d56290617df4279e)

## 演算子
### overload
二項演算子はどっちも大体同じ。

#### ruby
```ruby:ruby
class Lines
    attr_reader :xs

    def initialize(xs)
        @xs = xs
    end

    def +(o)
        Lines.new(@xs + o.xs)
    end

    def -@()
        Lines.new(@xs.reverse)
    end

    def inspect()
        @xs.join(', ')
    end
end

lines1 = Lines.new(['foo', 'bar'])

p lines1 + Lines.new(['pon'])    # foo, bar, pon
p -lines1                        # bar, foo
```

これは`1 + 2`が`1.+(2)`に見えていれば理解は簡単。scala と同じ。

`String`に対しても可能で、単項演算子も可能ってのは面白いなって思った。

#### python
```python:python
class Lines:
    def __init__(self, xs):
        self.xs = xs

    def __add__(self, o):
        return Lines(self.xs + o.xs)

    def __str__(self):
        return ', '.join(self.xs)

print Lines(['foo', 'bar']) + Lines(['pon'])    # => foo, bar, pon
```

似た感じ。

## 条件分岐
これは正直大差ないだろと思ってたけど、かなり違った。

### 文か式か
#### ruby
```ruby:ruby
if 1 == 1
    p 'true'     # => true
else
    p 'false'
end
```

これは python を同じだけど、こいつ値返すらしいぞ！

```ruby:ruby
x = if 1 == 1
    'true'
else
    'false'
end

p x    # => true
```

こいつはすげぇ！

これを

```ruby:ruby
if 1 == 1
    foo = 1
    bar = foo + 2
    foo = Foo.new(foo + bar)
else
    pon = 1
    foo = Foo.new(pon * 2)
end

p foo.twice()
```

こうできる！

```ruby:ruby
p Foo.new(
    if 1 == 1
        foo = 1
        bar = foo + 2
        foo + bar
    else
        pon = 1
        pon * 2
    end
).twice()    # => 8
```

変数大嫌いだし、`if`が式なのは色々と便利で良い！
メソッドの最後に書いてもそのまま値返却にできる。式は良い。

まさかと思って適当に書いてみて良かった。scala みたいだ。

#### python
```python:python
if 1 == 1:
    print 'true'
else:
    print 'false'
```

python は文なんだ、ちょっと、いや結構悲しい。

### 三項演算子
#### ruby
他の言語と同じ。

```ruby:ruby
x = nil
p x.nil? ? 'x is nil' : x                    # => x is nil
```

#### python
特殊。他で見たことない。
英語的ってやつかしら。

```python:python
x = None
print x if x is not None else 'x is none'    # => x is none
```

`print x, if x is not None. else, 'x is none'.`みたいに一息つきながら読む感じ。

ちなみに ruby の if 修飾子と違って`else`は無くせない。

### switch
#### ruby
`if`がそうだったのできっとと思ったけど、こいつも式みたい。良い！

```ruby:ruby
p case x
when 'rb'
    'ruby'
when 'py'
    'python'
when 'hs'
    'haskell'
else
    'unknown'
end
# => ruby
```

式になってると`.collect`とかにすっきり収まるはず。

```ruby:ruby
xs = ['rb', 'py', 'hs']

p xs.collect {|x| case x
    when 'rb'; 'ruby'
    when 'py'; 'python'
    when 'hs'; 'haskell'
    else     ; 'unknown'
    end
}    # => ["ruby", "python", "haskell"]
```

良いねー！（スタイルが ruby っぽくないのはわかってやってる。自分専用コードの時だけに留める。）
scala みたい。

#### python
文は大嫌いなので、式になってる scala や haskell でしか使ったことない。
まぁ python にはそもそも switch 文もないけど。

５年くらい前に使い捨ての辞書を引くって方法を自分で閃いて天才かと思ったけど、調べたら常套手段だった思い出ｗ

```python:python
x = 'py'

print {
    'rb' : 'ruby',
    'py' : 'python',
    'hs' : 'haskell'
}[x].capitalize()       # => Python
```

paiza みたいなのやるときはちょいちょい使う。

完全に余談だけど、python の boolean はただの`0`と`1`のエイリアスなのを知ってるとこんなことができる。

```python:python
print ['false!', 'true!'][x.startswith('p')]        # => true!

print 'true!' if x.startswith('p') else 'false!'    # => true!
```

三項演算子より極僅かだけど短いので、コードゴルフで使う。

### 優先度
#### ruby
`and`より`&&`が強いらしい。へー。

```ruby:ruby
p false && false || true     # => true
p false and false || true    # => false
```

上は`(f && f) || t`で、下は`f && (f || t)`に相当するから。
おもしろいけど、自分で使うかは微妙。とはいえ場面が多くて、かつ慣れたら多用すると思う。

#### python
python は`and`と`or`のみで`&&`と`||`はない。これも英語的ってやつかしら。

### 演算子の連結
#### ruby
逆に ruby はこれができない。

```ruby:ruby
x = 5

p 1 < x < 10
```

まぁちょっと考えれば`1.<(x).<(10)`だけど、`TrueClass`が前の条件覚えた`.<`を持ってるわけないしね。

#### python
```python:python
x = 5

print 1 < x < 10    # => True
```

案外ないと「んあ〜」ってなるので、できるのはうれしい。

## メソッド
ここが本題。

### 無名関数
#### ruby
```ruby:ruby
f = lambda{|x| x + x}

p f.call(3)    # => 6
```

`def`で作ったものと違い、`f.call(x)`みたいに呼ぶ。もしくは`f[x]`。

こういう時に`def`と`lambda`を比べたいから型が知りたくなるんだけど、これだとエラーなんだよなー。
もうちょっと慣れが必要っぽい。

```ruby:ruby
def f(x); x + x; end

p f.class                    # => error

p lambda{|x| x + 2}.class    # => Proc
```

それは置いといて、`lambda`で作った方は`Proc`と言うらしい。[2.6 のリリースノート](https://www.ruby-lang.org/ja/news/2018/12/25/ruby-2-6-0-released/)で見たぞ。

```ruby:ruby
p [1, 2, 3, 4].collect do |x|
    x + x
end
```

そんでここの`do ~ end`をブロックというらしい。置き換えられるふいんき。

```ruby:ruby
lamb = lambda{|x| x + x}

p [1, 2, 3, 4].collect(lamb)
```

...怒られた。どうやらブロックと`lambda`は別物らしい。
ruby lambda to block とかでぐぐったら出るわ出るわ。鬼門らしい？

要約すると、「ブロックはオブジェクトではない。ブロックをオブジェクトにするなら`&`で`Proc`オブジェクトにする。」ってことっぽい。
`proc`と`lambda`の違いはわかった気がするけど、`break`も`return`も使う気は全く無いので今は無視。

なので、こうだ。

```ruby:ruby
lamb = lambda{|x| x + x}

p [1, 2, 3, 4].collect(&lamb)    # => [2, 4, 6, 8]
```

`lambda`は`->`による略記があるみたい。

```ruby:ruby
lamb = ->(x) {x + x}
```

こっちの方が`f(x) {...}`と同じ形だからわかりやすいでしょって書いてあったけど、`x -> {...}`の方がわかりやすいと思うｗ
java とか scala とか haskell とか js とか、大体こうじゃあない？

#### python
```python:python
f = lambda x: x + x

print f(3)    # => 6
```

`def`製と`lambda`製に違いはない。

```python:python
print map(f, [1, 2, 3, 4])    # => [2, 4, 6, 8]
```

正直ここだけ見ると python の方がシンプル。
（`f = lambda x: ...`みたいにラムダ式を変数束縛するのは PEP 8 では非推奨です。これはあくまで個人用なので好みでやってるだけです。）

### メソッド参照
名前は不適切っぽいけど。なんて言うのかな。

#### ruby
シンボルを`Proc`オブジェクトにすることで、`x.f(arg)`を`:f.to_proc.call(x, arg)`にできるみたい。

```ruby:ruby
'foo'.include?('o')                   # => true
:include?.to_proc.call('foo', 'o')    # => true
```

引数がひとつならこんな感じでそのままはまる。

```ruby:ruby
['ruby', '', 'python'].collect(&:empty?)    # => [false, true, false]
```

たまに見る`&:f?`っていう呪文みたいなのはこいつだったんだな。
`&`は`.to_proc`で、`:`がシンボル。`?`はただのメソッド名の慣習。呪文をひとつ習得。

ところで、なんで`.collect(`の中とかじゃあないと`&`で怒られるんだ？

```ruby:ruby
f = :empty?.to_proc    # => #<Proc:0x00007f877b0cd960(&:empty?)>
f = &:empty?           # => unexpected &
```

その辺がまだわからん...

#### python
似た感じ。`.to_proc`とか`.call`がないのでスッキリしてる。

```python:python
'foo'.startswith('f')                 # => True
str.startswith('foo', 'f')            # => True

map(str.strip, ['foo\n', 'bar\n'])    # => ['foo', 'bar']
```

数年触ってて、これ先日まで知らなかったんだよね...

### デフォルト引数と名前付き引数
リスト渡しとか辞書渡しは使わないので無視。必要な場面に出くわしたら調べる。

#### ruby
```ruby:ruby
def f(a: 0, b: 0, c: 0)
    p [a, b, c]
end

f(b: 3, a: 1)      # => [1, 3, 0]
```

デフォルト引数がある引数は、名前指定で渡せる。

#### python
```python:python
def f(a, b, c = 0):
    print [a, b, c]

f(b = 3, a = 1)    # => [1, 3, 0]
```

デフォルト引数がなくても、名前指定で渡せる。
これは引数が多い場合に呼ぶ側の可読性が上がったりして地味に好き。

### 複数引数の無名関数
#### ruby
```ruby:ruby
p [['ruby', '2.6'], ['python', '2.7']].collect{|x| "#{x[0]}-#{x[1]}"}                   # => ["ruby-2.6", "python-2.7"]
```

これは多分`a, b = [1, 2]`みたいな代入ができるんだから、きっとこうできる。

```ruby:ruby
p [['ruby', '2.6'], ['python', '2.7']].collect{|name, version| "#{lang}-#{version}"}    # => ["ruby-2.6", "python-2.7"]

f = ->((name, version)) {"#{name}-#{version}"}
p [['ruby', '2.6'], ['python', '2.7']].collect(&f)                                      # => ["ruby-2.6", "python-2.7"]
```

できた。

`lambda`の方は、`->(name, version)`だと「引数の数あってねーよ」って怒られたので適当に`()`をもう一つ書いたら動いた。
あくまで１つの引数を受けて、受けた方がバラすのでこうなるってことかな。haskell みたい。

#### python
```python:python
f = lambda (name, version): '%(name)s-%(version)s' % locals()

print map(f, [['ruby', '2.6'], ['python', '2.7']])                                                   # => ['ruby-2.6', 'python-2.7']
```

ruby と同じ感じ。

```python:python
print ['%(name)s-%(version)s' % locals() for name, version in ['ruby', '2.6'], ['python', '2.7']]    # => ['ruby-2.6', 'python-2.7']
```

内包表記の`for`の部分は`,`でバラして受けられるのでよく使う。

### カリー化
#### ruby
```ruby:ruby
f = ->(name, version) {"#{name}-#{version}"}
python = f.curry.call('python')

p ['2.7', '3.3'].collect(&python)    # => ["python-2.7", "python-3.3"]
```

できるんだ！良さげ！

ただ、これが怒られるのがよくわからない。

```ruby:ruby
:+.to_proc.curry('result: ').call('Ruby-2.7')    # => 'result: '.+('Ruby-2.7') だから、result: Ruby-2.7 になると思った

:+.to_proc.call('result: ', 'Ruby-2.7')          # => これは result: Ruby-2.7 になるのになぁ
```

haskell の`("result:" ++)`みたいに演算子の部分適用できたらすげー便利だと思うのに...

#### python
できないんだよなー、残念。

### 関数合成
これが「良いな！」ってなって ruby を始めた。

#### ruby
```ruby:ruby
join     = ->((name, version)) { "#{name}-#{version}" }
cap      = ->(s)               { s.capitalize }
surround = ->(c, s)            { "#{c} #{s} #{c}" }
pipe     = ->(s)               { surround.call('|', s) }

f = join >> cap >> pipe

p f.call(['ruby', '2.6'])                                                                              # => | Ruby-2.6 |

p [['ruby', '2.6'], ['python', '2.7']].collect(&f)                                                     # => ["| Ruby-2.6 |", "| Python-2.7 |"]
```

`>>`と`<<`、良いなぁ！

メソッド参照とカリー化も出来るってことは...

```ruby:ruby
p [['ruby', '2.6'], ['python', '2.7']].collect(&join >> :capitalize.to_proc >> surround.curry['|'])    # => ["| Ruby-2.6 |", "| Python-2.7 |"]
```

できた！慣れてきたー！

`&(f >> g)`にしないで良いって事は、演算子の優先順位は`&`の方が弱いってこと？

#### python
自分で合成書けば...

```python:python
join     = lambda (name, version): '%(name)s-%(version)s' % locals()
cap      = lambda s              : s.capitalize()
surround = lambda c, s           : '%(c)s %(s)s %(c)s' % locals()
pipe     = lambda s              : surround('|', s)

comp3 = lambda f1, f2, f3: lambda x: f3(f2(f1(x)))

f = comp3(join, cap, pipe)

print f(['ruby', '2.6'])                              # => | Ruby-2.6 |

print map(f, [['ruby', '2.6'], ['python', '2.7']])    # => ["| Ruby-2.6 |", "| Python-2.7 |"]
```

あんまり恩恵感じないかな...

## リスト
### 連結
大半をメソッドのところでやっちゃったけど。
こいつが前置きにあった一番のポイント。

#### ruby
```ruby:ruby
xs = ['ruby', 'python', 'php', 'js']

f = lambda{|x| x % 2 == 0 ? 'even' : 'odd'}

p xs
    .select{|x| x.start_with?('p')}
    .collect(&:length)
    .collect(&f)
    .join(', ')    # => even, odd
```

んー、良い！
改行できるのがとても良い！

`.join`も`Array`のメソッドなので、最後に書けるのがとても良い！

目線が左上から右下に素直に行くのは、とっても大事！

ちなみに関数合成ができたので、複数引数の片方しか使わない場合は、これを

```ruby:ruby
is_p = proc{|x| x.start_with?('p')}

xs = ['foo.ruby', 'bar.python', 'pon.php', 'kaz.js']

p xs
    .collect{|x| x.split('.')}
    .select{|name, ext| is_p.call(ext)}
    .collect{|name, ext| name}
    .join(', ')                                      # => [bar, pon]
```

こんな風に書いたりできる。haskell 風。

```ruby:ruby
fst = proc{|x, _| x}
snd = proc{|_, x| x}

p xs
    .collect{|x| x.split('.')}
    .select(&snd >> is_p)
    .collect(&fst)
    .join(', ')                                      # => [bar, pon]
```

こういうのはメソッドが集まるほど強いので、個人的にはとても好き。

#### python
```python:python
xs = ['ruby', 'python', 'php', 'js']

f = lambda x: 'even' if x % 2 == 0 else 'odd'

print ', '.join(map(f, map(len, filter(lambda x: x.startswith('p'), xs))))

print ', '.join(
    map(
        f,
        map(
            len,
            filter(
                lambda x: x.startswith('p'),
                xs
            )
        )
    )
)
```

辛い...

これくらいなら内包表記で書くかなー...

```python:python
print ', '.join(
    [f(len(x)) for x in xs if x.startswith('p')]
)    # => even, odd
```

慣れてるのでそんなに読み書きは苦ではないけど...

`xs`を探す -> `if`探す -> `[`の左端から読む -> 上の行の`join`読む。ってなるので、目線がすんげーことになる。とても残念。

ところで、scala とか java とかもやったけど、`sep.join(xs)`の形って珍しいよね。普通は`xs.join(sep)`だよなぁ。

なんでこうなってんだろ。
`list`が処理を持てないのかな？。だから`len`も`xs.len()`じゃあなくて`len(xs)`だし`map`も`.map`じゃあなくて`map()`なのかな？`dict`は`.get()`とか`.items()`とかあるのにな。

### スライス
地味だけど重宝する。

だいたい python と同じだった。良い感じ。

#### ruby
```ruby:ruby
xs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

p xs.slice(7..-1)             # => [7, 8, 9]
p xs.slice(7..)               # => [7, 8, 9]    -1 の省略は 2.6 から
p xs.slice(0..0)              # => [0]
p xs[-1]                      # => 9
p xs.slice(5..-2)             # => [5, 6, 7, 8]
p xs.slice(5...-1)            # => [5, 6, 7, 8]
p xs.slice((1..-1).step(2))   # => error
```

なんだよ`range`なら良いんだろーと思ったけど、`range`じゃあなかった。そっかー。

```ruby:irb
> (1..2).class
=> Range

> (1..2).step(2).class
=> Enumerator::ArithmeticSequence

> ((1..2) % 2).class    # % は 2.6 から
=> Enumerator::ArithmeticSequence
```

#### python
`[::]`の意味を知っていればすっきり読み書きできる。（`[start:end:step]`）
ちょっと含む範囲が違う。step も有効で、応用で逆順がサッとできる。

python の好きなところのひとつ。

```python:python
xs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

print xs[7:]        # => [7, 8, 9]
print xs[:1]        # => [0]
print xs[-1]        # => 9
print xs[5:-2]      # => [5, 6, 7]
print xs[5:-2:2]    # => [5, 7]
print xs[::-1]      # => [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
```

ちなみに`xs[:1]`は案外便利で、リストの先頭要素がリストのまま欲しいときに重宝する。

1000 くらいの長さのリストを試しに一周だけ動かすときとかに便利。

```python:python
print [f3(f2(x)) for x in xs if f1(x)]        # これを試しに１回だけ動かすのに

print f3(f2(xs[0])) if f1(xs[0]) else None    # がっつり書き直さなくても

print [f3(f2(x)) for x in xs[:1] if f1(x)]    # [:1] だけ付けちゃう
```

ruby と python どちらも`[]`に対してやったら`[]`が返ってくるので安全。

稀に便利なちょいテク。

### 内包表記
もうちょくちょく出してるけど。

#### ruby
ないっぽい。
まぁ`.collect`とかが改行できるし、良いかな。

#### python
下手に`for`で一時変数に足し込むのは変数が散らかるので大嫌い。

`map`との使い分けは状況次第で簡潔な方ってかんじ。

`map`と`filter`が１回ずつ出る場合はまず内包表記でやる。（ネストするから）
`map`か`filter`がどちらか１回の場合は`lambda`ってタイプしないといけないかどうかとかで決めてるなぁ。

```python:python
xs = ['python', 'ruby']

print map(len, xs)            # => [6, 4]
print [len(x) for x in xs]    # => [6, 4]

print map(lambda s: 'lang is %s.' % s, xs)    # => ['lang is python.', 'lang is ruby.']
print ['lang is %s.' % x for x in xs]         # => ['lang is python.', 'lang is ruby.']
```

微妙にどっちかの方がすっきりしてるｗ

あと新人時代に冒頭しか読めなかった[エキ py](https://images-na.ssl-images-amazon.com/images/I/515wWUPkhHL._SX258_BO1,204,203,200_.jpg) に性能の話があったけど、ruby が主軸なので割愛。

### flat_map
`1 : *`構造が入れ子になってたりする時に使う。作るものの特性上、結構使うので気になるところ。

#### ruby
```ruby:ruby
xs = ['main.rb', 'readme.md', 'test.rb']

read_rb = ->(path) {path.end_with?('rb') ? ["this is #{path}", 'bla bla bla...'] : []}

p xs.map(&read_rb)         # => [["this is main.rb", "bla bla bla..."], [], ["this is test.rb", "bla bla bla..."]]
```

`read_rb`は引数で受けたパスのファイルを open, read して、中の行をリストで返すような処理。（だと思って。）

`.map`でやると`[[]]`になっちゃう。
（例として便宜上`readme.md`をスキップしたけど、空ファイルだったりする場合も同様に`[]`になる。そもそも`.md`を`[]`にしたいなら先に`.select`するけど、これは例なので。）

```ruby:ruby
p xs.flat_map(&read_rb)    # => ["this is main.rb", "bla bla bla...", "this is test.rb", "bla bla bla..."]
```

`.flat_map`あるんだね。良い。

#### python
`flatten`的なのがないので、内包表記で`for for`したり、空リストに対して畳み込んだりする。

```python:python
xs = ['main.py', 'readme.md', 'test.py']
read_py = lambda path: ['this is %s' % path, 'bla bla bla...'] if path.endswith('py') else []

def flat_map(f, xs):
    return sum(map(f, xs), [])

print flat_map(read_py, xs)    # => ['this is main.py', 'bla bla bla...', 'this is test.py', 'bla bla bla...', 'this is readme.md', 'bla bla bla...']
```

## 他、気になってること
個人的によく書くこととかを触っておきたい。

### コマンドライン引数
#### ruby
特に`require`は不要。

```ruby:ruby
p ARGV

# => ruby ./command.rb 1 3
#
#    ["1", "3"]
```

グローバル変数だから`$`使うのかな？って思ってたけど、これは定数？

#### python
```python:python
import sys

print sys.argv

# => python ./command.py 1 3
#
#    ['./command.py', '1', '3']
```

### コマンドライン引数パーサ
オレオレ自作コマンドを良く作るので、良く触る。

#### ruby
`OptionParser`っていう手の込んだやつと、手っ取り早く`ARGV`を改造する`getopts`があるみたい。

```ruby:ruby
#!/usr/local/bin/ruby

require 'optparse'

params = ARGV.getopts('', 'tension:', 'lang:en')

puts "#{params['lang'] == 'en' ? 'foo' : 'ふー'}#{'!' * params['tension'].to_i}"


# => $ foo -h
#    Usage: foo [options]
#            --tension=VAL
#            --lang=en
#
#
#    $ foo --tension 4
#    foo!!!!
#
#
#    $ foo --tension 4 --lang ja
#    ふー!!!!
```

すっきりしてて良い感じ。


ところで、どうして`-h`が生成されるの？

`.getopts`が`ARGV`を破壊しているの？それとも`.getopts`に渡した情報がどっかに渡ってるのかな？
get しかしてないのにちょっと気持ち悪いｗ

#### python
3 系だともっとイケてるのかもしれないけど、ずっとこんな感じでやってる。
これは適当だけど、排他オプションとかもちゃんとできるので良い。

```python:python
#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import argparse

parser = argparse.ArgumentParser(description = 'say foo!')
parser.add_argument('tension', type = int, help = 'number of !')
parser.add_argument('-l', '--lang', default = 'en', type = str, action = 'store', help = 'language')
args = parser.parse_args()

print '%s%s' % ('foo' if args.lang == 'en' else u'ふー', '!' * args.tension)


# => $ foo -h
#    usage: foo [-h] [-l LANG] tension
#
#    say foo!
#
#    positional arguments:
#      tension               number of !
#
#    optional arguments:
#      -h, --help            show this help message and exit
#      -l LANG, --lang LANG  language
#
#
#    $ foo 4
#    foo!!!!
#
#
#    $ foo 4 --lang ja
#    ふー!!!!
```

### アノテーション
#### ruby
検索してみたけど、そもそも`@foo`みたいなのないんだ。

`TODO`等の特定のコメントを、アノテーションコメントと言うみたい。
rails はそれをかき集めるコマンドがあるからセットでひっかかるのかな。

#### python
python ではデコレータと言う。
java とかのとは違う感じで、本来の処理の前後に任意の処理を被せられる。

```python:python
def file_testing(f):
    def w(path):
        print 'mkdir %s if not exists\n' % path.split('/')[0]    # => 書き込み先のディレクトリがなければ作る

        f(path)                                                  # => 元々呼ばれた処理を呼ぶ

        print '\nremove %s' % path                               # => 作ったファイルを消しておく
    return w


def sut(path):         # 本当にやりたいこと
    print 'write to %s' % path


@file_testing
def sut_test(path):    # sut のテスト
    sut(path)
    result = sut が作ったファイルを読む
    assert len(result) == 2 とかする


sut_test('out/foo.txt')


# => mkdir out if not exists
#
#    write to out/foo.txt
#
#    remove out/foo.txt
```

理解できると案外さっと作れるので、メソッド本体を汚さずにゴミ掃除をしたり実行時間を計ったりできる。（詳細は割愛。）

多用はしないけど重宝する。python の好きなところのひとつ。

### os コマンド実行
これもよく使う。

ファイルモジュールで再帰的にファイル探すのとか面倒なので`find | grep`使っちゃったり、ライブラリ経由して mysql 操作するのが面倒だから`mysql -e`で適当に叩いちゃったりする。
http ライブラリ使うのも面倒なので`curl`しちゃうし、git のオレオレラッパー作るときも、文字列でコマンド組み立てて叩いちゃう。（自分専用は、ね。）

#### ruby
```ruby:ruby
res = `ls /tmp`.split()

p res    # => ["a.md", "a.py", "a.txt", "b.txt"]
```

すっきりしてて良いな！
groovy みたい。

一応、同期処理かも確認しておこう。

```ruby:ruby
puts "foo"
res = `sleep 2s; ls /tmp`.split()
p res
puts "bar"
```

ちゃんと`p res`が終わってから bar が出た。良かった。（groovy でよくハマるｗ）

#### python
手っ取り早いのは`os.system`だけど、戻り値が受け取れない。

```python:python
import os

res = os.system('ls /tmp')
print res    # => 0

# => python command.py
#    a.md
#    a.py
#    a.txt
#    b.txt
```

いつもは素直にリストになってくれる`commands.getoutput`を使ってる。

```python:python
import commands

res = commands.getoutput('ls /tmp').split()

print res    # => ['a.md', 'a.py', 'a.txt', 'b.txt']
```

### ポリシー・思想
#### ruby
当然まだ全然わからないけど、ちょっと調べてわかったことだけ...

ストレスなく楽しむってのが最も重視されているらしい。

あとどうもドキュメントが後追いな感じ？なの？

> 「Matz（まつもと） が Python に満足していれば Ruby は生まれなかったであろう」と公式のリファレンスの用語集で言及されている。

へーｗｗ

でも正直なところ、思ってたよりずっと触りやすくて良いなーって思った。

純粋な oop 言語が良かったらしい。確かに python の`len`とかを見ると、後付け感がすごい。
ruby は触っていて統一感がある感じがした。

知ってる言語の中だと（あんまり詳しくないけど）scala に一番似てる気がした。ド素人意見。

あと python とは逆に、同じ事をやる方法が多い印象もある。
「`proc`の呼び方が`f.call(x)` or `f[x]` of `f.(x)`」とか「`.map` or `.collect`」とか「`->` or `lambda`」とか「`proc` of `Proc.new`」みたいな、別名が多くてどっちに慣れると良いんだろ？みたいなノイズも感じた。

#### python
[the zen of python](https://www.python.org/dev/peps/pep-0020/) ってのがある。



━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

どーも、xyakenです。普段はRubyでコード書いてます。 今回はRubyのEnumerableモジュールのメソッドをいくつかピックアップして、PythonでRubyのあれはどう書くのか調べたり、考えたりしてみました*1。

バージョンはruby 2.4.1p111とPython 3.6.1で動作確認しております。※リストであることを前提にPythonのコードを書いているので、ジェネレータ式ではエラーになるものもあると思います。

RubyのブロックをどうPythonで表現するのかと思ったのですが、内包表記というものを使えばそれっぽく実現できるんですね。

all?
all?/all - シンプルなTruthy, Falsy
Ruby

[false, true].all? # => false
[true, true].all? # => true
Python

all([False, True]) # => False
all([True, True]) # => True
all?/all - 条件指定
Ruby

[1, 2, 3, 4].all? { |x| x > 5 }  # => false
[1, 2, 3, 4].all? { |x| x < 5 }  # => true
Python

all(v > 5 for v in [1, 2, 3, 4]) # => False
all(v < 5 for v in [1, 2, 3, 4]) # => True
ただ、次のコードのように、複数行の判定をしたいケースだと、Pythonではシンプルにできないっぽい？　です*2。

Ruby

[1, 2, 3, 4].all? do |x|
  return false if x < 0
  return false if 100 < x
  true
end
以下のように判定用関数を定義してしまうか、

Python

def cond(x):
  if x < 0:
    return False
  if 100 < x:
    return False
  return True

all(cond(v) for v in [1, 2, 3, 4])
あるいは、forで頑張るかでしょうか・・・。

Python

x = True
for v in [1, 2, 3, 4]:
  if x < 0:
    x = False
    break
  if 100 < x:
    x = False
    break
個人的には、forを使う方法はC言語っぽくて嫌だし必要のない思考が必要になるので、自分なら判定用の関数を関数内関数として定義してallを使うと思います。

追記：条件演算子をネストすることでワンライナーで書けるようです。まあ、間違いなくレビューで書きなおせって言われますね、これは。

Python

all(False if v < 0 else False if 100 < v else True for v in [1,2,3,4])
any?
any?/any - シンプルなTruthy, Falsy
Ruby

[false, true].any? # => true
[nil, false].any? # => false
Python

any([False, True]) # => True
any([False, None]) # => False
any?/any - 条件指定
Ruby

[1, 2, 3, 4].any? { |x| x > 5 }  # => false
[1, 2, 3, 4].any? { |x| x < 2 }  # => true
Python

any(v > 5 for v in [1, 2, 3, 4]) # => False
any(v < 2 for v in [1, 2, 3, 4]) # => True
複数行の判定はallと同じように関数内関数を使えばできます。

none?
none?/not any - シンプルなTruthy, Falsy
Ruby

[nil, false].none? # => true
[true, false].none? # => false
Python

# notはrubyでいうところの条件否定の"!"
not any([None, False]) # => True
not any([True, False]) # => False
none?/not any - 条件指定
Ruby

[1, 2, 3, 4].none? { |x| x > 5 }  # => true
[1, 2, 3, 4].none? { |x| x < 2 }  # => false
Python

not any(v > 5 for v in [1, 2, 3, 4]) # => True
not any(v < 2 for v in [1, 2, 3, 4]) # => False
複数行の判定はallと同じように関数内関数を使えばできます。

one?
one?/countと比較の組み合わせ - シンプルなTruthy, Falsy
Ruby

[nil, true, false].one? # => true
[nil, 1000, false].one? # => true
[nil, 1000, 99999].one? # => false
[nil, false, false].one? # => false
Python

len([v for v in [None, True, False] if v]) == 1 # => True
len([v for v in [None, 1000, False] if v]) == 1 # => True
len([v for v in [None, 1000, 99999] if v]) == 1 # => False
len([v for v in [None, False, []] if v]) == 1 # => False
もっといい方法ありそう。

one?/countと比較の組み合わせ - 条件指定
Ruby

[1, 2, 3, 4].one? { |x| x > 5 }  # => false
[1, 2, 3, 4].one? { |x| x > 2 }  # => false
[1, 2, 3, 4].one? { |x| x < 2 }  # => true
Python

[v > 5 for v in [1, 2, 3, 4]].count(True) == 1 # => False
[v > 2 for v in [1, 2, 3, 4]].count(True) == 1 # => False
[v < 2 for v in [1, 2, 3, 4]].count(True) == 1 # => True
include?(member?)
include?(member?)/any - 指定要素を含むか判定
Ruby

[1, 2, 3, 4].include?(3) # => true
Python

any(3 == v for v in [1, 2, 3, 4]) # => True
first
first/スライス - 最初のn個の要素を取得する
Ruby

[1 ,2, 3].first # => 1
[1 ,2, 3].first(2) # => [1, 2]
Python

[1, 2, 3][0] # => 1
[1, 2, 3][:2] # => [1, 2]
map(collect)
map/内包表記 - 単純な変換
Ruby

[1, 2, 3, 4].map { |x| x * 2 }  # => [2, 4, 6, 8]
Pythonは内包表記を使うことでmapと同じことを実現できます。

Python

[v * 2 for v in [1, 2, 3, 4]] # => [2, 4, 6, 8]
count
count/len - 単純に要素数を得る
Ruby

[1, 2, 3, 4].count # => 4
※配列ならsizeメソッド(lengthメソッド)が定義されているので、要素数を得るだけなら普通はそっちを使います。countメソッドは要素を数え上げるメソッドのため、sizeメソッドに比べて多少速度が遅いです。

Python

len([1, 2, 3, 4]) # => 4
count/count - 指定要素の数を得る
Ruby

[1, 1, 2, 2, 2, 3].count(2) # => 3
Python

[1, 1, 2, 2, 2, 3].count(2) # => 3
count/lenと内包表記 - 条件を満たす要素数を得る
Ruby

[1, 2, 3, 4, 5].count {|x| x % 2 == 0 } # => 2
Python

len([v for v in [1, 2, 3, 4, 5] if v % 2 == 0]) #=> 2
内包表記にはifを追加することで含める要素を絞り込むことができます。

select(find_all)
select(find_all)/内包表記 - 条件に一致する要素をすべて探す
Ruby

[1, 2, 3, 4, 5].select {|x| 3 < x } # => [4, 5]
Python

[v for v in [1, 2, 3, 4, 5] if 3 < v] # => [4, 5]
reject
reject/内包表記 - 条件に一致する要素をすべて除外する
Ruby

[1, 2, 3, 4, 5].reject {|x| 3 < x } # => [1, 2, 3]
Python

[v for v in [1, 2, 3, 4, 5] if not 3 < v] # => [1, 2, 3]
detect(find)
detect(find)/内包表記 - 条件に一致する最初の要素を探す
Ruby

[1, 2, 3, 4, 5].detect { |x| 3 < x } # => 4
Python

# このやり方だと要素がないとIndexErrorになります
[v for v in [1, 2, 3, 4, 5] if 3 < v][0] # => 4
# スライスを使ったやり方だと要素がなくてもIndexErrorにならない
[v for v in [1, 2, 3, 4, 5] if 3 < v][0:1] # => [4]
[v for v in [1, 2, 3, 4, 5] if 100 < v][0:1] # => []
# これでも同じ
[v for v in [1, 2, 3, 4, 5] if 3 < v][:1] # => [4]
[v for v in [1, 2, 3, 4, 5] if 100 < v][:1] # => []
こうする他思いつかなかったんだけど、他に方法あるのかな。全件比較してしまうので、見つかった時点で切り上げたかったら、forで処理するしかないのかな？

Python

x = None
for v in [1, 2, 3, 4, 5]:
  if 3 < v:
    x = v
    break
Rubyのfindは見つからない場合はnilになるけど、Pythonの内包表記を使ったやり方だとIndexErrorになるか[]になります。

find_index
find_index/index - 指定要素が最初に現れる位置を返す
Ruby

[1, 2, 3, 4].find_index(3) # => 2
Python

[1, 2, 3, 4].index(3) #=> 2
find_index/indexと内包表記 - 指定条件にマッチする最初の要素の位置を返す
Ruby

[1, 2, 3, 4].find_index { |x| x % 2 == 0 } # => 1
Python

[v % 2 == 0 for v in [1, 2, 3, 4]].index(True) # => 1
detect(find)と同じでforでやったほうがよいかも。

Python

x = None
for i, v in enumerate([1, 2, 3, 4]):
  if v % 2 == 0:
    x = i
    break
なお、Rubyだと指定条件に一致する要素がなくてもnilが返るけど、PythonだとValueErrorになります。

Ruby

[1, 2, 3, 4].find_index(100) # => nil
Python

[1, 2, 3, 4].index(100) #=> ValueError: 100 is not in list
maxとmax_by、minとmin_by
minとmin_byは単純に置き換えればいい話なので省略します。

max/max - 単純な最大値の取得
Ruby

[1, 3, 4, 2].max # => 4
Python

max([1, 3, 4, 2]) # => 4
max_by/max - 最大値の判定方法を指定した最大値の取得
max_byで大体ことが済んでmaxでブロック渡す必要のあるケースってあんまりない気がするので、複雑なケースは省略します。Pythonで同じことをしようとするとワンライナーでは難しそう。

Ruby

[1, 3, 4, 2, -100].max { |a, b| a*a <=> b*b } # => -100
[1, 3, 4, 2, -100].max_by { |item| item*item } # => -100
Python

max([1, 3, 4, 2, -100], key = lambda x: x*x) # => -100
max(max_by)/sortedとスライス - 上位n件の要素を取得する
Ruby

[1, 3, 4, 2, -100].max(2) # => [4, 3]
[1, 3, 4, 2, -100].max_by(2) { |item| item*item } # => [-100, 4]
Python

# minの場合はreverseの指定を外せばよい
sorted([1, 3, 4, 2, -100], reverse = True)[:2] # => [4, 3]
sorted([1, 3, 4, 2, -100], key = lambda x: x*x, reverse = True)[:2] # => [-100, 4]
全要素をソートしてから先頭のn件を取得しているので効率は悪い。

sortとsort_by
sort/sorted - 並び替える
Ruby

# 昇順
[1, 3, 4, 2, -100].sort # => [-100, 1, 2, 3, 4]
# 降順
[1, 3, 4, 2, -100].sort { |a, b| b <=> a}  # => [4, 3, 2, 1, -100]
Python

sorted([1, 3, 4, 2, -100]) # => [-100, 1, 2, 3, 4]
sorted([1, 3, 4, 2, -100], reverse = True) # => [4, 3, 2, 1, -100]
sort_by/sorted - ソート条件を指定したソート
Ruby

[1, 3, 4, 2, -100].sort_by { |item| item*item } # => [1, 2, 3, 4, -100]
Python

sorted([1, 3, 4, 2, -100], key = lambda x: x*x) # => [1, 2, 3, 4, -100]
group_by
group_by/itertools.groupby - 対象のグルーピングをする
Pythonでもitertoolsモジュールにあるgroupbyと辞書内包表記を使えば同じことができます。

Ruby

[1, 2, 3, 4, 5, 6].group_by { |v| v % 2 } # => {1=>[1, 3, 5], 0=>[2, 4, 6]}
Python

from itertools import groupby
sorted_list = sorted([1, 2, 3, 4, 5, 6], key = lambda x: x % 2)
{ k: list(v) for k, v in groupby(sorted_list, key = lambda x: x % 2) }
# => {0: [2, 4, 6], 1: [1, 3, 5]}
注意点がgroupbyの第一引数がグルーピングと同じ方法でソートされている必要があるということです。

partition
partition/itertools.groupby - 対象を条件を満たすものと満たさないものに分ける
実質的にgroup_byでtrueとfalseに分けるようなものなので、同じやり方でできます。

Ruby

[1, 2, 3, 4, 5, 6].partition { |v| v % 3 == 0 } # => [[3, 6], [1, 2, 4, 5]]
Python

from itertools import groupby
sorted_list = sorted([1, 2, 3, 4, 5, 6], key = lambda x: x % 3 == 0, reverse = True)
[ list(v) for k, v in groupby(sorted_list, key = lambda x: x % 3 == 0) ]
# => [[3, 6], [1, 2, 4, 5]]
zip
zip/zip - 配列の配列を作る
Ruby

[1, 2, 3].zip([50, 60, 70]) # => [[1, 50], [2, 60], [3, 70]]
Python

list(zip([1, 2, 3], [50, 60, 70])) # => [(1, 50), (2, 60), (3, 70)]
用途としてはいくつかの配列を同時にループさせたい時とかに使います。

Ruby

keys.zip(values).each_with_object({}) do |(key, value), o|
  o[key] = value
end
Python

{ k: v for k, v in zip(keys, values) }
inject(reduce)
inject(reduce)/reduce - 畳込み
Ruby

[1, 2, 3, 4].inject(:+) # => 10
Pythonではfunctools.reduceをimportしないと使えません。

Python

from functools import reduce

reduce(lambda a,b: a + b, [1, 2, 3, 4]) # => 10
operatorモジュールを使うとRubyと似たような感じでかけます。

Python

from functools import reduce
from operator import add

reduce(add, [1, 2, 3, 4]) # => 10
takeとdrop
take/スライス - リストの前からn個の要素を取得する
Ruby

[0, 1, 2, 3].take(2) # => [0, 1]
Python

[0, 1, 2, 3][:2] # => [0, 1]
drop/スライス - リストの前からn番目よりあとの要素を取得する
Ruby

[0, 1, 2, 3].drop(2) # => [2, 3]
Python

[0, 1, 2, 3][2:] # => [2, 3]
each
each/for - ループ
厳密にはeachはEnumerableモジュールのメソッドではないのですが、内部的に使っているので。

Ruby

list.each do |value|
  #...
end
Python

for item in list:
  #...
lazy
lazy/ジェネレータ式 - 遅延評価
Ruby

(1...1000).lazy.map do |x|
  x * x
end
lazyメソッド実行した場合、Enumerator::Lazyオブジェクトが返るようになります。 https://docs.ruby-lang.org/ja/latest/class/Enumerator=3a=3aLazy.html

Python

(x*x for x in range(1, 1000))
要素を取得するにはnext組み込み関数を使えばいいのですが、リセットしたり(Rubyでいうところのrewind)、要素位置を維持したまま値を取得したり(Rubyでいうところのpeek)といったことはできないっぽい？　です(調査不足かも)。

Python

list = (x*x for x in range(1, 1000))
next(list) # => 1
next(list) # => 4
next(list) # => 9
chunk
chunk/itertools.groupby - 要素をチャンクに分ける
group_byみたいなメソッドですが、グループを一つにまとめません。

Ruby

# Enumeratorオブジェクトを返すのでto_aをしている
[3, 4, 4, 5, 6, 8, 2, 9 , 7, 1].chunk {|x| x % 2}.to_a
# => [[1, [3]], [0, [4, 4]], [1, [5]], [0, [6, 8, 2]], [1, [9, 7, 1]]]
Python

from itertools import groupby
a = groupby([3, 4, 4, 5, 6, 8, 2, 9 , 7, 1], key = lambda x: x % 2)
# => <itertools.groupby object at 0x7f4a3da0e8b8>
item = next(a) # => (1, <itertools._grouper object at 0x7f4a3d976550>)
list(item[1])  # => [3]
item = next(a) # => (0, <itertools._grouper object at 0x7f4a3da0dba8>)
list(item[1])  # => [4, 4]
item = next(a) # => (1, <itertools._grouper object at 0x7f4a3d9764e0>)
list(item[1])  # => [5]
item = next(a) # => (0, <itertools._grouper object at 0x7f4a3da0dba8>)
list(item[1])  # => [6, 8, 2]
cycle
cycle/itertools.cycle - 引数のリストを無限に繰り返す
Ruby

[1, 2, 3].cycle {|x| puts x } # 1、2、3を無限に出力し続ける
[1, 2, 3].cycle # 無限に繰り返すEnumeratorオブジェクトを返す
Python

from itertools import cycle

# 1、2、3を無限に出力し続ける
for v in cycle([1, 2, 3]):
  print(v)

# 無限に繰り返すイテレータを返す
cycle([1, 2, 3])
drop_while, take_while
drop_while/itertools.dropwhile - 指定した条件が偽になるまでの要素を切り捨てる
Ruby

[-11, -33, -55, 1, 3, -100].drop_while {|x| x < 0 } # => [1, 3, -100]
Python

from itertools import dropwhile
list(dropwhile(lambda x: x < 0, [-11, -33, -55, 1, 3, -100])) # => [1, 3, -100]
take_while/itertools.takewhile - 指定した条件が偽になるまでの要素を取得する
Ruby

[-11, -33, -55, 1, 3, -100].take_while {|x| x < 0 } # => [-11, -33, -55]
Python

from itertools import takewhile
list(takewhile(lambda x: x < 0, [-11, -33, -55, 1, 3, -100])) # => [-11, -33, -55]
each_with_index
each_with_index/enumerate - 要素と要素番号を取得するイテレータを取得する
Ruby

['a', 'b', 'c'].each_with_index {|char, i| puts "#{i}:#{char}" }
# 出力結果
# 0:a
# 1:b
# 2:c
Python

for i, char in enumerate(['a', 'b', 'c']):
  print('{0}:{1}'.format(i, char))
# 出力結果
# 0:a
# 1:b
# 2:c
each_cons
Ruby

[1, 2, 3, 4, 5].each_cons(3).to_a # => [[1, 2, 3], [2, 3, 4], [3, 4, 5]]
どう実装すればいいか検討がつかずググったら、ドンピシャなstackoverflowの質問があったので、そこの回答を引用します。 https://stackoverflow.com/questions/5878403/python-equivalent-to-rubys-each-cons

Python

def each_cons(x, size):
    return [x[i:i+size] for i in range(len(x)-size+1)]
https://stackoverflow.com/a/5878474

リストの要素番号をこねくり回している感じでわかりづらいのですが、len(x)が100でsizeが3とした場合、range(len(x) - size + 1)の部分はrange(0,98)になります。rangeは終端値を含めないためfor i in range(0, 98)のiは0から97の値を取ります。x[i:i+size]部分はx[0:3]、x[1:4]…、x[97:100]となりほしい結果が得られていることがわかります(スライスも終端値の要素は含めません)。

Python

import itertools
def each_cons(xs, n):
    return itertools.izip(*(xs[i:] for i in xrange(n)))
https://stackoverflow.com/a/12879942

おそらく、Python2のコードなのでPython3でも動くように修正してみます。

Python

def each_cons(xs, n):
  return zip(*(xs[i:] for i in range(n)))
ジェネレータでは使えないとかツッコミが入っていはするのですが、かなりクールなコードです。

残りものとまとめ
力尽きたので残りはリストアップだけしておきます。

chunk_while
flat_map(collect_concat)
each_slice
each_with_object
grep
grep_v
minmax
minmax_by
reverse_each
slice_after
slice_before
slice_when
to_h
今回、Rubyのコードと同等のことをPythonで書くということをしたわけですが、かなりPythonの勉強になりました。小さい課題を多くこなす感じになるので、新しい言語を勉強しようとしているときには良い勉強法かもしれません。



━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
2017-02-01
Python 使いのための、Python と Ruby の違い（基本文法）
PythonRuby
こんにちは。吉田弁二郎です。

今回は、web 開発の主力言語の一つとなっている Ruby の文法について、Python との違いをまとめます。文法の完全な紹介を目指すのではなく、特に紛らわしい項目の差分に注目していきます。そのため、Ruby 独自の文法的な事項（module/include/extend, Proc など）には触れていませんのでご容赦を。なお、今回は Python 3.5.2 および Ruby 2.3.1 で確認しています。

制御構文
範囲の記述（1から5まで）
# Python
range(1, 6)
# Ruby：以下はいずれも同じ
1..5
1...6
1.upto(5)
偽と判定されるもの
# Python
None
False
[]  # 空の配列
''  # 空の文字列
0
# Ruby
nil
false
ループ中、次の繰り返しに移動する方法
# Python：continue キーワードを使う
sum_even = 0
for i in range(10):
    if i % 2 == 0:
        continue  # <-
    else:
        sum_even += 1
# Ruby：next キーワードを使う
sum_even = 0
(0...10).each do |i|
  if i % 2 == 0
    next  # <-
  else
    sum_even += 1
  end
end
ハッシュに対する for 文
# Python：キーを取り出す
h = {'hoge': 1, 'foo': 2}
res = []
for item in h:
    res.append(item)/len
#=> res = ['hoge', 'foo']
# Ruby：キーと値の組を取り出す
h = { hoge: 1, foo: 2 }
for item in h
  res.push item
end
#=> res = [[:hoge, 1], [:foo, 2]]
Python で Ruby のこの for 文と同様のことをする場合は

for item in h.items():
    res.append(item)
となります。Ruby の方は見づらいので

h.each do |key, value|
  ...
end
とした方がよい気がします。

ワンライナー条件文
# Python：
a = 1
'one' if a == 1 else 'not one'  #=> 'one'
# Ruby：
a = 1
a == 1 ? 'one' : 'not one'  #=> 'one'
例外処理
# Python：
from sys import exc_info
a = 1
try:
    a.hoge  # エラー送出
except Exception as e:
    info = exc_info()
    print("error class: {}".format(info[0]))
    print("error message: {}".format(info[1]))
finally:
    print('done.')
# Ruby：
a = 1
begin
  a.hoge  # エラー送出
rescue => e
  puts e.class
  puts e.message
ensure
  puts 'done'
end
配列
インデックス参照
# Python：範囲外のインデックス参照はエラーとなる
a = [0, 1]
a[2]  #=> IndexError
# Ruby：範囲外のインデックス参照は nil を返す
a = [0, 1]
a[2]  #=> nil
これはハッシュでも同様です。Ruby は寛容ですね。

文字列
文字列への変数の挿入
# Python：format 関数を使う
lang_name = 'python'
"hello {name}!".format(name=lang_name)  #=> "hello python!"
# Ruby：
lang_name = 'ruby'
"hello #{lang_name}!"  #=> "hello ruby!"
文字列表示のための関数
# Python
print('hoge!')
# Ruby
puts 'hoge!'  # 文末に改行がつく。Python の print と同様
print 'hoge!'  # 文末に改行がつかない
関数
可変長引数
# Python
def func(*args):
    print(args)

a = [1, 2, 3]
func(a)  #=> ([1, 2, 3], )
func(*a)  #=> (1, 2, 3)
# Ruby
def func(*args)
  print args
end

a = [1, 2, 3]
func(a)  #=> [[1, 2, 3]]
func(*a)  #=> [1, 2, 3]
Python ではタプルが、Ruby では配列が返る以外は同じ挙動ですね。func(*a) の * は配列を引数展開して渡すことを表します。

可変長キーワード引数
# Python
def func(a=0, b=0):
    print("a is {}, b is {}".format(a, b))

func()  #=> a is 0, b is 0
func({"a": 1, "b": 2})  #=> a is {"a": 1, "b": 2}, b is 0
func(**{"a": 1, "b": 2})  #=> a is 1, b is 2
# Ruby：引数の波括弧を省略可能
def func(a: 0, b: 0):
  puts "a is #{a}, b is #{b}"
end

func()  #=> a is 0, b is 0
func("a": 1, "b": 2)  #=> a is 1, b is 2
func(**{"a": 1, "b": 2})  #=> a is 1, b is 2
クラス
宣言（継承しない場合）
# Python
class Klass(object):
    ...
# Ruby
class Klass
  ...
end
初期化メソッドとインスタンス化
# Python
class Klass(object):
    def __init__(self, *args, **kwargs):
        ....

klass = Klass(*args, **kwargs)
# Ruby
class Klass
  def initialize(*args, **kwargs)
    ...
  end
  ...
end

klass = Klass.new(*args, **kwargs)
クラス内でのインスタンス変数の表現
# Python
self.var
# Ruby
@var
クラスメソッドの定義
# Python
class Klass(object):
    ...
    @classmethod  # デコレータ
    def hoge(cls):  # cls を引数に取る
        ...
# Ruby
class Klass
  ...
  def self.hoge
    ...
  end
end
変数・メソッドの隠蔽
Python	Ruby
・通常は隠蔽されていない
・ _, __ を変数名・メソッド名の頭につけると隠蔽される	・通常は隠蔽されている
・インスタンス変数：アクセスメソッドを設定すれば隠蔽が解除される（attr_accessor 等）
・メソッド：private / protected / public の設定により隠蔽レベルを制御できる
その他
コメント
# Python：これが1行コメント
"""
　これは複数行コメント。空白・改行が反映される。
"""
# Ruby：これが1行コメント

=begin
これが複数行コメント。= の前に空白があると機能しない。
ヒアドキュメントについては割愛。
=end
外部ファイル（ライブラリ）の読み込み
# Python
import hoge
from hoge import foo  # hoge から foo だけを読み込み
# Ruby
require 'hoge'  # hoge で定義されたローカル変数以外を全て読み込み
「モジュール」という名称
Python	Ruby
・コードをまとめた .py ファイルのこと
・「モジュールを import する」等	・module で定義されるコード片のこと
・「モジュールを include する」等

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
知っておくとPythonを早く会得できる5つのポイントを考察！『パーフェクトPython』著者がPythonの魅力を語る！
20.04.28　|　開発手法と体制 Django, Python, エンジニア, FLEXY編集部

株式会社ディー・エヌ・エーのシステム本部CTO室の露木誠です。

PythonやDjangoについて執筆した『パーフェクトPython』や『Django×Python』などの著書が技術系出版社から数冊出版されています。DjangoのAUTHORSファイルにも実は名前が掲載されています。

本記事では、Pythonを始めたいと思っている方向けに、Pythonの魅力をお伝えできればと思います。

知っておきたいPythonの言語仕様や特徴的な考え方をご紹介しますので、参考にしてください。


【目次】
1. 自己紹介とPython、Djangoに関わる活動
　1-1. ディー・エヌ・エーのCTO室に所属、元々は異業種からIT業界に参入

2. Pythonとの出会い、Zope世代

3. 魅力を考察
　3-1. Pythonの魅力―「こうなるだろう」を実現する
　3-2. Djangoの魅力―固定観念に囚われない機能

4. おすすめ勉強法

5. 絶対知っておきたいPythonの5つの面白さ
　5-1. デコレーターと高階関数
　5-2. 名前空間
　5-3. 演算子のオーバーロードと多重継承
　5-4. ディスクリプター
　5-5. 速くする仕組み

6. 最後に―PythonだけできるプログラマーはPython的ではない
1.自己紹介とPython、Djangoに関わる活動について
ディー・エヌ・エーのCTO室に所属、元々は異業種からIT業界に参入
現在は、株式会社ディー・エヌ・エーのシステム本部CTO室で、エンジニア組織の課題解決を主な活動として、日々奮闘しています。

私はもともとファッションジュエリーの輸入販売業という全くの異業種にいました。転職を決めたのがちょうど20世紀末です。2000年問題なども影響してエンジニア不足が叫ばれていた時代に、エンジニアに転向しています。

IT業界に入ってからは、Python、Java、PHPなどのプログラミング言語を用いてB向けC向けを問わずさまざまな開発に従事しました。製造業の社内システムなども開発していた時期もあります。

ソフトウェアエンジニア、チーフアーキテクト、テックリードなども務めたほか、プログラミング講習の講師や自社サービス用工場の立ち上げなど、幅広い領域に関わってきました。

2006年頃からはPythonやDjangoの普及を目指して、Djangoの日本コミュニティを立ち上げ、勉強会を主催したりしていました（現在は私ではなく2代目が規模を拡大しながら続けています）。Maker Faire Tokyoへの出展を目指しながらIoTを楽しむ「鎌倉Maker Lab.」でスタッフとしてお手伝いをしているもその一つです。 また、書籍も執筆しており、複数冊出版されています（共著・単著あり）。『パーフェクトPython』に関しては2020年6月1日に最新版の『パーフェクトPython 改訂2版』が出版される予定です。

【過去の著作一覧】
・ムック
『最新Pythonエクスプローラ ～Django，TurboGears，Twisted，IronPython 完全攻略』

・共著
『開発のプロが教える標準Django完全解説』
『パーフェクトPython』
『15時間でわかるPython集中講座』

・単著
『Django×Python』

2. Pythonとの出会い、Zope世代
私とPythonの出会いについて少しお話しします。エンジニアに転向してからしばらくはJavaを主に使用していたのですが、2002年頃に何かスクリプト言語を使えるようになっておこうと考えました。PerlやPHP、Ruby、Pythonの当時4大LL言語と呼ばれていたプログラミング言語が選択肢でした。

PerlとPHPはすでに相当使われていたので、まだまだ使っている人が少ないRubyとPythonのほうが面白そうだ、ということで絞込んで比較をしていました。

その中で最終的にPythonを選んだ決定打になったのがZopeです。これはWeb Application ServerでもありWeb Application Frameworkでもあり、そして統合開発環境でもある、という不思議なソフトウェアです。20世紀の当時から、オブジェクトデータベースという考え方のデータベースを標準搭載していて、なおかつ普通に使われていました。

このZopeのすごさに惹かれてPythonを選ぶことにしたのです。具体的にはZope上で動くSquishdotというSlashdotのクローンやCOREBlogというブログツールをいじくり回すところから入りました。

その後Ruby on Railsが流行り始めたわけですが、同時期にオープンソースになったDjangoに出会い、普及活動を通して完全にハマりました。Pythonエンジニアのことをよく「Zope世代」とか「Django世代」とか言いますが、私はZope世代です。

現在Pythonは機械学習での利用が増えていますから、流行り言葉で言えば「AI世代」ということになるのでしょう。

でも実は、機械学習やAIのライブラリで基礎となっている数値計算ライブラリのNumPyがリリースされたのは1995年です。ここには、Pythonが世界的にはかなり面白い形で使われてきたという背景があります。

プログラマーでなくとも扱いやすいという特徴があり、世界中のさまざまな業種の人たちが使うための多彩なライブラリが生まれ、そこから発展してきたのです。

3.魅力を考察
Pythonの魅力―「こうなるだろう」を実現する
Pythonの魅力は、デコレーターや名前空間、間違いが起こりやすいということでほかの言語が忌避した演算子のオーバーロードやメタプログラミング、C言語のAPIなどにあらわれています。

後の項目でも詳しくご説明しますが、これらは一貫した思想のもとに設計されています。それはプログラムを見る人が「こうなるだろう」と素直に読めることを目指している、ということです。

Pythonの一番の特徴であるインデント（字下げ）にしてもそうです。ほかのプログラミング言語は{…}の範囲を同じカタマリとして見ますが、Pythonの場合はインデントして「見た目としてズレている」部分がカタマリ（以下ブロック）だという考え方を採用しています。プログラミングを書いていれば見やすいようにインデントするし、ブロックで分けるだろう、だったら{}は不要だ、という考えなのです。

ほかにも演算子のオーバーロードができることで、自分で定義したクラスについても「これとこれを+記号で連結をしたらこうなる」ときちんと定義できます。演算子のオーバーロードを許していない言語ではプリミティブ型と一部のビルトイン型でのみ+記号が使えて、自分が定義したクラスのインスタンスにはaddメソッドを定義して使う必要があります。

こうなるだろう、と思ったとおりにできるのがPythonの非常に面白い部分なのです。

Djangoの魅力―固定観念に囚われない機能
Djangoの魅力にも是非、触れたいと思います。

DjangoはPythonの言語仕様活かすようにできており、Webアプリケーションの開発をしていると知らない間にPythonの特徴的な機能を利用しています。

DjangoはちょうどRuby on Railsが流行り始めた頃にオープンソースで公開されたのですが、その影響もあって「Railsを真似たもの」をいう見方をされることがあります。ですが、実際は全く思想が異なります。

Rails以後のWebアプリケーションフレームワークとしてかなり面白い機能があります。例えばApplicationという単位で関心ごとを分割する思想やテンプレートの継承などです。固定観念に囚われていない点が魅力です。

ほかにも例えば、MVC model2というMVC（Model View Controller）をWebに適用させたものがあるのですが、Djangoの場合はこれをMTV（Model Template View）という言い方に変えました。MVCはもともとグラフィカルユーザーインターフェース（GUI）用の考え方だからということで、再定義をしたのです。

テンプレートの継承についてはほかのWebアプリケーションフレームワークでも取り入れられてきたので今は普通の概念になっていますが、Djangoが持ち込んだ概念でほかのWebアプリケーションフレームワークが追いついていないものは残っていると思います。

4. おすすめの勉強法
Python自体が初めての方は、Dive Into Python3というチュートリアルがおすすめです。

Djangoに初めて触れるなら、Django Girlsのチュートリアルにトライしてみるのがいいと思います。

プログラミングそのものの勉強を始める人にもPythonはおすすめです。オブジェクト指向プログラミングや関数プログラミング、クラスやモジュールといった名前空間、クラス生成自体をカスタマイズできるメタプログラミング、そして本記事でご紹介する機能など、簡単で読みやすい構文と共存する柔軟な機能や考え方を学べるからです。

Pythonのリリースから間もなく30年になろうとしていますが、Python自体の開発ルールや、Pythonを発展させる上で気をつけられていることなど、開発コミュニティが持っている意思を組みとることも面白いでしょう。

5.これだけは知っておきたい！Pythonの5つの面白さ
本章では、知っておくと面白くなるPythonの以下の5つのポイントについてご説明します。

【知っておくと面白くなるPythonの5つのポイント】

①デコレーターと高階関数
②名前空間
③演算子のオーバーロードと多重継承
④ディスクリプター
⑤速くする仕組み
①デコレーターと高階関数
まず最初に、デコレーターと高階関数から説明します。

Pythonは関数が書ける言語です。関数をオブジェクトとして扱えるので、関数を関数に渡す、関数が関数を返すといった高階関数の仕組みを書けるようになっています。

例えば複数の機能が同じ前提条件を要求する場合、前提条件を確認する共通機能と、それぞれの機能から前提条件を確認する共通機能を呼び出すプログラムの記述が必要です。 高階関数を書けるので、前提条件を確認する機能をそれぞれの機能から呼び出す書き方ではなく、前提条件を確認して「何かの機能を持った関数」を呼び出す書き方ができます。前提条件を確認する関数で各機能の関数をそれぞれラップすれば良いのです。 ですが、高階関数で書けるだけでは見た目が冗長です。

このような場合、高階関数はデコレーターという可視性の高い機能を使うことで、関数やメソッドをマークするような感覚で解決できます。

例えばスクレイピングをするオブジェクトがログイン済みかを確認し、ログイン済みであればスクレイピング作業に入り、終わった後に何かをする…というシーンがあるとしましょう。どのページでもスクレイピング以外の部分は同じことをしなければなりません。

以下にscrape_page_a、scrape_page_b、scrape_page_cという関数がありますが、これらはそれぞれ同じ意味を持ちます。

デコレーターと高階関数の理解のために、以下に例を掲載してご紹介します。

import os  # osというモジュールを利用するために名前空間にosという名前でインポートしています


class Scraper:  # Pythonのクラス宣言です

    def __init__(self):  # コンストラクタです。メソッド定義は第一引数にインスタンスが渡されます
        self.is_logined = False  # インスタンス（self）の変数をFalse（偽）で初期化しています
        self.token = None  # Noneは何も無いことを表します

    def login(self, userid, password):
        print('call Scraper login')
        ...  # ピリオド3つは省略（ellipsis）を表します
        self.is_logined = True
        return True

    def get(self, url, params=None):  # key=... はキーワード引数。デフォルト値を設定できます
        ...
        return

    def post(self, url, parms=None):
        ...
        return

    def update_status(self):
        print('call Scraper update_status')
        ...


# スクレイピングのコードに毎回書く
def scrape_page_a(scraper):  # 関数定義
    if not scraper.is_logined:
        if not scraper.login(
            os.environ.get('userid'),
            os.environ.get('password'),
        ):
            raise LoginException('login failed')  # 例外を投げています
    ...  # page_aのスクレーピング処理
    print('call scrape_page_a')
    scraper.update_status()


# チェックメソッドを毎回呼ぶ
def do_login(scraper):
    if not scraper.is_logined:
        if not scraper.login(
            os.environ.get('userid'),
            os.environ.get('password'),
        ):
            raise LoginException('login failed')


def scrape_page_b(scraper):
    do_login(scraper)
    ...  # page_bのスクレーピング処理
    print('call scrape_page_b')
    scraper.update_status()


#  デコレーターを使う
def need_login(fnc):  # 関数を引数で受け取って関数内関数でラップした関数を返す高階関数
    def _do_login(scraper):
        if not scraper.is_logined:
            if not scraper.login(
                os.environ.get('userid'),
                os.environ.get('password'),
            ):
                raise LoginException('login failed')
        result = fnc(scraper)
        scraper.update_status()
        return result
    return _do_login


@need_login
def scrape_page_c(scraper):
    ...  # page_cのスクレーピング処理
    print('call scrape_page_c')


if __name__ == '__main__':
    print('スクレイピングのコードに毎回書いたタイプ')
    scraper = Scraper()
    scrape_page_a(scraper)

    print('チェックメソッドを毎回呼ぶタイプ')
    scraper = Scraper()
    scrape_page_b(scraper)

    print('デコレーターを使うタイプ')
    scraper = Scraper()
    scrape_page_c(scraper)
scrape_page_aはコードを毎回愚直に書いた場合です。ログインの確認をして、ログインをしていなければ別の何かをする。ログインをしようとして失敗したら失敗のフローに移ります。

scrape_page_bは上記を関数に切り出して読み込み、そのページならではの処理をしてその後に後処理を書くといったことをしています。

scrape_page_cは関心事の関数だけを切り出し、その関数をログインの処理と後処理に対して渡し、渡された関数をその間で呼ぶ、といったことをしています。need_loginという関数が高階関数です。高階関数を利用するにはそのページならではの関数を定義してneed_loginの引数として呼び出して返ってくる関数を変数に格納して利用時にはその変数を呼び出します。通常の呼び出し方より見た目がわかりやすくなるように、Pythonはデコレーターという@を使うシンタックスを導入しました。

ここでは肝になるscrape_page_cという関数を@need_loginというデコレーターでデコレーションするイメージで書けるようになっています。

この機能のメリットは、関心事と共通して持っている性質を分けて書けること、そしてぱっと見で「ログインが必要であること」と「どういう処理になっているか」が分かることです。冗長な部分はほとんどありません。

デコレーターという発明は便利なので、Python以外の言語からも実装を希望する声をよく聞きます。 私もほかの言語で書いているときに、Pythonではデコレーターで書くような処理をわかりやすく書くにはどう書けば良いのかを識者に聞いたりしたりしていますが、その度にデコレーターの良さを実感します。

②名前空間
名前空間はPythonの禅（The Zen of Python）にも登場するほど大事なものです。Pythonの禅はPythonインタプリタ上でimport thisと入力すると表示されます。Pythonならではのジョークだとも言われていますが、個人的には非常に大事なことが書かれていると思っています。『パーフェクトPython』はPythonの禅を真面目に解説している数少ない書籍です（笑）。

【The Zen of Python】

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren’t special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one—and preferably only one—obvious way to do it.
Although that way may not be obvious at first unless you’re Dutch.
Now is better than never.
Although never is often better than right now.[n 1]
If the implementation is hard to explain, it’s a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea—let’s do more of those!
名前空間は、最後の一文に出てきます。

Namespaces are one honking great idea — let’s do more of those!
ネームスペース（名前空間）はすごくよいアイデアの1つ。もっと考えよう！
多くのプログラミング言語はincludeという仕組みを採用しています。分割されたファイルに記載された変数や関数などは、includeをいくつか経由していても使えてしまうのです。

例えばa、b、cというファイルがあったときにbがaの何かをincludeしており、cはbをincludeしているといった場合、aで定義されている変数や関数はcでも使えてしまうということです。逆に言えば、bでaをincludeするのをやめた瞬間cは使えなくなってしまいます。同じ名前の変数を上書きしてしまう、ということも発生するかもしれません。

この問題を回避するために、クラスやモジュールといったもので閉じ込めようとしている言語もありますが、includeである限りはその名前空間自体がインクルードされ、最終的に1つのファイルに展開されてしまう点は変わりません。

ではPythonはどうかというと、グローバル変数はファイルというモジュール単位で閉じこもっています。

さらに明示的なインポートという形でどのファイルからどの名前を持ってくるのか、あるいはファイル自体を持ってくるのかといったようにどこから何を持ってきたのかが明示的になります。あるファイルを使っていても自動的に全て使えるわけではないので、名前空間は区切られているというわけです。非常にバグが起きにくいですし、どこでどの変数名や関数名が定義されているのかがひと目で分かる優れた機能です。

(modulea.py)
VAR1 = True
VAR2 = True

(moduleb.py)
from modulea import VAR1, VAR2  # modulea.pyからVAR1とVAR2をmoduleb.pyの名前空間にimport

(modulec.py)
from moduleb import VAR1  # moduleb.pyにimportされたVAR1をmodulec.pyの名前空間にimport

if __name__ == '__main__':
    print(VAR1)
    print(VAR2)  # NameError: name 'VAR2' is not define  ← modulec.pyの名前空間にはimportされていない
③演算子のオーバーロードと多重継承
誤りが起きやすいということで搭載していないプログラミング言語が多いのですが、Pythonはあえて採用しています。上手く使えれば非常に綺麗に書けるものです。

以下は算術演算子のオーバーロードをした例です。

class One:
    def __add__(self, other):  # + された時に呼び出されます
        if not isinstance(other, self.__class__):
            raise TypeError('Only One and One can be added')
        return 2

if __name__ == '__main__':
    one1 = One()
    one2 = One()
    print(one1 + one2)  # 2
    print(one1 + 1)  # TypeError
addを定義しておくと、one1に足し算記号が発生した際にone2がaddのotherの部分に入ります。そこで予期している型かをチェックします。本来ならoneというものが値を持っていて、確認をした上で何か処理をして値を変える…ということができます。今回はoneが絶対に1ということで、oneとoneを足すと2が入る。one+one+oneになった瞬間にバグるので残念な例です（笑）。 そういう足し算を普通にできるという意味では非常に便利です。通常ならaddのようなメソッドを用意するところから始めなければなりません。なぜもともとある値型は+でいいのに、自分で定義した数値は+できないのか、といった一貫性のない状態を排除できるのです。

演算子だけではなく、シーケンスのスライスも同様の仕組みで記述可能です。DjangoのO/R Mapperにおいては、Pythonのリストを扱うようなイメージでデータベースの集合を操作できます。

多重継承については、いろいろなものを継承してしまうとどれを抱えているのかが分かりにくくなりますし、実際解決できないこともあります。しかし、多段の継承になってしまう、冗長になりロジックが重複してしまう、コンポジットで誤魔化すといったことになるのは、目的を見失っている感があります。継承を使っていろいろな機能をシンプルに入れることができる点自体は、非常に便利だということをお伝えしておきたいです。

④ディスクリプター
これも少し変わった機能です。通常はgetter/setterをクラスの変数やプロパティごとに定義する必要があるのですが、ディスクリプターを使うとある変数へのset/get/deleteに対して機能を持たせられます。

ディスクリプターについての例を以下にご紹介します。

def absolute_integer(value):
    if value is None:
        return 0
    if not isinstance(value, int):
        raise TypeError
    if value < 0:
        return value * -1
    return value

class AbsoluteInteger:
    def __set__(self, instance, value):
        instance.value = absolute_integer(value)

    def __get__(self, instance, owner):
        return instance.value

class SomeClass:
    data1 = AbsoluteInteger()  # インスタンスの属性ではなくてクラスの属性です
    data2 = AbsoluteInteger()

if __name__ == '__main__':
    var1 = SomeClass()
    var2 = SomeClass()

    var1.data1 = 3
    var2.data1 = -2
    print(var1.data1)  # 3
    print(var2.data1)  # 2
setが属性に対して行われたとき、ディスクリプター側でsetというメソッドが起動されます。なのでvar1.data1=3としたときには=3でsetが呼ばれ、その中で渡されたものに1行目から始まる関数が適用されています。 何もなければ0をvar1のdata1に移し、0以下なら+にして格納する。こういったことを属性ごとではなく、ディスクリプターで設定できます。

DjangoのO/R Mapperのモデルは仕組みを深堀りして見ていくと非常に面白いと思います。

⑤速くする仕組み
Pythonは書きやすく柔軟な動作をする代わり、あまり動作が速くありません。遅すぎるということはありませんが、とても速いというわけでもないのです。

その対応として、高速に動作させたい箇所はC言語で記述できるAPIが標準で規定されています。並列処理を行うとなると今度はメモリを破壊するという問題が発生するのですが、そこで登場するのがGILという仕組みです。GILはPythonのVM上でプログラムが同時に動かないよう制限しているものです。

これは逆に言えば、CPUを一つしか使えないということでもあります。プロセッサが単一でタイムシェアリングをしている時代は良かったのですが、ムーアの法則が終わりを告げ、マルチコアやハイパースレッディングといったCPUを並列で動作させる時代ではCPUを使い切ることができません。

そこで今はPythonにmultiprocessingというモジュールが入っており、プロセス自体を分けることで並列動作させられるようになっています。 弱点を作ってしまったら、そこを補うものを用意する。そういった周辺の仕組みも面白さのひとつです。

私が自作したブログを生成するコードをご紹介します。

昔はブログ記事が増えてくるとファイルの読み込みに時間がかかっていたのですが、今はSSDのおかげで読み込みが非常に速くなりましたので、構造化テキストをHTMLに変換する部分を並列化したものです。

【ブログを生成するコード】

def glob_rst_documents(base_path):
    pool = Pool(config.settings.multiprocess)  # 指定数でワーカープールを作成しています
    story_list = pool.map(
        unmarshal_story,  # 並列処理させたい関数
        list(glob('{0}/**/*.rst'.format(base_path), recursive=True))  # 並列処理させる対象
    )
    pool.close()
    pool.join()  # 全ての並列処理が終わるのを待ちます
    story_list.sort()
    return story_list
複数のプロセスを使って、全ての文章を処理し終えたら次に進むというコードが記述してあります。全体を知りたい場合にはリポジトリを参照してください。

6. 最後に―Python学習の勧めとPythonのパラドックス
Pythonはかなり幅広い領域を扱えます。3DCGの世界ではツールの自動化スクリプトでデファクトとなっていますし、最近流行している機械学習はもちろん、数値計算、GUIプログラミングも簡単です。

Pythonista3というアプリを使えば、iPhoneやiPad上でPythonプログラムを動作させることもできます。IoTの分野に登場するArduinoなどでもPythonは動作します。

これだけの領域を扱える言語はそうそうありません。もちろんなんでもPythonでできるというわけではありませんが、新しい領域にチャレンジしたい、何かを体得したいと思ったときにまずはPythonで試しに書けるようになっておくというのは悪くない選択肢です。

ただ、Pythonだけを使えるというのはPython自体の面白さが少し薄れてしまうかもしれません。静的にコンパイルされるような言語も一つ習得することを前提にしつつ学んでみるのがいいかもしれません。ニュアンスとしては何かを試す時にPythonを使えるようになっておくと良い、という感じでしょうか。

Pythonで最後までプロダクトを作ることが悪いのではなく、PythonだけができるプログラマーはPythonっぽくないという感覚があります。

ハッカーと画家で有名なポール・グレアム氏の「Pythonのパラドックス」という有名な文章がありますが、そこでは企業はPythonを使える人を探したいのではなくても、Pythonを学ぼうとする人を探すべきだとしています。Pythonを使える人はほかの言語も大体使えるからです。Pythonにはこういうパラドックス的な考え方が、長い間流通しています。

最後に、「Pythonのパラドックス」書かれている一文を紹介して終わりにします。

「メジャーな言語をほとんど全て知っていて、彼自身のプロジェクトにはPythonを使っている友人がいます。彼がPythonを選んだのはソースコードの見た目が理由だそうです」


株式会社ディー・エヌ・エー システム本部CTO室　露木誠さん

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---
title: Pythonの特殊メソッド一覧を備忘録としてまとめてみた。
tags: Python Python3
author: y518gaku
slide: false
---
## 特殊メソッド利用
* オブジェクトの振る舞いの変更、特殊な挙動を持たせたい場合に特殊メソッドを使用する
* インスタンスに対して演算子を使った操作ができる
* 演算子使用時に特殊メソッドが呼び出される

## 算術演算子を定義する特殊メソッド
* `__add__(self,オブジェクト)`:「＋」で足し算を行うときに呼び出されるメソッド(+演算子使用時に呼び出される）
* `__sub__(self,オブジェクト)`:「―」で引き算を行うときに呼び出されるメソッド
* `__mul__(self,オブジェクト)`:「＊」で掛け算を行うときに呼び出されるメソッド
* `__truediv__(self,オブジェクト)`:「／」で割り算を行うときに呼び出されるメソッド
* `__floordiv__(self,オブジェクト)`:「／／」で割り算を行うときに呼び出されるメソッド(小数点以下切り捨てで整数値で返す）

なお、`__iadd__()`,`__isub__()`のように上記のメソッド名の頭にiを加えると複合演算子「+=」、「-=」、を定義できる。他も同様。

```python
class Car():
    def __init__(self,value):
        self.value = value

    def __add__(self,other):
        return self.value + other.value

    def __sub__(self,other):
        return self.value - other.value

    def __mul__(self,other):
        return self.value * other.value

    def __truediv__(self,other):
        return self.value / other.value

    def __floordiv__(self,other):
        return self.value // other.value

car1 = Car(10)
car2 = Car(20)
print(car1+car2) #30
print(car1-car2) #-10
print(car1*car2) #200
print(car1/car2) #0.5
print(car1//car2) #0
```


## ビット演算子を定義する特殊メソッド
* `__and__(self,オブジェクト)`:「&」を使うときに呼び出されるメソッド
* `__or__(self,オブジェクト)`:「|」を使うときに呼び出されるメソッド

```python

class Car():
    def __init__(self,value):
        self.value = value

    def __and__(self,other):
        return self.value & other.value

    def __or__(self,other):
        return self.value | other.value

car1 = Car(1)
car2 = Car(0)
print(car1&car2) #0
print(car1|car2) #1
```

## 比較演算子を定義する特殊メソッド[拡張比較 (rich comparison) メソッド]
* `__eq__(self,オブジェクト)`:「==」を使うときに呼び出されるメソッド
* `__ne__(self,オブジェクト)`:「!=」を使うときに呼び出されるメソッド
* `__lt__(self,オブジェクト)`:「<」を使うときに呼び出されるメソッド(less thanの意）
* `__gt__(self,オブジェクト)`:「>」を使うときに呼び出されるメソッド(greater thanの意）

```python
class Car():
    def __init__(self,value):
        self.value = value

    def __eq__(self,other):
        return self.value == other.value

    def __ne__(self,other):
        return self.value != other.value

    def __lt__(self,other):
        return self.value < other.value

    def __gt__(self,other):
        return self.value > other.value

car1 = Car(1)
car2 = Car(0)
print(car1==car2)
print(car1!=car2)
print(car1<car2)
print(car1>car2)
#以下、結果
False
True
False
True

```



## 型変換を定義する特殊メソッド
* `__int__(self)`:int()関数を使うときに呼び出されるメソッド
* `__float__(self)`:float()関数を使うときに呼び出されるメソッド
* `__str__(self)`:str()関数,組み込み関数 format(), print() を使うときに呼び出されるメソッド
* `__repr__(self)`:オブジェクトの文字列表記(オブジェクトの印字可能な表現を含む文字列）を返すメソッド


***※`__str__(self)`と`__repr__(self)`の違いについては下記記載***

なお参考までに：[http://taustation.com/python3-str-repr/],  [https://gammasoft.jp/blog/use-diffence-str-and-repr-python/]

* `__bytes__(self)`:bytes()関数を使うときに呼び出されるメソッド
* `__format__(self,form_spec)`:format()メソッド使用時に呼び出される[https://docs.python.org/ja/3/library/functions.html#format]


```python
class Car():
    def __init__(self,value):
        self.value = value
        self.str = "あいうえお"

    def __int__(self):
        return int(self.value)

    def __float__(self):
        return float(self.value)

#    def __str__(self):
#        return str(self.value)

    def __repr__(self):
        return repr(self.value)

    def __bytes__(self):
        return bytes(self.value)

    def __format__(self, form_spec):
        return self.str

car1 = Car(1)
car_str = Car("a")
print(int(car1))
print(float(car1))

print(str(car1))
print(car_str)
print('{}'.format(car1,0))
repr(car1)

#以下、結果
1
1.0
1
'a'
あいうえお
```

### ※__str__()メソッドと __repr__()について
```python

#__str__()メソッドと __repr__()を定義しなかったとき
print(str(car1))     #<__main__.Car object at 0x000002A4A2B16F60>
print(car1)          #<__main__.Car object at 0x000002A4A2B16F60>
print(car_str)       #<__main__.Car object at 0x000002A4A2B16940>

#__str__()だけを定義したとき
car1 = Car(1)
car_str = Car("a")
print(str(car1))  #1
print(car1)       #1
print(car_str)    #a

#__repr__()だけを定義したとき
car1 = Car(1)
car_str = Car("a")
print(str(car1)) #1
print(car1)      #1
print(car_str)   #'a'

# 両方定義したとき
import datetime
today = datetime.date.today()
print(str(today))    #2019-08-19
print(repr(today))   #datetime.date(2019, 8, 19)
```

## コンテナ型で利用する特殊メソッド
* コンテナ型とはリストやタプル、ディクショナリのように、複数の要素数を持つ型の総称
* `__len__(self)`:組み込み関数len()を呼び出したときに実行されるメソッド
* `__getitem__(self,キー)` :要素を参照(`list[1]`,`d["key"]`)するときに呼び出されるメソッド
* `__setitem__(self,キー)`:引数のキーに要素を代入メソッド
* `__delitem__(self,キー)`:del文が使用されたときに呼び出されるメソッド
* `__iter__(self)`:iter()関数使用時に呼び出される
* `__conteins__(self)`:比較演算子「in」が使われたときに呼び出されるメソッド（戻り値はTrueかFalse）

## アトリビュートのアクセスに利用される特殊メソッド
* `__getattr__(self,アトリビュート名)`:未定義のアトリビュートが参照されるときに呼び出されるメソッド
* `__getattribute__(self,キー)` :全てのアトリビュートが参照されるときに呼び出されるメソッド
* `__setatter__(self,キー)`:オブジェクトのアトリビュートに代入しようとするときに呼び出されるメソッド（このメソッド内で代入を行わないとアトリビュートに追加ができない


## 参考文献
* みんなのPython 第4版
* エキスパートPythonプログラミング改訂2版

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

とほほのPython入門 - 構文
トップ > Python入門 > 構文
Hello world!
Python で Hello world! を出力するプログラムは下記の様に記述します。拡張子は .py(例: test.py) です。

Python
print "Hello world!"
ただし、Python 3 では上記の記法は禁止され、下記の様に記述します。(以後、本書では、基本的に Python 2.7 に従って説明します。)

Python
print("Hello world!")
プログラムが完成したら、次のように実行します。

Python
python test.py
文・式
Python では、改行が文の区切りとなります。

Python
print "Hello"
print "World"
Perl や PHP の様にセミコロン(;)で区切ることもできます。

Python
a = 5; b = 3; c = a + b
print c
文を数行に分けて記述したい場合は、行末にバックスラッシュ(\)を書きます。

Python
total = 123 \
      + 456 \
      + 789
(...), [...], {...} 中のカンマ(,)の後ろはバックスラッシュ(\)を省略することができます。

Python
months = [ 'Jan', 'Feb', 'Mar', 'Apr',
           'May', 'Jun', 'Jul', 'Aug',
           'Sep', 'Oct', 'Nov', 'Dec' ]
コメント(#)
ハッシュ(#)から行末まではコメントとみなされます。

Python
print "Hello"       # Helloと表示します
ただし、バックスラッシュによる継続行の箇所にはコメントを記述することができません。

Python
total = 123 \    # ここにコメントは記述できない
      + 456      # ここには記述できる
カンマ(,)による継続行にはコメントを記述することができます。

Python
months = [ 'Jan', 'Feb', 'Mar', 'Apr',     # ここにはコメントを記述できる
           'May', 'Jun', 'Jul', 'Aug',     # ここにはコメントを記述できる
           'Sep', 'Oct', 'Nov', 'Dec' ]
インデント
Perl や PHP では文を { ... } で囲むことでブロック(複文)を構成しますが、Python ではインデント(行頭の空白文字の数)が重要な意味を持ち、同じ数の空白でインデントされた文がブロックとみなされます。

Python
a = 3
if a == 5:
    print "AAA"    # if文の対象
    print "BBB"    # if文の対象
print "CCC"        # if文の対象ではない
インデントには通常、4個の空白文字を使用します。タブ文字は、インデントが8の倍数になるように1～8個の空白文字とみなされます。

Python
[空白][空白][TAB]print "AAA"         # 8文字の空白とみなされる
エンコードルール(coding:)
Python 3 では不要となりましたが、Python 2 では、日本語など、ASCII以外の文字を含むスクリプトを作成する場合は、スクリプトの1行目、または2行目に、下記の形式でスクリプトの エンコードルール(coding:) を指定してください。大文字・小文字は無視されます。

Python
# coding: utf-8

print "Hello world"    # 文字列やコメントに日本語を使えるようになります
Emacs との互換性を考慮し、下記の様に記述することもできます。

Python
# -*- coding: utf-8 -*-
エンコードルールには下記などがあります。

Python
# coding: utf-8
# coding: Shift_JIS
# coding: EUC-JP
# coding: cp932

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

整数(int)
整数(int)は下記の様に記述します。

Python
num = 1234        # 正の整数
0o(0O), 0x(0X), 0b(0B) はそれぞれ、8進数、16進数、2進数を意味します。

Python
num = 0o777        #  8進数 (0oで始まる数値は 8進数とみなされる)
num = 0xffff       # 16進数 (0xで始まる数値は16進数とみなされる)
num = 0b11000100   #  2進数 (0bで始まる数値は 2進数とみなされる)
長整数(long)
長整数(long)は、整数(int)を超える桁数の整数を扱います。末尾に l か L をつけますが、l は 1 と間違えやすいので L を使うのがよいでしょう。整数(int)の最大値(sys.maxint)はシステムにより異なり、231-1 だったり 263-1 だったりします。

Python
num = 9223372036854775808L
長整数は、メモリが許す限り桁数に制限はなく、長整数同士の演算では計算誤差も生じません。

Python
num = 1234567890123456789012345678901234567890123456789012345678901234567890L
Python 3 では、整数(int) と長整数(long)は統合され、すべて整数(int)として扱われるようになり、L や l も廃止されました。

Python
num = 123L       # Python 3 ではエラー(SyntaxError例外)
浮動小数点数(float)
浮動少数点数(float)は下記の様に記述します。e2 は 10の2乗を意味します。

Python
num = 1.234     # 浮動小数点数
num = 1.2e3     # 浮動小数点数(指数表記) 1.2 × 103
num = 1.2E-3    # 浮動小数点数(指数表記) 1.2 × 10-3
虚数(complex)
虚数(complex)には j または J をつけます。

Python
num = 3.14j
論理値(bool)
論理値(bool)は、True または False で表します。最初の1文字は大文字で記述します。

Python
bool = True
bool = False
Python では、False、数値の 0 や 0.0、空文字("")、空リスト([])、空タプル(())、空辞書({})などを偽とみなし、それ以外を真とみなします。

文字列(str)
文字列(str)は、ダブルクォート(")、またはシングルクォート(')で囲みます。

Python
str = "Hello world"
str = 'Hello world'
"..." の中では ' を、'...' の中では " を使うことができます。"..." の中で " を、'...' の中で ' を使用するには、バックスラッシュ(\)を用いて引用符をエスケープ(無効化)します。

Python
str = "We can use \" in the string."
str = 'We can use \' in the string.'
バックスラッシュ(\)を用いることで、複数行に分けることができます。

Python
str = 'Hello \
world!'
"..." や '...' の前に r または R をつけると、後述するエスケープシーケンスが無視されます。

Python
str = 'aaa\nbbb'        # \n は改行とみなされる
str = r'aaa\nbbb'       # \n はバックスラッシュ(\)と小文字nとみなされる
三重クォート """...""" や '''...''' は、複数行にまたがった文字列を記述することができます。三重クォートはしばしば、複数行のコメントとして利用されることがあります。

Python
str = """A simple example module
This module is ...
"""
複数の文字列をスペースで区切ることで、連結することができます。

Python
print 'Hello ' 'world!'
Unicode文字列(unicode)とバイト列(bytes)
Python 2 では、日本語など ASCII 以外の文字を扱うには、u"..." や u'...' を用いた Unicode文字列(unicode) とする必要がありました。

Python
# Python 2
len = len(u'あいうえお')       # ちゃんと5文字として数えられる
len = len('あいうえお')        # Unicodeに対応していないため15文字と数えられる
Python 3.0 では u が廃止され、"..." や '...' が Unicodeも扱える文字列(str)を示すようになりました。代わりにバイト列(bytes)を示す b"..." がサポートされました。Python 3.3 では互換性考慮のため u"..." が文字列(str)として復活しました。Python 2 では b"..." は文字列(str)として扱います。

"..."
'...'	u"..."
u'...'	b"..."
b'...'
Python 2.x	文字列(str)	Unicode文字列(unicode)	文字列(str)
Python 3.0-3.2	文字列(str)	SyntaxError	バイト列(bytes)
Python 3.3-	文字列(str)	文字列(str)	バイト列(bytes)
Python 3 でバイト列(bytes)とUnicodeを含む文字列(str)を変換するには下記の様にします。

Python
byte_string = b"\xe3\x81\x82"
utf8_string = byte_string.decode()    // バイト列から文字列に変換
print(utf8_string)

utf8_string = "あ"
byte_string = utf8_string.encode()    // 文字列からバイト列に変換
print(byte_string)
Shift_JIS/EUC/JISとの変換
Python 3 では、シフトJIS(Shift_JIS)、Windows版シフトJIS(CP932)、EUC(EUC-JP) や ISO-2022-JP(俗にいうJISコード) などの文字列はバイト列(bytes)として扱います。Unicode文字列(str)とバイト列(bytes)を変換するには下記の様にします。

Python
# Unicode文字列からUTF8/SJIS/CP932/EUC/JISバイト列への変換
utf8_str = "あ"
utf8_bytes = utf8_str.encode('utf-8')             # UTF-8バイト列: b'\xe3\x81\x82'
sjis_bytes = utf8_str.encode('sjis')              # Shift_JISバイト列: b'\x82\xa0'
cp932_bytes = utf8_str.encode('cp932')            # CP932バイト列: b'\x82\xa0'
eucjp_bytes = utf8_str.encode('euc_jp')           # EUC-JPバイト列: b'\xa4\xa2'
jis_bytes = utf8_str.encode('iso2022_jp')         # ISO-2022-JPバイト列: b'\x1b$B$"\x1b(B'

# UTF8/SJIS/CP932/EUC/JISバイト列からUnicode文字列への変換
utf8_str = utf8_bytes.decode('utf-8')             # あ
utf8_str = sjis_bytes.decode('sjis')              # あ
utf8_str = cp932_bytes.decode('cp932')            # あ
utf8_str = eucjp_bytes.decode('euc_jp')           # あ
utf8_str = jis_bytes.decode('iso2022_jp')         # あ
エスケープシーケンス(\x)
文字列の中では、下記のエスケープシーケンスを使用できます。

エスケープシーケンス
\改行 : バックスラッシュと改行が無視される
\\ : バックスラッシュ(\)
\' : シングルクォート(')
\" : ダブルクォート(")
\a : ベル(BEL)
\b : バックスペース(BS)
\f : フォームフィード(FF)
\n : 改行(LF)
\r : 復帰(CR)
\t : タブ(TAB)
\v : 垂直タブ(VT)
\nnn : 8進表記文字(nは0～7)
\xnn : 16進表記文字(nは0～f)
\uxxxx : ユニコード文字xxxx (例: u"\u3042")
\U....xxxx : ユニコード文字xxxxxxxx (例: U"\U00003042")
\N{name} : Unicodeデータベース文字 (例: u"\N{HIRAGANA LETTER A}")
文字列のフォーマット(%)
% 演算子を用いて、C言語の printf()文に似た記法で、下記の様に文字列を フォーマット することができます。ひとつ目の変数 errmsg の値が %s の箇所に、ふたつ目の変数 errcode の値が %d の箇所に挿入されます。

Python
errmsg = "Can't open file"
errcode = 19042
msg = "ERROR: %s (%d)" % (errmsg, errcode)
print msg                                    #=> ERROR: Can't open file (19042)
%s は文字列、%d は整数、%f は浮動小数点数、%x は16進数、%o は8進数、%% は %自身を示します。

Python
print "%s" % "ABC"          #=> ABC
print "%d" % 123            #=> 123
print "%f" % 1.23           #=> 1.23
print "%x" % 255            #=> ff
print "%o" % 255            #=> 377
print "%%%d" % 80           #=> %80
% に続く数値で文字幅や桁数を指定することができます。

Python
print "|%5s|" % 'ABC'        #=> |  ABC| : 右寄せ5文字分
print "|%-5s|" % 'ABC'       #=> |ABC  | : 左寄せ5文字分
print "|%5d|" % 123          #=> |  123| : 右寄せ5桁
print "|%-5d|" % 123         #=> |123  | : 左寄せ5桁
print "|%+5d|" % 123         #=> | +123| : ±符号付き
print "|%5.2f|" % 1.23       #=> | 1.23| : 全体桁数.少数点以下の桁数
print "|%05d|" % 123         #=> |00123| : 0埋め
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

変数・定数
トップ > Python入門 > 変数・定数
変数
Python の 変数 は、アンダーバー(_)を含む英数字からなる名前で表します。最初の1文字はアンダーバー(_)または英字でなくてはなりません。

Python
value1 = 123
_value1 = 123
test_value = 123
TEST_VALUE = 123
定数
Python では 定数 はサポートされていません。慣習的に大文字とアンダーバー(_)のみの変数が固定値を表現することが多いようです。

Python
PI = 3.14
MAX_BUFFER_SIZE = 1024
ドキュメントストリング(__doc__)
モジュールの冒頭、クラスの冒頭、関数の先頭に三重クォート """...""" で記述したコメントは、ドキュメントストリング と呼ばれ、モジュールオブジェクト、クラスオブジェクト、関数オブジェクトの __doc__ アトリビュートで参照することができます。

mymod.py Python
"""A sample module"""
class MyClass:
    """A sample class"""
    def myfunc(self, x, y):
        """A sample function"""
        return x + y
mytest.py Python
import mymod
print mymod.__doc__                  #=> A sample module
print mymod.MyClass.__doc__          #=> A sample class
print mymod.MyClass.myfunc.__doc__   #=> A sample function
ドキュメントストリングはまた、対話モードで使用される help() でも参照されます。

Linux
$ python
>>> import mymod
>>> help(mymod)
Help on module mymod:

NAME
    mymod - A sample module

FILE
    /root/mymod.py

CLASSES
    MyClass

    class MyClass
     |  A sample class
     |
     |  Methods defined here:
     |
     |  myfunc(self, x, y)
     |      A sample function
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
リスト・タプル・辞書
リスト(list)
[...] でリスト(list)を表します。

Python
a = [10, 20, 30, 40]
下記の様に改行して記述することもできます。最後のカンマ(,)は省略可能です。

Python
colors = [
    'red',
    'green',
    'blue',
]
異なる型の要素のリストを作ることもできます。

Python
a = [10, 'ABC']
リストの要素にアクセスするには for を用います。

Python
a = [1, 2, 3, 4, 5]
for n in a:
    print n
[n] で n番目の要素を参照します。最初の要素を 0番目と数えます。

Python
a = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
a1 = a[0]       # 0番目: 'A'
a2 = a[2]       # 2番目: 'C'
[n:m] で n番目から m番目の前まで(つまり m - 1番目まで)の要素を参照します。n を省略すると最初から、m を省略すると最後までの要素を参照します。

Python
a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
a1 = a[2:4]     # 2番目から3番目: [2, 3]
a2 = a[2:]      # 2番目から最後: [2, 3, 4, 5, 6, 7, 8, 9]
a3 = a[:4]      # 最初から3番目: [0, 1, 2, 3]
[n:m:s] は s個とばしで参照します。

Python
a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
a1 = a[1:8:2]            # 1番目から7番目まで2個とばし: [1, 3, 5, 7]
n, m にマイナスの値を指定すると、後ろから数えます。

Python
a = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
a1 = a[-1]           # 最後の文字 'G'
a2 = a[-3:-1]        # 最後から3番目の文字から最後から1番目の前の文字: ['E', 'F']
+ 演算子を用いてリストを結合することができます。

Python
print [1, 2, 3] + [4, 5, 6]        #=> [1, 2, 3, 4, 5, 6]
len() を用いてリストの個数を調べます。

Python
print len([1, 2, 3])           #=> 3
リストのリストを作ることも可能です。

Python
a = [[1, 2], [3, 4], [5, 6]]

for list in a:
    for n in list:
        print n,              #=> 1 2 3 4 5 6
タプル(tuple)
(...) で要素を並べたものをタプル(tuple)と呼びます。タプルはリストとほぼ同じように使用できますが、要素を変更できない点が異なります。

Python
a = (10, 20, 30, 40)
要素がひとつだけの時は、最後にカンマ(,)を記述する必要があります。

Python
a = (10)                # タプルではなく数値の10となる
a = (10,)               # タプルの(10,)となる
リスト要素は変更することはできますが、タプル要素を変更することはできません。

Python
a1 = [10, 20, 30, 40]
a2 = (10, 20, 30, 40)

a1[2] = 60              # 代入できる
a2[2] = 60              # エラーとなり、TypeError例外が発生する
タプルからリストに変換するには list() を、リストからタプルに変換するには tuple() を使います。

Python
print list((1, 2, 3))     #=> [1, 2, 3]
print tuple([1, 2, 3])    #=> (1, 2, 3)
辞書(dict)
{...} は、辞書(dict)と呼ばれるキーと値のペアのリストを保持します。

Python
d = {'Yamada': 30, 'Suzuki': 40, 'Tanaka': 80}
各要素には次のようにアクセスします。

Python
d1 = d['Yamada']
d2 = d['Suzuki']
d3 = d['Tanaka']
全ての要素や値を参照するには、items(), keys(), valus(), iteritems() を使用します。参照される要素の順序は順不同です。

Python
d = {'Yamada': 30, 'Suzuki': 40, 'Tanaka': 80}

for k, v in d.items():
    print k, v             # Tanaka 80, Yamada 30, Suzuki 40

for k in d.keys():
    print k, d[k]          # Suzuki 40, Yamada 30, Tanaka 80

for v in d.values():
    print v                # 80, 30, 40

for k, v in d.iteritems():
    print k, v             # Tanaka 80, Yamada 30, Suzuki 40
リスト関数(map(), filter(), reduce())
map() はリストの各要素に対して処理を行い、行った結果を返します。下記の例では各要素を2倍にする処理を行います。

Python
a = [1, 2, 3]

def double(x): return x * 2
print map(double, a)                #=> [2, 4, 6] : 関数方式
print map(lambda x: x * 2, a)       #=> [2, 4, 6] : lambda方式
print [x * 2 for x in a]            #=> [2, 4, 6] : 内包表記(後述)
filter() はリストの各要素に対して処理を行い、処理結果が真となる要素のみを取り出します。下記の例では各要素から奇数のみを取り出します。

Python
a = [1, 2, 3]

def isodd(x): return x % 2
print filter(isodd, a)              #=> [1, 3] : 関数方式
print filter(lambda x: x % 2, a)    #=> [1, 3] : lambda方式
print [x for x in a if x % 2]       #=> [1, 3] : 内包表記(後述)
reduce() はリストの最初の2要素を引数に処理を呼び出し、結果と次の要素を引数に処理の呼び出しを繰り返し、単一の結果を返します。下記の例では、各要素の合計を計算しています。

Python
a = [1, 2, 3, 4, 5]

def add(x, y): return x + y
print reduce(add, a)                #=> 15 : 関数方式
print reduce(lambda x, y: x + y, a) #=> 15 : lambda方式
リストの内包表記
リストの内包表記 を用いることで、map(), filter(), lambda を使用しないで簡単なリスト演算を行うことができます。

Python
a = [1, 2, 3]
print [x * 2 for x in a]                        #=> [2, 4, 6]
print [x * 2 for x in a if x == 3]              #=> [6]
print [[x, x * 2] for x in a]                   #=> [[1, 2], [2, 4], [3, 6]]
print [(x, x * 2) for x in a]                   #=> [(1, 2), (2, 4), (3, 6)]

b = [4, 5, 6]
print [x * y for x in a for y in b]             #=> [4, 5, 6, 8, 10, 12, 12, 15, 18]
print [a[i] * b[i] for i in range(len(a))]      #=> [4, 10, 18]
セット(set)
セット(set)は、重複の無いリストを扱います。セット同士の減算、OR、AND、XOR 操作が可能です。

Python
a = set(['red', 'blue', 'green'])
b = set(['green', 'yellow', 'white'])

print a                #=> set(['red', 'blue', 'green'])
print b                #=> set(['green', 'yellow', 'white'])
print a - b            #=> set(['red', 'blue'])
print a | b            #=> set(['red', 'blue', 'green', 'yellow', 'white'])
print a & b            #=> set(['green'])
print a ^ b            #=> set(['red', 'blue', 'yellow', 'white'])
print 'green' in a     #=> True
a.add('black')
print a                #=> set(['red', 'blue', 'green', 'black'])


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
演算子
代数演算子(+, -, *, /, %, **, //)
下記の演算子が定義されています。

Python
+a            # 正数
-a            # 負数
a + b         # 加算
a - b         # 減算
a * b         # 乗算
a / b         # 除算
a % b         # a を b で割った余り
a ** b        # a の b 乗
a // b        # 切り捨て除算
ビット演算子(~, &, |, ^, <<, >>)
下記のビット演算子が定義されています。

Python
~a            # ビット反転
a & b         # AND:論理積(aもbも1のビットが1)
a | b         # OR:論理和(aまたはbが1のビットが1)
a ^ b         # XOR:排他的論理和(aまたはbが1のビットが1)
a << b        # b ビット左シフト
a >> b        # b ビット右シフト
代入演算子(=, +=, -=, *=, /=, %=, **=, //=, &=, |=, ^=, <<=, >>=)
下記の代入演算子が定義されています。++ や -- はサポートされていないので、代わりに a += 1 や a -= 1 を用います。

Python
a = b         # a に b を代入する
a += b        # a = a + b に同じ
a -= b        # a = a - b に同じ
a *= b        # a = a * b に同じ
a /= b        # a = a / b に同じ
a %= b        # a = a % b に同じ
a **= b       # a = a ** b に同じ
a //= b       # a = a // b に同じ
a &= b        # a = a & b に同じ
a |= b        # a = a | b に同じ
a ^= b        # a = a ^ b に同じ
a <<= b       # a = a << b に同じ
a >>= b       # a = a >> b に同じ
比較演算子(==, !=, <, >, <=, >=, is, is not, in, not in)
下記の比較演算子が定義されています。

Python
a == b           # a が b と等しい
a != b           # a が b と異なる
a < b            # a が b よりも小さい
a > b            # a が b よりも大きい
a <= b           # a が b 以下である
a >= b           # a が b 以上である
a is b           # a が b と等しい
a is not b       # a が b と異なる
a in b           # a が b に含まれる (a, b は共に文字列、または、b はリストやタプル)
a not in b       # a が b に含まれない (a, b は共に文字列、または、b はリストやタプル)
ブール演算子(and, or, not)
下記のブール演算子が定義されています。

Python
a and b         # a も b も真であれば真
a or b          # a または b が真であれば真
not a           # a が偽であれば真
条件演算(if else)
下記の式は、c が真であれば x を、さもなくば y を返します。

Python
x if c else y
文字列演算(+, *, [n:m])
文字列に対して下記の演算子が定義されています。文字数は 0文字から数えます。n や m にマイナスの数を指定すると、文字列の後ろから数えます。

Python
a + b         # 文字列 a と 文字列 b を連結します
a * n         # 文字列 a を n 回繰り返します
a[n]          # 文字列 a の中の n 番目の文字を取り出します
a[n:m]        # 文字列 a の中の n 番目から m 番目までの文字列を取り出します
a[n:]         # 文字列 a の中の n 番目から最後までの文字列を取り出します
a[:m]         # 文字列 a の中の 0 番目から m 番目までの文字列を取り出します
a[n:m:s]      # 文字列 a の中の n 番目から m 番目までの文字列を s個とばしで取り出します
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

トップ > Python入門 > 制御構文
もし～ならば(if, else, elsif)
文法
if expression:
    suite...
[elif expr:
    suite...]
[else:
    suite...]
if は「もし」を意味します。式が真であれば、インデントされたブロックを実行します。下記の例では、num の値が 10より大きければ BIG を3回表示します。

Python
if num > 10:
    print "BIG"
    print "BIG"
    print "BIG"
else は「さもなくば」を意味します。下記の例では、num が 10より大きければ BIG を、さもなくば SMALL を表示します。

Python
if num > 10:
    print "BIG"
else:
    print "SMALL"
elif は「さもなくばもし」を意味します。下記の例では、num が 10より大きければ BIG を、10と等しければ NORMAL を、さもなくば SMALL を表示します。

Python
if num > 10:
    print "BIG"
elif num == 10:
    print "NORMAL"
else:
    print "SMALL"
if文では、False、数値の 0 や 0.0、空文字("")、空リスト([])、空タプル(())、空辞書({})などを偽とみなし、それ以外を真とみなします。

～のあいだ(while, else)
文法
while expression:
    suite...
[else:
    suite...]
while は「～のあいだ」を意味します。下記の例では、i の値が 10よりも小さい間 i の値を表示します。

Python
n = 0
while n < 10:
    print n
    n += 1
else がある場合は、ループの最後に else節を実行します。

Python
n = 0
while n < 10:
    print n
    n += 1
else:
    print 'END'
～のあいだ(for, in)
文法
for var in expression:
    suite...
[else:
    suite...]
for はリスト、タプルの各要素、辞書のキー、文字列の各文字、ファイルの各行などに対して処理を繰り返します。

Python
for n in [1, 2, 3]:
    print n                  #=> 1, 2, 3
for n in (1, 2, 3):
    print n                  #=> 1, 2, 3
for k in {'one': 1, 'two': 2, 'three': 3}:
    print k                  #=> one, two, three
for c in "123":
    print c                  #=> 1, 2, 3
for line in open("sample.txt"):
    print line               # 1行ずつ表示
処理を10回繰り返したい場合は range() を用います。

Python
for n in range(10):
    print n
文字列に指定した場合は、それぞれの文字に対して実行します。

Python
for c in u'あいうえお':
    print c                  # あ, い, う, え, お
else がある場合は、ループの最後に else節を実行します。

Python
for n in [1, 2, 3]:
    print n
else:
    print 'END'
ループを抜ける(break)
break は最も内側の while, for などのループ処理を抜けます。下記の例では n が 5の時に forループを抜けます。

Python
for n in range(10):
    if n == 5:
        break
    print n                  # 0, 1, 2, 3, 4
ループを繰り返す(continue)
continue は最も内側の while, for などのループ処理を繰り返します。下記の例では n が 5の時に forループの先頭に戻ります。

Python
for n in range(10):
    if n == 5:
        continue
    print n                  # 0, 1, 2, 3, 4, 6, 7, 8, 9
例外処理(try, except, else, finally, raise)
文法
try:
    suite...
[except [expression]:
    suite...]
[else:
    suite...]
[finally:
    suite...]
try, except, else, finally は例外を扱います。

Python
str = 'ABC'
try:
    c = str[5]                    # 5番目の文字が無いので、IndexError例外が発生します
except IOError:
    print 'IOError'               # IOError例外の場合、このブロックが実行されます
except IndexError:
    print 'IndexError'            # IndexError例外の場合、このブロックが実行されます
except:
    print 'Unknown'               # 上記以外の例外の場合、このブロックが実行されます
else:
    print 'Other'                 # 例外が発生しなかった場合、このブロックが実行されます
finally:
    print 'Finally'               # 常に、このブロックが実行されます
raise は例外を発生させます。下記の例は、直近に発生した例外を再発生させます。例外が発生していない場合は TypeError例外を発生させます。

Python
try:
    ...
except:
    raise
下記の例は、SystemErrorクラスのインスタンスを生成し、これを引数に例外を発生させます。

Python
try:
    raise SystemError('Error message')
except SystemError as e:
    print "SystemError"
    print e
下記の例は、'Error message' を引数に SystemError のコンストラクタを呼び出し、生成したインスタンスを引数に例外を発生させます。

Python
try:
    raise SystemError, 'Error message'
except SystemError as e:
    print "SystemError"
    print e
下記の例では自作した例外に引数を与え、生成したインスタンスを引数に例外を発生させています。

Python
class MyError(Exception):
    def __init__(self, file, lineno):
        self.file = file
        self.lineno = lineno

try:
    raise MyError("test.txt", 1163)
except MyError as e:
    print "MyError"
    print e.file
    print e.lineno
例外処理の中で例外を発生させるには、次のパターンがあります。

Python
# 元の例外をそのまま投げる
excent Exception as e:
    raise e

# 新たな例外を生成して投げる
excent Exception:
    raise MyError()

# 元の例外情報をつけて、新たな例外を投げる
excent Exception as e:
    raise MyError() from e

# 元の例外を無視して、新たな例外を投げる
excent Exception:
    raise MyError() from None
with構文(with)
文法
with expression [as target] [, expression [as target]]... :
    suite...
with を用いると、withブロックが終了した際に、オブジェクトの終了処理が自動的に呼ばれます。例えば、open() で返却される file オブジェクトは、終了処理として、close() が自動的に呼び出されます。下記の例で、with を用いた書き方では、withブロックが終了した際に f.close() が自動的に呼び出されます。

Python
# withを用いた書き方1
with open("test.txt") as f:
    print f.read()

アサーション文(assert)
assert はテストの際に値が期待通りに設定されているかを確認するための仕組みです。__debug__ が True の時のみ動作し、式を評価して偽であれば、AssertionError例外を発生させます。python を -O オプション付きで起動することで、__debug__ の値は False になります。

Python
f = func()
assert f == 5              # f の値が期待通り 5になっていることを確認する
assert expression は、下記と等価です。

Python
if __debug__:
    if not expression: raise AssertionError
assert expression1, expression2 は、下記と等価です。

Python
if __debug__:
    if not expression1: raise AssertionError(expression2)
パス文(pass)
pass は何もしない文です。中身の無い関数やクラスを作成する際に使用されます。

Python
def myfunc():
    pass

class MyClass:
    pass
デリート文(del)
del はオブジェクトを削除します。

Python
x = 5
y = [1, 2, 3]
z = MyClass()
del x, y, z
print文(print)
print は変数やオブジェクトを標準出力に出力します。Python 3 では実装が変わっているので、ここでは、Python 2 の print文について説明します。

Python
print 3                    #=> 3
print [1, 2, 3]            #=> [1, 2, 3]
print (1, 2, 3)            #=> (1, 2, 3)
print {'k1':10, 'k2':20}   #=> {'k2': 20, 'k1': 10}
引数をカンマ(,)で複数指定すると、ひとつのスペースで区切って複数の値を表示します。

Python
print "AAA", "BBB"          #=> AAA BBB
通常は、最後に改行(\n)を書き出します。最後の引数の後ろにカンマ(,)をつけると、改行しません。

Python
print "AAA",                # 改行しない
print "BBB"                 # 改行する
下記の様に、フォーマットを指定することもできます。

Python
print "My name is %s." % "Tanaka"
print "%s is %d years old." % ("Tanaka", 28)
print "%(name)s is %(age)d years old." % {'name': "Tanaka", 'age': 28}
標準出力以外に出力するには、>> を用います。

Python
f = open("test.txt", "w")
print >> f, "Hello world!"
f.close()
print文で複数の値を出力すると半角スペースで区切られますが、半角スペースを入れたくない場合は、sys.stdout.write() を使用します。

Python
import sys
sys.stdout.write("Hello")
sys.stdout.write("World")
exec文(exec)
exec文(exec)は、引数の文字列を Python のスクリプトとして実行します。

文法
exec statements [as global [, local]]
サンプルを下記に示します。

Python
exec "print 'Hello'"
global と local には、グローバル変数、ローカル変数を辞書形式で渡します。ローカル変数を省略した場合は、global が両方に適用されます。

Python
exec "print global_x, local_y" in {'global_x': 100}, {'local_y': 200}
statements にはオープンしたファイルや、コンパイルしたコードオブジェクトを渡すこともできます。

Python
f = open("sample.py")
exec f

code = compile("print 'Hello'", "<string>", "exec");
exec code
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

関数
関数(def)
def 文を用いて関数(function)を定義することができます。下記の例では、x と y という二つの引数を受け取り、その合計値を表示する関数 add() を定義し、それを呼び出しています。

Python
def add(x, y):
    print x + y

add(3, 5)            #=> 8
return は関数の戻り値を指定します。return 文を省略すると、関数は None を返します。

Python
def add(x, y):
    ans = x + y
    return ans

n = add(3, 5)
print n             #=> 8
下記の様に、キーワード付き引数を指定することができます。キーワード付き引数は関数定義側で、デフォルトの値を指定することができます。

Python
def repeat_msg(msg, repeat=3):
    for i in range(repeat):
        print msg

repeat_msg('Hello')                    # Hello, Hello, Hello
repeat_msg('Yahho', repeat=5)          # Yahho, Yahho, Yahho, Yahho, Yahho
*name は残りの順序引数を、**name はキーワード付き引数を辞書型で受け取ります。

Python
def func(a1, a2, *args, **params):
    print a1                     #=> A
    print a2                     #=> B
    print args                   #=> ('C', 'D')
    print params                 #=> {'k1': 'K1', 'k2': 'K2'}


func('A', 'B', 'C', 'D', k1='K1', k2='K2')
args や params を変数で渡す場合には、呼び出す側にも * や ** をつけます。

Python
args = ('C', 'D')
params = {'k1': 'K1', 'k2': 'K2'}
func('A', 'B', *args, **params)     #=> A, B, ('C', 'D'), {'k1': 'K1', 'k2': 'K2'}
関数は、複数の値を返却することができます。

Python
def func():
    return 3, "ABC"

n, s = func()
print n, s               #=> 3 ABC
関数定義の冒頭には、"""...""" で ドキュメントストリング を記述することができます。

Python
def func(x, y):
    """A sample function"""
    return x + y
グローバル変数(global)
関数の外部で定義された変数は グローバル変数 として扱われます。関数の中でグローバル変数を参照することはできますが、代入することはできません。代入する場合は、global で宣言する必要があります。

Python
count = 0                   # グローバル変数

def func():
    print count             # 参照することはできる
    global count            # global宣言してやれば
    count += 1              # 代入することもできる
globals() はグローバル変数、locals() はローカル変数の一覧を辞書として返却します。

Python
def func():
    for k in globals().keys():
        print "GLOBAL: %s = %s" % (k, globals()[k])
    for k in locals().keys():
        print "LOCAL: %s = %s" % (k, locals()[k])

func()
ラムダ式(lambda)
ラムダ式(lambda)式は、名前のない小さな関数を定義します。ラムダ式自体は式として扱われるため、関数の引数に指定することができます。

Python
myfunc = lambda x, y: x + y
print myfunc(3, 5)                 #=> 8
lambda式は、sorted(), map(), filter()などの関数に渡す無名関数として利用されることがあります。

Python
a = [1, 2, 3]
print map(lambda x: x ** 2, a)        #=> [1, 4, 9]
イテレータ(iterator)
イテレータ は for文 で使用することができる繰り返し機能を持つオブジェクトです。イテレータオブジェクトは、__iter__() で next() メソッドを持つオブジェクトを返却し、next() メソッドは次の要素を返却し、最後に達すると StopIteration例外を返すようにします。

Python
class MyClass:
    def __init__(self):
        self.data = (1, 2, 3, 4, 5)
        self.index = 0
    def __iter__(self):
        return self
    def next(self):
        if self.index < len(self.data):
            self.index += 1
            return self.data[self.index - 1]
        else:
            raise StopIteration

for n in MyClass():
    print n                      #=> 1, 2, 3, 4, 5
最後の for文は、下記と同等の動作を行っています。

Python
it = MyClass().__iter__()
while 1:
    n = it.next()
    try:
        print n                  #=> 1, 2, 3, 4, 5
    except StopIteration:
        break
ジェネレータ(yield)
yield は、イテレータを返却するジェネレータを定義する際に用いられます。まずは、yield を使用しない例を見てみます。

Python
def funcA(list):
    ret = []
    for n in list:
        ret.append(n * 2)
    return ret

for n in funcA([1, 2, 3, 4, 5]):
    print n                      #=> 2, 4, 6, 8, 10
上記を yield によるイテレータを用いた方式に変更すると下記になります。どちらも実行結果は変わりませんが、funcA() が [2, 4, 6, 8, 10] のリストを返却するのに対し、funcB() はイテレータオブジェクトを返却します。イテレータの場合、値が参照される度に次の値が計算されて返却されます。この例では、5個程度のリストなのでパフォーマンスの差異はありませんが、100万個のリストの場合、funcA() は関数を呼び出した時点で 100万個のリストを生成してしまうのに対し、イテレータの funcB() の場合は、利用した際にのみ次の値を計算するので、メモリや処理効率が改善されます。

Python
def funcB(list):
    for n in list:
        yield n * 2

for n in funcB([1, 2, 3, 4, 5]):
    print n                      #=> 2, 4, 6, 8, 10
もう少し例を見てみましょう。下記は、ファイルを読み込み、__END__ が出現するまでの行を表示するプログラムです。

Python
def readfileA(f):
    lines = []
    for line in f:
        lines.append(line.rstrip())
    return lines

f = open("test.txt")
for line in readfileA(f):
    if (line == "__END__"):
        break
    print line
f.close()
yield によるイテレータを用いると下記の様になります。上記が、最初にファイルをすべて読み込んでメモリに展開してしまうのに対して、イテレータを使用した例では、1行分のメモリしか使用せず、__END__ がきた時点で残りは読み飛ばして処理を終了することができます。

Python
def readfileB(f):
    for line in f:
        yield line.rstrip()

f = open("test.txt")
for line in readfileB(f):
    if (line == "__END__"):
        break
    print line
f.close()
デコレータ(@)
関数を実行する前後に特殊な処理を実行したい場合、@デコレータ を用いることができます。下記の例では、hello()関数を mydecolater でデコレート(装飾)しています。デコレーション関数では、関数実行前に start を、関数実行後に end を出力しています。

Python
def mydecolater(func):        # デコレータを定義する
    def wrapper():
        print "start"         # 前処理を実行する
        func()                # デコレート対象の関数を実行する
        print "end"           # 後処理を実行する
    return wrapper

@mydecolater
def hello():
    print "hello"

hello()                       #=> start, hello, end
デコレータをもう少し汎用化したのが下記のサンプルです。ターゲット関数に @decolater を付与することで、関数の引数や戻り値を表示するサンプルです。wraps()は、ターゲット関数の関数名やドキュメントストリング(__doc__)を保持するために呼び出します。

Python
def mydecolater(func):
    import functools
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        print "Funcname:", func.__name__
        print "Arguments:", args
        print "Keywords:", kwargs
        ret = func(*args, **kwargs)
        print "Return:", ret
        return ret
    return wrapper

@mydecolater
def func(msg1, msg2, flag=1, mode=2):
    """A sample function"""
    print "----", msg1, msg2, "----"
    return 1234

n = func("Hello", "Hello2", flag=1)
print n

print repr(func)
print func.__doc__

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
クラス
クラス(class)
Python の クラス(class)は次のように定義します。クラス名は慣習的に大文字で始めます。

Python
class MyClass:
    """A simple example class"""         # 三重クォートによるコメント

    def __init__(self):                  # コンストラクタ
        self.name = ""

    def getName(self):                   # getName()メソッド
        return self.name

    def setName(self, name):             # setName()メソッド
        self.name = name

a = MyClass()                            # クラスのインスタンスを生成
a.setName("Tanaka")                      # setName()メソッドをコール
print a.getName()                        # getName()メソッドをコール
クラス定義の冒頭には、"""...""" で ドキュメントストリング を記述することができます。

Python
def MyClass:
    """A sample class"""
    (略)
クラス変数・インスタンス変数(attribute)
クラスは、インスタンス変数 と クラス変数 を持つことができます。インスタンス変数は「インスタンス.変数名」で表され、インスタンス毎に独立の変数です。コンストラクタ __init__(後述)の中で初期化することをお勧めします。

Python
class MyClass:
    def __init__(self):
        self.name = ""              # インスタンス変数

a1 = MyClass()
a1.name = "Tanaka"

a2 = MyClass()
a2.name = "Suzuki"

print a1.name                        #=> Tanaka
print a2.name                        #=> Suzuki
クラス変数は「クラス名.変数名」で表され、すべてのインスタンスで共通の変数です。

Python
class MyClass:
    PI = 3.14                        #=> クラス変数

print MyClass.PI                     #=> 3.14
下記は、クラス変数を用いてインスタンスの個数をカウントアップするサンプルです。

Python
class MyClass:
    count = 0                       # クラス変数を初期化

    def __init__(self):
        MyClass.count += 1          # クラス変数をカウントアップ

a1 = MyClass()
a2 = MyClass()
print MyClass.count                 #=> 2
クラス変数やインスタンス変数は、動的に追加することができます。

Python
class MyClass:
    pass

a1 = MyClass()
a1.name2 = "Tanaka"                 # インスタンス変数の追加
MyClass.PI2 = 3.141593              # クラス変数の追加
インスタンス変数が存在しない場合、「インスタンス.変数名」はクラス変数を参照することに注意してください。「インスタンス.変数名」に値を代入した時点でインスタンス変数が生成され、以降はインスタンス変数が参照されます。

Python
class MyClass:
    PI = 3.14

a1 = MyClass()
a2 = MyClass()
print a1.PI                         # クラス変数 MyClass.PI(3.14) が参照される
a1.PI = 3.141593                    # インスタンス変数 a1.PI が生成される
print a1.PI                         # インスタンス変数 a1.PI(3.141593)が参照される
print a2.PI                         # クラス変数 MyClass.PI(3.14) が参照される
Python では private や protected などのスコープを制御する機構は実装されておらず、クラス変数、インスタンス変数はすべてどこからでも参照可能(public)となります。

メソッド(method)
クラスが持つ関数は メソッド と呼ばれます。メソッドもまた、どこからでも参照可能(public)です。メソッドの第一引数には、クラスのインスタンスを指定し、第二引数以降で、メソッドの引数を受け取ります。

Python
class MyClass:
    name = ""
    def setName(self, name):     # 第一引数は自インスタンス(self)
        self.name = name

a = MyClass()
a.setName("Tanaka")
アクセス制限(_, __)
Python では private や protected などのアクセス修飾子はサポートされていません。アンダーバー(_)で始まる変数や関数は外から参照しないという慣習的ルールがあります。アンダーバー2個(__)で始まる変数や関数は参照が制限されます。

Python
class MyClass:
    def __init__(self):
        self.name = "tanaka"
        self._name = "yamada"
        self.__name = "suzuki"

    def hello(self): print 'hello'
    def _hello(self): print 'hello'
    def __hello(self): print 'hello'

a = MyClass()

print a.name            # 参照できる
print a._name           # 参照できるが慣習的に参照しない
# print a.__name        # 参照できない(AttributeError例外)

a.hello()               # 参照できる
a._hello()              # 参照できるが慣習的に参照しない
# a.__hello()           # 参照できない(AttributeError例外)
とは言っても、__ で始まる変数や関数も、_クラス名__変数名 に名前変換されるだけで、下記の様にするとアクセスできてしまうそうです。

Python
print a._MyClass__name
a._MyClass__hello()
コンストラクタ(__init__)
__init__() メソッドは、クラスのインスタンスが生成された際に呼び出されます。コンストラクタ とも呼ばれます。

Python
class MyClass:
    def __init__(self, name):
        self.name = name
    def getName(self):
        return self.name

a = MyClass("Tanaka")
print a.getName()                      #=> Tanaka
デストラクタ(__del__)
__del__() メソッドは、クラスのインスタンスが消滅する際に呼び出されます。デストラクタ とも呼ばれます。

Python
class MyClass:
    def __init__(self):
        print "INIT!"
    def __del__(self):
        print "DEL!"

a = MyClass()           #=> INIT!
del a                   #=> DEL!
文字列化(__str__)
__str__() は、インスタンスを暗黙的に文字列に変換する際の変換処理を定義します。

Python
class MyClass:
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return "My name is " + self.name

a = MyClass("Yamada")
print a                        #=> My name is Yamada
継承(inheritance)
他のオブジェクト指向言語と同様、クラスを継承することもできます。下記の例では、MyClassクラスを継承した、MyClass2サブクラスを定義しています。サブクラスでは、親クラスが持つアトリビュートやメソッドを継承して利用することができます。

Python
class MyClass:
    def hello(self):
        print "Hello"

class MyClass2(MyClass):
    def world(self):
        print "World"

a = MyClass2()
a.hello()                   #=> Hello
a.world()                   #=> World
サブクラスでは、親クラスのメソッドを上書き(オーバーライド)することができます。

Python
class MyClass:
    def hello(self):
        print "Hello"

class MyClass2(MyClass):
    def hello(self):        # 親クラスのhello()メソッドをオーバーライド
        print "HELLO"

a = MyClass2()
a.hello()                   #=> HELLO
親クラス(super())
super() は 親クラス を参照します。第一引数にはクラス、第二引数にはインスタンスを指定します。下記の例では、サブクラスのコンストラクタの中で、親クラスのコンストラクタを呼び出しています。

Python
class MyClass1(object):
    def __init__(self):
       self.val1 = 123

class MyClass2(MyClass1):
    def __init__(self):
        super(MyClass2, self).__init__()
        self.val2 = 456

a = MyClass2()
print a.val1                #=> 123
print a.val2                #=> 456
多重継承
Python では多重継承がサポートされています。下記では、MyClassA, MyClassB 両方を継承する MyClassC を定義しています。

Python
class MyClassA:
    def funcA(self):
        print "MyClassA:funcA"

class MyClassB:
    def funcB(self):
        print "MyClassB:funcB"

class MyClassC(MyClassA, MyClassB):
    pass

a = MyClassC()
a.funcA()                    # MyClassA のメソッドも
a.funcB()                    # MyClassB のメソッドも使用できる
クラス階層
Python のクラスはすべて、object をルートとするクラス階層を構成しています。
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

パッケージとモジュール
モジュール(module)
ひとつのスクリプトファイルはモジュールとして扱うことができます。モジュールは import文で読み込みます。読み込んだモジュールのクラス、関数、変数は、「モジュール名.識別子」で参照することができます。

mymod.py
def myfunc():
    print "Hello!"
mytest.py
import mymod

mymod.myfunc()                      #=> Hello!
モジュールの冒頭には、"""...""" で ドキュメントストリング を記述することができます。

Python
# coding: utf-8
"""A sample module"""
(略)
パッケージ(package)
複数のモジュールをまとめてパッケージとして扱うことができます。パッケージは、__init__.py という名前のファイルを持つフォルダ、モジュールは .py ファイルです。__init__.py にはパッケージの初期化処理を記述します。なければ空でかまいません。下記の例では、mypack1パッケージの中に mypack2パッケージがあり、mypack2パッケージの中に mymod.pyモジュールが配置されています。

フォルダ構成
フォルダmypack1/
  ファイル__init__.py
  フォルダmypack2/
    ファイル__init__.py
    フォルダmymod.py
インポート(import)
パッケージの中からモジュールや識別子(クラス、関数、変数...)をインポートするには下記の様にします。

Python
# import [パッケージ.]モジュール
import mypack1.mypack2.mymod
mypack1.mypack2.mymod.myfunc()

# from パッケージ import モジュール
from mypack1.mypack2 import mymod
mymod.myfunc()

# from パッケージ import *
from mypack1.mypack2 import *                # __all__の設定が必要
mymod.myfunc()

# from [パッケージ.]モジュール import 識別子
from mypack1.mypack2.mymod import myfunc
myfunc()

# from [パッケージ.]モジュール import *
from mypack1.mypack2.mymod import *
myfunc()
上記の例で「from パッケージ import *」の形式を用いるには、mypack2 パッケージの __init__.py ファイルに読み込み対象のモジュールリストを __all__ に定義しておく必要があります。

__init__.py
__all__ = ["mymod"]
読み込むモジュールや識別子を複数記述することもできます。

Python
import mypack1.mypack2.mymod1, mypack1.mypack2.mymod2
from mypack1.mypack2 import mymod, mymod2
from mypack1.mypack2 import (mymod, mymod2)
from mypack1.mypack2.mymod import myfunc1, myfunc2
from mypack1.mypack2.mymod import (myfunc1, myfunc2)
読み込んだモジュール名や識別子に別名をつけることができます。

Python
import mypack1.mypack2.mymod as mymod1
mymod1.myfunc()

from mypack1.mypack2 import mymod as mymod2
mymod2.myfunc()

from mypack1.mypack2.mymod import myfunc as myfunc1
myfunc1()
from には、. や .. を用いて、パッケージを相対的に指示することができます。

Python
from . import mymod              # このパッケージから mymodモジュールをインポートする
from .. import mymod             # ひとつ上の階層のパッケージから mymodモジュールをインポートする
from ... import mymod            # ふたつ上の階層のパッケージから mymodモジュールをインポートする
from ...mypack4 import mymod     # ふたつ上の階層のmypack4パッケージから mymodモジュールをインポートする
パッケージ名(__package__)
__package__ は、現在のパッケージ名を示します。

Python
print __package__
ファイル名(__file__)
__file__ は、現在のファイル名を示します。

Python
print __file__
モジュール名(__name__)
__name__ は、現在のモジュール名を示します。スクリプトとして起動されたメインモジュールの場合は __main__ という名前が設定されます。下記の例は、ファイルが python コマンドから直接起動された場合のみ実行する処理を記載しています。

Python
if __name__ == "__main__":
    test()
ビルトインモジュール(__builtin__)
__builtin__ は、open() などのビルトインオブジェクトを包含する仮想的なモジュールを示します。

Python
import __builtin__

for line in __builtin__.open("test.txt"):
    print line





正規表現パターンオブジェクトのメソッドで実行
reモジュールで正規表現の処理を行う方法の2つ目は正規表現パターンオブジェクトのメソッド。

re.compile()を使うと、正規表現パターン文字列をコンパイルして正規表現パターンオブジェクトを作成できる。

p = re.compile(r'([a-z]+)@([a-z]+)\.com')

print(p)
# re.compile('([a-z]+)@([a-z]+)\\.com')

print(type(p))
# <class 're.Pattern'>
source: re_complie.py
re.match(), re.sub()などの関数と同様の処理が、正規表現オブジェクトのメソッドmatch(), sub()として実行できる。

m = p.match(s)
print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>

result = p.sub('new-address', s)
print(result)
# new-address, new-address, ccc@zzz.net
source: re_complie.py
以降で説明するre.xxx()の関数はすべて正規表現オブジェクトのメソッドとしても提供されている。

同じパターンを使う処理を繰り返し行う場合は、re.compile()で正規表現オブジェクトを生成して使い回すほうが効率的。

以降のサンプルコードでは便宜上コンパイルせずに関数を使っているが、同じパターンを繰り返し使う場合は、前もってコンパイルして正規表現オブジェクトのメソッドとして実行することをおすすめする。

マッチオブジェクト
match()やsearch()などはマッチオブジェクトを返す。

s = 'aaa@xxx.com'

m = re.match(r'[a-z]+@[a-z]+\.[a-z]+', s)
print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>

print(type(m))
# <class 're.Match'>
source: re_match_object.py
マッチした文字列や位置はマッチオブジェクトの以下のメソッドを使って取得する。

マッチした位置を取得: start(), end(), span()
マッチした文字列を取得: group()
各グループの文字列を取得: groups()
マッチした部分の位置はstart(), end(), span()、文字列はgroup()。

print(m.start())
# 0

print(m.end())
# 11

print(m.span())
# (0, 11)

print(m.group())
# aaa@xxx.com
source: re_match_object.py
正規表現パターンの文字列中の部分を括弧()で囲むと、その部分がグループとして処理される。このとき、groups()で各グループにマッチした部分の文字列がタプルとして取得できる。

m = re.match(r'([a-z]+)@([a-z]+)\.([a-z]+)', s)
print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>

print(m.groups())
# ('aaa', 'xxx', 'com')
source: re_match_object.py
グループに名前を設定した場合の振る舞いや、if文での使い方など、マッチオブジェクトの詳細は以下の記事を参照。

関連記事: Pythonの正規表現マッチオブジェクトでマッチした文字列や位置を取得
文字列の先頭がマッチするかチェック、抽出: match()
match()は文字列の先頭がパターンにマッチするとマッチオブジェクトを返す。

上述のように、マッチオブジェクトを使ってマッチした部分文字列を抽出したり、単純にマッチしたかどうかをチェックしたりできる。

match()が調べるのはあくまでも先頭のみ。先頭にマッチする文字列がない場合はNoneを返す。

s = 'aaa@xxx.com, bbb@yyy.com, ccc@zzz.net'

m = re.match(r'[a-z]+@[a-z]+\.com', s)
print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>

m = re.match(r'[a-z]+@[a-z]+\.net', s)
print(m)
# None
source: re_match_search_fullmatch.py
先頭に限らずマッチするかチェック、抽出: search()
search()は文字列すべてが検索対象で、先頭にない文字列にもマッチする。match()と同じく、マッチする場合はマッチオブジェクトを返す。

マッチする部分が複数ある場合は、最初のマッチ部分のみが返される。

s = 'aaa@xxx.com, bbb@yyy.com, ccc@zzz.net'

m = re.search(r'[a-z]+@[a-z]+\.net', s)
print(m)
# <re.Match object; span=(26, 37), match='ccc@zzz.net'>

m = re.search(r'[a-z]+@[a-z]+\.com', s)
print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>
source: re_match_search_fullmatch.py
マッチする部分をすべて取得したい場合は後述のfindall()またはfinditer()を使う。

文字列全体がマッチするかチェック: fullmatch()
文字列全体が正規表現パターンにマッチしているかどうかの確認にはfullmatch()を使う。例えば、ある文字列がメールアドレスとして有効かどうかなどをチェックする場合に便利。

文字列全体がマッチしているとマッチオブジェクトが返される。

s = 'aaa@xxx.com'

m = re.fullmatch(r'[a-z]+@[a-z]+\.com', s)
print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>
source: re_match_search_fullmatch.py
マッチしていない部分がある（一部しかマッチしていない、または、全くマッチしていない）とNoneが返される。

s = '!!!aaa@xxx.com!!!'

m = re.fullmatch(r'[a-z]+@[a-z]+\.com', s)
print(m)
# None
source: re_match_search_fullmatch.py
fullmatch()はPython3.4で追加された。それより前のバージョンで同様の処理を行いたい場合は、match()と末尾にマッチするメタ文字$を利用する。先頭から末尾まで文字列全体がマッチしていないとNoneを返す。

s = '!!!aaa@xxx.com!!!'

m = re.match(r'[a-z]+@[a-z]+\.com$', s)
print(m)
# None
source: re_match_search_fullmatch.py
マッチする部分すべてをリストで取得: findall()
findall()はマッチするすべての部分文字列をリストにして返す。リストの要素はマッチオブジェクトではなく文字列なので注意。

s = 'aaa@xxx.com, bbb@yyy.com, ccc@zzz.net'

result = re.findall(r'[a-z]+@[a-z]+\.[a-z]+', s)
print(result)
# ['aaa@xxx.com', 'bbb@yyy.com', 'ccc@zzz.net']
source: re_findall_finditer.py
マッチした部分が何個あるかは、リストの要素数を返す組み込み関数len()を使って確認できる。

print(len(result))
# 3
source: re_findall_finditer.py
正規表現パターンで括弧()を使ってグルーピングすると、各グループの文字列を要素とするタプル（マッチオブジェクトのgroups()に相当）のリストが返される。

result = re.findall(r'([a-z]+)@([a-z]+)\.([a-z]+)', s)
print(result)
# [('aaa', 'xxx', 'com'), ('bbb', 'yyy', 'com'), ('ccc', 'zzz', 'net')]
source: re_findall_finditer.py
グループの括弧()は入れ子状に設定できるので、マッチ全体も合わせて取得したい場合は全体を括弧()で囲めばよい。

result = re.findall(r'(([a-z]+)@([a-z]+)\.([a-z]+))', s)
print(result)
# [('aaa@xxx.com', 'aaa', 'xxx', 'com'), ('bbb@yyy.com', 'bbb', 'yyy', 'com'), ('ccc@zzz.net', 'ccc', 'zzz', 'net')]
source: re_findall_finditer.py
マッチしない場合は空のタプルを返す。

result = re.findall('[0-9]+', s)
print(result)
# []
source: re_findall_finditer.py

 
マッチする部分すべてをイテレータで取得: finditer()
finditer()はマッチするすべての部分をイテレータで返す。その要素はfindall()のように文字列ではなくマッチオブジェクトなので、マッチした部分の位置（インデックス）なども取得できる。

イテレータはそれ自体をprint()で出力しても中身は得られない。組み込み関数next()やfor文を使うと中身が一つずつ取り出せる。

s = 'aaa@xxx.com, bbb@yyy.com, ccc@zzz.net'

result = re.finditer(r'[a-z]+@[a-z]+\.[a-z]+', s)
print(result)
# <callable_iterator object at 0x10b0efa90>

print(type(result))
# <class 'callable_iterator'>

for m in result:
    print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>
# <re.Match object; span=(13, 24), match='bbb@yyy.com'>
# <re.Match object; span=(26, 37), match='ccc@zzz.net'>
source: re_findall_finditer.py
list()でリストに変換することも可能。

l = list(re.finditer(r'[a-z]+@[a-z]+\.[a-z]+', s))
print(l)
# [<re.Match object; span=(0, 11), match='aaa@xxx.com'>, <re.Match object; span=(13, 24), match='bbb@yyy.com'>, <re.Match object; span=(26, 37), match='ccc@zzz.net'>]

print(l[0])
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>

print(type(l[0]))
# <class 're.Match'>

print(l[0].span())
# (0, 11)
source: re_findall_finditer.py
マッチするすべての部分の位置を取得したいといった場合は、list()よりもリスト内包表記のほうが便利。

関連記事: Pythonリスト内包表記の使い方
print([m.span() for m in re.finditer(r'[a-z]+@[a-z]+\.[a-z]+', s)])
# [(0, 11), (13, 24), (26, 37)]
source: re_findall_finditer.py
イテレータは順番に要素を取り出していく。最後まで到達した後でさらに要素を取り出そうとすると何も残っていない状態になるので注意。

result = re.finditer(r'[a-z]+@[a-z]+\.[a-z]+', s)

for m in result:
    print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>
# <re.Match object; span=(13, 24), match='bbb@yyy.com'>
# <re.Match object; span=(26, 37), match='ccc@zzz.net'>

print(list(result))
# []
source: re_findall_finditer.py
マッチする部分を置換: sub(), subn()
sub()を使うと、マッチした部分を他の文字列に置換することができる。置換処理された文字列が返される。

s = 'aaa@xxx.com, bbb@yyy.com, ccc@zzz.net'

result = re.sub(r'[a-z]+@[a-z]+\.com', 'new-address', s)
print(result)
# new-address, new-address, ccc@zzz.net

print(type(result))
# <class 'str'>
source: re_sub_subn.py
括弧()でグルーピングした場合、置換後の文字列の中でマッチした文字列を使用することができる。

デフォルトでは\1, \2, \3...が、それぞれ1つ目の()、2つ目の()、3つ目の()...にマッチした部分に対応している。raw文字列ではない通常の文字列だと'\\1'のように\をエスケープする必要があるので注意。

result = re.sub(r'([a-z]+)@([a-z]+)\.com', r'\1@\2.net', s)
print(result)
# aaa@xxx.net, bbb@yyy.net, ccc@zzz.net
source: re_sub_subn.py
正規表現パターンの()の先頭に?P<xxx>を記述してグループに名前をつけると、\1のような番号ではなく\g<xxx>のように名前を使って指定できる。

result = re.sub(r'(?P<local>[a-z]+)@(?P<SLD>[a-z]+)\.com', r'\g<local>@\g<SLD>.net', s)
print(result)
# aaa@xxx.net, bbb@yyy.net, ccc@zzz.net
source: re_sub_subn.py
引数countで最大置換回数（個数）を指定できる。左側からcount個の部分のみ置換される。

result = re.sub(r'[a-z]+@[a-z]+\.com', 'new-address', s, count=1)
print(result)
# new-address, bbb@yyy.com, ccc@zzz.net
source: re_sub_subn.py
subn()は置換処理された文字列（sub()の返り値と同じ）と置換された部分の個数（パターンにマッチした個数）とのタプルを返す。

result = re.subn(r'[a-z]+@[a-z]+\.com', 'new-address', s)
print(result)
# ('new-address, new-address, ccc@zzz.net', 2)
source: re_sub_subn.py
引数の指定方法などはsub()と同じ。()でグルーピングした部分を使ったり、引数countを指定したりできる。

result = re.subn(r'(?P<local>[a-z]+)@(?P<SLD>[a-z]+)\.com', r'\g<local>@\g<SLD>.net', s)
print(result)
# ('aaa@xxx.net, bbb@yyy.net, ccc@zzz.net', 2)

result = re.subn(r'[a-z]+@[a-z]+\.com', 'new-address', s, count=1)
print(result)
# ('new-address, bbb@yyy.com, ccc@zzz.net', 1)
source: re_sub_subn.py
文字列の置換についての詳細は以下の記事を参照。

関連記事: Pythonで文字列を置換（replace, translate, re.sub, re.subn）
正規表現パターンで文字列を分割: split()
split()はパターンにマッチした部分で文字列を分割し、リストにして返す。

先頭・末尾にマッチする場合、結果のリストの最初と最後に空文字列''が含まれるので注意。

s = '111aaa222bbb333'

result = re.split('[a-z]+', s)
print(result)
# ['111', '222', '333']

result = re.split('[0-9]+', s)
print(result)
# ['', 'aaa', 'bbb', '']
source: re_split.py
引数maxsplitで最大分割回数（個数）を指定できる。左側からcount個の部分でのみ分割される。

result = re.split('[a-z]+', s, 1)
print(result)
# ['111', '222bbb333']
source: re_split.py
文字列の分割についての詳細は以下の記事を参照。

関連記事: Pythonで文字列を分割（区切り文字、改行、正規表現、文字数）
Pythonでの正規表現のメタ文字・特殊シーケンスと注意点
Python3のreモジュールで使える正規表現のメタ文字（特殊文字）・特殊シーケンスの主なものは以下の通り。

メタ文字	内容
.	改行以外の任意の1文字（DOTALLフラグで改行も含む）
^	文字列の先頭（MULTILINEフラグで各行の先頭にもマッチ）
$	文字列の末尾（MULTILINEフラグで各行の末尾にもマッチ）
*	直前のパターンを0回以上繰り返し
+	直前のパターンを1回以上繰り返し
?	直前のパターンを0回または1回繰り返し
{m}	直前のパターンをm回繰り返し
{m, n}	直前のパターンをm〜n回繰り返し
[]	文字の集合 - []内のいずれか1文字にマッチ
|	OR（または） - A|BでAかBいずれかのパターンにマッチ
特殊シーケンス	内容
\d	Unicode10進数字（ASCIIフラグでASCIIの数字に限定）
\D	\dの反対（\d以外）
\s	Unicode空白文字（ASCIIフラグでASCIIの空白文字に限定）
\S	\sの反対（\s以外）
\w	Unicode単語文字と_（ASCIIフラグでASCIIの英字と_に限定）
\W	\wの反対（\w以外）
この表に挙げたものが全てではない。完全なリストは公式ドキュメントを参照。

re --- 正規表現操作 - 正規表現のシンタックス — Python 3.7.3 ドキュメント
また、Python2では意味が異なるものもあるので注意。

7.2. re --- 正規表現操作 - 正規表現のシンタックス — Python 2.7.16 ドキュメント
基本的なものを使ったシンプルな活用例を以下の記事で紹介している。

関連記事: Pythonで文字列を抽出（位置・文字数、正規表現）
フラグの設定
上の表でも示した通り、メタ文字・特殊シーケンスの中にはフラグによってモードが変わるものがある。

ここでは主なフラグのみを取り上げる。そのほかは公式ドキュメントを参照。

re --- 正規表現操作 - モジュールコンテンツ — Python 3.7.3 ドキュメント
ASCII文字に限定: re.ASCII
Python3の文字列に対しては、\wはデフォルトで全角の日本語や英数字などにもマッチする。標準的な正規表現とは異なり\wと[a-zA-Z0-9_]は等価ではない。

m = re.match(r'\w+', 'あいう漢字ＡＢＣ１２３')
print(m)
# <re.Match object; span=(0, 11), match='あいう漢字ＡＢＣ１２３'>

m = re.match('[a-zA-Z0-9_]+', 'あいう漢字ＡＢＣ１２３')
print(m)
# None
source: re_flag.py
各関数で引数flagsにre.ASCIIを指定するか、正規表現パターンの文字列の先頭にインラインフラグ(?a)をつけると、ASCII文字にのみマッチするようになる（全角の日本語や英数字などにはマッチしない）。この場合は\wは[a-zA-Z0-9_]と等価。

m = re.match(r'\w+', 'あいう漢字ＡＢＣ１２３', flags=re.ASCII)
print(m)
# None

m = re.match(r'(?a)\w+', 'あいう漢字ＡＢＣ１２３')
print(m)
# None
source: re_flag.py
re.compile()でコンパイルする場合も同様。引数flagsかインラインフラグ(?a)を使う。

p = re.compile(r'\w+', flags=re.ASCII)
print(p)
# re.compile('\\w+', re.ASCII)

print(p.match('あいう漢字ＡＢＣ１２３'))
# None

p = re.compile(r'(?a)\w+')
print(p)
# re.compile('(?a)\\w+', re.ASCII)

print(p.match('あいう漢字ＡＢＣ１２３'))
# None
source: re_flag.py
またre.ASCIIは短縮形re.Aとしても提供されている。どちらを使ってもよい。

print(re.ASCII is re.A)
# True
source: re_flag.py
\wの反対を表す\Wもre.ASCIIや(?a)の影響を受ける。

m = re.match(r'\W+', 'あいう漢字ＡＢＣ１２３')
print(m)
# None

m = re.match(r'\W+', 'あいう漢字ＡＢＣ１２３', flags=re.ASCII)
print(m)
# <re.Match object; span=(0, 11), match='あいう漢字ＡＢＣ１２３'>
source: re_flag.py
\wと同様に、数字にマッチする\d、空白にマッチする\sも、デフォルトでは半角にも全角にもマッチする。re.ASCIIや(?a)を指定すると半角のみに限定される。

m = re.match(r'\d+', '123')
print(m)
# <re.Match object; span=(0, 3), match='123'>

m = re.match(r'\d+', '１２３')
print(m)
# <re.Match object; span=(0, 3), match='１２３'>

m = re.match(r'\d+', '123', flags=re.ASCII)
print(m)
# <re.Match object; span=(0, 3), match='123'>

m = re.match(r'\d+', '１２３', flags=re.ASCII)
print(m)
# None

m = re.match(r'\s+', '　')  # 全角スペース
print(m)
# <re.Match object; span=(0, 1), match='\u3000'>

m = re.match(r'\s+', '　', flags=re.ASCII)
print(m)
# None
source: re_flag.py
それらの反対、\D, \Sもre.ASCIIや(?a)の影響を受ける。

大文字小文字を区別しない: re.IGNORECASE
デフォルトでは大文字小文字が区別される。両方にマッチさせるには大文字と小文字の両方をパターンに入れる必要がある。

re.IGNORECASE]を指定すると大文字小文字を区別せずにマッチする。標準的な正規表現のiフラグに相当。

m = re.match('[a-zA-Z]+', 'abcABC')
print(m)
# <re.Match object; span=(0, 6), match='abcABC'>

m = re.match('[a-z]+', 'abcABC', flags=re.IGNORECASE)
print(m)
# <re.Match object; span=(0, 6), match='abcABC'>

m = re.match('[A-Z]+', 'abcABC', flags=re.IGNORECASE)
print(m)
# <re.Match object; span=(0, 6), match='abcABC'>
source: re_flag.py
インラインフラグ(?i)、または、短縮形のre.IでもOK。

各行の先頭・末尾にマッチ: re.MULTILINE
正規表現のメタ文字^は文字列の先頭にマッチする。

デフォルトでは文字列全体の先頭のみにマッチするが、re.MULTILINEを指定すると各行の先頭にもマッチするようになる。標準的な正規表現のmフラグに相当。

s = '''aaa-xxx
bbb-yyy
ccc-zzz'''

print(s)
# aaa-xxx
# bbb-yyy
# ccc-zzz

result = re.findall('[a-z]+', s)
print(result)
# ['aaa', 'xxx', 'bbb', 'yyy', 'ccc', 'zzz']

result = re.findall('^[a-z]+', s)
print(result)
# ['aaa']

result = re.findall('^[a-z]+', s, flags=re.MULTILINE)
print(result)
# ['aaa', 'bbb', 'ccc']
source: re_flag.py
末尾にマッチする$も同様。デフォルトでは文字列全体の末尾のみにマッチ、re.MULTILINEを指定すると各行の末尾にもマッチするようになる。

result = re.findall('[a-z]+$', s)
print(result)
# ['zzz']

result = re.findall('[a-z]+$', s, flags=re.MULTILINE)
print(result)
# ['xxx', 'yyy', 'zzz']
source: re_flag.py
インラインフラグ(?m)、または、短縮形のre.MでもOK。

複数のフラグを指定
複数のフラグを同時に有効にしたい場合は|を使う。インラインフラグの場合は(?am)のように各文字を続けて記述する。

s = '''aaa-xxx
あああ-んんん
bbb-zzz'''

print(s)
# aaa-xxx
# あああ-んんん
# bbb-zzz

result = re.findall(r'^\w+', s, flags=re.M)
print(result)
# ['aaa', 'あああ', 'bbb']

result = re.findall(r'^\w+', s, flags=re.M | re.A)
print(result)
# ['aaa', 'bbb']

result = re.findall(r'(?am)^\w+', s)
print(result)
# ['aaa', 'bbb']
source: re_flag.py
貪欲マッチと非貪欲マッチ
これは正規表現の一般的な問題でPythonだけの問題ではないが、ハマりがちなので書いておく。

デフォルトでは*, +, ?は貪欲（greedy）マッチで、できる限り長い文字列にマッチする。

s = 'aaa@xxx.com, bbb@yyy.com'

m = re.match(r'.+com', s)
print(m)
# <re.Match object; span=(0, 24), match='aaa@xxx.com, bbb@yyy.com'>

print(m.group())
# aaa@xxx.com, bbb@yyy.com
source: re_greedy.py
?を後ろにつける（*?, +?, ??）と、非貪欲（non-greedy）、最小（minimal）のマッチとなり、できる限り短い文字列にマッチする。

m = re.match(r'.+?com', s)
print(m)
# <re.Match object; span=(0, 11), match='aaa@xxx.com'>

print(m.group())
# aaa@xxx.com
source: re_greedy.py
デフォルトの貪欲マッチだと思わぬ文字列にマッチする場合があるので要注意。

