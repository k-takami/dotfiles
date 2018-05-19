# encoding: UTF-8
require 'open-uri'
require 'roo' #; require 'roo-xls'
# .xlsxファイルを読み出すだけでいいから気軽に扱いたい -> roo
# .xlsでもいいからネット上の情報が豊富なやつを使いたい　-> spreadsheet
# システムのみでリッチな.xlsxファイルを作りたい -> axlsx
# テンプレートの.xlsxファイルがあって、それにデータを書き込んで保存したい -> rubyXL
require_relative 'common'

STDOUT.puts "Enter the file name & path (eg:/home/Desktop/sample.xls)"
file_name = File.expand_path STDIN.gets.chomp
if file_name &&  File.exists?(file_name)
	workbook = Roo::Spreadsheet.open("#{file_name}")
	workbook.each_with_pagename do |name, sheet|
		
		@first_row=workbook.first_row
		@last_row=workbook.last_row
		@first_column=workbook.first_column
		@last_column=workbook.last_column
		
		index=[]	
		
		if  workbook && workbook.first_row != nil
			sleep(2)
			time_stamp=Time.now.utc.strftime("%Y%m%d%H%M%S") 
			File.open("#{time_stamp}_create_#{name}.rb", 'w') do |f2|
				f2.puts "class Create#{name.capitalize} < ActiveRecord::Migration"
				f2.puts "\tdef change"
				f2.puts "\t\tcreate_table :#{name} do |t|"
				for i in @first_column..@last_column do
					if sheet.cell(@first_row,i) =~/data type/i
						@datatype=i
					elsif sheet.cell(@first_row,i) =~/COLUMN NAME/i
						@column_name=i
					elsif sheet.cell(@first_row,i) =~/LENGTH LIMIT/i
						@precision=i
					elsif sheet.cell(@first_row,i) =~/UNDER DECIMAL/i
						@scale=i
					elsif sheet.cell(@first_row,i) =~/LOGICAL MEAING/i
						@comment=i
					elsif sheet.cell(@first_row,i) =~/UNIQUE/i
						@table_index=i
					end
				end
				for j in @first_row+1..@last_row do
					if !sheet.cell(j,@datatype).to_s.empty? &&  !sheet.cell(j,@column_name).to_s.empty?  &&  !sheet.cell(j,@precision).to_s.empty? &&  !sheet.cell(j,@scale).to_s.empty? && !sheet.cell(j,@comment).to_s.empty?
						f2.puts "\t\t\tt.#{sheet.cell(j,@datatype)} :#{sheet.cell(j,@column_name)},:precision=>#{sheet.cell(j,@precision)},:scale => #{sheet.cell(j,@scale)},:comment =>'#{sheet.cell(j,@comment)}'"
					elsif !sheet.cell(j,@datatype).to_s.empty? &&  !sheet.cell(j,@column_name).to_s.empty?  && !sheet.cell(j,@comment).to_s.empty?
						f2.puts "\t\t\tt.#{sheet.cell(j,@datatype)} :#{sheet.cell(j,@column_name)},:comment =>'#{sheet.cell(j,@comment)}'"					
					end
					if sheet.cell(j,@table_index)=~ /multi_culumn_index/
						index<<sheet.cell(j,@column_name).to_sym
					end
				end
				f2.puts "\t\tend"
				f2.puts "\t\tadd_index :#{name},#{index}"
				f2.puts "\tend"
				f2.puts "end"
			end
		end
	end
else
	puts "Invalid file name or Path"
end


