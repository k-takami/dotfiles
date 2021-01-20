Hatena::Diary                           [rails file_column ] 日記 検索                                                              はてな
                                      *
*
 ようこそゲストさん                                                     ブログトップ       記事一覧     ログイン       無料ブログ開設

*

Geekboy このページをアンテナに追加 RSSフィード

[ Top ] [ Recent Archive ] [ Bookmark ] [ About ]
<[Ruby]Apache2.2でFastCGI | [PHP]Zend Framework Preview 0....>

2006/02/10 Friday

■[Ruby]RailsでUploadProgressとfile_column Pluginを使った画像のアップと加工処理

Railsを使ったアプリを組んでいる時、「画像の投稿と加工」処理がめんどくさかったので、色々調べたメモ。

通常では以下の様なフォームから投稿された画像をローカルに保存する場合、modelでファイル操作して保存するのが普通なのでしょうが、画像のリサイ
ズとか考える出すと激しくだるい。。

create.rhtml

<form action="create" method="post" enctype="multipart/form-data">
 <b>Picture:</b><br />
 <input type="file" name="picture[image]" />
 <input type="submit" name="Save" />
</form>

Picture.rb

class Picture < ActiveRecord::Base
  def self.save(picture)
    File.open("pictures/image.jpg", "w") { |f| f.write(picture['image'].read) }
  end
end

そこでfile_columnという画像の「upload処理」「保存処理」「加工処理」を劇的に簡易化してくれるPluginを使う事に。

まず、画像の加工にRMagickが必要だという事なので、ダウンロードしてインストール。このRMagickはImageMagickのRubyインターフェイスでRubyから
ImageMagickが利用できるようになります。

逆に言うとImageMagickがインストールされていなければならないので、ImageMagickもダウンロードしてインストール。

次にfile_columnをtrunkから引っ張ってきてRailsのPluginディレクトリにインストール。

これで準備完了。file_columnをインストールした事で以下の機能が使えるようになります。

Model

CREATE TABLE pictures
(
id int8 NOT NULL AUTO_INCREMENT PRIMARY KEY,
image varchar(255) NOT NULL,
created_on timestamp(11) NOT NULL,
updated_on timestamp(11) NOT NULL
)TYPE=MyISAM;

この様なテーブルがあった場合、以下の様にカラム名をハンドリングする。

class Picture < ActiveRecord::Base
  file_column :image
end

これでsaveした時に自動的にuploadした画像がpublic/picture/image/[id]/[file_name].jpgの位置に自動的に保存されます。画像をリサイズしたい場合
は以下の様に書く。

class Picture < ActiveRecord::Base
  file_column :image, :magick => {
    :versions => {
      :thumb => "50x50",
      :midle => "100x100",
      :large => "200x200"
    }
  }
end

こうすると、uploadした画像を自動的に種類分リサイズして保存しくれる。defaultで保存場所は、

Original => public/picture/image/[id]/[file_name].jpg

thumb => public/picture/image/[id]/thumb/[file_name].jpg

midle => public/picture/image/[id]/midle/[file_name].jpg

large => public/picture/image/[id]/large/[file_name].jpg

Helper

以下のhelperが追加される。


file_column_field("picture", "image")

uploadフォームを生成する。


url_for_file_column("picture", "image")

uploadした画像を表示する


url_for_image_column("picture", "image")

uploadした画像を表示する



非常に便利！



フォームからのupload処理とリサイズはfile_columnで十分なのですが、ちょっとかっこつけて

ActionController::UploadProgress

を使ってupload処理を実現してみます。これを使うとmultipart formからのファイルのアップロード状態を取得できます。要するにProgressBarみたいな
のを実装できるわけですね。まず、environment.rbに以下の一行を記述。

ActionController::Base.enable_upload_progress

次にviewを作ります。

app/views/upload_progress/index.rhtml

<h1>Upload Progress</h1>

<%= form_tag_with_upload_progress({:action => 'picture'}, {:finish => ''}, {:action => :upload_status}) %>
  <%= render :partial => 'form' %>
  <%= submit_tag "アップロード" %>
<%= end_form_tag %>

<hr />
<% unless @picture[:id].nil? %>
<%= image_tag url_for_image_column @picture, "image", :thumb %>
<br />
<%= image_tag url_for_image_column @picture, "image", :midle %>
<br />
<%= image_tag url_for_image_column @picture, "image", :large %>
<br />
<% end %>

app/views/upload_progress/_form.rhtml

<label>画像</label>
<%= file_column_field 'picture', 'image' %>
<br />
JPG,GIF,PNG,BMP画像をアップロードできます。
<br />
<%= upload_status_tag %>
<br />

app/views/layouts/default-layout.rhtml

<html xmlns="http://www.w3.org/1999/xhtml" xml::lang="ja" lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ROR Upload Progress</title>
<%= stylesheet_link_tag "base.css" %>
<%= javascript_include_tag "prototype" %>
</head>
<body>
<%= @content_for_layout %>
</body>
</html>

