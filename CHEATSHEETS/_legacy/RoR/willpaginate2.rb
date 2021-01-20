プラグインのインストール
$ script/plugin install svn://errtheblog.com/svn/plugins/will_paginate

基本
  • findメソッドと同じ感覚で利用できるようだ。
  • :page => params[:page]オプションは必須。無いとエラーが発生し、:page parameter requiredのメッセージ。

コントローラの修正 以下のようにコードを修正。コメントアウトしたものは修正前のもの。
	def list
		# @pages, @items = paginate(:items, :conditions => ["deleted = 0"], :order => 'created_at desc', :per_page => 10)
		@items = Item.paginate(:page => params[:page], :conditions => ["deleted = 0"], :order => 'created_at desc', :per_page => 10)
	end
	引数の :page で表示するページ数を指定して、:per_page でページあたりの表示件数を指定する。
	またpaginate_by_xxxというメソッドも使えるようになるので、
	@items = Item.paginate_by_user_id @user.id, :page => params[:page]
	のような使い方もできるようだ。

    # 以下のような条件指定もOK。詳細はマニュアルを。
    #@slips = Slip.paginate(:page => params[:page], :per_page => 4,
                            :conditions=>["total_yen>?", 1000],
                            :order=>"number DESC, id DESC")
  end
.
		メソッド                           内容
	size          総件数。
	page_count    総ページ数。
	per_page      1ページあたりの表示件数。
	previous_page 現在のページの前のページ番号。存在しない場合はnil
	next_page     現在のページの次のページ番号。存在しない場合はnil
	offset        現在のページの最初のレコードのオフセット。

	例
	<%= @items.page_count %>

ビューの修正
	< %= will_paginate(@items, :prev_label => '前', :next_label => '次', :params_name => 'p') %>
<%= will_paginate @slips, :prev_label=>'&#171;前', :next_label=>'次&#187;' %>
	<%= will_paginate(@items) %>
	will_paginateのオプションオプションを与えると外観をカスタマイズできる。
	 オプション                                                内容                                                     デフォルト値
	:class        ページネーションを囲むdivタグ（コンテナ）につくCSSクラス名                                     “pagination”
	:prev_label   前のページへのリンクのラベル                                                                   “≪ Previous”
	:next_label   次のページへのリンクのラベル                                                                   “Next ≫”
	:inner_window 現在のページをの両隣何ページ分までリンクを表示するか                                           4
	:outer_window 1ページ目と最後のページからそれぞれ何ページ分までリンクを表示するか                            1
	:separator    ページとページの間のセパレータ                                                                 ” ” （半角スペース）
	:param_name   ページ数を表すパラメータの名前。例えば “p” にすると “p=1″ とか “p=3″ とか言うクエリパラメータ  “page”
								になる。
	:params       各ページへのリンクにつける追加パラメータ。例えば :controller => “foo”, :action => nil など     nil
	:renderer     リンクを描画するレンダラークラスを指定できる                                                   WillPaginate::LinkRenderer
	:page_links   各ページへのリンクを表示するか否か。falseにすると各ページへのリンクは表示されず、前と次のペー  true
								ジへのリンクのみ表示される。
	:container    ページネーションをdivタグ（コンテナ）で囲むか否か。                                            true
								ページネーションを囲むdivタグ（コンテナ）のidを指定できる。
	:id           文字列でなくtrueを指定するとモデルのクラス名を小文字化したものに “_pagenation” がついたものに  nil
								なる。

:inner_windowと:outer_windowの挙動が若干おかしいような気がしないでもない・・・


前後のページに進むリンクのラベルを変更し、クエリストリングのページ番号を表すパラメータを「p」に変更している。
なお:params_nameを変えたらコントローラ側でも変更が必要になるので注意。

@items = Item.paginate(:page => params[:p], :per_page => 10)

スタイルを当てる
	READMEに載っている次のスタイルを当てるとちょっとかっこよくなる。
	paginationというクラス名はヘルパーのオプションで変更してたらそれにあわせること。
  • READMEに書かれているスタイルシートをコピーして、will_paginate.cssとして保存した。
/* スタイルシート: public/stylesheets/will_paginate.css */
	.pagination {
		padding: 3px;
		margin: 3px;
	}
	.pagination a {
		padding: 2px 5px 2px 5px;
		margin: 2px;
		border: 1px solid #aaaadd;
		text-decoration: none;
		color: #000099;
	}
	.pagination a:hover, .pagination a:active {
		border: 1px solid #000099;
		color: #000;
	}
	.pagination span.current {
		padding: 2px 5px 2px 5px;
		margin: 2px;
		border: 1px solid #000099;
		font-weight: bold;
		background-color: #000099;
		color: #FFF;
	}
	.pagination span.disabled {
		padding: 2px 5px 2px 5px;
		margin: 2px;
		border: 1px solid #eee;
		color: #ddd;
	}


  • レイアウトで上記スタイルシートを読み込む。
<%# レイアウト: app/views/layouts/slips.rhtml %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" /> <title>Slips: <%= controller.action_name %></title>
  <%= stylesheet_link_tag 'scaffold', 'will_paginate' %><%#<--- 'will_paginate'を追記 %>
  <%= javascript_include_tag :defaults %>
</head>
<body>
<p style="color: green">
<%= flash[:notice] %></p> <%= yield  %>
</body>
</html>


AAjax遷移なpaginate
    [INS:Ajax遷移なpaginateは絶対欲しくなるだろうなー、と思っていたところ...　応用例が紹介されていました。感謝です！:INS]
      □ will_paginateでAjaxで遷移（ページ番号リンクをlink_to_remoteへ変更する） - 福島でRailsを使って仕事を頑張る計画
ちなみに、gemでインストールしたwill_paginate(2.2.1)を使ってますが、
will_paginateの中のrendererのコードも上述のとは違っていて、nextリンクにrel=”next”がデフォルトで付いてくれる様子でした。

* WillPaginate::Finder::ClassMethods for pagination on your models;
* WillPaginate::ViewHelpers for your views.
* {Pagination 101}[http://kurafire.net/log/archive/2007/06/22/pagination-101]
* {Pagination gallery}[http://www.smashingmagazine.com/2007/11/16/pagination-gallery-examples-and-good-practices/]
* {Pagination on Yahoo Design Pattern Library}[http://developer.yahoo.com/ypatterns/parent.php?pattern=pagination]
	{Google group}[http://groups.google.com/group/will_paginate].


