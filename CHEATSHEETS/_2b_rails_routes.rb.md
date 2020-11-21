
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

Railsルーターの目的
URLを実際のコードに割り振る
コードからパスやURLを生成する
Railsルーターを設定する
リソースベースのルーティング: Railsのデフォルト
Web上のリソース
CRUD、動詞、アクション
パスとURL用ヘルパー
複数のリソースを同時に定義する
単数形リソース
コントローラの名前空間とルーティング
ネストしたリソース
ルーティングの「concern」機能
オブジェクトからパスとURLを作成する
RESTfulなアクションをさらに追加する
リソースフルでないルーティング
パラメータの割り当て
動的なセグメント
静的なセグメント
クエリ文字列
デフォルト設定を定義する
名前付きルーティング
HTTP動詞を制限する
セグメントを制限する
リクエスト内容に応じて制限を加える
高度な制限
ルーティンググロブとワイルドカードセグメント
リダイレクト
Rackアプリケーションにルーティングする
rootを使う
Unicode文字列をルーティングで使う
ダイレクトルーティング（Direct routes）
resolveを使う
リソースフルルーティングをカスタマイズする
使うコントローラを指定する
制限を指定する
名前付きヘルパーをオーバーライドする
newセグメントやeditセグメントをオーバーライドする
名前付きルーティングヘルパーにプレフィックスを追加する
ルーティングの作成を制限する
パスを変更する
「単数形のフォーム」をオーバーライドする
名前付きリソースで:asを使う
名前付きルーティングのパラメータをオーバーライドする
ルーティングの調査とテスト
既存のルールを一覧表示する
ルーティングをテストする
RailsガイドProプラン
1 Railsルーターの目的
Railsのルーターは受け取ったURLを認識し、適切なコントローラ内アクションやRackアプリケーションに割り当てます。ルーターは、ビューでこれらのパスやURLを直接ハードコードすることを避けるためにパスやURLを生成することもできます。

1.1 URLを実際のコードに割り振る
Railsアプリケーションが以下のHTTPリクエストを受け取ったとします。

GET /patients/17

このリクエストは、特定のコントローラ内アクションにマッチさせるようルーターに要求しています。最初にマッチしたのが以下のルーティングだとします。

get '/patients/:id', to: 'patients#show'

このリクエストはpatientsコントローラのshowアクションに割り当てられ、paramsには{ id: '17' }ハッシュが含まれています。

1.2 コードからパスやURLを生成する
パスやURLを生成することもできます。たとえば、上のルーティングが以下のように変更されたとします。

get '/patients/:id', to: 'patients#show', as: 'patient'

そして、アプリケーションのコントローラに以下のコードがあるとします。

@patient = Patient.find(params[:id])

上記に対応するビューは以下です。

<%= link_to 'Patient Record', patient_path(@patient) %>

これで、ルーターによって/patients/17というパスが生成されます。これを利用することでビューが改修しやすくなり、コードも読みやすくなります。このルーティングヘルパーではidを指定する必要がない点にご注目ください。

1.3 Railsルーターを設定する
アプリケーションやエンジンのルーティングはconfig/routes.rbファイルの中に存在し、通常以下のような感じになっています。

Rails.application.routes.draw do
  resources :brands, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  resource :basket, only: [:show, :update, :destroy]

  resolve("Basket") { route_for(:basket) }
end

これは通常のRubyソースファイルなので、Rubyのあらゆる機能を用いてルーティングを定義できます。ただし変数名には注意が必要です。ルーターのDSLメソッド名と変数名と衝突する可能性があります。

ルーティング定義をラップするRails.application.routes.draw do ... endブロックは、ルーターDSLのスコープを確定するのに不可欠なので、削除してはいけません。

2 リソースベースのルーティング: Railsのデフォルト
リソースベースのルーティング (以下リソースルーティング) を使うことで、リソースベースで構成されたコントローラに対応する共通のルーティングを手軽に宣言できます。リソースフルなルーティングを宣言することで、コントローラのindex、show、new、edit、create、update、destroyアクションを個別に宣言しなくても1行で宣言が完了します。

2.1 Web上のリソース
ブラウザはRailsに対してリクエストを送信する際に、特定のHTTPメソッド (GET、POST、PATCH、PUT、DELETEなど) を使って、URLに対するリクエストを作成します。上に述べたHTTPメソッドは、いずれもリソースに対して特定の操作の実行を指示するリクエストです。リソースルーティングでは、関連するさまざまなリクエストを1つのコントローラ内のアクションに割り当てます。

Railsアプリケーションが以下のHTTPリクエストを受け取ったとします。

DELETE /photos/17

このリクエストは、特定のコントローラ内アクションにマッピングさせるようルーターに要求しています。最初にマッチしたのが以下のルーティングだとします。

resources :photos

Railsはこのリクエストをphotosコントローラ内のdestroyアクションに割り当て、paramsハッシュに{ id: '17' }を含めます。

2.2 CRUD、動詞、アクション
Railsのリソースフルルーティングでは、(GET、PUTなどの) 各種HTTP動詞 (verb) と、コントローラ内アクションを指すURLが対応付けられます。1つのアクションは、データベース上での特定のCRUD (Create/Read/Update/Delete) 操作に対応付けられるルールになっています。たとえば、以下のようなルーティングが1つあるとします。

resources :photos

上の記述により、アプリケーション内に以下の7つのルーティングが作成され、いずれもPhotosコントローラに対応付けられます。

HTTP動詞	パス	コントローラ#アクション	目的
GET	/photos	photos#index	すべての写真の一覧を表示
GET	/photos/new	photos#new	写真を1つ作成するためのHTMLフォームを返す
POST	/photos	photos#create	写真を1つ作成する
GET	/photos/:id	photos#show	特定の写真を表示する
GET	/photos/:id/edit	photos#edit	写真編集用のHTMLフォームを1つ返す
PATCH/PUT	/photos/:id	photos#update	特定の写真を更新する
DELETE	/photos/:id	photos#destroy	特定の写真を削除する
Railsのルーターでは、サーバーへのリクエストをマッチさせる際にHTTP動詞とURLを使っているため、4種類のURL (GET/POST/PATCH/DELETE) が7種類の異なるアクション (index/new/create/show/edit/update/destroy) に割り当てられています。

Railsのルーティングは、ルーティングファイルの「上からの記載順に」マッチします。このため、たとえばresources :photosというルーティングがget 'photos/poll'よりも前の行にあれば、resources行のshowアクションがget行の記述よりも優先されますので、get行のルーティングは有効になりません。これを修正するには、get行をresources行 よりも上 の行に移動してください。これにより、get行がマッチするようになります。

2.3 パスとURL用ヘルパー
リソースフルなルーティングを作成すると、アプリケーションのコントローラで多くのヘルパーが利用できるようになります。resources :photosというルーティングを例に取ってみましょう。

photos_pathは/photosを返します
new_photo_pathは/photos/newを返します
edit_photo_path(:id)は/photos/:id/editを返します (edit_photo_path(10)であれば/photos/10/editが返されます)
photo_path(:id)は/photos/:idを返します。 (photo_path(10)であれば/photos/10が返されます)
これらの_pathヘルパーには、それぞれに対応する_urlヘルパー (photos_urlなど) があります。_urlヘルパーは、_pathの前に現在のホスト名、ポート番号、パスのプレフィックスが追加されている点が異なります。

2.4 複数のリソースを同時に定義する
リソースをいくつも定義しなければならない場合は、以下のような略記法で一度に定義することでタイプ量を節約できます。

resources :photos, :books, :videos

上の記法は以下と完全に同一です。

resources :photos
resources :books
resources :videos

2.5 単数形リソース
ユーザーがページを表示する際にidを一切参照しないリソースが使われることがあります。たとえば、/profileでは常に「現在ログインしているユーザー自身」のプロファイルを表示し、他のユーザーidを参照する必要がないとします。このような場合には、単数形リソース (singular resource) を使ってshowアクションに (/profile/:idではなく) /profileを割り当てることができます。

get 'profile', to: 'users#show'

to:の引数に文字列を渡す場合はコントローラ#アクション形式であることが前提ですが、シンボルを使う場合は、to:オプションをaction:に置き換えるべきです。#なしの文字列を使う場合は、to:オプションをcontroller:に置き換えるべきです。

get 'profile', action: :show, controller: 'users'

以下に記述するリソースフルなルーティングは

resource :geocoder
resolve('Geocoder') { [:geocoder] }

Geocodersコントローラに割り当てられた以下の6つのルーティングを作成します。

HTTP動詞	パス	コントローラ#アクション	目的
GET	/geocoder/new	geocoders#new	geocoder作成用のHTMLフォームを返す
POST	/geocoder	geocoders#create	geocoderを作成する
GET	/geocoder	geocoders#show	1つしかないgeocoderリソースを表示する
GET	/geocoder/edit	geocoders#edit	geocoder編集用のHTMLフォームを返す
PATCH/PUT	/geocoder	geocoders#update	1つしかないgeocoderリソースを更新する
DELETE	/geocoder	geocoders#destroy	geocoderリソースを削除する
単数形リソースは複数形のコントローラに割り当てられます。これは、同じコントローラで単数形のルーティング (/account) と複数形のルーティング (/accounts/45) を両方使いたい場合を想定しているためです。従って、resource :photoとresources :photosのどちらも、単数形ルーティングと複数形ルーティングを両方作成し、同一のコントローラ (PhotosController) に割り当てられます。

