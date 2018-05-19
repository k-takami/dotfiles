



ENDLESS X
=========



GAE+DJANGO
----------

  * Home

  * Blog



Sign
----

Login



Labels
------

1981s ActionScript Ajax Apache CodeIgniter Django FULLTEXT Fedora Flex Free GoogleAppEngine Gundam HeavyMetal Information Ludia Mac Mecab Mobile
Music MySQL Objective-C PHP PostgreSQL Python RSS Ruby RubyonRails SEO SVN Senna Ski Stock Trac Twisted Ubuntu UpdatePing UserAgent comedy free
iPhoneFix iPhoneSDK iPodTouch imagemagick lxml mod_wsgi pyspa shell tritonn

Hits:5 ... 1



対話シェル
-----

個人メモ

自分はよくPythonを使っているとき，Pythonシェル(ipythonなど）で dir関数を使って中身を片っ端から覗いて，さらにhelp関数で使用方法を確認したりしていた．

Rubyの場合はどうやるんだろと調べてみた．（ toshi78 さんにも協力していただいちゃいました．ありがとうございます．） Rubyシェル(irb)で Object.methods とやるとオブジェクトが持つメソッドを見ることができた．ん～とりあえずこれでいいかな!?

ほんで，help関数にあたるモノを探すと refe というのをインストールするとRubyのリファレンスからエントリを引っ張ることができるとのこと． では早速，

~>
  $ sudo /usr/local/ruby/bin/gem install refe
  
<~

インストールできたようなので実験

~>
  $ refe String concat
      String#concat
      --- self << other
      --- concat(other)
  
          文字列 other の内容を self に連結します。
          other が 0 から 255 の範囲の Fixnum である場合は
          その 1 バイトを末尾に追加します。
  
          self を返します。
  
<~

と成功すればOK！ が，俺の場合上記のようにうまく行かなかった…文字化けした…． 文字化けは下記のように修正して成功． 参考サイト : http://d.hatena.ne.jp/nagaton/20060914/1158247239

~>
  $ sudo vi /usr/local/ruby/lib/ruby/gems/1.8/gems/refe-0.8.0.3/lib/refe/searcher.rb
  def adjust_encoding( str )
    if shift_jis_platform?
      NKF.nkf('-Es', str)
    else
      str
    end
  end
  
  # の部分を下記のように修正
  
  def adjust_encoding( str )
    NKF.nkf('-w', str)
    #if shift_jis_platform?
    #  NKF.nkf('-Es', str)
    #else
    #  str
    #end
  end
  
<~

おーよかったよかった…．しかし，この refe って Rubyシェル内で使えないじゃんか！ ということで，さらに .irbrc に下記を追記． 参考サイト : http://d.hatena.ne.jp/secondlife/20051114/1131894899

~>
  # 補完を有効
      require 'irb/completion'
  
      module Kernel
        def r(arg)
          puts `refe #{arg}`
        end
        private :r
      end
  
      class Module
        def r(meth = nil)
          if meth
            if instance_methods(false).include? meth.to_s
              puts `refe #{self}##{meth}`
            else
              super
            end
          else
            puts `refe #{self}`
          end
        end
      end
  
<~

では，早速..

~>
  $ irb
  >> Array.r :inspect
  Array < Object#inspect
   --- inspect
  
      オブジェクトを人間が読める形式に変換した文字列を返します。
  
      組み込み関数 p は、このメソッドの結果を使用して
      オブジェクトを表示します。
  
  => nil
  
<~

出来たみたい！

でも…，これってRubyのリファレンスから引っ張ってきているだけなので…．Pythonのhelp関数とは違う…．

もちろん，Railsのコンソール起動（./script/console）でRailsのモデルのリファレンスがひけるわけがない…． ん～Railsではないのかなぁ～． Pythonのhelpって便利なんだよなぁ～．

[Ruby]

2008/02/13 17:41 | Comments(1000)



Railsに挑戦
--------

とりあえず，単純な登録/閲覧/更新/削除/コメントができるBLOGを作成してみた． これを通して，migrationでDB管理して遊んでみたり，モデル操作を遊んでみたりした．migrationは気持ちよいね． ん〜書き方もまだ何が正しいかわからないです．
そんなcontrollerのソースがこれ↓． なんだかーこれだと無駄が多いような気がする． 色んなサンプル見てみないといけないっすね!!

~>
  class BlogController < ApplicationController
  
      def index
          self.list
          render :action => 'list'
      end
  
      verify :method => :post, :only => [:create, :update],
             :redirect_to => { :action => :list }
  
      def list
          @title = 'BLOG LIST'
          @blog_pages, @blogs = paginate(
              :blog_blogs,
              :per_page => 5,
              :conditions => "is_active = true",
              :order => "created_at DESC"
          )
      end
  
  
      def show
          begin
              @blog = BlogBlog.find(
                  @params[:id],
                  :conditions => "is_active = true"
              )
              @title = @blog.title
              @comment = BlogComment.new
          rescue ActiveRecord::RecordNotFound
              redirect_to '/404.html'
          end
      end
  
  
      def new
          @title = 'NEW BLOG'
          @blog  = BlogBlog.new()
      end
  
  
      def create
          @blog = BlogBlog.new(@params[:blog])
          if @blog.save
              redirect_to :action => 'list'
          else
              render :action => 'new'
          end
      end
  
  
      def edit
          @title = 'EDIT BLOG'
          begin
              @blog  = BlogBlog.find(
                  @params[:id],
                  :conditions => "is_active = true"
              )
          rescue ActiveRecord::RecordNotFound
              redirect_to '/404.html'
          end
      end
  
  
      def update
          begin
              @blog = BlogBlog.find(
                  @params[:id],
                  :conditions => "is_active = true"
              )
          rescue ActiveRecord::RecordNotFound
              redirect_to '/404.html'
          end
          if @blog.update_attributes(@params[:blog])
              redirect_to :action => 'show', :id => @blog.id
          else
              render :action => 'edit'
          end
      end
  
  
      def delete
          begin
              BlogBlog.update(@params[:id], :is_active => false)
              flash[:notice] = 'success delete blog.'
          rescue  ActiveRecord::RecordNotFound
              flash[:notice] = 'cannot delete blog.'
          end
          redirect_to :action => 'list'
      end
  
  
      def comment
          begin
              @blog = BlogBlog.find(
                  @params[:id],
                  :conditions => "is_active = true"
              )
          rescue
              redirect_to '/404.html'
          end
          @params[:comment]['blog_blog_id'] = @params[:id]
          @comment = BlogComment.new(@params[:comment])
          if @comment.save
              redirect_to :action => 'show', :id => @params[:id]
          else
              render :action => 'show'
          end
      end
  
  end
  
<~

今度は，このBLOGにタグ付けできるような処理（多対多:has_and_belongs_to_many）をやってみよう．とりあえず，書いてみてrubyに慣れてみよう．

追記： paramsは，@params ではなく params で受け取れるようです． また，beginもやらなくてもOKのようです．Railsが裏でやってくれているようです． 結局，バージョン遅れの汚いソースコードとなっておりました．

[RubyonRails] [Ruby]

2008/02/14 21:19 | Comments(0)



Rails acts_as_paranoid を覗く
--------------------------

前回のBLOG 続き，

では，init.rbを覗いてみる．（素人なのでー間違っている箇所が多いと思います．ツッコミいただければー幸いです．）

~>
  # vendor/plugins/acts_as_paranoid/init.rb
  
  class << ActiveRecord::Base
    def belongs_to_with_deleted(association_id, options = {})
      with_deleted = options.delete :with_deleted
      returning belongs_to_without_deleted(association_id, options) do
        if with_deleted
          reflection = reflect_on_association(association_id)
          association_accessor_methods(reflection,            Caboose::Acts::BelongsToWithDeletedAssociation)
          association_constructor_method(:build,  reflection, Caboose::Acts::BelongsToWithDeletedAssociation)
          association_constructor_method(:create, reflection, Caboose::Acts::BelongsToWithDeletedAssociation)
        end
      end
    end
  
    alias_method_chain :belongs_to, :deleted
  end
  ActiveRecord::Base.send :include, Caboose::Acts::Paranoid
  
<~

１行目からわからない！ " class A < B " なら AクラスはBクラスを継承するということだが…． これなんなん!?

これは，クラスメソッドの追加でした．つまり，ActiveRecord::Base クラスに belongs_to_with_deleted メソッドを追加している．下記にちょこっと試してみた！

~>
  $ irb
  > class Base
  >    def hoge
  >        'hoge'
  >    end
  > end
  > class << Base
  >    def hige
  >         'hige'
  >    end
  > end
  >
  > Base.hige    # 追加されたクラスメソッドの実行
  => "hige"
  > Base.hoge   # インスタンスメソッドだから実行できない
  NoMethodError: undefined method `hoge' for Base:Class
  > obj = Base.new
  > obj.hige       # クラスメソッドだから実行できない
  NoMethodError: undefined method `hige' for #<Base:0xb7e8738c>
  > obj.hoge      # インスタンスメソッドの実行
  => "hoge"
  
<~

とういうことで納得．次に「alias_method_chain :belongs_to, :deleted」これ何してんだろ…． これrubyじゃなくてーrailsのメソッドだった…． このファイルを覗くと答えが見れる．

~>
  ruby/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib/active_support/core_ext/module/aliasing.rb`
  
<~

alias という言葉通りな感じですね． 試しに使ってみる．

~>
  $ ./script/console
  >> class Gly
  >>     def name
  >>         'glycine'
  >>     end
  >> end
  >> class G < Gly
  >>     def name_with_short
  >>         name_without_short + '( GLY )'
  >>     end
  >>     alias_method_chain :name, :short
  >> end
  >> Gly.new.name
  => "glycine"
  >> G.new.name
  => "glycine( GLY )"
  
<~

name_without_short は，拡張前のメソッドを呼び出せる． name_with_short は，拡張したメソッドを呼び出せる． この説明だとわかりにくいですよね．

この段階になっても，Model に acts_as_paranoid と書いただけでープラグインがうまく動くことは理解できない． 最後の行の「ActiveRecord::Base.send :include, Caboose::Acts::Paranoid」これですね．
ここは，（クラスメソッドが追加された）ActiveRecord::Base に Caboose::Acts::Paranoid モジュールを include している．
Paranoidモジュールは，vendor/plugins/acts_as_paranoid/lib/caboose/acts/paranoid.rb にあります． しかし，このモジュールが読み込まれてもー （ClassMethodsモジュール内の）acts_as_paranoid
メソッドは，Model から呼び出せない． と思ったらー（Paranoidモジュールの）self.included(base) ってーのが ClassMethodsモジュールをextend してるわ！ということで Model に acts_as_paranoid と書くとー Modelを
読み込んだとき に acts_as_paranoidメソッドが実行される．

メモがてらにモジュールのincludeを試してみる．

~>
  $ irb
  > module Paranoid
  >     def self.included(base)
  >         p self    #=> Pranoid
  >         p base  #=> Base
  >         base.extend ClassMethods
  >     end
  >
  >     module ClassMethods
  >        def acts_as_paranoid
  >             'ACTS_AS_PARANOID'
  >        end
  >     end
  > end
  >
  > class Base
  >     include Paranoid
  > end
  >
  > Base.acts_as_paranoid
  => "ACT_AS_PARANOID"
  
<~

これで何とかーModelにacts_as_paranoid と書くことだけでーModelにプラグインが反映されることが理解． いやー疲れた．やっぱ言語勉強しないとね．今回もー toshi78 さんにも協力してもらっちゃいました．

結局，このプラグインを全部解読してませんが，色々と疑問． なんで，こんなにモジュールがネストされているんだろ？ また，ActiveRecord::Baseにクラスメソッドを最初に追加したんだろ？ だってーこの init.rb は Rails がロードされたときに読み込まれる．だもんでー
論理削除を必要としないModelにまでー不必要なクラスメソッドが追加されちゃいません？パフォーマンス悪くなっちゃうんじゃない？ 素人の俺には「ActiveRecord::Base.send :include,
Caboose::Acts::Paranoid」の中でーうまく「belongs_to_with_deleted」クラスメソッドを追加する処理をすればいいのではないのかなぁ〜．

と，素人の考えが色々と浮かぶ…．

[RubyonRails] [Ruby]

2008/02/19 01:16 | Comments(0)



メモ：Python Ruby
--------------

PythonでいうこれをRubyでやろうとしたらー探してしまったのでメモっとく（実は前にやっているのに忘れたからメモる！）

~>
  In [10]: def Hoge(val):
     ....:     def Hige(val2):
     ....:         print val
     ....:         print val2
     ....:     return Hige
     ....:
  
  In [11]: Hoge('HOGE')('HIGE')
  HOGE
  HIGE
  
<~

Rubyでは，

~>
  >> def Hoge(val)
  >>   return Proc.new do |val2|
  >>     p val
  >>     p val2
  >>   end
  >> end
  => nil
  >> Hoge('HOGE').call('HIGE')
  "HOGE"
  "HIGE"
  
<~

でいいのかな！？ どちらかと言うとーPythonの方がちょっと変な気もしなくもないかも！？

[Ruby] [Python]

2008/04/21 20:47 | Comments(0)



CSV Writer Ruby vs Python
-------------------------

仕事でログをCSVに書き出す（@ruby）という処理をするということで，ちょいとググっていたらーPythonの方が早いとあったので遊びで簡単10万行を書き出しするタイムを測定した．

■ Ruby csv (Ruby標準CSV)

~>
  # csv_writer.rb
  
  #!/usr/bin/ruby
  require 'csv'
  f = File.open('CSV.csv', 'a')
  CSV::Writer.generate(f) do |csv|
      100000.times do |i|
          csv << [i, 'hoge', 'hige', 'hage', 'page', 'jige']
      end
  end
  f.close
  
<~

■ Ruby fastercsv (プラグイン gem install fastercsvによりインストール)

~>
  # fastercsv_writer.rb
  
  #!/usr/bin/ruby
  require 'rubygems'
  require 'fastercsv'
  FasterCSV.open('FasterCSV.csv', 'a') do |csv|
    100000.times do |i|
      csv << [i, 'hoge', 'hige', 'hage', 'page', 'jige']
    end
  end
  
<~

■ Python csv (標準)

~>
  # csv_writer.py
  
  #!/opt/local/bin/python
  import csv
  f = file('PyCSV.csv', 'a')
  writer = csv.writer(f)
  for i in range(0, 100000):
      writer.writerow([i, 'hoge', 'hige', 'hage', 'page', 'jige'])
  
<~

さて，これらのスクリプトを実行してみる．

~>
  $ time ./csv_writer.rb
  real    0m3.325s
  user    0m3.248s
  sys     0m0.043s
  
  $ time ./fastercsv_writer.rb
  real    0m2.522s
  user    0m2.440s
  sys     0m0.042s
  
  $ time ./csv_writer.py
  real    0m0.548s
  user    0m0.480s
  sys     0m0.034s
  
<~

お！Python ダントツではや！！なんかうれしい☆ fastercsvは思った以上な早さではなかったなぁ〜rubygemをrequireしているから!?

※ 適当にやってみたので，rubyもより早い記述があるかもしれません．

[Ruby] [Python]

2008/05/02 12:06 | Comments(0)

Hits:5 ... 1

Copyright (c) 2008 end.appspot.com Produce by ENDLESS.

{Hatena::}{Diary}]> 
日記検索

  * 最新の日記

  * 記事一覧

  * ログイン

  * 無料ブログ開設



雑用系
===

1990 | 01 |
2006 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 | 10 | 11 | 12 |
2007 | 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 | 10 | 11 | 12 |
2008 | 08 |
2009 | 04 |

<[web] これは痛い | [firefox][dev][programming] こ...>



2006-09-14 Thu
--------------



■[mac][shell][ruby] irb + refe の文字化けと格闘してみた
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ココを見て、これはやっとかないと！ と思って早速 .irbrc 弄って同じ事してみたんですが、またコレ文字化け。つか、文字化け以前に日本語部分だけ何も表示されない...。OSX の UTF-8 環境ってこういうところで不遇だよなぁ、と思いながらとりあえず色々と調べてみました。


で、/opt/local/lib/ruby/gems/1.8/gems/refe-0.8.0.3/lib/refe/searcher.rb を弄ればよさ気なのがわかったので、恒例になってきた感のあるインチキ huck*1 で、ソース冒頭の

~>
  def adjust_encoding( str )
    if shift_jis_platform?
      NKF.nkf('-Es', str)
    else
      str
    end
  end
  
<~

この部分を

~>
  def adjust_encoding( str )
    NKF.nkf('-w', str)
  # if shift_jis_platform?
  #   NKF.nkf('-Es', str)
  # else
  #   str
  # end
  end
  
<~

と修正。これで日本語のドキュメントをサクサク表示出来るようになりました。めっさ便利！！！！


{f:id:nagaton:20060915013127p:image}


...本当にいないとは思うけど、同じ事をする場合には自己責任でお願いします。Ruby は syntax を理解している程度でしかないので。


追記
""

なんかパスが間違ってたので修正。

↑は DarwinPorts で Ruby, RubyGems で refe をインスコしたときのパスです。


つか、これって .irbrc 弄るだけでどうにかならないのかな。無理かな。

Permalink | コメント(0) | トラックバック(0) | 00:20 { irb + refe の文字化けと格闘してみた - 雑用系 を含むブックマーク} {はてなブックマーク -  irb + refe の文字化けと格闘してみた - 雑用系 }{ irb + refe の文字化けと格闘してみた - 雑用系 のブックマークコメント}

*1：hack と書くのもおこがましい

コメントを書く

{ゲスト} ]> 
{IMAGE}]> 
{IMAGE}]> 

--- Click to edit the text area ------------------------------------------------------------------------------------------------------------ {{{



}}} --------------------------------------------------------------------------------------------------------------------------------------------
{IMAGE} ]> 

投稿

トラックバック - http://d.hatena.ne.jp/nagaton/20060914/1158247239

<[web] これは痛い | [firefox][dev][programming] こ...>

アーカイブ

  * [javascript] Array#join

  * [javascript][safari] 選択範囲に含まれるリンクを全て開いてみる / もしくはSafariでキーワード検索した後のアレ

  * [misc]はてなダイアリーに印刷ボタンがあったらいいのに

  * [mac][osx][shell] OSX 10.5 で zsh とか screen とか Leopard 編的に

  * [osx] とりあえず Safari で GreaseKit（旧Creammonkey）使えるようにしてみたけど...

  * [osx][shell] 特定のプロセスが使ってるポートやらファイルやらの一覧

  * [misc]デザイン変えた

  * [mac][osx] Mail.app で ISO-2022-JP なメールを送るテスト

  * [misc] また失敗

  * ■

最近のコメント

  * 2006-08-20 nyakki

  * 2007-11-05 nagaton

  * 2007-11-05 Larme

  * 2007-10-27 nagaton

  * 2007-10-27 AG

  * 2007-10-27 nagaton

  * 2007-10-27 kzys

  * 2007-07-03 nagaton

  * 2007-07-03 AG

  * 2007-05-10 nagaton

プロフィール

nagaton {このページをアンテナに追加} {RSSフィード}

あとで書く

最近言及したキーワード

  * 2009-04-07

  * ASCII

  * Command

  * Creammonkey

  * DNS

  * IE

  * IE7

  * IE8

  * Leopard

  * MacPorts

  * PDF

  * Safari

  * String

  * TCP

  * UDP

  * WebKit

  * [mac]

  * grep

  * print

  * root

  * screen

  * zsh

  * ＞＜

  * はてなダイアリー

  * アイデア

  * アンカー

  * インストール

  * エンジン

  * エントリ

  * キーワード

{counter}

