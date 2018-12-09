---
title: Rubyでエクセルデータを扱うために、spreadsheetを試してみた
tags: Ruby Gem
author: m-shin
slide: false
---
# Excelデータを、スクリプトでいろいろ処理したい。

Excelデータなどからいろいろな情報を抽出して、様々な処理を加えたい。
また、Excelに対応した形式でデータを出力して渡したいようなことがあります。

## だが、マクロはあまり使いたくない

この手の処理、一定の単純なパターンの繰り返しなので、マクロ使って一気に処理することも可能ですが・・・。

Excelがフリーズしやすくなる、メールで送るときに弾かれるなどの様々な問題があります。

加えて、処理速度や加工途中の段階での扱いやすさを考えると、
各種スクリプト言語のほうが楽！なので（個人的見解）

# RubyでExcelを扱う方法をさがす

Windows上でRuby&Excelというケースもあったが、ここでは割愛する。

結局のところ

RailsでExcelを扱うGemまとめ
http://qiita.com/Kta-M/items/02a2c41c5624f75498aa

を参考にして、spreadsheet を使うことにした

https://github.com/zdavatz/spreadsheet

ドイツ人が作ったらしい。

# 試しに、統計資料から特定の値だけ抜き出すケースを試した

（あくまで操作方法のサンプルです。実用性はほとんどありません）

## データ引用元と処理内容
データ引用元：（平成２６年の）川崎市の統計資料　2－15　市内各地の月間雨量　その1　最大1時間雨量その2　1時間雨量20mm以上の発生日数

(修正：なんかこっちに移動していた）
http://www.city.kawasaki.jp/170/page/0000066141.html

引用元のデータから、最大1時間雨量が30mmを超えたときの　観測地点、住所、年度、雨量を引用して１行ずつ書き出す。

## Rubyによるコード記述例



```ruby:kawasaki_ame.rb
require 'spreadsheet'

readName = '26hyo2-15.xls'
writeName = 'result.xls'

#open books
readBook = Spreadsheet.open(readName)
writeBook = Spreadsheet::Workbook.new

readSheet = readBook.worksheet('Ⅱ-15その1')
writeSheet = writeBook.create_worksheet(name: 'result')

writeSheet.row(0).push readSheet[4,0], readSheet[4,1], '年度', '雨量'

k = 0
for i in 5..44 do
	place1 = readSheet[i,0]
	place2 = readSheet[i,1]
	
	for j in 2..6 do
		if readSheet[i,j].is_a?(Numeric) && readSheet[i,j] >= 30
			k = k + 1
			writeSheet.row(k).push place1, place2,readSheet[4,j],readSheet[i,j]
		end
	end
end 

writeBook.write(writeName) 
```

何をやってるのかというと
１：読み込み、書き出しファイル名を無理やり指定

２：読み込み、書き込みのインスタンスオブジェクトを生成

```ruby:kawasaki_ame.rb#instance
readBook = Spreadsheet.open(readName)
writeBook = Spreadsheet::Workbook.new
```

３：読み込むシートの指定、書き出すシートの作成

```ruby:kawasaki_ame.rb#sheet_name
readSheet = readBook.worksheet('Ⅱ-15その1')
writeSheet = writeBook.create_worksheet(name: 'result')
```

４：書き出すシートの１行目に、見出しを書き込む

```ruby:kawasaki_ame.rb#headline
writeSheet.row(0).push readSheet[4,0], readSheet[4,1], '年度', '雨量'
```

１行目が0 になることに注意１行目、つまりExcelでいうとA1地点〜A4地点まで順に、読み込みシートの５行目１列目のセル内容「観測地点名」、２列目のセル内容「雨量計所在地」、固定文字の「年度」、「雨量」を書き込んでいる。

５：地点、年度別の記述がある箇所を１行ずつ読み込み分岐処理

```ruby:kawasaki_ame.rb#contents
k = 0

for i in 5..44 do
	place1 = readSheet[i,0]
	place2 = readSheet[i,1]
	
	for j in 2..6 do
		（中略）
	end
end 
```

kは書き込むときに何行目に書くかの指定に使います。

for文のところは、地点と年度別の記述が並んでいる行の位置を目視し、ハードコーディングしました（強引）

そして、観測地点名と住所の文字列を取得。
（セル指定でもよかったか）

さらに入れ子のfor部分は、年度別の値が存在する列を参照するようにした。

６：値が数値かつ30以上かを判定し、真であれば書き込む

```ruby:kawasaki_ame.rb#chk
for j in 2..6 do
        if readSheet[i,j].is_a?(Numeric) && readSheet[i,j] >= 30
            k = k + 1
            writeSheet.row(k).push place1, place2,readSheet[4,j],readSheet[i,j]
        end
    end
```

前項で（中略）となっていた部分です。
参照した値が数値かつ30以上かを判定し、真であれば書き込み行を１行分進め、１列目から順に、あらかじめ取得した地点名と住所、
何年度目かの値、雨量を記述していきます。

#７：ファイルに書き出す

```ruby:kawasaki_ame.rb#write
writeBook.write(writeName) 
```

最後に、書き出します。

# 生成物
１行目に観測地点名、雨量計、年度、雨量　の見出しがあり、
２行目から川崎市役所第３庁舎などの観測地点名と住所、年度、雨量の記載があれば成功です。

# 感想（の羅列）

##エクセルなんてデータの羅列です
今回は、エクセルデータを「所定の座標に数値や文字列が入っているデータの塊」として扱っています。エンジニア的にはエクセルなんてデータの羅列です（笑）

##もともとは引数でファイルパスを指定していた
これ、もともとは読み込むファイルと書き出すファイル（のパス）を引数で受け取り、引数で与えられたパスのディレクトリやファイルが存在するか、パスが存在するかなどの判定を行ってました。

ソースコードの分量的には、そっちの方が多いです。

## 解説書くのって面倒だが、理解のためだ
細かい解説書くのは面倒だが、自己がどれだけ理解を振り返るにはいいのかも。

