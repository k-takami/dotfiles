---
title: rubyXL で Excel 生成したいときの Tips 集
tags: Ruby RubyXL Excel XLSX tips
author: akicho8
slide: false
---
## install するには？

```shell
gem i rubyXL
```

## Hello, World するには？

```ruby
require "rubyxl"
@workbook = RubyXL::Workbook.new
@sheet = @workbook.first
@sheet.add_cell(0, 0, "Hello, World")
@workbook.write("out.xlsx")
`open out.xlsx`
```

## 直接バイナリーで欲しいときは？

```ruby
@workbook.stream.read
```

Rails で send_data するとき用

## 既存のファイルを読むには？

```ruby
@workbook = RubyXL::Parser.parse("file.xlsx")
```

## 1つめのシートを参照するには？

```ruby
@sheet = @workbook.first
```

## 2つ目のシートを作るには？

```ruby
@sheet = @workbook.add_worksheet("2つめのシートの名前")
```

## 既存のシートの名前を変更するには？

```ruby
@sheet.sheet_name = "シートの名前"
```

## A列の横幅を変更するには？

```ruby
@sheet.change_column_width(0, 1.0) # よくわからないが 1.0 で1文字分ぐらいの幅だった
```

## 座標の扱いは？

- 横(x)も、縦(y)も、 `0` が基点
- `(x, y)` はすべて逆の `(y, x)` で指定

## (x, y) のセルを取得するには？ (なければ作る)

```ruby
@cell = @sheet.add_cell(y, x, "", nil, false)
```

## 左よせ・センタリング・右よせ するには？

```ruby
@cell.change_horizontal_alignment("left")
@cell.change_horizontal_alignment("center")
@cell.change_horizontal_alignment("right")
```

## 3桁毎のカンマ区切りにするには？

```ruby
@cell.set_number_format('#, ##0') # 書式はよくわかってない
```

## セルの文字色を赤にするには？

```ruby
@cell.change_font_color("FF0000")
```

## セルの背景を灰色にするには？

```ruby
@cell.change_fill("EEEEEE")
```

## (x1, y1) から (x2, y2) の範囲でセルを結合するには？

```ruby
@sheet.merge_cells(y1, x1, y2, x2)
```

## アンダーラインを引くには？ (ボーダーの下だけに線)

```ruby
@cell.change_border(:bottom, "medium")
```

## アンダーラインの色を赤にするには？ (下ボーダーの色変更)

```ruby
@cell.change_border_color(:bottom, "FF0000")
```

## 1つのセルだけにボーダーを描くには？

```ruby
[:top, :bottom, :left, :right].each do |e|
   @cell.change_border(e, "medium")
end
```

## ボーダーの線を細くするには？

`medium` のかわりに `thin` を指定

## セル結合した範囲や、広範囲にボーダーを描くには？

x, y 順で (1, 1) から (3, 2) の地点までボーダーを描く場合

```ruby
x1, y1 = [1, 1]
x2, y2 = [3, 2]

(y1..y2).each do |y|
  (x1..x2).each do |x|
    list = []
    if y == y1
      list << :top
    end
    if y == y2
      list << :bottom
    end
    if x == x1
      list << :left
    end
    if x == x2
      list << :right
    end
    list.each do |e|
      cell = @sheet.add_cell(y, x, "", nil, false)
      cell.change_border(e, "medium")
    end
  end
end
```

セル結合している場合は左上のセルに設定したボーダーが、セル結合した範囲にも自動的に広がってくれると思ったらそうはならないようです。

常識的に考えてこんな冗長なコードを使う側が書く必要はないと思うので、何か他の方法がある気がするんですが見つけられませんでした。とりあえず自力でボーダーを引くようにしてみましたが正しい方法があったら教えてください。