単数形のリソースフルなルーティングを使うと、以下のヘルパーメソッドが生成されます。

new_geocoder_pathは/geocoder/newを返します
edit_geocoder_pathは/geocoder/editを返します
geocoder_pathは/geocoderを返します。
複数形リソースの場合と同様に、単数形リソースでも_pathヘルパーに対応する_urlヘルパーが使えます。_urlヘルパーは、_pathの前に現在のホスト名、ポート番号、パスのプレフィックスが追加されている点が異なります。

2.6 コントローラの名前空間とルーティング
コントローラを名前空間によってグループ化することもできます。最もよく使われる名前空間といえば、多数の管理用コントローラ群をまとめるAdmin::名前空間でしょう。これらのコントローラをapp/controllers/adminディレクトリに配置し、ルーティングでこれらをグループ化できます。

namespace :admin do
  resources :articles, :comments
end

上のルーティングにより、articlesコントローラやcommentsコントローラへのルーティングが多数生成されます。たとえば、Admin::ArticlesController向けに作成されるルーティングは以下のとおりです。

HTTP 動詞	パス	コントローラ#アクション	名前付きヘルパー
GET	/admin/articles	admin/articles#index	admin_articles_path
GET	/admin/articles/new	admin/articles#new	new_admin_article_path
POST	/admin/articles	admin/articles#create	admin_articles_path
GET	/admin/articles/:id	admin/articles#show	admin_article_path(:id)
GET	/admin/articles/:id/edit	admin/articles#edit	edit_admin_post_path(:id)
PATCH/PUT	/admin/articles/:id	admin/articles#update	edit_admin_article_path(:id)
DELETE	/admin/articles/:id	admin/articles#destroy	admin_article_path(:id)
例外的に、(/adminが前についていない) /articlesをAdmin::ArticlesControllerにルーティングしたい場合は、以下のようにすることもできます。

scope module: 'admin' do
  resources :articles, :comments
end

以下のようにブロックを使わない記述も可能です。

resources :articles, module: 'admin'

逆に、/admin/articlesを (Admin::なしの) ArticlesControllerにルーティングしたい場合は、以下のようにします。

scope '/admin' do
  resources :articles, :comments
end

以下のようにブロックを使わない記述も可能です。

resources :articles, path: '/admin/articles'

いずれの場合も、名前付きルート (named route)は、scopeを使わなかった場合と同じであることにご注目ください。最後の例の場合は、以下のパスがArticlesControllerに割り当てられます。

HTTP 動詞	パス	コントローラ#アクション	名前付きヘルパー
GET	/admin/articles	articles#index	articles_path
GET	/admin/articles/new	articles#new	new_article_path
POST	/admin/articles	articles#create	new_article_path
GET	/admin/articles/:id	articles#show	article_path(:id)
GET	/admin/articles/:id/edit	articles#edit	edit_article_path(:id)
PATCH/PUT	/admin/articles/:id	articles#update	article_path(:id)
DELETE	/admin/articles/:id	articles#destroy	article_path(:id)
namespaceブロックの内部で異なるコントローラ名前空間を使いたいのであれば、「get '/foo' => '/foo#index'」のような絶対コントローラパスを指定することもできます。

2.7 ネストしたリソース
論理上、他のリソースの配下に子リソースを配置することはよくあります。たとえば、Railsアプリケーションに以下のモデルがあるとします。

class Magazine < ApplicationRecord
  has_many :ads
end

class Ad < ApplicationRecord
  belongs_to :magazine
end

ルーティングをネストする (入れ子にする) ことで、この親子関係をルーティングで表すことができるようになります。上の例の場合、以下のようにルーティングを宣言することができます。

resources :magazines do
  resources :ads
end

上のルーティングによって、雑誌 (magazine) へのルーティングに加えて、広告 (ad) をAdsControllerにルーティングすることもできるようになりました。adへのURLにはmagazineもなければなりません。

HTTP動詞	パス	コントローラ#アクション	目的
GET	/magazines/:magazine_id/ads	ads#index	ある雑誌1冊に含まれる広告をすべて表示する
GET	/magazines/:magazine_id/ads/new	ads#new	ある1冊の雑誌用の広告を1つ作成するHTMLフォームを返す
POST	/magazines/:magazine_id/ads	ads#create	ある1冊の雑誌用の広告を1つ作成する
GET	/magazines/:magazine_id/ads/:id	ads#show	ある雑誌1冊に含まれる広告を1つ表示する
GET	/magazines/:magazine_id/ads/:id/edit	ads#edit	ある雑誌1冊に含まれる広告1つを編集するHTMLフォームを返す
PATCH/PUT	/magazines/:magazine_id/ads/:id	ads#update	ある雑誌1冊に含まれる広告を1つ更新する
DELETE	/magazines/:magazine_id/ads/:id	ads#destroy	ある雑誌1冊に含まれる広告を1つ削除する
ルーティングを作成すると、ルーティングヘルパーも作成されます。ヘルパーはmagazine_ads_urlやedit_magazine_ad_pathのような名前になります。これらのヘルパーは、最初のパラメータとしてMagazineモデルのインスタンスを1つ取ります (magazine_ads_url(@magazine))。

2.7.1 ネスティング回数の上限
次のように、ネストしたリソースの中で別のリソースをネストできます。

resources :publishers do
  resources :magazines do
    resources :photos
  end
end

ただしリソースのネストが深くなるとたちまち扱いにくくなります。たとえば、上のルーティングはアプリケーションで以下のようなパスとして認識されます。

/publishers/1/magazines/2/photos/3

このURLに対応するルーティングヘルパーはpublisher_magazine_photo_urlとなります。このヘルパーを使うには、毎回3つの階層すべてでオブジェクトを指定する必要があります。ネスティングが深くなるとルーティングが扱いにくくなる問題については、Jamis Buckの有名な 記事 を参照してください。JamisはRailsアプリケーション設計上の優れた経験則を提案しています。

リソースのネスティングは、ぜひとも1回にとどめて下さい。決して2回以上ネストするべきではありません。

2.7.2 「浅い」ネスト
前述したような深いネストを避けるひとつの方法として、コレクション (index/new/createのような、idを持たないアクション) だけを親のスコープの下で生成するという手法があります。このとき、メンバー (show/edit/update/destroyのような、idを必要とするアクション) をネストに含めないのがポイントです。これによりコレクションだけが階層化のメリットを受けられます。つまり、以下のように最小限の情報でリソースを一意に指定できるルーティングを作成するということです。

resources :articles do
  resources :comments, only: [:index, :new, :create]
end
resources :comments, only: [:show, :edit, :update, :destroy]

この方法は、ルーティングの記述を複雑にせず、かつ深いネストを作らないという絶妙なバランスを保っています。:shallowオプションを使うことで、上と同じ内容をさらに簡単に記述できます。

resources :articles do
  resources :comments, shallow: true
end

これによって生成されるルーティングは、最初の例と完全に同じです。親リソースで:shallowオプションを指定すると、すべてのネストしたリソースが浅くなります。

resources :articles, shallow: true do
  resources :comments
  resources :quotes
  resources :drafts
end

DSL (ドメイン固有言語) であるshallowメソッドをルーティングで使うと、すべてのネストが浅くなるように内側にスコープを1つ作成します。これによって生成されるルーティングは、最初の例と完全に同じです。

shallow do
  resources :articles do
    resources :comments
    resources :quotes
    resources :drafts
  end
end

scopeメソッドには、「浅い」ルーティングをカスタマイズするためのオプションが2つあります。:shallow_pathオプションは、指定されたパラメータをメンバーのパスの冒頭にだけ追加します。

scope shallow_path: "sekret" do
  resources :articles do
    resources :comments, shallow: true
  end
end

上の場合、commentsリソースのルーティングは以下のようになります。

HTTP 動詞	パス	コントローラ#アクション	名前付きヘルパー
GET	/articles/:article_id/comments(.:format)	comments#index	article_comments_path
POST	/articles/:article_id/comments(.:format)	comments#create	article_comments_path
GET	/articles/:article_id/comments/new(.:format)	comments#new	new_article_comment_path
GET	/sekret/comments/:id/edit(.:format)	comments#edit	edit_comment_path
GET	/sekret/comments/:id(.:format)	comments#show	comment_path
PATCH/PUT	/sekret/comments/:id(.:format)	comments#update	comment_path
DELETE	/sekret/comments/:id(.:format)	comments#destroy	comment_path
:shallow_prefixオプションを使うと、指定されたパラメータを (パスではなく) 名前付きヘルパー名の冒頭に追加します。

scope shallow_prefix: "sekret" do
  resources :articles do
    resources :comments, shallow: true
  end
end

上の場合、commentsリソースのルーティングは以下のようになります。

HTTP 動詞	パス	コントローラ#アクション	名前付きヘルパー
GET	/articles/:article_id/comments(.:format)	comments#index	article_comments_path
POST	/articles/:article_id/comments(.:format)	comments#create	article_comments_path
GET	/articles/:article_id/comments/new(.:format)	comments#new	article_comments_path
GET	/comments/:id/edit(.:format)	comments#edit	edit_sekret_comment_path
GET	/comments/:id(.:format)	comments#show	sekret_comment_path
PATCH/PUT	/comments/:id(.:format)	comments#update	sekret_comment_path
DELETE	/comments/:id(.:format)	comments#destroy	sekret_comment_path
2.8 ルーティングの「concern」機能
concernを使うことで、他のリソースやルーティング内で使いまわせる共通のルーティングを宣言できます。concernは以下のように定義します。

