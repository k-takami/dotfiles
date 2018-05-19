Hatena::Diary
[                    ][日記][検索]
  • ブログトップ
  • 記事一覧
  • ログイン
  • 無料ブログ開設

篳篥日記このページをアンテナに追加 RSSフィード

<前の日 | 次の日>

2008-11-30

■[Rails] Paperclipプラグインによる画像アップロード 01:33 Paperclipプラグインによる画像アップロード - 篳篥日記のブックマークコメント

Paperclipは新興のRails用ファイルアップロードプラグイン。

基本的な使い方は、以下を参照。ちなみにプロジェクトのホームページにある使い方の説明は古く、githubのrdocの方が最新になっているので注意。

README.rdoc at master from thoughtbot’s paperclip - GitHub

もう少し突っ込んだ使い方は、

Goodbye attachment_fu, hello Paperclip ? Ruby on Rails, JRuby, AWS, EC2, Exalead

Paperclip: Attaching Files in Rails | Ruby on Rails

あたりが詳しい。


すごく大雑把に言うと、file_columnと同じようにモデルにカラムを追加して、そこにファイルの情報を入れるタイプ。デフォルトではpublic/ の下にフ
ァイルを置くが、Amazon S3にファイルを置く設定がデフォルトで用意されてたりする。あんまり中身をちゃんと読んでないけど、ファイルの置き場所を
結構柔軟に決められるのと、特別なヘルパー無しに image_tag で画像が表示できるのが良い所かと。


とはいえ、file_columnと同じくカラム追加タイプなので、

2008-08-02 - 篳篥日記

で説明したように、STI + ポリモーフィックな画像モデルにして使ってみたい。

ので、実験してみた。


$ ruby script/plugin install git://github.com/thoughtbot/paperclip.git

で、プラグインをインストールしたら、まず画像モデル(Imageクラス)を作る。Paperclip用のカラム名は"image"とする。

$ ./script/generate model Image type:sting parent_type:string parent_id:integer image_file_name:string image_content_type:string image_file_size:integer image_updated_at:datetime

で作ると、以下のようなmigrationファイルができる。

STI用のカラム、ポリモーフィック関連用のカラムも一緒に作ってしまった。ポリモーフィックの関連名は "parent"とした。

lass CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string   :type                 # STI用
      t.string   :parent_type          # ポリモーフィック用type
      t.integer  :parent_id            # ポリモーフィック用id
      t.string   :image_file_name      # [Paperclip] (カラム名)_file_name
      t.string   :image_content_type   # [Paperclip] (カラム名)_content_type
      t.integer  :image_file_size      # [Paperclip] (カラム名)_file_size
      t.datetime :image_updated_at     # [Paperclip] (カラム名)_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end

上で、[Paperclip] と書いてあるのが、Paperclip用カラム。


ではモデルをいじる。

本家のREADMEにあるような使い方を説明してもしょうがないので、ここでは、

  • サムネイルなどの作成
  • ファイル保存先は、public/store 以下に変更

をしてみる。

# app/models/image.rb
class Image < ActiveRecord::Base
  # (1)
  belongs_to :parent, :polymorphic => true

  # (2)
  has_attached_file :image,
    :styles => {
      :medium => "300x300>",
      :thumb => "100x100#"
    },
    :url => "/store/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/store/:attachment/:id/:style/:basename.:extension"
end

(1) はポリモーフィックの設定

(2) でPaperclipの指定。 "100x100#" の最後の # は cropということらしい。


ファイル保存先の変更は :url と :pathで。ここが config/routes.rb のように指定できてる所がミソ。

上の指定では、RAILS_ROOT/public/store/images/3/original/foo.jpg みたいな所にファイルが保存される。

また、(画像モデル).(カラム名).path で、ファイルの保存先がフルパスで得られ、表示する際のURLは、(画像モデル).(カラム名).url で求められる。こ
の辺りはscript/consoleで確認してみて欲しい。


ちなみに :url と :path のデフォルトは、以下の通り。

    :url => "/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension"

このコロン付きの部分(Interpolation)は以下のようなものが使える。

:rails_root RAILS_ROOT
:rails_env  RAILS_ENV
:attachment Paperclip用カラム名を小文字化し複数形にしたもの。ここでは"images"
    :id     モデルのid
  :style    has_attachment_file に渡した :style オプションのキー。"medium" とか "thumb" とか。
 :basename  ファイル名の拡張子以外の部分
