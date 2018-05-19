begin
  # NG: HOMEが展開されない： require 'pry'; binding.pry
  require '../common'
  require './common4cgi'
  erb_new_result = ERB.new("<%=h(Time.now.to_s)%> <br>").result
	html = <<-"CODE"
    <html><body>
      this is test page <br>
      query\string   = #{@cgi.query_string } <br>
      params         = #{CGI.unescapeHTML @cgi.params.to_s } <br>
      name_post      = #{@cgi['post'] }   <br />
      referer        = #{@cgi.referer}   <br />
      header         = #{@cgi.header}    <br /><br />
      cookies        = #{@cgi.cookies}   <br /><br />
      erb_new_result = #{erb_new_result}<br /><br />
     </body> </html>
	CODE
  @cgi.out("type" => "text/html" , "charset" => "UTF-8") { html }

  # NG:
  # sessiondata = CGI::Session.new(@cgi,
  #   "tmpdir"            => "/tmp/session",
  #   "database_manage"   => CGI::Session::PStore,
  #   # "database_manage" => CGI::Session::FileStore,
  #   # "session_key"     => "session_id"
  #   # "session_expires" => false,
  #   # "secure"          => true,
  # )
  # print @cgi.header( "type"=>"text/plain")
  # sessiondata["count"] = "***TEST-SESSIONDATA***"
  # puts sessiondata["count"]
  #
  # print @cgi.header(
  #   "type"=>"text/plain",
  #   "cookie"=>[
  #     CGI::Cookie.new(
  #       "name"=>"COOKIE_TEST",
  #       "value"=>"XXXXXXXXXX",
  #       "path"=>"/",
  #       "expires"=>nil,
  #       "secure"=>false
  #     )
  #   ]
  # )
  # REDIRECT print @cgi.header("status"=>"MOVED", "location"=>"/sample.html")

  # NOTE: URLのエスケープはCGI.escape(str)/.unescape(str)
  # NOTE: メタ文字処理のCGI.unescapeHTMLはUTF-8じゃないと数値実態参照のunescapeに失敗する。
  # $SAFE=1 #<=== NOTE: taintモードになる 文字列.untaintで汚染除去 gem Amrita などで自動除去するなど、検討
  #
rescue
  error_cgi
end