concern :commentable do
  resources :comments
end

concern :image_attachable do
  resources :images, only: :index
end

concernを利用すると、同じようなルーティングを繰り返し記述せずに済み、複数のルーティング間で同じ動作を共有できます。

resources :messages, concerns: :commentable

resources :articles, concerns: [:commentable, :image_attachable]

上のコードは以下と同等です。

resources :messages do
  resources :comments
end

resources :articles do
  resources :comments
  resources :images, only: :index
end

concernはルーティング内のどのような場所にでも配置することができます。scopeやnamespace呼び出しでの使用法は以下のとおりです。

namespace :articles do
  concerns :commentable
end

2.9 オブジェクトからパスとURLを作成する
ルーティングヘルパーを使う方法の他に、パラメータの配列からパスやURLを作成することもできます。例として、以下のようなルーティングがあるとします。

resources :magazines do
  resources :ads
end

magazine_ad_pathを使うと、idを数字で渡す代りにMagazineとAdのインスタンスを引数として渡すことができます。

<%= link_to 'Ad details', magazine_ad_path(@magazine, @ad) %>

複数のオブジェクトが集まったセットに対してurl_forを使うこともできます。複数のオブジェクトを渡しても、適切なルーティングが自動的に決定されます。

<%= link_to 'Ad details', url_for([@magazine, @ad]) %>

上の場合、Railsは@magazineがMagazineであり、@adがAdであることを認識し、それに基づいてmagazine_ad_pathヘルパーを呼び出します。link_toなどのヘルパーでも、完全なurl_for呼び出しの代りに単にオブジェクトを渡すことができます。

<%= link_to 'Ad details', [@magazine, @ad] %>

1冊の雑誌にだけリンクしたいのであれば、以下のように書きます。

<%= link_to 'Magazine details', @magazine %>

それ以外のアクションであれば、配列の最初の要素にアクション名を挿入するだけで済みます。

<%= link_to 'Edit Ad', [:edit, @magazine, @ad] %>

これにより、モデルのインスタンスをURLとして扱うことができます。これはリソースフルなスタイルを採用する大きなメリットの1つです。

2.10 RESTfulなアクションをさらに追加する
デフォルトで作成されるRESTfulなルーティングは7つですが、7つでなければならないということはありません。必要であれば、コレクションやコレクションの各メンバーに対して適用されるリソースを追加することもできます。

2.10.1 メンバールーティングを追加する
メンバー (member) ルーティングを追加したい場合は、memberブロックをリソースブロックに1つ追加します。

resources :photos do
  member do
    get 'preview'
  end
end

上のルーティングはGETリクエストとそれに伴う/photos/1/previewを認識し、リクエストをPhotosコントローラのpreviewアクションにルーティングし、リソースid値をparams[:id]に渡します。同時に、photo_preview_urlヘルパーとphoto_preview_pathヘルパーも作成されます。

memberルーティングブロックの内側では、次に述べるHTTP動詞が指定されたルーティング名を認識できます。指定可能な動詞はget、patch、put、post、deleteです。memberルーティングが1つだけしかないのであれば、以下のようにルーティングで:onオプションを指定することでブロックを省略できます。

resources :photos do
  get 'preview', on: :member
end

:onオプションを省略しても同様のmemberルーティングが生成されます。この場合リソースidの値の取得にparams[:id]ではなくparams[:photo_id]を使う点が異なります。

2.10.2 コレクションルーティングを追加する
ルーティングにコレクション (collection) を追加するには以下のようにします。

resources :photos do
  collection do
    get 'search'
  end
end

上のルーティングは、GETリクエスト+/photos/searchなどの (idを伴わない) パスを認識し、リクエストをPhotosコントローラのsearchアクションにルーティングします。このときsearch_photos_urlやsearch_photos_pathルーティングヘルパーも同時に作成されます。

collectionルーティングでもmemberルーティングのときと同様に:onオプションを使えます。

resources :photos do
  get 'search', on: :collection
end

2.10.3 追加されたnewアクションへのルーティングを追加する
:onオプションを使って、たとえば以下のように別のnewアクションを追加できます。

resources :comments do
  get 'preview', on: :new
end

上のようにすることで、GET + /comments/new/previewのようなパスが認識され、Commentsコントローラのpreviewアクションにルーティングされます。preview_new_comment_urlやpreview_new_comment_pathルーティングヘルパーも同時に作成されます。

リソースフルなルーティングにアクションが多数追加されていることに気付いたら、それ以上アクションを追加するのをやめて、そこに別のリソースが隠されているのではないかと疑ってみる方がよいでしょう。

3 リソースフルでないルーティング
Railsではリソースルーティングを行なう他に、任意のURLをアクションにルーティングすることもできます。この方式を使う場合、リソースフルルーティングのような自動的なルーティンググループの生成は行われません。従って、アプリケーションで必要なルーティングを個別に設定することになります。

基本的にはリソースフルルーティングを使用すべきではありますが、このような単純なルーティングの方が適している箇所も多数あるはずです。リソースフルルーティングでは大袈裟過ぎる場合に、アプリケーションを無理にリソースフルなフレームワークに押し込める必要はありません。

シンプルルーティングは、特に従来形式のURLを新しいRailsのアクションに割り当てることがずっと簡単に行えるようになります。

3.1 パラメータの割り当て
通常のルーティングを設定するのであれば、RailsがルーティングをブラウザからのHTTPリクエストに割り当てるためのシンボルをいくつか渡します。以下のルーティングを例にとってみましょう。

get 'photos(/:id)', to: :display

ブラウザからの/photos/1リクエストが上のルーティングで処理される (他のルーティング設定にはマッチしなかったとします) と、PhotosControllerのdisplayアクションが呼び出され、URL末尾のパラメータ"1"へのアクセスはparams[:id]で行なえます。:idが必須パラメータではないことがかっこ () で示されているので、このルーティングは/photosをPhotosController#displayにルーティングすることもできます。

3.2 動的なセグメント
通常のルーティングの一部として、文字列を固定しない動的なセグメントを自由に使えます。あらゆるセグメントはparamsの一部に含めてアクションに渡すことができます。以下のルーティングを設定したとします。

get 'photos/:id/:user_id', to: 'photos#show'

ブラウザからの/photos/1/2パスはPhotosControllerのshowアクションに割り当てられます。params[:id]には"1"、params[:user_id]には"2"がそれぞれ保存されます。

動的なセグメント分割ではドット.をデフォルトでは使えません。ドットはフォーマット済みルーティングでは区切り文字として使用されるためです。どうしても動的セグメント内でドットを使いたい場合は、デフォルト設定を上書きする制限を与えます。たとえばid: /[^\/]+/とすると、スラッシュ以外のすべての文字が使えます。

3.3 静的なセグメント
ルート作成時にコロンを付けなかった部分は、静的なセグメントとして固定文字列が指定されます。

get 'photos/:id/with_user/:user_id', to: 'photos#show'

上のルーティングは、/photos/1/with_user/2のようなパスにマッチします。このときアクションで使えるparamsは { controller: 'photos', action: 'show', id: '1', user_id: '2' }となります。

3.4 クエリ文字列
クエリ文字列 (訳注: ?パラメータ名=値の形式でURLの末尾に置かれるパラメータ) で指定されているパラメータもすべてparamsに含まれます。以下のルーティングを例にとってみましょう。

photos/:id', to: 'photos#show'

ブラウザからのリクエストで/photos/1?user_id=2というパスが渡されると、Photosコントローラのshowアクションに割り当てられます。このときのparamsは{ controller: 'photos', action: 'show', id: '1', user_id: '2' }となります。

3.5 デフォルト設定を定義する
:defaultsオプションにハッシュを1つ渡すことで、ルーティング内にデフォルトを定義できます。このとき、動的なセグメントとして指定する必要のないパラメータを次のように適用することも可能です。

get 'photos/:id', to: 'photos#show', defaults: { format: 'jpg' }

上のルーティングはブラウザからの/photos/12パスにマッチし、Photosコントローラのshowアクションに割り当てられます。

defaultsをブロック形式で使うと、複数の項目についてデフォルトを設定することもできます。

defaults format: :json do
  resources :photos
end

セキュリティ上の理由により、クエリパラメータでデフォルトをオーバーライドすることはできません。URLパスの置き換えによる動的セグメントのみ、オーバーライド可能です。

3.6 名前付きルーティング
:asオプションを使うと、どんなルーティングにも名前を指定できます。

get 'exit', to: 'sessions#destroy', as: :logout

上のルーティングではlogout_pathとlogout_urlがアプリケーションの名前付きヘルパーとして作成されます。logout_pathを呼び出すと/exitが返されます。

この方法を使って、リソースとして定義されているルーティングを以下のように上書きすることもできます。

get ':username', to: 'users#show', as: :user

上のルーティングではuser_pathメソッドが生成され、コントローラ・ヘルパー・ビューでそれぞれ使えるようになります。このメソッドは、/bobのようなユーザー名を持つルーティングに移動します。Usersコントローラのshowアクションの内部でparams[:username]にアクセスすると、ユーザー名を取り出すことができます。パラメータ名を:usernameにしたくない場合は、ルーティング定義の:usernameの部分を変更してください。

3.7 HTTP動詞を制限する
あるルーティングを特定のHTTP動詞に割り当てるために、通常はget、post、put、patch、deleteメソッドのいずれかを使う必要があります。matchメソッドと:viaオプションを使うことで、複数のHTTP動詞に同時にマッチするルーティングを作成できます。