次にcontrollerを作ります。

app/controllers/upload_progress.rb

class UploadProgressController < ApplicationController
  layout "default-layout"
  upload_status_for :picture, :status => :upload_status

  def index
    if @session[:picture]
      @picture = Picture.find(@session[:picture])
    else
      @picture = Picture.new
    end
  end

  def picture
    @picture = Picture.new(@params[:picture])
    @picture.save
    @session[:picture] = @picture.id
    redirect_to :action => 'index'
    finish_upload_status("\"アップロードが完了しました\"")
  end

  def upload_status
    render :inline => "<%= image_tag 'progress.gif', :size => '#{upload_progress.completed_percent rescue 0}x3' %> <%= upload_progress.completed_percent rescue 0 %>% complete", :layout => false
  end
end

最後にmodelを作ります。

app/models/picture.rb

class Picture < ActiveRecord::Base
  file_column :image, :magick => {
    :versions => {
      :thumb => "50x50",
      :midle => "100x100",
      :large => "200x200"
    }
  }

  set_field_names :image => '画像'

  def validate_on_create
    errors.add("image", "が選択されていません") if image.nil?
    errors.add("image", "形式が不正です") unless image_valid?
  end

  private

    def image_valid?
      image =~ /.*\.(jpg|png|gif|bmp)$/i
    end

end


・設置サンプル

http://labs.geekboy.jp/ruby/upload_progress


helper tagで吐かれたHTMLとJSを見てみると、prototype.jsのPeriodicalUpdaterで数秒毎にcontrollers/upload_progress.rbのupload_statusメソッドに
アクセスしてHTMLを書き換えてる様子。

とにかく非常に簡単ですね！

ちょっと大きめの画像をuploadするとバーが見れて面白い。ちなみにIEとFireFoxでしかテストしてません。

追記

ActiveHeartもPluginとして入れてました。

Permalink | コメント(0) | トラックバック(0) | 18:50 RailsでUploadProgressとfile_column Pluginを使った画像のアップと加工処理 - Geekboy を含
むブックマーク

コメント一覧

はてなユーザーのみコメントできます。はてなへログインもしくは新規登録をおこなってください。

トラックバック - http://d.hatena.ne.jp/sweeper/20060210/1139565058

  • http://d.hatena.ne.jp/aki69/20060717
  • http://d.hatena.ne.jp/iRSS/20061128
  • http://d.hatena.ne.jp/ma2/20070308
  • http://d.hatena.ne.jp/ymP/20070411
  • yamazのRails日記 - Rails勉強会@東京第18回に参加したよ
  • http://d.hatena.ne.jp/niraikanaibird/20070712

リンク元

  • 8 http://d.hatena.ne.jp/keyworddiary/Ruby
  • 7 http://www.google.co.jp/search?sourceid=navclient&hl=ja&ie=UTF-8&rls=GGLG,GGLG:2005-46,GGLG:ja&q=kamibayashi@gmail.com
  • 6 http://vgzh.dtdns.net/mt/archives/2005/12/perlphp.html
  • 4 http://acc.blogdb.jp/
  • 3 http://b.hatena.ne.jp/t/rails
  • 3 http://d.hatena.ne.jp/keyword/Rails
  • 3 http://d.hatena.ne.jp/sweeper
  • 3 http://search.goo.ne.jp/web.jsp?TAB=&MT=rails+画像　表示
  • 2 http://221.186.129.146/sweeper/20051108
  • 2 http://b.hatena.ne.jp/clavier/rails/

<[Ruby]Apache2.2でFastCGI | [PHP]Zend Framework Preview 0....>
プロフィール

sweeper

Masaki Kamibayashi ♂O型最近Rubyの虜な人


[2006082217]
日記の検索
[rails file_column   ][検索]
(*)詳細 ( )一覧
最新タイトル

  • [Ruby]lighttpdをrestart,stopしてもfastcgiのrubyプロセスが死なない
  • [Ruby]modelに部分的にvalidationをかける
  • タフネスThinkPad
  • [LIFE]情報収集量
  • [PHP]Zend FrameworkのHelper設計
  • [PHP]Zend Framework Preview 0.1.1
  • [Ruby]RailsでUploadProgressとfile_column Pluginを使った画像のアップと加工処理
  • [Ruby]Apache2.2でFastCGI
  • [PHP] extractでaction内の変数をviewと繋げる
  • [PHP]Gmailに突っ込む

カテゴリー

  • PHP
  • Perl
  • C
  • Ruby
  • MySQL
  • NEWS
  • BOOK
  • LIFE
  • OTHER

最近のトラックバック

最近のコメント


    [php_s] random Hatena Ring php

        [www_s] random Hatena Ring www

            [ruby_s] random Hatena Ring ruby

                [rubyonrail] random Hatena Ring rubyonrails

