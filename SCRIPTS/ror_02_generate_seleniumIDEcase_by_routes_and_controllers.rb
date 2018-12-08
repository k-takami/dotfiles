# coding: utf-8
# NOTE: in case of docker:
  # dkcp ~/dotfiles/SCRIPTS/common.rb  $CONTAINER:/app/ ; dkcp ~/dotfiles/SCRIPTS/ror_02_generate_seleniumIDEcase_by_routes_and_controllers.rb $CONTAINER:/app ; dkbash
  # (root@ container) ruby ror_02_generate_seleniumIDEcase_by_routes_and_controllers.rb
#
# いつかコンテナ内部からホストのdotfilesを見せたい ln -s ~/dotfiles dotfiles
require_relative 'common'
@apps_root = @option[:from]
@mode      = @option[:mode]
Dir.chdir @apps_root

    server_name = "server_1"
    routes = `rake routes`.split("\n").map(&:split).map{|x| x.select{|y| y =~ /\// } }.flatten
    # TODO: 上の結果は[routte/path/pattern, controller/path#action] の配列なので、さらに[0]要素だけにしないゴミが半分近く吐き出される
    loop_elements =[]

    header = <<-"CODE"
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
        <head profile="http://selenium-ide.openqa.org/profiles/test-case">
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <link rel="selenium.base" href="http://localhost:3000/" />
          <title>APPNAME_CONTROLLER_NAME_YYMMDD</title>
        </head>
        <body>
          <table cellpadding="1" cellspacing="1" border="1">
            <thead>
              <tr><td rowspan="1" colspan="3">
                APPNAME_CONTROLLER_NAME_YYMMDD
              </td></tr>
            </thead>
            <tbody>
              <!--# サーバー名は適宜変更すること -->
              <tr>
                <td>store</td>
                <td>http://localhost:3000</td>
                <td>server_1</td>
              </tr>
    CODE

    routes.each do |path|
      loop_element = <<-"CODE"
              <tr>
                <td>open</td>
                <td>${#{server_name}}#{ path.sub("(.:format)","") }</td>
                <td></td>
              </tr>
      CODE
      loop_elements << loop_element
    end

    if routes.grep("/:controller(/:action(/:id))(.:format)").length > 0
      loop_element = <<-"CODE"
              <!--# 以下はｺﾝﾄﾛｰﾗｰから自動採取したaction -->
      CODE
      loop_elements << loop_element
      Dir.glob("#{Dir.pwd}/app/controllers/*rb").sort.each do |file|
        controller     = File.basename(file).split("_").first
        ary_controller = File.read(file).split("\n")
        ary_methods    = ary_controller.grep( /def /).map{|i| i.gsub(/^.+def/, '')}.map(&:strip)
        ary_methods.each do |action|
          loop_element = <<-"CODE"
              <tr>
                <td>open</td>
                <td>${#{server_name}}/#{controller}/#{action}</td>
                <td></td>
              </tr>
          CODE
          loop_elements << loop_element
        end
      end
      # 不定個数引数にあたえたれた controllers 総なめ、各々のC内のメソッドをリストアップ
    end

    footer = <<-"CODE"
            </tbody>
          </table>
        </body>
      </html>
    CODE

    puts header
    puts loop_elements
    puts footer

