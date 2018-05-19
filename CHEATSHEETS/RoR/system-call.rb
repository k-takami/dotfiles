curl
  def execute_sso
    card_id = params[:j_username]
    sso_api_query = ""
    sso_api_query << "curl -X POST 'https://10.2.74.181:8081/risapi/session' --insecure"
    sso_api_query << " -d 'cardId=#{card_id}' -d 'password=#{params[:j_password]}'"
    sso_api_query << " -c #{Rails.root}/tmp/sso_cookie"
    # sso_api_query << -H 'Cookie: header_some_key_str=some_value'
    #  --max-time  1
    #  --retry 3 --connect-timeou 3 などのオプションもある

    # NOTE: API below requires VPN connection to NDL server in advance.
    #     : Meanwhile, VPN connection and loading/rendering of top page of enju-flower seems to be mutually exclusive. (or , contradictory settings)
    # XXX: timeout logic is nice to have.
debugger
    result = JSON.parse(IO.popen(sso_api_query, "r+").gets)
    render_login_when_failed and return if result.blank? || result["type"] == "errorResponse"
    if result['patron']['type'] == "REGISTERED"
=begin
    if 1 == 1
=end
    IssBridge.update(session, :referer, url_for(params))
    IssBridge.update(session, :online, true)