match 'photos', to: 'photos#show', via: [:get, :post]

via: :allを指定すると、すべてのHTTP動詞にマッチする特別なルーティングを作成できます。

match 'photos', to: 'photos#show', via: :all

1つのアクションにGETリクエストとPOSTリクエストを両方ルーティングすると、セキュリティに影響する可能性があります。本当に必要な理由がない限り、1つのアクションにすべてのHTTP動詞をルーティングすることは避けてください。

RailsではGETのCSRFトークンをチェックしません。絶対にGETリクエストでデータベースに書き込んではいけません。詳しくはセキュリティガイドのCSRF対策を参照してください。

3.8 セグメントを制限する
:constraintsオプションを使って、動的セグメントのURLフォーマットを特定の形式に制限できます。

get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }

上のルーティングは/photos/A12345のようなパスにはマッチしますが、/photos/893にはマッチしません。以下のようにもっと簡潔な方法で記述することもできます。

get 'photos/:id', to: 'photos#show', id: /[A-Z]\d{5}/

:constraintsでは正規表現を使えますが、ここでは正規表現の「アンカー」は使えないという制限があることにご注意ください。たとえば、以下のルーティングは無効です。

get '/:id', to: 'articles#show', constraints: {id: /^\d/}

対象となるルーティングはすべて初めからアンカーされているので、このようなアンカー表現を使う必要はないはずです。

たとえば以下のルーティングでは、ルート (root) 名前空間を共有する際にarticlesに対してto_paramが1-hello-worldのように数字で始まる値だけが使えるようになっており、usersに対してto_paramがdavidのように数字で始まらない値だけが使えるようになっています。

get '/:id', to: 'articles#show', constraints: { id: /\d.+/ }
get '/:username', to: 'users#show'

3.9 リクエスト内容に応じて制限を加える
また、Stringを返すRequestオブジェクトの任意のメソッドに基いてルーティングを制限することもできます。

リクエストに応じた制限は、セグメントを制限するときと同様の方法で指定することができます。

get 'photos', constraints: {subdomain: 'admin'}

ブロックフォームに対して制限を指定することもできます。

namespace :admin do
  constraints subdomain: 'admin' do
    resources :photos
  end
end

リクエストベースの制限は、Requestオブジェクトに対してあるメソッドを呼び出すことで実行されます。メソッド呼び出し時にハッシュキーと同じ名前をメソッドに渡し、返された値をハッシュ値と比較します。従って、制限された値は、対応するRequestオブジェクトメソッドが返す型と一致する必要があります。たとえば、constraints: { subdomain: 'api' }という制限はapiサブドメインに期待どおりマッチしますが、constraints: { subdomain: :api }のようにシンボルを使った場合はapiサブドメインに一致しません。request.subdomainが返す'api'は文字列型であるためです。

formatの制限には例外があります。これはRequestオブジェクトのメソッドですが、すべてのパスに含まれる暗黙的なオプションのパラメータでもあります。formatの制限よりセグメント制限が優先されます。たとえば、get 'foo'、constraints: { format： 'json' }はGET /fooと一致します。これはデフォルトでformatがオプションであるためです。しかし、次のようにラムダを使うことができます。get 'foo', constraints: lambda { |req| req.format == :json } このルーティング指定は明示的なJSONリクエストにのみ一致します。

3.10 高度な制限
より高度な制限を使いたい場合、Railsで必要なmatches?に応答できるオブジェクトを渡す方法があります。例として、ブラックリストに記載されているすべてのユーザーをBlacklistControllerにルーティングしたいとします。この場合、以下のように設定します。

class BlacklistConstraint
  def initialize
    @ips = Blacklist.retrieve_ips
  end

  def matches?(request)
    @ips.include?(request.remote_ip)
  end
end

Rails.application.routes.draw do
  get '*path', to: 'blacklist#index',
    constraints: BlacklistConstraint.new
end

制限をラムダとして指定することもできます。

Rails.application.routes.draw do
  get '*path', to: 'blacklist#index',
    constraints: lambda { |request| Blacklist.retrieve_ips.include?(request.remote_ip) }
end

matches?メソッドおよびラムダはいずれも引数としてrequestオブジェクトを取ります。

3.11 ルーティンググロブとワイルドカードセグメント
ルーティンググロブ (route globbing) とはワイルドカード展開のことであり、ルーティングのある位置から下のすべての部分に特定のパラメータをマッチさせる際に使います。例:

get 'photos/*other', to: 'photos#unknown'

上のルーティングはphotos/12や/photos/long/path/to/12にマッチし、params[:other]には"12"や"long/path/to/12"が設定されます。先頭にアスタリスク*が付いている部分を「ワイルドカードセグメント」と呼びます。

ワイルドカードセグメントはルーティングのどの部分でも使えます。例:

get 'books/*section/:title', to: 'books#show'

上はbooks/some/section/last-words-a-memoirにマッチし、params[:section]には'some/section'が保存され、params[:title]には'last-words-a-memoir'が保存されます。

技術上は、1つのルーティングに2つ以上のワイルドカードセグメントを含めることは可能です。マッチャがセグメントをパラメータに割り当てる方法は直感的です。例:

get '*a/foo/*b', to: 'test#index'

上のルーティングはzoo/woo/foo/bar/bazにマッチし、params[:a]には'zoo/woo'が保存され、params[:b]には'bar/baz'が保存されます。

'/foo/bar.json'をリクエストするとparams[:pages]には'foo/bar'がJSONリクエストフォーマットで保存されます。Rails 3.0.xの動作に戻したい場合は、以下のようにformat: falseを指定することができます。

get '*pages', to: 'pages#show', format: false

このセグメントフォーマットを必須にしたい場合は、以下のようにformat: trueを指定します。

get '*pages', to: 'pages#show', format: true

3.12 リダイレクト
ルーティングでredirectを使うと、あるパスを他のあらゆるパスにリダイレクトできます。

get '/stories', to: redirect('/articles')

パスにマッチする動的セグメントを再利用してリダイレクトすることもできます。 使うと ruby get '/stories/:name', to: redirect('/articles/%{name}')

リダイレクトにブロックを渡すこともできます。このリダイレクトは、シンボル化されたパスパラメータとrequestオブジェクトを受け取ります。

get '/stories/:name', to: redirect { |path_params, req| "/articles/#{path_params[:name].pluralize}" }
get '/stories', to: redirect { |path_params, req| "/articles/#{req.subdomain}" }

デフォルトのリダイレクトは、HTTPステータスで言う「301 "Moved Permanently"」であることにご注意ください。一部のWebブラウザやプロキシサーバーはこの種のリダイレクトをキャッシュすることがあり、その場合リダイレクト前の古いページにはアクセスできなくなります。次のように:statusオプションを使うことでレスポンスのステータスを変更できます。

get '/stories/:name', to: redirect('/articles/%{name}', status: 302)

