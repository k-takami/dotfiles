#Active scaffold
  #rails2.x
    script/plugin install git://github.com/lackac/render_component.git -r rails-edge
    cd /vendor/plugins;
    git clone git://github.com/activescaffold/active_scaffold.git activescaffold
    *normal motion on rails 2.2.x is suspicious. to b checked. ouhave to "git clone" & edit"config/environment.rb":
    #NOTE: not natively compatible with Spree app.
  #rails1.x
    ruby script/plugin install http://activescaffold.googlecode.com/svn/tags/active_scaffold
    ruby script/plugin install http://activescaffold.googlecode.com/svn/tags/active_scaffold -r rails-2.2






	  rails/plugin/ActiveScaffold
	  <http://a01.biz/wiki/index.php?plugin=related&page=rails%2Fplugin%2FActiveScaffold>


	rails <http://a01.biz/wiki/index.php?rails>


		ActiveScaffold? <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#pad09b43>

		* ActiveScaffold <#pad09b43>
		* 説明 <#r5efc1c0>
		* Rails2.0対応について <#tdf140e2>
		* インストール <#f5945e80>
		* 使い方 <#z0bcefa8>
			  o 単純な使いかた <#l8e6567c>
			  o ActiveScaffoldの設定 <#f9d88981>
					+ 基本的な内容 <#tb58f8ce>
					+ ページあたりの表示数を指定 <#k568981c>
					+ listの並び順を設定 <#hfc102c7>
					+ 表示するカラムと順番を指定する <#u8058cd7>
					+ カラムのタイトルを日本語にしたい <#v39cab5e>
			  o 2008-03-25 ActiveScaffoldメニューの日本語化 <#u3d32f28>
			  o （旧）ActiveScaffoldメニューの日本語化【2008-03-25 プラグイ
				ン化されているので必要無し】 <#y923029c>
			  o 表示方法を変更するには? <#l7158af5>
			  o 共通の設定をするには? <#rfe3e821>
			  o 不要なメニューを消すには? <#s0686d65>
		* 公式サイト翻訳 <#jab9de3b>
			  o API:Core <#s357815c>
					+ actions (global local) <#n70189f0>
					+ action_links (global local) <#yf541d11>
					+ columns <#p74d1ff1>
		* リンク <#e070a68c>

	説明 † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#r5efc1c0>
	そのままではまともに使えないScaffoldに変わり、そのままでもかなり使える Viewを動的に作成してくれます。 Viewの開発を劇的に楽にします。
		Rails2.0対応について † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#tdf140e2>
	基本的な部分は問題なく使えるが、ソートをしようとするとエラーになる。 もしかしたらpostgresql特有の問題かも・・・
	インストール † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#f5945e80>
		Rails2.0～ 2007/1/9 時点
			$ script/plugin install http://activescaffold.googlecode.com/svn/tags/1.1.0_rc1
			$ mv vendor/plugins/1.1.0_rc1/ vendor/plugins/active_scaffold
		Rails1.～
			$ script/plugin install http://activescaffold.googlecode.com/svn/tags/active_scaffold
	単純な使いかた † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#l8e6567c>
	コントローラに宣言を追加する
		$ vi app/controllers/admin_controller.rb
		class AdminController < ApplicationController
		  active_scaffold :user
		  layout "activescaffold"
		end

	ActiveScaffold? 用のレイアウトを追加 <http://a01.biz/wiki/index.php?cmd=edit&page=ActiveScaffold& refer=rails%2Fplugin%2FActiveScaffold>
		Rails2 $ vi app/views/layouts/activescaffold.erb
		Rails1 $ vi app/views/layouts/activescaffold.rhtml
			ファイル内容
			<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html>
			  <head>
				<title>My Application</title>
				<%= javascript_include_tag :defaults %>
				<%= active_scaffold_includes %>
			  </head>
			  <body>
				<%= yield %>
			  </body>
			</html>

	ActiveScaffoldの設定 †
	基本的な内容 † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#tb58f8ce>
	設定をしたい場合はブロックで囲む
	config.xxx=は全体の設定 config.listやconfig.showなどはlist、show個別の設定になる。

		active_scaffold :product do |config|
		  config.label = "商品"
		  config.list.per_page = 2
		  config.list.sorting ={:name => :asc }
		end


		ページあたりの表示数を指定 † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#k568981c>
			config.list.per_page = 20
					listの並び順を設定 † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#hfc102c7>
			config.list.sorting = {:name => :asc}

		表示するカラムと順番を指定する † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#u8058cd7>
			columnsを書くと表示する順番を指定できる。
			config.columns = [:name, :note, :items]
			表示順は書いた順番になる。 全体設定なのでlistだけでなく、showもeditも同じ順番になる。 itemsの様に親子関係の場合も指定可能

		カラムのタイトルを日本語にしたい † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#v39cab5e>
			config.columns[:name].label = "商品名"
			config.columns[:note].label = "メモ"

		カラム関係のメソッド
			label	カラム名	String
			description	補足説明(編集時)	String
			required	必須項目	true|false
			ui_type	関連の選択設定	:crud|:select
			search_sql	SQLの条件節	true|String

	2008-03-25 ActiveScaffold? メニューの日本語化 † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#u3d32f28>
		$ script/plugin install http://svn2.assembla.com/svn/activescaffold_japanese_l10n
			  【2008-03-25 プラグイン化されているので必要無し】 † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#y923029c>
		urekatのスカンク日記３ <http://d.hatena.ne.jp/urekat/20071110/>さんのと ころの通りでOK

		libにactive_scaffold_localization.rbを作成
		$ vi lib/active_scaffold_localization.rb
			# http://activescaffold.com/docs/localization-reference
			class Object
			  AS_JP_MAP = {
				"Replace With New" => "新しい値に置き換える",
				"Edit"             => "編集",
				"Show"             => "表示",
				"Update"           => "更新",
				"Delete"           => "削除",
				"Search"           => "検索",
				"Create New"       => "新規作成",
				"Reset"            => "リセット",
				"hide"             => "隠す",
				"show"             => "表示",
				"Cancel"           => "キャンセル",
				"Found"            => "件見つかりました。",
				"Create"           => "作成",
				"Close"            => "閉じる",
				"No Entries"       => "データがありません",
				"Live Search"      => "リアルタイム検索",
				"Search Terms"     => "検索ワード",
				"Create %s"        => "%sの新規作成",
				'Create Another'   => "追加",
				'Add From Existing'=> "既にあるものを追加(Add From Existing)",
				'- select -'       => "-- 選択 --",
				'Remove'           => "除外",
				'Previous'         => "前",
				'Next'             => "次",
				'%s for %s'        => "%2$s の %1$s (%1$s for %2$s)",
				'Update %s'        => "%sの編集",
				'Are you sure?'    => "本当によろしいですか？",
				'Request Failed (code 500, Internal Error)' => "エラーが発生しました。",
				'Created %s'       => "%s を作成しました。",
				'Deleted %s'       => "%s を削除しました。",
				'Updated %s'       => "%s を更新しました。",
				"Version inconsistency - this record has been modified since you started editing it." => "更新が衝突しました。",
				'Show %s'          => "%s の表示"
			  }
			  alias_method :as__without_jp, :as_
			  def as__with_jp(*args)
				pars = args.dup
				fmt = pars.shift
				text = AS_JP_MAP[fmt]
				if text
				  text = text % pars unless pars.empty?
				  return text
				end
				return as__without_jp(*args)
			  end
			  alias_method :as_, :as__with_jp
			end

		ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:default] = "%Y/%m/%d %H:%M"
		ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default] = "%Y/%m/%d %H:%M"

		environment.rbの最後に追加
			$ vi config/environment.rb
			require "active_scaffold_localization"

		サーバ再起動
		$ script/server


	表示方法を変更するには? † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#l7158af5>
	表示方法を変更するには、ヘルパーを利用する。
	|カラムの表示方法|(カラム名)_column(record)
	|Formの表示方法|(カラム名)_form_column(record, name)
		module AdminHelper
		  def release_date_column(record)
			record[:release_date].strftime("%Y-%m-%d")
		  end

		  def release_date_form_column(record,name)
			input(:record, :release_date, :name => name, :order => [:year, :month, :day], :use_month_numbers => true, :start_year => 1970)
		  end
		end

		  共通の設定をするには? † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#rfe3e821>
	applicationControllerでAjaxScaffold? .set_defaultsを指定すると全体の共 通設定が可能。 <http://a01.biz/wiki/index.php?cmd=edit&page=AjaxScaffold& refer=rails%2Fplugin%2FActiveScaffold>

		  不要なメニューを消すには? † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#s0686d65>

	conf.actions.exclude :delete, :show, :create, :update, :search

	:editではなく:updateなので注意

	公式サイト翻訳 † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#jab9de3b>

	  API:Core † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#s357815c>

		actions (global local) † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#n70189f0>

	使用するアクションを指定する(指定しないばあいは全部使う)

	conf.actions = [:create, :update, :show]

	使わないアクションを指定する

	conf.actions.exclude :create

	配列で渡せばまとめて指定できる

	conf.action.exclude = [:create, :delete]

	アクションを使える様にする

	conf.actions.add :delete

	アクションを変更する(:search専用?)

	conf.actions.swap :search, :live_search

			action_links (global local) † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#yf541d11>

	アクションを追加する

	conf.action_links.add 'get_pdf', :label => 'Download PDF'

	アクションの名称を変更

	conf.action_links['get_pdf'].label = "Save PDF"

	アクションを追加(簡易版)

	conf.action_links << 'print_pdf'

	標準のアクション名を変更する

	conf.show.link.label = "Display Record"

	列毎にMenuを表示する

	conf.action_links.add 'GetRss', :type => :record, :action => 'get_rss'

	アクションの説明

	:action	'action_name'	指定したアクションを実行する
	:controller	'controller_name'	コントローラを指定する
	:parameters		その他のパラメータを指定
	:method	:get :post :put :delete	メソッドを指定する
	:type	:table :record	全体かレコードかを指定
	:label	'label_name'	表示用ラベルを指定

	:confirm		確認? The confirmation message for the link	if any.

	:security_method
	:crud_type		:create :read :update :destroy
	:inline	true false	ActiveScaffold? で表示するか?
	:page	true false

			columns † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#p74d1ff1>
	カラムの追加

	conf.columns.add :name
	conf.columns << :sort_no

	まとめて追加

	conf.columns = [:name, :sort_no]

	listに対する編集

	conf.list.columns = [:name, :sort_no]

		リンク † <http://a01.biz/wiki/index.php?rails%2Fplugin%2FActiveScaffold#e070a68c>
		ActiveScaffold公式サイト(英語) <http://www.activescaffold.com/>
		ActiveScaffold を使って Ruby on Rails を機能アップする <http://www.ibm.com/developerworks/jp/linux/library/l-activescaffold/>
		2007-11-10 優しいRailsの育て方 <http://wota.jp/ac/?date=20071110>

	 新規
		<http://a01.biz/wiki/index.php?plugin=newpage&refer=rails%2Fplugin%2FActiveScaffold>
		http://a01.biz/wiki/index.php?cmd=rss&ver=1.0>
		Last-modified: 2009-01-04 (日) 19:17:31 (118d)
		Link: rails <http://a01.biz/wiki/index.php?rails>(118d)
		Site admin: anonymous <http://a01.biz/wiki/>

-------------------------------------------------------------------------------
