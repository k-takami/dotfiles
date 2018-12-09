# ref https://github.com/weshatheleopard/rubyXL
require_relative '../common'
require 'rubyXL'

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

book.write("test_rubyXL.xlsx")

# # 読み込み
# open_book = RubyXL::Parser.parse(filepath)
# sheet = open_book['curry']
# sheet.each do |row|
#   puts "#{row[0].value} #{row[1].value} #{row[2].value} #{row[3].value}"
# end
#
# # 編集
# sheet[4][1].change_contents(500)
#
# # 書き込み
# open_book.write(filepath)