どの場合であっても、ホスト (http://www.example.comなど) がURLの冒頭で指定されていない場合は、Railsは (以前のリクエストではなく) 現在のリクエストから詳細を取得します。

3.13 Rackアプリケーションにルーティングする
Postコントローラのindexアクションに対応する'articles#index'のような文字列の代りに、任意のRackアプリケーションをマッチャーのエンドポイントとして指定することができます。

match '/application.js', to: MyRackApp, via: :all

Railsルーターから見れば、MyRackAppがcallに応答して[status, headers, body]を返す限り、ルーティング先がRackアプリケーションであるかアクションであるかは区別できません。これはvia: :allの適切な利用法です。というのは、適切と考えられるすべてのHTTP動詞をRackアプリケーションで扱えるようにできるからです。

参考までに、'articles#index'は実際にはArticlesController.action(:index)という形に展開されます。これは正しいRackアプリケーションを返します。

マッチャーのエンドポイントとしてRackアプリケーションを指定する場合、受け取るアプリケーションのルーティングは変更されない点にご留意ください。以下のルーティングでは、Rackアプリケーションは/adminへのルーティングを期待するべきです。

 match '/admin', to: AdminApp, via: :all

Rackアプリケーションがルートパスでリクエストを受け取れるようにしたい場合は、mountを使います。

 mount AdminApp, at: '/admin'

3.14 rootを使う
rootメソッドを使うことで、Railsがルート'/'とすべき場所を指定できます。

root to: 'pages#main'
root 'pages#main' # 上の省略形

rootルーティングは、ルーティングファイルの先頭に記述してください。rootは最もよく使用されるルーティングであり、最初にマッチする必要があるからです。

rootルーティングがアクションに渡せるのはGETリクエストだけです。

名前空間やスコープの内側にrootを置くこともできます。例:

namespace :admin do
  root to: "admin#index"
end

root to: "home#index"

3.15 Unicode文字列をルーティングで使う
Unicode文字列をルーティングで直接使うこともできます。例:

get 'こんにちは', to: 'welcome#index'

3.16 ダイレクトルーティング（Direct routes）
カスタムURLヘルパーを次のように作成できます。

direct :homepage do
  "http://www.rubyonrails.org"
end

# >> homepage_url
# => "http://www.rubyonrails.org"

このブロックの戻り値は、必ずurl_forメソッドで有効な1個の引数にならなければなりません。これによって、有効な文字列URL/ハッシュ/配列/Active Modelインスタンス/Active Modelクラスのいずれかを1つ渡せるようになります。

direct :commentable do |model|
  [ model, anchor: model.dom_id ]
end

direct :main do
  { controller: 'pages', action: 'index', subdomain: 'www' }
end

3.17 resolveを使う
resolveメソッドを使うと、モデルのポリモーフィックなマッピングを次のようにカスタマイズできます。

resource :basket

resolve("Basket") { [:basket] }

<%= form_for @basket do |form| %>
  <!-- basket form -->
<% end %>

上のコードは、通常の/baskets/:idではなく、単数形の/basketというURLを生成します。

4 リソースフルルーティングをカスタマイズする
ほとんどの場合、resources :articlesのような指定を行ってデフォルトのルーティングやヘルパーを生成することで用は足りますが、もう少しルーティングをカスタマイズしたくなることもあります。Railsでは、リソースフルなヘルパーの一般的などの部分であっても事実上自由にカスタマイズ可能です。

4.1 使うコントローラを指定する
:controllerオプションは、リソースで使うコントローラを明示的に指定します。例:

resources :photos, controller: 'images'

上のルーティングは、/photosで始まるパスを認識しますが、ルーティング先をImagesコントローラにします。

HTTP 動詞	パス	コントローラ#アクション	名前付きヘルパー
GET	/photos	images#index	photos_path
GET	/photos/new	images#new	new_photo_path
POST	/photos	images#create	photos_path
GET	/photos/:id	images#show	photo_path(:id)
GET	/photos/:id/edit	images#edit	edit_photo_path(:id)
PATCH/PUT	/photos/:id	images#update	photo_path(:id)
DELETE	/photos/:id	images#destroy	photo_path(:id)
このリソースへのパスを生成するにはphotos_pathやnew_photo_pathなどを使っててください。

名前空間内のコントローラは以下のように直接指定することができます。例:

resources :user_permissions, controller: 'admin/user_permissions'

上はAdmin::UserPermissionsにルーティングされます。

ここでサポートされている記法は、/で区切る「ディレクトリ式」のみです。Rubyの定数表記法 (controller: 'Admin::UserPermissions'など) をコントローラに対して使うと、ルーティングで問題が生じ、警告が出力される可能性があります。

4.2 制限を指定する
:constraintsオプションを使うと、暗黙で使用されるidに対してフォーマットを指定することができます。例:

resources :photos, constraints: {id: /[A-Z][A-Z][0-9]+/}

上の宣言は:idパラメータに制限を加え、指定した正規表現にのみマッチするようにします。従って、上の例では/photos/1のようなパスにはマッチしなくなります。代わって、/photos/RR27のようなパスにマッチするようになります。

ブロックフォームを使うことで、多数のルーティングに対して1つの制限をまとめて与えることもできます。

constraints(id: /[A-Z][A-Z][0-9]+/) do
  resources :photos
  resources :accounts
end

もちろん、この場合であれば「リソースフルでない」ルーティングに適用可能な、より高度な制限を加えることもできます。

:idパラメータではドット.をデフォルトでは使えません。ドットはフォーマット済みルーティングでは区切り文字として使用されるためです。どうしても:id内でドットを使いたいい場合は、デフォルト設定を上書きする制限を与えます。たとえばid: /[^\/]+/とすると、スラッシュ以外のすべての文字が使えます。

4.3 名前付きヘルパーをオーバーライドする
:asオプションを使うと、名前付きルーティングヘルパーを次のように上書きして名前を変えられます。

resources :photos, as: 'images'

上のルーティングでは、/photosで始まるブラウザからのパスを認識し、このリクエストをPhotosコントローラにルーティングしますが、ヘルパーの命名に:asオプションの値が使用されます。

HTTP 動詞	パス	コントローラ#アクション	名前付きヘルパー
GET	/photos	photos#index	images_path
GET	/photos/new	photos#new	new_image_path
POST	/photos	photos#create	images_path
GET	/photos/:id	photos#show	image_path(:id)
GET	/photos/:id/edit	photos#edit	edit_image_path(:id)
PATCH/PUT	/photos/:id	photos#update	image_path(:id)
DELETE	/photos/:id	photos#destroy	image_path(:id)
4.4 newセグメントやeditセグメントをオーバーライドする
:path_namesオプションを使うと、パスに含まれている、自動生成された"new"セグメントや"edit"セグメントをオーバーライドできます。

resources :photos, path_names: { new: 'make', edit: 'change' }

これにより、ルーティングで以下のようなパスが認識できるようになります。

/photos/make
/photos/1/change

このオプションを指定しても、実際のアクション名が変更されるわけではありません。変更後のパスを使っても、ルーティング先は依然としてnewアクションとeditアクションのままです。

このオプションによる変更をすべてのルーティングに統一的に適用したくなった場合は、スコープを使えます。

scope path_names: { new: 'make' } do
  # 残りすべてのルーティング
end

4.5 名前付きルーティングヘルパーにプレフィックスを追加する
:asオプションを使うことで、Railsがルーティングに対して生成する名前付きルーティングヘルパー名の冒頭に文字を追加できます (プレフィックス)。パススコープを使うルーティング同士での名前の衝突を避けたい場合に使ってください。例:

scope 'admin' do
  resources :photos, as: 'admin_photos'
end

resources :photos

上のルーティングでは、admin_photos_pathやnew_admin_photo_pathなどのルーティングヘルパーが生成されます。

ルーティングヘルパーのグループにプレフィックスを追加するには、以下のようにscopeメソッドで:asオプションを使います。

scope 'admin', as: 'admin' do
  resources :photos, :accounts
end

resources :photos, :accounts

上によって、admin_photos_pathとadmin_accounts_pathなどのルーティングが生成されます。これらは/admin/photosと/admin/accountsにそれぞれ割り当てられます。

namespaceスコープを使うと、:moduleや:pathプレフィックスに加えて:asも自動的に追加されます。

名前付きパラメータを持つルーティングにプレフィックスを追加することもできます。

scope ':username' do
  resources :articles
end

上のルーティングにより、/bob/articles/1のような形式のURLを使えるようになります。さらに、コントローラ、ヘルパー、ビューのいずれにおいても、このパスのusernameの部分に相当する文字列 (この場合であればbob) をparams[:username]で参照できます。

4.6 ルーティングの作成を制限する
Railsは、アプリケーション内のすべてのRESTfulルーティングに対してデフォルトで7つのアクション (index、show、new、create、edit、update、destroy) へのルーティングを作成します。:onlyオプションや:exceptオプションを使うことで、これらのルーティングを微調整できます。:onlyオプションは、指定されたルーティングだけを生成するよう指示します。

resources :photos, only: [:index, :show]

これで、/photosへのGETリクエストは成功し、/photos へのPOSTリクエスト (通常であればcreateアクションにルーティングされます) は失敗します。

:exceptオプションは逆に、指定したルーティングのみを生成 しない よう指示します。

resources :photos, except: :destroy

この場合、destroy (/photos/:idへのDELETEリクエスト) を除いて通常のルーティングが生成されます。

アプリケーションでRESTfulルーティングが多数使用されているのであれば、それらに適宜:onlyや:exceptを使って、本当に必要なルーティングのみを生成することで、メモリ使用量の節約とルーティングプロセスの速度向上が見込めます。

4.7 パスを変更する
scopeメソッドを使うことで、resourcesによって生成されるデフォルトのパス名を変更できます。

scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do
  resources :categories, path: 'kategorien'
end

上のようにすることで、以下のようなCategoriesコントローラへのルーティングが作成されます。

HTTP 動詞	パス	コントローラ#アクション	名前付きヘルパー
GET	/kategorien	categories#index	categories_path
GET	/kategorien/neu	categories#new	new_category_path
POST	/kategorien	categories#create	categories_path
GET	/kategorien/:id	categories#show	category_path(:id)
GET	/kategorien/:id/bearbeiten	categories#edit	edit_category_path(:id)
PATCH/PUT	/kategorien/:id	categories#update	category_path(:id)
DELETE	/kategorien/:id	categories#destroy	category_path(:id)
4.8 「単数形のフォーム」をオーバーライドする
あるリソースの「単数形のフォーム」を定義したい場合、Inflectorに活用形ルールを追加します。

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'tooth', 'teeth'
end

4.9 名前付きリソースで:asを使う
:asを使うと、ネストしたルーティングヘルパー内のリソース用に自動生成された名前をオーバーライドできます。例:

resources :magazines do
  resources :ads, as: 'periodical_ads'
end

上のルーティングによって、magazine_periodical_ads_urlやedit_magazine_periodical_ad_pathなどのルーティングヘルパーが生成されます。

4.10 名前付きルーティングのパラメータをオーバーライドする
:paramオプションは、デフォルトのリソース識別子:id (ルーティングを生成するために使用される動的なセグメントの名前) をオーバーライドします。params[<:param>]を使って、コントローラからそのセグメントにアクセスできます。

resources :videos, param: :identifier

     videos GET  /videos(.:format)                  videos#index
            POST /videos(.:format)                  videos#create
 new_videos GET  /videos/new(.:format)              videos#new
edit_videos GET  /videos/:identifier/edit(.:format) videos#edit

Video.find_by(identifier: params[:identifier])

関連するモデルの ActiveRecord::Base#to_param をオーバーライドしてURLを作成することができます。

class Video < ApplicationRecord
  def to_param
    identifier
  end
end

video = Video.find_by(identifier: "Roman-Holiday")
edit_videos_path(video) # => "/videos/Roman-Holiday"

5 ルーティングの調査とテスト
Railsには、ルーティングを調べる機能（inspection）とテスト機能が備わっています。

5.1 既存のルールを一覧表示する
現在のアプリケーションで利用可能なルーティングをすべて表示するには、サーバーが development 環境で動作している状態でhttp://localhost:3000/rails/info/routesをブラウザで開きます。ターミナルでrails routesコマンドを実行しても同じ結果を得られます。

どちらの方法を使った場合でも、config/routes.rbファイルに記載された順にルーティングが表示されます。1つのルーティングについて以下の情報が表示されます。

ルーティング名 (あれば)
使用されているHTTP動詞 (そのルーティングがすべてのHTTP動詞に応答するのでない場合)
マッチするURLパターン
そのルーティングで使うパラメータ
以下は、あるRESTfulルーティングに対してrails routesを実行した結果から抜粋したものです。

    users GET    /users(.:format)          users#index
          POST   /users(.:format)          users#create
new_user GET    /users/new(.:format)      users#new
edit_user GET    /users/:id/edit(.:format) users#edit

-g（grepオプション）を使ってルーティングを検索できます。URLヘルパー名、HTTP動詞、URLパスのいずれかに部分マッチするルーティングが出力されます。

$ bin/rails routes -g new_comment
$ bin/rails routes -g POST
$ bin/rails routes -g admin

特定のコントローラに対応するルーティングだけを表示したい場合は、-cオプションを使います。

$ bin/rails routes -c users
$ bin/rails routes -c admin/users
$ bin/rails routes -c Comments
$ bin/rails routes -c Articles::CommentsController

折り返しが発生しないぐらいに十分大きなサイズのターミナルを使えるのであれば、rails routesコマンドの出力の方がおそらく読みやすいでしょう。

5.2 ルーティングをテストする
アプリケーションの他の部分と同様、ルーティング部分もテスティング戦略に含めておくべきでしょう。Railsでは、テスティングを容易にするために3つのビルトインアサーション が用意されています。

assert_generates
assert_recognizes
assert_routing
5.2.1 assert_generatesアサーション
assert_generatesは、特定のオプションの組み合わせを使った場合に特定のパスが生成されること、そしてそれらがデフォルトのルーティングでもカスタムルーティングでも使えることをテストするアサーション (assert, assertion: 主張・検証とも) です。例:

assert_generates '/photos/1', { controller: 'photos', action: 'show', id: '1' }
assert_generates '/about', controller: 'pages', action: 'about'

5.2.2 assert_recognizesアサーション
assert_recognizesはassert_generatesと逆方向のテスティングを行います。与えられたパスが認識可能であること、アプリケーションの特定の場所にルーティングされることをテストするアサーションです。例:

assert_recognizes({ controller: 'photos', action: 'show', id: '1' }, '/photos/1')

引数で:methodを使ってHTTP動詞を指定することもできます。

assert_recognizes({ controller: 'photos', action: 'create' }, { path: 'photos', method: :post })

5.2.3 assert_routingアサーション
assert_routingアサーションは、ルーティングを2つの観点 (与えられたパスによってオプションが生成されること、そのオプションによって元のパスが生成されること) からチェックします。つまり、assert_generatesとassert_recognizesの機能を組み合わせたものになります。

assert_routing({ path: 'photos', method: :post }, { controller: 'photos', action: 'create' })

---
title: Railsのルーティングの種類と要点まとめ
tags: Rails
author: senou
slide: false
---
#はじめに
scopeやnamespaceを使用してルーティングを設定する機会があった。
これまでresoucesくらいの基礎的なルーティング設定しかしたことがなく、色々調べたのでまとめてみる。

#目次
- resource
- namespace
- scopeとmodule
- concers
- memger
- collection
- shallow（オプション）
- as（オプション）
- params（オプション）

##resource
resourceは単数形リソースと呼ばれる。
場合によっては、ユーザーがページを表示する時にidを参照することのないリソースが使用されることがある。たとえば、マイページ（ここでは/profileとする）のように「現在ログインしているユーザー自身」のプロファイルを表示し、他のユーザーidを参照する必要がない場合には、単数形リソースを使用してshowアクションに (/profile/:idではなく) /profileを割り当てることができる。

```rb
resouce :user
```

##namespace
namespaceはコントローラを名前空間によってグループ化することができる。
どういうことかというと、ユーザーが使う部分とと管理者が使う部分をそれぞれ分けて管理できるようになる。管理者用のコントローラはcontrollers/adminディレクトリ以下に作成して管理するみたいに。

```rb
namespace :admin do
  resources :users, :tweets
end
```

ちなみに、controllers/admin以下にコントローラを作成するコマンドは以下

```bash
rails g controller admin/users
```

##scope
もし、URLは/tweetsだけど、Admin::TweetsController(adminディレクトリ以下にコントローラを作成するとこういうクラス名になる）にルーティングしたいなんて場合に使う。

```rb
scope module: 'admin' do
  resouces :tweets
end

#ブロックを使わない書き方もできる
resources :posts, module: 'admin'
```

逆に、/admin/tweetsというURLでTweetsControllerにルーティングしたい場合は、以下。

```rb
scope '/admin' do
  resouces :tweets
end

#または
resources :tweets, path: '/admin/tweets/
```

##concern
concernを使うと、他のリソースやルーティング内で使いまわせる共通のルーティングを宣言できる。

```rb
#使いまわしたいルーティングを定義
concern :commentable do
  resouces :comments
end

concern :image_attachable do
  resources :images, only: :index
end

#concernで定義したルーティングを使い回す
resources :messages, concerns: :commentable
resources :posts, concerns: [:commentable, :image_attachable]

```

上のコードは以下と同じ。

```rb
resources :messages do
  resources :comments
end

resources :posts do
  resources :comments
  resources :images, only: :index
end
```

## member
memberはメンバールーティング（photos/:id/previewのようにidを伴うパス）を追加するときに使う。
memberブロックをリソースブロック(resources :~~ do)の中に1つ追加する。追加したブロック内にメンバルーティングを記述する。

```rb
resources :photos do
  member do
    get :preview
  end
end

#追加したいメンバルーティングが1つならonオプションを使うと1行でいける
resouces :photos do
  get :preview, on: :member
end
```

## collection
ルーティングにコレクション（/photos/searchのようにidを伴わないパス）を追加するときに使う。

```rb
resources :photos do
  collection do
    get :search
  end
end

# こちらもonオプションで1行に
resouces :photos do
  get :search, on: :collection
end
```


## shallow
ネストが深くなったときに、生成するルーティングをいい感じにしてくれる。

```rb
resources :posts do
  resouces :comments, shallow: true
end

#ネストするリソースが複数ある場合ならこっちのが良さげ
resources :posts, shallow: true do
  resources :comments
  resources :quotes
  resources :drafts
end
```

## asオプション
:asオプションを使うと、ルーティングに名前を指定できる。

```rb
get 'exit', to: 'session#destroy', as: :logout
```

## matchとviaオプション
matchメソッドと:viaオプションを使うと、複数のHTTPメソッドに同時にマッチするルーティングを作成できる。

```rb
match 'photos', to: 'photos#show', via: [:get, :post]
```

## paramオプション
`resources :posts`というようなルーティング定義すると、#showなどのパスは`:id`となる。
しかし、uidで検索する場合などは`:uid`となっているべき。
以下のようにすると、:id以外の名前もつけることができる、

```rb
resources :posts, params: :uid
```

## 参考
http://railsguides.jp/routing.html
[resources を nest するときは shallow を使うと幸せになれる - Qiita](https://qiita.com/kuboon/items/96bbd227f9497ed81f38)

## 疑問
_pathヘルパーには、それぞれに対応する_urlヘルパーがある。_urlヘルパーは、_pathの前に現在のホスト名、ポート番号、パスのプレフィックスが追加されている点が異なるようだが、使用上の違いがよくわからない。。。
コメントで教えていただけると嬉しいです！

### 回答
上記の疑問に対する回答がこちら。
コメントにて回答いただいた @kuboon さんありがとうございました！

>
url ヘルパの使いどころ
>
- meta や ogp ではフルURLを書かないといけない決まりがある
- メール本文の中
- SNS 等にリンクを投げる時
- redirect_to に渡すパラメタ (pathでも動作するが、HTTPの仕様上フルURLが必要なので、pathを渡すとrails内でフルURLに変換される)




■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■



This is Cheatsheets — a collection of cheatsheets I've written.

Routes

Multiple resources (resources)

resources :books

# PhotosController:
# index  =>    GET /photos
# new    =>    GET /photos/new
# create =>   POST /photos/new
# show   =>    GET /photos/:id
# edit   =>    GET /photos/:id/edit
# update =>    PUT /photos/:id
# delete => DELETE /photos/:id
#
# Helpers:
# new_book_path
# book_path(id)
# edit_book_path(id)

Custom actions

resources :photos do
  member { get 'preview' }       # /photo/1/preview
  collection { get 'search' }    # /photos/search

  get 'preview', on: :member     # (..same as the first)
end

Options

resources :photos,
  path_names: { new: 'brand_new' }    # /photos/1/brand_new
  path: 'postings'                    # /postings
  only: :index
  only: [:index, :show]
  except: :show
  except: [:index, :show]

  shallow: true                       # also generate shallow routes
  shalow_path: 'secret'
  shallow_prefix: 'secret'

Single resource (resource)

resource :coder

# CodersController:
# new    =>    GET /coder/new
# create =>   POST /coder/new
# show   =>    GET /coder
# edit   =>    GET /coder/edit
# update =>    PUT /coder
# delete => DELETE /coder

Matching (match)

match 'photo/:id' => 'photos#show'  # /photo/what-is-it
match 'photo/:id', id: /[0-9]+/     # /photo/0192
match 'photo/:id' => 'photos#show', constraints: { id: /[0-9]+/ }
match 'photo/:id', via: :get
match 'photo/:id', via: [:get, :post]

match 'photo/*path' => 'photos#unknown'    # /photo/what/ever

# params[:format] == 'jpg'
match 'photos/:id' => 'photos#show', :defaults => { :format => 'jpg' }

Get/post

get is the same as match via: :get.

get 'photo/:id' => 'photos#show'
# same as match 'photo/:id' => 'photos#show', via: :get

post 'photo/:id' => 'photos#update'
# same as match 'photo/:id' => 'photos#show', via: :post

Redirection

match '/stories' => redirect('/posts')
match '/stories/:name' => redirect('/posts/%{name}')

Named

# logout_path
match 'exit' => 'sessions#destroy', as: :logout

Constraints

match '/', constraints: { subdomain: 'admin' }

# admin.site.com/admin/photos
namespace 'admin' do
  constraints subdomain: 'admin' do
    resources :photos
  end
end

Custom constraints

class BlacklistConstraint
  def initialize
    @ips = Blacklist.retrieve_ips
  end

  def matches?(request)
    @ips.include?(request.remote_ip)
  end
end

TwitterClone::Application.routes.draw do
  match "*path" => "blacklist#index",
    :constraints => BlacklistConstraint.new
end

Scopes

scope 'admin', constraints: { subdomain: 'admin' } do
  resources ...
end

Rack middleware

# Yes, Sprockets is middleware
match '/application.js' => Sprockets

Route helpers

projects_path   # /projects
projects_url    # http://site.com/projects

Default help text

# The priority is based upon order of creation:
# first created -> highest priority.

# Sample of regular route:
match 'products/:id' => 'catalog#view'

# Keep in mind you can assign values other than :controller and :action

# Sample of named route:
match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase

# This route can be invoked with purchase_url(:id => product.id)

# Sample resource route (maps HTTP verbs to controller actions automatically):
resources :products

# Sample resource route with options:
resources :products do
  member do
    get 'short'
    post 'toggle'
  end

  collection do
    get 'sold'
  end
end

# Sample resource route with sub-resources:
resources :products do
  resources :comments, :sales
  resource :seller
end

# Sample resource route with more complex sub-resources
resources :products do
  resources :comments
  resources :sales do
    get 'recent', :on => :collection
  end
end

# Sample resource route within a namespace:
namespace :admin do
  # Directs /admin/products/* to Admin::ProductsController
  # (app/controllers/admin/products_controller.rb)
  resources :products
end

# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
match ':controller(/:action(/:id(.:format)))'

References

    Guides/Routing

    ActionDispatch::Routing::Mapper (See included modules)

Cheatsheets is a collection of cheatsheets I've written over the years. Suggestions and corrections? Send them in. I'm Rico Sta. Cruz. Check out my Today I learned blog for more.





















{Pentabarf}
Search:]>
Search
  * Login
  * Preferences
  * About Trac
  * Timeline
  * Browse Source
  * View Tickets
  * Search
  * Roadmap

Context Navigation
------------------
  * Last Change
  * Annotate
  * Revision Log
------------------------------------------------------------------------------------------------------------------------------------------------

root/trunk/rails/config/routes.rb @ 6084

View revision:]> 6084
Visit:[                 ] Go!
Revision 6084, 2.9 KB (checked in by sven, 3 months ago)
add nicer route for xml controller
Line
1 ActionController::Routing::Routes.draw do |map|
2 # The priority is based upon order of creation: first created -> highest priority.
3
4 # Sample of regular route:
5 # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
6 # Keep in mind you can assign values other than :controller and :action
7
8 # Sample of named route:
9 # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
10 # This route can be invoked with purchase_url(:id => product.id)
11
12 # You can have the root of your site routed by hooking up ''
13 # -- just remember to delete public/index.html.
14 map.connect '', :controller => 'pentabarf'
15
16 map.connect 'schedule/:conference', :controller => 'schedule', :action => 'index', :language => 'en'
17 map.connect 'schedule/:conference/index.:language.html', :controller => 'schedule', :action => 'index'
18 map.connect 'schedule/:conference/day/:id.:language.html', :controller => 'schedule', :action => 'day'
19 map.connect 'schedule/:conference/speakers.:language.html', :controller => 'schedule', :action => 'speakers'
20 map.connect 'schedule/:conference/speaker/:id.:language.html', :controller => 'schedule', :action => 'speaker'
21 map.connect 'schedule/:conference/events.:language.html', :controller => 'schedule', :action => 'events'
22 map.connect 'schedule/:conference/event/:id.:language.html', :controller => 'schedule', :action => 'event'
23 map.connect 'schedule/:conference/day/:id.:language.html', :controller => 'schedule', :action => 'day'
24 map.connect 'schedule/:conference/track/:track/index.:language.html', :controller => 'schedule', :action => 'track_events'
25 map.connect 'schedule/:conference/track/:track/:id.:language.html', :controller => 'schedule', :action => 'track_event'
26 map.connect 'schedule/:conference/style.css', :controller => 'schedule', :action => 'css'
27 map.connect 'schedule/:conference/:action.:language.html',:controller => 'schedule'
28 map.connect 'schedule/:conference/:action/:id.:language.html',:controller => 'schedule'
29
30 map.connect 'feedback/:conference/style.css',:controller => 'feedback', :action => 'css'
31 map.connect 'feedback/:conference/:action/:id.:language.html',:controller => 'feedback'
32
33 map.connect 'submission/:conference/:action/:id', :controller => 'submission'
34
35 map.connect 'image/:action/:id.:size.:extension', :controller=> 'image'
36 map.connect 'image/:action/:id.:size', :controller=> 'image'
37
38 map.connect 'ical/:action/:conference', :controller=> 'ical'
39 map.connect 'xcal/:action/:conference', :controller=> 'xcal'
40 map.connect 'xml/:action/:conference', :controller=> 'xml'
41
42 map.connect 'pentabarf/events_by_state/:event_state', :controller => 'pentabarf', :action => 'events_by_state'
43 map.connect 'pentabarf/events_by_state/:event_state/:event_state_progress', :controller => 'pentabarf', :action => 'events_by_state'
44
45 # Install the default route as the lowest priority.
46 map.connect ':controller/:action/:id.:format'
47 map.connect ':controller/:action/:id'
48 end

Note: See TracBrowser for help on using the browser.
------------------------------------------------------------------------------------------------------------------------------------------------


Module
ActionController::Routing

In: vendor/rails/actionpack/lib/action_controller/routing/builder.rb vendor/rails/actionpack/lib/action_controller/routing/optimisations.rb
vendor/rails/actionpack/lib/action_controller/routing/recognition_optimisation.rb vendor/rails/actionpack/lib/action_controller/routing/route.rb
vendor/rails/actionpack/lib/action_controller/routing/route_set.rb vendor/rails/actionpack/lib/action_controller/routing/segments.rb
vendor/rails/actionpack/lib/action_controller/routing.rb



Routing
-------

The routing module provides URL rewriting in native Ruby. It‘s a way to redirect incoming requests to controllers and actions. This replaces
mod_rewrite rules. Best of all, Rails’ Routing works with any web server. Routes are defined in config/routes.rb.

Consider the following route, installed by Rails when you generate your application:

~>
    map.connect ':controller/:action/:id'

<~

This route states that it expects requests to consist of a :controller followed by an :action that in turn is fed some :id.

Suppose you get an incoming request for /blog/edit/22, you‘ll end up with:

~>
    params = { :controller => 'blog',
               :action     => 'edit',
               :id         => '22'
            }

<~

Think of creating routes as drawing a map for your requests. The map tells them where to go based on some predefined pattern:

~>
    ActionController::Routing::Routes.draw do |map|
      Pattern 1 tells some request to go to one place
      Pattern 2 tell them to go to another
      ...
    end

<~

The following symbols are special:

~>
    :controller maps to your controller name
    :action     maps to an action with your controllers

<~

Other names simply map to a parameter as in the case of :id.



Route priority
--------------

Not all routes are created equally. Routes have priority defined by the order of appearance of the routes in the config/routes.rb file. The
priority goes from top to bottom. The last route in that file is at the lowest priority and will be applied last. If no route matches, 404 is
returned.

Within blocks, the empty pattern is at the highest priority. In practice this works out nicely:

~>
    ActionController::Routing::Routes.draw do |map|
      map.with_options :controller => 'blog' do |blog|
        blog.show '',  :action => 'list'
      end
      map.connect ':controller/:action/:view'
    end

<~

In this case, invoking blog controller (with an URL like ’/blog/’) without parameters will activate the ‘list’ action by default.



Defaults routes and default parameters
--------------------------------------

Setting a default route is straightforward in Rails - you simply append a Hash at the end of your mapping to set any default parameters.

Example:

~>
    ActionController::Routing:Routes.draw do |map|
      map.connect ':controller/:action/:id', :controller => 'blog'
    end

<~

This sets up blog as the default controller if no other is specified. This means visiting ’/’ would invoke the blog controller.

More formally, you can include arbitrary parameters in the route, thus:

~>
    map.connect ':controller/:action/:id', :action => 'show', :page => 'Dashboard'

<~

This will pass the :page parameter to all incoming requests that match this route.

Note: The default routes, as provided by the Rails generator, make all actions in every controller accessible via GET requests. You should
consider removing them or commenting them out if you‘re using named routes and resources.



Named routes
------------

Routes can be named with the syntax map.name_of_route options, allowing for easy reference within your source as name_of_route_url for the full
URL and name_of_route_path for the URI path.

Example:

~>
    # In routes.rb
    map.login 'login', :controller => 'accounts', :action => 'login'

    # With render, redirect_to, tests, etc.
    redirect_to login_url

<~

Arguments can be passed as well.

~>
    redirect_to show_item_path(:id => 25)

<~

Use map.root as a shorthand to name a route for the root path "".

~>
    # In routes.rb
    map.root :controller => 'blogs'

    # would recognize http://www.example.com/ as
    params = { :controller => 'blogs', :action => 'index' }

    # and provide these named routes
    root_url   # => 'http://www.example.com/'
    root_path  # => ''

<~

You can also specify an already-defined named route in your map.root call:

~>
    # In routes.rb
    map.new_session :controller => 'sessions', :action => 'new'
    map.root :new_session

<~

Note: when using with_options, the route is simply named after the method you call on the block parameter rather than map.

~>
    # In routes.rb
    map.with_options :controller => 'blog' do |blog|
      blog.show    '',            :action  => 'list'
      blog.delete  'delete/:id',  :action  => 'delete',
      blog.edit    'edit/:id',    :action  => 'edit'
    end

    # provides named routes for show, delete, and edit
    link_to @article.title, show_path(:id => @article.id)

<~



Pretty URLs
-----------

Routes can generate pretty URLs. For example:

~>
    map.connect 'articles/:year/:month/:day',
                :controller => 'articles',
                :action     => 'find_by_date',
                :year       => /\d{4}/,
                :month      => /\d{1,2}/,
                :day        => /\d{1,2}/

<~

Using the route above, the URL "localhost:3000/articles/2005/11/06" maps to

~>
    params = {:year => '2005', :month => '11', :day => '06'}

<~



Regular Expressions and parameters
----------------------------------

You can specify a regular expression to define a format for a parameter.

~>
    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show', :postalcode => /\d{5}(-\d{4})?/

<~

or, more formally:

~>
    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show', :requirements => { :postalcode => /\d{5}(-\d{4})?/ }

<~

Formats can include the ‘ignorecase’ and ‘extended syntax’ regular expression modifiers:

~>
    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show', :postalcode => /hx\d\d\s\d[a-z]{2}/i

    map.geocode 'geocode/:postalcode', :controller => 'geocode',
                :action => 'show',:requirements => {
                  :postalcode => /# Postcode format
                                  \d{5} #Prefix
                                  (-\d{4})? #Suffix
                                  /x
                }

<~

Using the multiline match modifier will raise an ArgumentError. Encoding regular expression modifiers are silently ignored. The match will always
use the default encoding or ASCII.



Route globbing
--------------

Specifying *[string] as part of a rule like:

~>
    map.connect '*path' , :controller => 'blog' , :action => 'unrecognized?'

<~

will glob all remaining parts of the route that were not recognized earlier. The globbed values are in params[:path] as an array of path
segments.



Route conditions
----------------

With conditions you can define restrictions on routes. Currently the only valid condition is :method.

  * :method - Allows you to specify which method can access the route. Possible values are :post, :get, :put, :delete and :any. The default value
    is :any, :any means that any method can access the route.

Example:

~>
    map.connect 'post/:id', :controller => 'posts', :action => 'show',
                :conditions => { :method => :get }
    map.connect 'post/:id', :controller => 'posts', :action => 'create_comment',
                :conditions => { :method => :post }

<~

Now, if you POST to /posts/:id, it will route to the create_comment action. A GET on the same URL will route to the show action.



Reloading routes
----------------

You can reload routes if you feel you must:

~>
    ActionController::Routing::Routes.reload

<~

This will clear all named routes and reload routes.rb if the file has been modified from last load. To absolutely force reloading, use reload!.



Testing Routes
--------------

The two main methods for testing your routes:



assert_routing
^^^^^^^^^^^^^^

~>
    def test_movie_route_properly_splits
     opts = {:controller => "plugin", :action => "checkout", :id => "2"}
     assert_routing "plugin/checkout/2", opts
    end

<~

assert_routing lets you test whether or not the route properly resolves into options.



assert_recognizes
^^^^^^^^^^^^^^^^^

~>
    def test_route_has_options
     opts = {:controller => "plugin", :action => "show", :id => "12"}
     assert_recognizes opts, "/plugins/show/12"
    end

<~

Note the subtle difference between the two: assert_routing tests that a URL fits options while assert_recognizes tests that a URL breaks into
parameters properly.

In tests you can simply pass the URL or named route to get or post.

~>
    def send_to_jail
      get '/jail'
      assert_response :success
      assert_template "jail/front"
    end

    def goes_to_login
      get login_url
      #...
    end

<~



View a list of all your routes
------------------------------

Run rake routes.

Methods

  * controller_relative_to

  * inflections_with_route_reloading

  * normalize_paths

  * possible_controllers

  * use_controllers!

  * with_controllers

Classes and Modules

Module ActionController::Routing::Helpers
Module ActionController::Routing::Optimisation
Class ActionController::Routing::OptionalFormatSegment
Constants

SEPARATORS = %w( / . ? )
HTTP_METHODS = [:get, :head, :post, :put, :delete]
ALLOWED_REQUIREMENTS_FOR_OPTIMISATION = [:controller, :action].to_set
Routes = RouteSet.new

Public Class methods

controller_relative_to(controller, previous)

Returns a controller path for a new controller based on a previous controller path. Handles 4 scenarios:

  * stay in the previous controller:
    ~>
        controller_relative_to( nil, "groups/discussion" ) # => "groups/discussion"

<~

  * stay in the previous namespace:
    ~>
        controller_relative_to( "posts", "groups/discussion" ) # => "groups/posts"

<~

  * forced move to the root namespace:
    ~>
        controller_relative_to( "/posts", "groups/discussion" ) # => "posts"

<~

  * previous namespace is root:
    ~>
        controller_relative_to( "posts", "anything_with_no_slashes" ) # =>"posts"

<~

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 363
  363:       def controller_relative_to(controller, previous)
  364:         if controller.nil?           then previous
  365:         elsif controller[0] == ?/    then controller[1..-1]
  366:         elsif %r{^(.*)/} =~ previous then "#{$1}/#{controller}"
  367:         else controller
  368:         end
  369:       end

<~

normalize_paths(paths)

Returns an array of paths, cleaned of double-slashes and relative path references.

  * "\\" and "//" become "\" or "/".

  * "/foo/bar/../config" becomes "/foo/config".

The returned array is sorted by length, descending.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 299
  299:       def normalize_paths(paths)
  300:         # do the hokey-pokey of path normalization...
  301:         paths = paths.collect do |path|
  302:           path = path.
  303:             gsub("//", "/").           # replace double / chars with a single
  304:             gsub("\\\\", "\\").        # replace double \ chars with a single
  305:             gsub(%r{(.)[\\/]$}, '\1')  # drop final / or \ if path ends with it
  306:
  307:           # eliminate .. paths where possible
  308:           re = %r{[^/\\]+[/\\]\.\.[/\\]}
  309:           path.gsub!(re, "") while path.match(re)
  310:           path
  311:         end
  312:
  313:         # start with longest path, first
  314:         paths = paths.uniq.sort_by { |path| - path.length }
  315:       end

<~

possible_controllers()

Returns the array of controller names currently available to ActionController::Routing.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 318
  318:       def possible_controllers
  319:         unless @possible_controllers
  320:           @possible_controllers = []
  321:
  322:           paths = controller_paths.select { |path| File.directory?(path) && path != "." }
  323:
  324:           seen_paths = Hash.new {|h, k| h[k] = true; false}
  325:           normalize_paths(paths).each do |load_path|
  326:             Dir["#{load_path}/**/*_controller.rb"].collect do |path|
  327:               next if seen_paths[path.gsub(%r{^\.[/\\]}, "")]
  328:
  329:               controller_name = path[(load_path.length + 1)..-1]
  330:
  331:               controller_name.gsub!(/_controller\.rb\Z/, '')
  332:               @possible_controllers << controller_name
  333:             end
  334:           end
  335:
  336:           # remove duplicates
  337:           @possible_controllers.uniq!
  338:         end
  339:         @possible_controllers
  340:       end

<~

use_controllers!(controller_names)

Replaces the internal list of controllers available to ActionController::Routing with the passed argument.

~>
    ActionController::Routing.use_controllers!([ "posts", "comments", "admin/comments" ])

<~

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 344
  344:       def use_controllers!(controller_names)
  345:         @possible_controllers = controller_names
  346:       end

<~

with_controllers(names) {|| ...}

Expects an array of controller names as the first argument. Executes the passed block with only the named controllers named available. This
method is used in internal Rails testing.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 287
  287:       def with_controllers(names)
  288:         prior_controllers = @possible_controllers
  289:         use_controllers! names
  290:         yield
  291:       ensure
  292:         use_controllers! prior_controllers
  293:       end

<~

Public Instance methods

inflections_with_route_reloading(&block)

Ensures that routes are reloaded when Rails inflections are updated.

[ show source ]

~>
       # File vendor/rails/actionpack/lib/action_controller/routing.rb, line 376
  376:       def inflections_with_route_reloading(&block)
  377:         returning(inflections_without_route_reloading(&block)) {
  378:           ActionController::Routing::Routes.reload! if block_given?
  379:         }
  380:       end

<~