:extension  ファイル拡張子
  :class    モデルのクラス名をアンダースコア化して、複数形にしたもの

しかも、このInterpolationは自分で追加することも可能。

config/initializers/ に以下のような内容のファイルを置くと、自分で定義可能。ここでは、created_at を YYYYMMDD形式にする :dateを追加してみる
。

Paperclip::Attachment.interpolations[:date] = proc do |attachment, style|
  attachment.instance.created_at.strftime("%Y%m%d")
end

これで、:url や :path の指定の際に、:date が使えるようになる。


では、Paperclipを使って画像をアップロードしてみる。

とりあえず、scaffoldで画像を持つ事になる親モデルを作成。

$ ruby script/generate scaffold Entry title:string body:text

ポリモーフィックの関連名は "parent" だった。

# app/models/entry.rb
class Entry < ActiveRecord::Base
  has_many :images, :as => :parent, :dependent => :destroy
end

次に、画像モデルをSTIにして、Image::EntryImageモデルを作る。

$ mkdir app/models/image

してから、app/models/image/entry_image.rbを作成。

# app/models/image/entry_image.rb
class Image::EntryImage < Image
end

入力画面のビュー app/views/entries/new.html.erb を修正。

<h1>New entry</h1>

<!-- multipart にする -->
<% form_for(@entry, {}, { :html => { :multipart => true } }) do |f| %>
  <%= f.error_messages %>

  <p>
    <%= f.label :title %><br />
    <%= f.text_field :title %>
  </p>
  <p>
    <%= f.label :body %><br />
    <%= f.text_area :body %>
  </p>

  <!-- 追加 -->
  <p>
    <%= file_field :image, :image %>
  </p>

  <p>
    <%= f.submit "Create" %>
  </p>
<% end %>

<%= link_to 'Back', entries_path %>

コントローラを修正

# app/controllers/entries_controller.rb
class EntriesController < ApplicationController
  # 略
  # POST /entries
  # POST /entries.xml
  def create
    @entry = Entry.new(params[:entry])
    @image = Image::EntryImage.new(params[:image])  # 追加

    respond_to do |format|
      if @entry.save
        @entry.images << @image  # 追加
        flash[:notice] = 'Entry was successfully created.'
        format.html { redirect_to(@entry) }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end
  # 略
end

あとは出来上がった後の表示部分 app/views/entries/show.html.erb を修正。

<p>
  <b>Title:</b>
  <%=h @entry.title %>
</p>

<p>
  <b>Body:</b>
  <%=h @entry.body %>
</p>

<!-- 追加 -->
<p>
  <b>Photos:</b>
  <%- @entry.images.each do |image| -%>
    <%= image_tag image.image.url %>
    <%= image_tag image.image.url(:medium) %>
    <%= image_tag image.image.url(:thumb) %>
  <%- end -%>
</p>

<%= link_to 'Edit', edit_entry_path(@entry) %> |
<%= link_to 'Back', entries_path %>

画像表示の際に、普通の image_tag で表示できるのは嬉しいかも。しかもurlの取り出し方も分かりやすい。

ただし、画像のカラム名が "image" なので、上のように image.imageとなってしまうのはどうも格好わるい。Imageモデルを作ってしまえば、カラム名が
変わる事はほとんどないと思われるので、以下のように #urlメソッドをdelegateしてしまおう。

class Image < ActiveRecord::Base
  # 略

  delegate :path, :url, :to => :image
end

ついでにファイルの保存先をフルパスで出す :path も delegateしておいた。


すると、上の表示部分のビューは、

<p>
  <b>Photos:</b>
  <%- @entry.images.each do |image| -%>
    <%= image_tag image.url %>
    <%= image_tag image.url(:medium) %>
    <%= image_tag image.url(:thumb) %>
  <%- end -%>
</p>

のように書ける。すっきり。


これで、最低限画像をアップロードして表示することができた。


で、いろいろやってみて、一つ困った所が。

それは画像オブジェクトを destroy しても、ディレクトリが残ってしまうということ。

これはいけてない。destroyしたらちゃんとディレクトリも奇麗にしてほしい。

そこで、以下のようにものすごく簡単に直してみた。

":path" とかでファイルの置き場所を変更したらそれにならって適切に消す。以下が対応しているのは、:path がデフォルトの場合(上で行った変更では
ファイルパス末尾の変更は無いので、このモンキーパッチでも有効)。

