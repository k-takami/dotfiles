:mru	ひげろぐ
ADVAのtags&taggingテーブルを先にバックアップ削除:
migrate失敗の時はapp/db/[tablename].rbを逃がしてやりすごすとOK
プラグインのインストール
$ ruby script/plugin install http://svn.viney.net.nz/things/rails/plugins/acts_as_taggable_on_steroids
$ ruby script/generate acts_as_taggable_migration
$ rake db:migrate

モデルにタグ機能をつける – acts_as_taggable
class Item < ActiveRecord::Base
  acts_as_taggable
end

以下タグのリストに関する仕様。
  • タグのリストは[S:配列でも文字列でも:S]文字列で指定する
  • 文字列で指定した場合のデリミタのデフォルトはコンマ
		デリミタが半角スペース以外の時にはデリミタとタグの間に半角スペースが入った形になる。
  • 重複タグは自動的にユニークになる
  • タグの前後の空白は取り除かれる
  • 空タグ（nilや空文字列）は取り除かれる

WRITE/UPDATE
  item.tag_list = "テント, 設営器具, ペグ"
  item.tag_list = ["テント, "設営器具", "ペグ"] でもよい
	item.tag_list.add("Coleman, コールマン")
		# => ["テント", "設営器具", "ペグ", "Coleman", "コールマン"]
DELETE
	item.tag_list.remove("Coleman, コールマン")
		指定したタグがタグのリストの中に存在していなくてもエラーにはならない。
		# => ["テント", "設営器具", "ペグ"]

READ:=tag_list, add, remove, toggle(<-有無反転) + item.save;
	item.tag_list
	# => ["テント", "設営器具", "ペグ"]
	item.tag_list.to_s
	# => "テント, 設営器具, ペグ"

		タグの付いているモデルオブジェクトを取得する – find_tagged_with
		find_tagged_with("tagname"):タグ->レコード検索
			items = Item.find_tagged_with("テント")
			items = Item.find_tagged_with("テント", :conditions => ["maker_id = 1"], :order => 'price', :limit => 20)
			複数のタグを指定すると、デフォルトではそれらタグのOR条件での取得になる。
				items = Item.find_tagged_with("テント, タープ")
			AND条件っぽく取得したい場合はオプションで「:match_all => true」を指定する。
				items = Item.find_tagged_with("テント, 本体", :match_all => true)

			find_tagged_withに続けてpaginateを使う。:conditionsや:orderなどはfind_tagged_withの方に含める。
				ところでfind_tagged_withの後にpaginate使うと該当レコード全部持ってきてからページネーション処理に入るからパフォーマンス的にあんまりよく
				ないとかけっこう前に気がついたけどめんどくて修正してなかったりします。サーセン。

			@items = Item.find_tagged_with('テント', :order => :price).paginate(:page => params[:page], :per_page => 20)

			ビューで次のように書く。
			<%= will_paginate(@items) %>

			モデルに付いているタグの集計リストを取得する – tag_counts
				<all model>
				tags = Tag.counts
				p "#{tags.first.name}(#{tags.first.count})"
				# => テント(123)
				name  タグ名
				count タグの使われている回数

				<single model>
				tags = Item.tag_counts
				p "#{tags.first.name}(#{tags.first.count})"
				# => テント(123)


				tag_countsのオプション
				 :start_at  タグ付けされた日時が指定した日時以降のタグのみ対象に取得
					:end_at   タグ付けされた日時が指定した日時以前のタグのみ対象に取得
				:conditions findと同じようにwhere条件を指定。モデルのカラムの他、tags.nameやtaggings.created_atなどのカラムも条件に含めることができる。
					:limit    取得件数の制限。findで指定するのと同じ。
					:order    ソート条件の指定。findで指定するのと同じ。
				 :at_least  タグのついているレコード数が指定した数値以上のタグのみを対象に取得
				 :at_most   タグのついているレコード数が指定した数値以下のタグのみを対象に取得

Category.find_by_name('テント・タープ').items.tag_counts

タグクラウド – tag_cloud
	サンプルで説明するとまずヘルパーをインクルードして
	module ApplicationHelper
		include TagsHelper
	end

	ビューで次のように使う。tag_cloudヘルパーの引数にはTag.countsの返値とCSSクラスの配列を与え、ブロックを渡す。
	<% @tags = Item.tag_counts %>
	<% tag_cloud(@tags, ['tag-x-small', 'tag-small', 'tag-medium', 'tag-large', 'tag-x-large']) do |tag, css_class| %>
		<%= link_to(tag.name, { :action => :tag, :id => tag.name }, :class => css_class) %>
	<% end %>

	対応するCSSは以下。
	.tag-x-small { font-size:  80%; }
	.tag-small   { font-size:  90%; }
	.tag-medium  { font-size: 100%; }
	.tag-large   { font-size: 120%; }
	.tag-x-large { font-size: 150%; }

	「@tags = Item.tag_counts」の箇所は実際にはコントローラ内に書くと思うがサンプルと言うことでひとつ。
	CSSクラスの数は任意に変更でき大きさの段階を細かくしたい場合には増やせば、粗くしたい場合は減らせばよい。

タグのデリミタの変更 – TagList.delimiter
	半角スペースにしたい場合は次のように。
	TagList.delimiter = " "
	デリミタはいつでも変更できるが基本的に使っている途中で別のものに変更するとかは考えにくいのでconfig/environment.rbに書くのが普通だろう。

タグのキャッシュと使われなくなったタグの削除
	タグリストのキャッシュと使うためには単に「cached_tag_list」という文字列型のカラムをモデルのテーブルに作ればよい。
	例えば以下のようなマイグレーションで。ひとつのオブジェクトにつくタグの数が多い場合はカラムのサイズに注意すること。
	class CacheItemTagList < ActiveRecord::Migration
		def self.up
			add_column :items, :cached_tag_list, :string
		end
	end
	カラムがあれば自動的にキャッシュされるようになる。
	タグリストを変更した場合にはキャッシュの内容も自動的に変更されるので、キャッシュを使っていると意識する必要はまずない。
	何らかの事情でカラムの名前を変えたければset_cached_tag_list_column_nameを使う。
	class Item < ActiveRecord::Base
		acts_as_taggable
		set_cached_tag_list_column_name "tags_cache"
	end

カラムが存在しなくてもエラーにはならない。なければキャッシュが働かないと言うだけ。

使われなくなったタグを自動的に削除する
この削除はタグリストから削除されたタイミングで行われるので、destroy_unusedをtrueにする前に使われなくなったタグはやっぱりそのまま残り続ける
まあパフォーマンスに影響が出ているとか何らかの問題がなければ残りっぱなしでほっといてもかまわんと思う。
config/environment.rb辺りに書いておけばよいと思う。
	Tag.destroy_unused = true


