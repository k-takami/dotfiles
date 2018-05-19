# coding: utf-8
require 'cgi' ; @cgi = CGI.new
require 'erb' ; include ERB::Util
require 'cgi/session' ; require 'cgi/session/pstore' ;
# require 'uri'

def error_cgi
  print "Content-Type:text/html;charset=utf-8\n\n"
  print "#{CGI.escapeHTML($!.inspect)} <br />"
  $@.each{|x| print CGI.escapeHTML(x), "<br/>"}
end

def excapeHTML(str)
  # NOTE: ' だけは明示的に置き換える必要がある。
  CGI.escapeHTML(str).gsub(/'/n, '&#39')
end


