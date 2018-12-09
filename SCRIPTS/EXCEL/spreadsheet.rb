#!/usr/bin/env ruby
require_relative '../common'
require 'spreadsheet'

# Create a new Workbook
# Spreadsheet.client_encoding = "UTF-8" #default
new_book = Spreadsheet::Workbook.new

# Create the worksheet
new_book.create_worksheet :name => 'Sheet Name'
new_book.worksheet(0).insert_row(0, ['感じA1', 'B1'])

# Write the file
new_book.write('test.xls')

# Wait for the user to inspect the file manually
print "Sheet Created, press Enter to continue...."
gets







# Open the previously created Workbook
open_book = Spreadsheet.open('test.xls')
# Get the row index in order to append a new row
# after any exisitng rows with data
next_last_row = open_book.worksheet(0).last_row_index + 1

open_book.worksheet(0).insert_row(next_last_row, ['A2', 'B2'])

# Delete the file so that it can be re-written
File.delete('test.xls')
# Write out the Workbook again
open_book.write('test.xls')