# app/models/image.rb
class Image < ActiveRecord::Base
  # 略

  # 追加
  def destroy
    base_dir = self.path.sub(%r!/[^/]+/[^/]+$!, "")
    super
    FileUtils.rm_rf(base_dir)
  end
end

別に File.dirname(File.dirname(self.path)) でも良いんだけど、ちょっと格好わるいので。


ということで、最後に今回作った画像モデルの全容を載せておく。

class Image < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true

  has_attached_file :image,
    :styles => {
      :medium => "300x300>",
      :thumb => "100x100#"
    },
    :url => "/store/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/store/:attachment/:id/:style/:basename.:extension"

  delegate :path, :url, :to => :image

  def destroy
    base_dir = self.path.sub(%r!/[^/]+/[^/]+$!, "")
    super
    FileUtils.rm_rf(base_dir)
  end
end

file_columnから乗り換えるかどうかはちょっと分からないけど、保存先のパスがかなり柔軟に変更できるのと、画像表示が分かりやすいので、悪くない
プラグインなのではないかと思う。


2008.12.1追記

validationについて書き忘れていたので、

2008-12-01 - 篳篥日記

に追記した。

また、

Paperclipと確認画面

についても参照のこと。

コメントを書く
<前の日 | 次の日>
カレンダー

<<    2008/11  >>
日 月 火 水 木 金 土
                  1
2  3  4  5  6  7  8
9  10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30

プロフィール

hichiriki

自遊人

最新タイトル

  • [OpenSocial] APIの利用とタイムアウト
  • [Rails][diary][OpenSocial] Railsでモバゲーアプリ開発
  • [Rails] テーブルを個別に作りなおす
  • [Rails] STIとacts_as_list
  • [Rails] BIGINTやLONGTEXTなどを使う
  • [Rails] rakeタスクに引数を渡す
  • [Rails] PHPに見せかける
  • [Rails] URL短縮サービスで使われるような、ランダムでユニークなアクセストークンを発行するプラグイン
  • [Rails] DBに入れた画像を表示する
  • [Rails] renderしない

カテゴリー

  • Mac
  • PC
  • misc
  • Rails
  • diary
  • Ruby
  • Perl
  • Flash
  • JavaScript
  • OpenSocial

最近のコメント

  • 2010-04-10 yukke1130
  • 2010-04-10 hichiriki
  • 2010-04-10 holyz
  • 2008-12-07 大西
  • 2008-12-07 hichiriki

最近書いたコメント

  • 2010-04-13 id:hichiriki:20100410
  • 2010-02-11 id:hichiriki:20081207
  • 2010-02-11 id:hichiriki:20081207
  • 2009-02-17 id:miyohide:20090216:1234787238
  • 2009-02-16 id:miyohide:20090215:1234709538

最近のトラックバック

  • 2010-01-10 うんたらかんたらRuby - [rails]DBに格納したバイナリ画像を表示さ...
  • 2009-05-15 いちごいちえ - エキブロから過去のブログを移行するツール出来た！
  • 2008-11-30 A Life Less Ordinary - rails12日目メモ
  • 2009-04-13 payopayo54の日記 - 入門中
  • 2008-11-30 常識という迷信 - githubで管理されてる注目プロジェクトのまとめ

最近言及したキーワード

  • ALTER
  • API
  • ActiveRecord
  • Amazon EC2
  • CRUD
  • DB
  • Rails
  • client
  • rake
  • script
  • アバター
  • アプリ
  • サーバ
  • タイムアウト
  • プログラム
  • モバイル
  • モバゲー
  • ライブラリ
  • 引数
  • 文字列

最新の画像

  • hichiriki2009-01-10
  • 兼六園
  • hichiriki2008-08-09
  • hichiriki2007-12-16
  • hichiriki2007-10-15

hichiriki’s fotolife

  • 20100424175128
  • 20100424174232
  • 20100424173530
  • 20100110205413
  • 20100110205412

hichirikiのブックマーク

  • OAuthプロトコルの中身をざっくり解説してみるよ - ゆろよろ日記
  • インターネットを活用した、ひきこもりのための株式会社の創り方
  • SSHのセキュリティを高めるためのハウツー - SourceForge.JP Magazine
  • よそでは読めない？Ruby関連エントリーのまとめ。 - このブログは証明できない。
  • ASCII.jp：ゼロから分かる、GAE＆Twitter API開発の始め方｜Twitter＆Google App Engineで始めるWebプログラミング入門

ページビュー
81089
