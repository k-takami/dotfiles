= jpmobile: A Rails plugin for Japanese mobile-phones

== jpmobileとは
携帯電話特有の機能を Rails で利用するためのプラグイン。
以下の機能を備える。

* 携帯電話のキャリア判別
* 端末位置情報の取得
* 端末製造番号、契約者番号等の取得
* IPアドレスの検証(キャリアが公開しているIPアドレス帯域からのアクセスか判定)
* セッションIDをフォーム／リンクに付与(Trans SID)
* 携帯電話ビューへの自動振分け
* ディスプレイ情報(画面サイズ、ブラウザ画面サイズ、カラー・白黒、色数)の取得
* GeoKit(http://geokit.rubyforge.org)との連携
* 文字コード変換機能／絵文字のキャリア間相互変換

== インストール

sudo gem1.8 install jpmobile-0.0.4.gem --local
  RAILS_ROOT/config/environment.rb の Rails::Initializer.run do |config| ? end 内に
	config.gem "jpmobile"
	の行を追加する。

=== pluginとしてインストールする場合

リリース版:
  % ./script/plugin install http://jpmobile.rubyforge.org/svn/tags/rel-x.x.x/jpmobile
  (x.x.xはバージョン)

開発版:
  % ./script/plugin install git://github.com/darashi/jpmobile.git

=== gemでインストールする場合

  # gem install jpmobile
としてgemをインストールした後

RAILS_ROOT/config/environment.rb の Rails::Initializer.run do |config| 〜 end 内に
  config.gem "jpmobile"
の行を追加する。


== 使用例

=== 携帯電話の識別

==== Viewの中で一部を切替える例
  <% if request.mobile? %>
    携帯電話からのアクセスです。
  <% else %>
    携帯電話からのアクセスではありません。
  <% end %>

==== 別に用意した携帯電話用コントローラへリダイレクトする例
  class PcController < ApplicationController
    before_filter :redirect_if_mobile

    def index
    end

    private
    def redirect_if_mobile
      if request.mobile?
        pa = params.dup
        pa[:controller] = "/mobile"
        redirect_to pa
      end
    end
  end

  class MobileController < ApplicationController
    after_filter :to_sjis

    def index
    end

    private
    def to_sjis
      @headers["Content-Type"] = "text/html; charset=Shift_JIS"
      response.body = response.body.tosjis
    end
  end


=== 携帯電話viewの自動振分け
DoCoMo携帯電話からアクセスすると、
* index_mobile_docomo.rhtml
* index_mobile.rhtml
* index.rhtml
の順でテンプレートを検索し、最初に見付かったテンプレートが利用される。
Auの場合は、index_mobile_au.rhtml、Softbankの場合はindex_mobile_softbank.rhtmlが最初に検索される。

BUG: 現状、上記の例では index.rhtml が存在しない場合に振り分けが行われない(ダミーファイルを置くことで回避可能)。

==== キャリアの識別

  case request.mobile
  when Jpmobile::Mobile::Docomo
    # for DoCoMo
  when Jpmobile::Mobile::Au
    # for au
  when Jpmobile::Mobile::Softbank
    # for SoftBank
  when Jpmobile::Mobile::Willcom
    # for Willcom
  when Jpmobile::Mobile::Emobile
    # for EMOBILE
  else
    # for PC
  end

あるいは
  if request.mobile.is_a?(Jpmobile::Mobile::Docomo)
    # for DoCoMo
  end

=== 位置情報の取得

==== 取得用リンクの生成

以下のようなコードで、端末に位置情報を要求するリンクを出力する。
  <%= get_position_link_to(:action=>:gps) %>

==== 位置情報の取得

  class MobileController < ApplicationController
    def gps
      if request.mobile && pos = request.mobile.position
        @latitude = pos.lat
        @longuitude = pos.lon
      end
    end
  end


=== 端末情報の取得

端末側から通知されている場合、request.mobile.ident で
契約に固有の識別子もしくは端末の製造番号を取得できる。
両方存在する場合は契約に固有のIDが優先される。

* 契約に固有のID (request.mobile.ident_subscriber)
  * au: EZ番号(サブスクライバ番号)
  * DoCoMo: FOMAカード製造番号
  * EMOBILE: EMnet対応端末から通知されるユニークなユーザID
* 端末製造番号 (request.mobile.ident_device)
  * DoCoMo: 端末製造番号(FOMA, MOVA)
  * SoftBank: 製造番号

=== IPの検証
キャリアが公開しているIPアドレス帯域からのアクセスか判定する。
  request.mobile.valid_ip?

=== セッションIDの付与(Transit SID)
==== Cookie非対応携帯だけに付与する
  class MyController
    trans_sid
  end

==== PCにも付与する
  class MyController
    trans_sid :always
  end

=== 端末の画面サイズ
request.mobile.display で Jpmobile::Display クラスのインスタンスが返る。
  画面幅 <%= request.mobile.display.width %>
  画面高さ <%= request.mobile.display.height %>

=== GeoKit(http://geokit.rubyforge.org)との連携

vandor/plugins/geokit以下にGeoKitがインストールされていると、Jpmobile::PositionにGeoKit::Mappableがincludeされる。したがって、

  request.mobile.position.distance_to('札幌駅')

とすることで、端末と「札幌駅」との距離を求めることができる。詳細は http://geokit.rubyforge.org/api/index.html 参照。

=== 文字コード変換機能／絵文字のキャリア間相互変換

JpmobileではControllerにmobile_filterを指定することで
DoCoMo、Au、SoftBankの絵文字を透過的に扱うことができる。

 class MyController
   mobile_filter
 end

また、半角・全角の自動変換を用いる場合は
 class MyController
   mobile_filter :hankaku=>true
 end
と指定する。

Jpmobile内では、各キャリアの絵文字はUnicode私的領域上にマッピングされ、管理される。
このとき、DoCoMo、Auは公式サイト記載のマッピングが使用される。
ただしSoftBankはAuとの重複を避けるため、公式のマッピングに0x1000加算しU+F001以降に割り当てる。
テンプレート内ではUTF-8でエンコードするか、数値文字参照の&#xHHHH;形式で指定する。

絵文字は送出時に内蔵の変換表に基づいて変換され、携帯電話のエンコーディングにあわせて送出される。
携帯電話から受信した絵文字は上記マッピングに基づいてUTF-8でparamsに渡される。

mobile_filterを有効にすると以下の処理が自動で行われる。
* DoCoMo、Auとの通信時にはShift_JIS、SoftBankとの通信時にはUTF-8が使用される。
* :hankaku=>true指定時は、カタカナは半角カナに変換されて送出される。携帯電話から送られた半角カナは全角カナに変換される。
* 絵文字はキャリアにあわせて変換されて送出される。
* 携帯電話からの絵文字はUnicode私的領域にマップされ、UTF-8でparamsに格納される。

== テストに必要なgemパッケージ
テストを実行するためには以下のgemパッケージが必要です。
* rails
* rack
* hpricot
* rspec
* rspec-rails
* spec-fixtures

== リンク
* Project Website: http://jpmobile-rails.org
* RDoc Documentation: http://jpmobile.rubyforge.org/rdoc
* GitHub: http://github.com/darashi/jpmobile/
* RubyForge Project Page: http://rubyforge.org/projects/jpmobile
* Mailing List: http://groups.google.com/group/jpmobile
* IRC Channel #jpmobile@freenode.net

== 作者
Copyright 2006 (c) Yohji Shidara, under MIT License.
Yohji Shidara <dara@shidara.net>	http://d.hatena.ne.jp/darashi


Aというユーザーがログインして、以下の3つから１つをに選択するとします。
・りんご
・みかん
・いちご

そして再ログイン後、選択したものが表示されます。
Bというユーザーのログイン後の画面にはBユーザーが選択したものが表示されているというようにしたいのです。
この場合、それぞれのログインしているユーザーが選んだ情報をテーブルに保存するということになると思うのですが、ログインしているユーザーというのはどうやって渡せばいいんでしょうか？

作っているのは携帯サイトでcookieは使えません。
ユーザーIDをパラメータは渡すのも危険だと思うのですが、どういう実装方法が適切なのでしょうか。 railsでユーザー管理を実装したいのですが、 Aというユーザーがログインして、以下の3つから１つをに選択するとします。 ・りんご ・みかん ・いちご そして再ログイン後、.. を含むブックマークはてなブックマーク - railsでユーザー管理を実装したいのですが、 Aというユーザーがログインして、以下の3つから１つをに選択するとします。 ・りんご ・みかん ・いちご そして再ログイン後、.. - 人力検索はてな

書き方が悪かったようで申し訳ありません。
ユーザIDをセッションに入れる、というのはRails内でのsessionオブジェクトにユーザIDを入れておく、という意味でした。
流れとしては
(1) URL(やcookie)にセッションIDを入れてRailsアプリにアクセスする
(2) RailsではセッションIDをもとにsessionオブジェクトを生成/検索する
(3) Railsアプリからsessionオブジェクトを使用する。Hashのように使える。ここに入れた各パラメータはセッションをまたがって使用することができる。

というようなものになります。つまりjpmobileを使うと、携帯端末からアクセスした場合の(1)と(2)の部分を勝手にやってくれるので、あとは(3) sessionオブジェクトをいじればいい、ということになります。
具体的には

class XxxContrller < ApplicationController
    # transit_sid  # ApplicationControllerでやってるならこちらに書く必要はない
  def page_1
     ...
     session[:selected_fruit_id] = fruit_model.id
  end

  def page_2
      selected_fruit = Fruit.find(session[:selected_fruit_id]
      ...
  end
end

とか。セッションIDのやりとりをアプリケーション側でケアする必要は(たぶん)ないはずです。


とりあえず二つの問題があると理解しました。
1. cookieが使えない状況でセッションを引き回す方法
携帯でCookieが使えないとなると、セッションを引き回すためにセッションID(かさらにそれを識別するための記号)をURLに含めるやり方が多いようです。
で、それを実装するためのプラグインがjp-mobileです。
http://jpmobile.rubyforge.org/
他にも携帯ならではの事情(キャリア判別や絵文字など)のサポートもなされている、おすすめプラグインです。

# こっちの問題が主であれば、質問の頭の方に「携帯で」というのを入れるといいかな、と思います。

2. で、ユーザ管理をどうするか
	もしかするとこちらについては悩んでは居ないかもしれませんが、念のため。
	ログインしているユーザのIDをセッション(cookieやURLクエリじゃなく)に入れて引き回す方法が多いです。
	# で、そのセッションを引き回すのがcookieや上のjpmobileです)
	ログイン認証やユーザ管理まわりはacts_as_authenticatedというプラグインが使いやすいかと思います。
	http://idm.s9.xrea.com/ratio/2007/09/18/000680.html


セッションIDにユーザーIDを入れて引き回すということですが、jpmobileを使うと「_sission_id」というパラメータに以下のようにセッションIDが入ります。
    ?_session_id=aaaaaaa
1. これにユーザーID(bbb)を混ぜるということでしょうか？
    ?_session_id=aaaaaaabbb
2. こうするばあいリンクはどう記述すればいいのでしょうか。

jpmobileはコントローラのapplication.rbに
class ApplicationController < ActionController::Base
  transit_sid
end

「transit_sid」と書くだけでセッションIDは自動で渡してくれるのですが、これにユーザーID（暗号化も必要？）を付加させる方法がわかりません。
コントローラで処理されるのでlink_toで書くと二重で渡されてしまうと思います。
jpmobile側のコントローラを触らないといけなくなりそうです。
また、セッションIDに埋め込んだ場合どうやってユーザーIDを受け取るんでしょうか？セッションIDの値が変更されてしまいそうですが。

-------------------------------------------------------------------------------------------------------------------
