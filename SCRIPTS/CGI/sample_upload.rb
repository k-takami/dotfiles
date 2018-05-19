# coding: utf-8
begin
  require '../common'
  require './common4cgi'
  file = @cgi.params["file"][0]
	html = <<-"CODE"
    <html><body>
      アップロードされたファイル<br />
      <pre> #{CGI.escapeHTML(File.read file)} </pre>
     </body> </html>
	CODE
  @cgi.out("type" => "text/html" , "charset" => "UTF-8") { html }
rescue
  error_cgi
end
