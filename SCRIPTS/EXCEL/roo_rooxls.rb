require_relative '../common'
require 'roo'
require 'roo-xls'

filepath_x = './test.xlsx'
# xlsx = Roo::Spreadsheet.open(filepath_x)
# xlsx = Roo::Excelx.new(filepath_x)

filepath = './test.xls'
begin
  xls = Roo::Spreadsheet.open(filepath, extension: :xlsx)
rescue Zip::Error
  xls = Roo::Spreadsheet.open(filepath)
end

byebug
# # Use the extension option if the extension is ambiguous.
# xlsx = Roo::Spreadsheet.open('./rails_temp_upload', extension: :xlsx)
#
# xlsx.info
# # => Returns basic info about the spreadsheet file
# xlsx = Roo::Excelx.new("./test_roo.xlsx")
#
puts "############"
# xls.each_row_streaming do |row|
#     puts "###" # row.inspect # Array of Excelx::Cell objects
#     puts %w(aaa bbb)
# end
#
