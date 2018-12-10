---
title: RailsでExcelを扱うGemまとめ
tags: Ruby Rails
author: Kta-M
slide: false
---

RailsにはExcelを扱うGemがいくつかあり、それぞれ特徴があるのでまとめてみる。
ついでに簡単なテストコードも載せてみる。

テストで扱うデータはこんな感じ。
もちろんしかるべきところには計算式を入れてある。
新規作成の場合はこれを作成する。
読み込みの場合はこのデータを読み込んで表示、さらに編集・書き出しが可能な場合には牛肉の単価を500円(和牛)に変更する。

|品名|単価|数量|計|
|:---|:---|:---|:---|
|にんじん|80|1|80|
|たまねぎ|50|2|100|
|じゃがいも|40|2|80|
|牛肉|200|1|200|
|カレー粉|150|1|150|
|||計|610|



## spreadsheet
[zdavatz/spreadsheet](https://github.com/zdavatz/spreadsheet)

* [TheRubyToolbox](https://www.ruby-toolbox.com/categories/reporting)によると、一番多く使われているらしい
* `.xlsx`, `.xlsm`は扱えない
* 新規作成、読み込み、書き出しが可能
* セルの書式設定は面倒そう

```
# 新規作成
book = Spreadsheet::Workbook.new                
sheet = book.create_worksheet(name: 'curry')    
                     
# いろいろな方法でデータを入れられる
# 計算式は入力できない                           
sheet.row(0).concat %w{品名 単価 数量 計}       
                                                
sheet[1,0] = 'にんじん'                         
sheet[1,1] = 80                                 
sheet[1,2] = 1                                  
sheet[1,3] = 80                                 
                                                
row = sheet.row(2)                              
row.push 50                                     
row.push 2                                      
row.push 100                                    
row.unshift 'たまねぎ'                          
                                                
sheet.row(3).replace [ 'じゃがいも', 40, 2, 80 ]
                                                
sheet.row(4).push '牛肉', 1, 200                
sheet.row(4).insert 1, 200                      
                                                
sheet.update_row 5, 'カレー粉', 150, 1, 150     
                                                
sheet[6,2] = '総計'                             
sheet[6,3] = 610

book.write('test.xls')                                
```

```
# 読み込み                                                                                                   
book = Spreadsheet.open(filepath)                                                                  
sheet = book.worksheet('curry')                                                                              
sheet.each do |row|                                                                                          
    # 数式が入っているセルは .value で値を取得                                                                                  
    puts "#{row[0]} #{row[1]} #{row[2]} #{row[3].instance_of?(Spreadsheet::Formula) ? row[3].value : row[3]}"
end                                                                                                          
```

## axlsx
[randym/axlsx](https://github.com/randym/axlsx)

* 扱う拡張子は`.xlsx`
* 新規作成専用で、既存ファイルの読み込みは不可
* セルの書式設定はやりやすい印象
* セルに画像を貼ったり、グラフを表示したりもできるっぽい（未検証）

```
# 新規作成
package = Axlsx::Package.new                             
sheet = package.workbook.add_worksheet(name: 'curry')    

sheet.add_row(['品名', '単価', '数量', '計'])            
sheet.add_row(['にんじん',    80, 1,      '=B2*C2'])     
sheet.add_row(['たまねぎ',    50, 2,      '=B3*C3'])     
sheet.add_row(['じゃがいも',  40, 2,      '=B4*C4'])     
sheet.add_row(['牛肉',       200, 1,      '=B5*C5'])     
sheet.add_row(['カレー粉',   150, 1,      '=B6*C6'])     
sheet.add_row(['',            '', '総計', '=SUM(D2:D6)'])

package.serialize('test.xlsx')                        
```

## roo
[Empact/roo](https://github.com/Empact/roo)

* `.xls`と`.xlsx`が扱える(他にも`.ods`や`.csv`や google spreadsheet も扱えるらしい)
* 読み込み専用で、新規作成、書き出しは不可

```
# 読み込み                                                                      
s = Roo::Excel.new(filepath)  # .xlsx を読み込むときは Roo::Excelx.new                                                  
s.default_sheet = 'curry'                                                       
s.first_row.upto(s.last_row) do |row|                                           
  puts "#{s.cell(row, 1)} #{s.cell(row, 2)} #{s.cell(row, 3)} #{s.cell(row, 4)}"
end                                                                             
```

## rubyXL
[weshatheleopard/rubyXL](https://github.com/weshatheleopard/rubyXL)

* `.xlsx`と`.xlsm`が扱えるが、`.xlsm`にマクロが含まれているとデータが壊れる…
 * もしマクロ入り`.xlsm`を壊さずに扱える方法をご存じの方がいれば教えて下さい！
* 新規作成、読み込み、書き出しが可能
* セルの書式設定はやりやすい印象

```
# 新規作成
book = RubyXL::Workbook.new                  
sheet = book[0]   # 最初からシートが１つある 
sheet.sheet_name = 'curry'                   
sheet.add_cell(0, 0, '品名')                 
sheet.add_cell(0, 1, '単価')                 
sheet.add_cell(0, 2, '数量')                 
sheet.add_cell(0, 3, '計')                   
                                             
sheet.add_cell(1, 0, 'にんじん')             
sheet.add_cell(1, 1, 80)                     
sheet.add_cell(1, 2, 1)                      
sheet.add_cell(1, 3, '', 'B2*C2')    

# 中略         
                                             
sheet.add_cell(6, 2, '計')                   
sheet.add_cell(6, 3, '', 'SUM(D2:D6)')       
                                             
book.write("test.xlsx")                   
```

```
# 読み込み                                                                
book = RubyXL::Parser.parse(filepath)                                     
sheet = book['curry']                                                     
sheet.each do |row|                                                       
  puts "#{row[0].value} #{row[1].value} #{row[2].value} #{row[3].value}"  
end                                                                       
                                                                          
# 編集                                                                    
sheet[4][1].change_contents(500)                                          
                                                                          
# 書き込み                                                                
book.write(filepath)                                                      
```

## まとめ

使い分けとしては、

* `.xls`でもいいからネット上の情報が豊富なやつを使いたい　-> spreadsheet
* システムのみでリッチな`.xlsx`ファイルを作りたい -> axlsx
* `.xlsx`ファイルを読み出すだけでいいから気軽に扱いたい -> roo
* テンプレートの`.xlsx`ファイルがあって、それにデータを書き込んで保存したい -> rubyXL

といった感じかな…。

ちなみにどのGemでもマクロが含まれていると扱えなかった。

