


#YAML:    http://yaml-online-parser.appspot.com/
  #引用符：　'' の中に"": ' "***" ' でok
  #anchor & reference
    anchor_ios9later_only: &AP_ios9later_only
      Operations: iOS9以降のデバイスのみ設定できます。
    anchor_supervised_device_only: &AP_under_supervision
      Operations: &MSG_supervised_device_only 監視対象デバイスのみ制限できます。
      AirDrop: *AP_under_supervision

#Rspec::webmock
     [*0..s.size-1].each{|k| former_part=s[0..k]; latter_part=s[k+1..-1]; puts k if former_part.count("(") ==
latter_part.count(")")  }




HTML-codeing
  raw(***), ***.html_safe, h()  <---rails3以降は<%= は自動エスケープ

//form_tag　の　片側だけをif分で条件分岐生成はできない。
  pry()> show-method options_from_collection_for_select
  pry()> ri options_from_collection_for_select
//定数展開例；　　          when *ITEMNAMES4SUPERVISED_APPLE_DEVICE
  //不定HTMLtemplate変数引き渡し：　    <%= component_view_line(item, {index: local_assigns[:index].presence}) %>
  //不定引数SQL化：　uri_variable_value = uri_variable_value.nil? ? 'NULL' : %Q('#{uri_variable_value}')
//パフォチュー
  //render partial 排除：cf: http://www.ohmyenter.com/Railsアプリを『浅く』パフォーマンス・チューニングしてみる（その２）
    module BooksHelper
      extend ERB::DefMethod
      def_erb_method('render_book(book)', "#{Rails.root}/app/views/books/_book.html.erb")
    end

if ***count > 0 || **.present?  --->  if good_news.presence
users.each { |user| process_user(user) } --->  users.each(&method(:process_user))


//Time::
  コード内ではapplication.rbに設定されたタイムゾーンを使うように統一することが望ましいです。
  具体的には、Date.todayではなくDate.currentを、Time.nowではなくTime.current（またはTime.zone.now）を使うようにしてください。
  cf: RubyとRailsにおけるTime, Date, DateTime, TimeWithZoneの違い
//未来時間：***.(hours|days|months|years).since
//時間計算
	３時間ごと：work_hour_per_three = (9..24).to_a.collect { |x| ["#{x}:00"] if x % 3 == 0 }.compact.flatten
コンバーターパターン
  date [+-]  2.(hours|days|months|years)
  date.prev_week(:monday) # => 2013-10-28
  date.next_week(:monday) # => 2013-11-11
  time = Time.current
    # => Mon, 23 Nov 2015 16:45:23 JST +09:00
  time.all_day
  time.all_month
  time.all_year
//String::
  # ダッシュ(ハイフン)区切りにする
  "my_book".dasherize # => "my-book"
  # 人間が読みやすくする(一文字目は大文字 + スペース区切り)
  "my_books".humanize # => "My books"
  # タイトル形式にする(各単語の一文字目が大文字 + スペース区切り)
  "my_books".titleize # => "My Books"
  # クラス名にする(キャメルケース + 単数形)
  "my_book".classify  # => "MyBook"
  "my_books".classify # => "MyBook"
  # テーブル名にする(アンダースコア区切り + 複数形)
  "my_book".tableize # => "my_books"
  "MyBook".tableize  # => "my_books"
  cf: http://apidock.com/rails/String
  余分なスペースや改行を取り除く (2013.11.14追記)
  "    My    \r\n  \t   \n   books       ".squish # => "My books"


//troubleshooting
  Missing template-->強制render, 直感でtemplateフォルダーとパス全部作る。
  irm/mv Gemfile.lock
  rm db/schema.rb
  rake db:reset
  #debug
    #index.htmk.erb を偽装して通常のhtmlを表示させる方法＝＞ <%= stylesheet_link_tag 'scaffold' %>だけをのこしてあとをいれかえる
  //❌印は  h エスケープが原因か、特殊記号
禁則
  #Rails予約語　:-aで終わるロマンシュ語っぽい英語､information,policeもか?
  **create "rails test" add for troubleshooting such as installation of plugins.
  *never use "new/create/destroy/list/index/update/edit/" for controller/model/action name. otherwise Rails router get confused.
  *don't use "_" character for DB table/coolumn name. this way U can easily tell "_" of helper/plugin method name.
  *WiFI connection must check every 10 minutes before every donloading.
  *don't read japanese docment until you stuck into a trouble. it's waste of time.


  Rails3 でモデルやコントローラをネストしてスキャフォールドとかするメモ

  rails destroy scaffold 
#routes.rb .redirecting, layouts  http://railsdoc.com/routes
  Missing Template問題
    CVH: render|redirect_to '/?****/****'  unless    lookup_context.find_all('welcome/index').any?
    #INSPECT:  view_paths.paths[0].to_s
  regexp redirection
      get 'benefits/:controller/:action' => redirect("/benefits/%{controller}/_%{action}.html"),  :action => /^¥d¥d/
  : reload!
  : recognize-path localhost:3000/my/report/neuroblastoma/genes.html?ajax=true
  : recognize-path localhost:3000/my/report/neuroblastoma/genes.html?ajax=true
  : show-routes --grep ajax
  irb> app.passcode_mail_kohai_deliveries_path   # <= helperパスの確認方法
  http://qiita.com/yaotti/items/c6e850010f36acedb0e1



