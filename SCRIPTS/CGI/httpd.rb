# coding: utf-8
require_relative '../common'
require 'webrick'

# NOTE: port は1024以下にする場合はroot権限がないとエラーになる
server = WEBrick::HTTPServer.new({
  :DocumentRoot => './public',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  # :CGIInterpreter => '/usr/local/bin/ruby' #環境にあわせてwindows  'C:\\Ruby193\\bin\\ruby.exe'
  # :BindAddress  => @option[:host],
  :Port         => @option[:port],
})

#INT == Ctrl+C 
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

### ROUTING BELOW;
# sample.cgiにhttpアクセスした場合、sample.rbをcgiで動かす
server.mount('/sample.cgi', WEBrick::HTTPServlet::CGIHandler,  'sample.rb')
server.mount('/sample_upload.cgi', WEBrick::HTTPServlet::CGIHandler,  'sample_upload.rb')
# module WEBrick
#   module HTTPServlet
#     FileHandler.add_handler('rb', CGIHandler)
#   end
# end


server.start
