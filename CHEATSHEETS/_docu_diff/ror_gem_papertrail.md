---
title: Railsで監査ログやバージョン管理機能を追加するPaperTrailの使い方をまとめてみた
tags: Rails papertrail
author: ko-he-8
slide: false
---
github : https://github.com/airblade/paper_trail

Railsアプリケーションで監査、またはバージョン管理のためにモデルの変更を追跡するツールです。モデルの生成から破棄まで監視していて、任意のバージョンへ戻したり、削除したものを復元したりできるようになります。

基本的にはgithubのREADMEを見ればだいたいわかるようになっていますが、少しつまづいたところもあったのでまとめました。

# PaperTrailのバージョン

2015/11/25 バージョン4が最新安定版、ruby1.8.7以上、activerecord3.0以上6未満

バージョン5はunreleasedとなっています。

# 作成されるテーブルとその中身
PaperTrailは以下のようなversionsテーブルを作りログを残します。
item_typeがモデル名、 whodunnitはeventを起こしたユーザ（文字列可）です。

| id | item_type  | item_id | event  | whodunnit |                                       object                                       |         created_at
|----|------------|---------|--------|-----------|------------------------------------------------------------------------------------|----------------------
|  1 | Account    |       1 | create |           |                                                                                    | 2015-11-25 08:33:50.844782
|  2 | Account    |       2 | create | 1         |                                                                                    | 2015-11-25 08:35:31.590367
|  3 | Sample    |       1 | create | 1         |                                                                                    | 2015-11-25 08:35:31.370328
|  4 | Sample2 |       1 | create | 1         |                                                                                    | 2015-11-25 08:35:31.633935
|  5 | Sample2 |       2 | create | 1         |                                                                                    | 2015-11-25 08:35:31.643612
|  6 | Account    |       2 | update | 1         | --- <br>  : id: 2<br>: email: sample@sample.com<br>  : encrypted_password: "***************"<br> : name: sample<br> : admin: false<br> : created_at: 2015-11-25 08:35:31.590367000 Z<br> : updated_at: 2015-11-25 08:35:31.590367000 Z<br> :<br>| 2015-11-25 08:37:34.267056
|  7 | Sample    |       1 | update | 1         | --- <br> : name: sample01<br>: created_at: 2015-11-25 08:35:31.370328000 Z<br> : updated_at: 2015-11-25 08:35:31.370328000 Z<br> :<br>                                                                              | 2015-11-25 08:37:34.226331



# インストール
1．Gemfile追加

```
gem 'paper_trail', '~> 4.0.0'
```

２. Bundlerを実行

```
bundle install
```

3．データベースにバージョンテーブルを追加する
```
bundle exec rails generate paper_trail:install
bundle exec rake db:migrate
```

※　--with-associationsをつけるとモデルが変更されたときにそのモデルと関連するモデルのバージョンも格納するようになります。このときユニークな値であるtransaction_idを使うようになり、同じトランザクションで生成されたバージョンレコードを管理します。これがつかないと使えないものがいくつかあるようです。

```
bundle exec rails generate paper_trail:install --with-associations
```


# 使い方

以下のようにモデルに`has_paper_trail`を追加することで`create`, `update`, `destroy`を追跡するようになる。

```
class Widget < ActiveRecord::Base
  has_paper_trail
end
```

基本的な使い方の例

```
v = widget.versions.last    # 直前の変更を取得する
v.event        # 'update'か'create'か'destroy'
v.created_at   # eventがいつ起こったか          
v.whodunnit    # controller経由で変更された場合、controllerがcurrent_user methodを持っていればidをstringで返す

widget = v.reify # widgetを直前の状態に戻す。(eventはnil)
```

# APIまとめ

## モデルオブジェクトから使えるmethod
has_paper_trailを追加すると使えるようになるmethod一覧

以下のようにhas_paper_trailを追加した場合で見ていきます。

```
class Widget < ActiveRecord::Base
  has_paper_trail
end
```

- versions
  - 登録されているバージョンすべて取得する
  - PaperTrailオブジェクトの配列を返す

```
widget.versions
```

- version
  - 現在のバージョンを取得する。
  - PaperTrailオブジェクトを返す
  - バージョン管理されていない（最新のものなど）はnilを返す

```
widget.version
```

- live?
  - 現在参照しているものが使用しているものならtrue、違うならfalseを返す

```
widget.live?　#　trueの場合
widget.previous_version.live? #　ひとつ前の状態を見るとfalseが返る
widget.destroy
widget.live? # 削除してもfalseになる
```

- paper_trail_originator
  - 前の状態から現在の状態への変更を行ったユーザを返す


```
widget.paper_trail_originator
```

- version_at
  - 与えられたタイムスタンプの時の状態を返す
  - 下の例の場合2015年11月17日23時59分59秒時点のWidgetオブジェクトが返る

```
widget.version_at(Time.local(2015, 11, 17, 23, 59, 59))
```

- previous_version
  - ひとつ前の状態を取得する。
  - 前がない場合nilを返す
  - 下の例の場合Widgetオブジェクトが返る

```
widget.previous_version
```

- next_version
  - 次の状態を取得する。
  - 次がない場合nilを返す
  - 下の例の場合Widgetオブジェクトが返る

```
widget.next_version
```

- touch_with_version
  - 通常のtouchコマンドではversionの更新が行われないのでtouch_with_versionを使用する
  - touchと同様に下の例ならwidget.created_atが更新され、さらに新しいPaperTrailオブジェクトが生成される

```
widget.touch_with_version

# ------touchとtouch_with_versionの違い------
widget.updated_at # => 2015-11-18 07:54:45 UTC
widget.version.created_at # => 2015-11-18 07:54:45 UTC
sleep(5)
#-------------touch------------------------
widget.touch
widget.versions.size # => 3
widget.updated_at # =>2015-11-18 07:54:51 UTC
widget.version.created_at # => 2015-11-18 07:54:45 UTC
#-------------touch_with_version-----------
widget.touch_with_version
widget.versions.size # => 4
widget.updated_at # =>2015-11-18 07:54:51 UTC
widget.versions.last.created_at # =>2015-11-18 07:54:51 UTC
```

- paper_trail_off!
  - PaperTrailによるログの収集が行われなくなる
  - 収集済みのログは見れる

```
Widget.paper_trail_off!
```

- paper_trail_on!
  - PaperTrailによるログの収集を始める

```
Widget.paper_trail_on!
```

- paper_trail_enabled_for_model?
  - classまたはinstanceに対しPaperTrailによるログの収集が行われていればtrueを返す

```
Widget.paper_trail_enabled_for_model?
widget.paper_trail_enabled_for_model?
```

## PaperTrail::Versionインスタンスが持つmethod


- version.reify
  - このバージョンで管理されているモデルオブジェクトを返す
  - dupオプション
    - 次のバージョンで管理されているモデルオブジェクトを返す
  - has_oneオプション
    - --with-associationsが必要  
  - has_manyオプション
    - --with-associationsが必要
  - mark_for_destructionオプション
    - --with-associationsが必要

```
version.reify
```

- paper_trail_originator
  - 前のバージョンから現在のバージョンへの変更を行ったユーザを返す

```
version.paper_trail_originator
```

- terminator、whodunnit、version_author
  - 現在のバージョンから次のバージョンへ変更を行ったユーザを返す
  - どれも挙動は同じ?

```
version.terminator
version.whodunnit
version.version_author
```

- next
  - 次のバージョンを返す

```
version.next
```

- previous
  - 前のバージョンを返す

```
version.previous
```

- index
  - バージョンの全体の中でのindex番号を返す

```
version.index
```

- event
  - バージョンが作られた時の操作(create、updated、destroy)を返す

```
version.event
```

- where_object
  -  属性でバージョンの問い合わせを行う
  -  バージョンオブジェクトの配列が返る

```
# content属性が"Hello"でtitle属性が"Article"なバージョンを探す
Trail::Version.where_object(content: "Hello", title: "Article")
```

- where_object_changes
  -  属性でバージョンの問い合わせを行う
  - --with-associationsが必要
  -  指定した属性が変更されたバージョンオブジェクトの配列が返る

```
# content属性が"Hello"に変更されたバージョンを探す
PaperTrail::Version.where_object_changes(content: "Hello")
```


# versionsとversionの名前変更

versionsとversionのメソッドがすでに存在する場合、モデル側で以下のようにすることでversionsとversionの名前を変更できます。

```
class Widget < ActiveRecord::Base
  has_paper_trail :versions => :paper_trail_versions,
                  :version  => :paper_trail_version
end
```

# ユーザをログに残す
ApplicationControllerに以下のように追記することでユーザをログに残せます。

```
class ApplicationController
  before_filter :set_paper_trail_whodunnit
end
```

ただしPaperTrailではset_paper_trail_whodunniは

```
def set_paper_trail_whodunnit
        @set_paper_trail_whodunnit_called=true
        ::PaperTrail.whodunnit = user_for_paper_trail if ::PaperTrail.enabled_for_controller?
end
```

でuser_for_paper_trailは

```
def user_for_paper_trail
  return unless defined?(current_user)
  ActiveSupport::VERSION::MAJOR >= 4 ? current_user.try!(:id) : current_user.try(:id)
rescue NoMethodError
  current_user
end
```

のように定義されているのでcurrent_userでユーザ名をとれない場合は
ApplicationControllerで以下のようにuser_for_paper_trailをオーバーライドします。

```
class ApplicationController
  def user_for_paper_trail
    logged_in? ? current_member.id : 'Public user'  # or whatever
  end
end
```


ただ、私がPaperTrailを使用したのはGrapeで作成したAPIに
上のことを行おうとしたらうまくいきませんでした。

これはGrapeのAPIがApplicationControllerを継承していないためで、
以下のように各APIに追記することでユーザ名（今回はID）を取得するようにできました。
GrapeのAPIはbaseを継承しているのでそちらに書けば一括で適用されます。

```
module API
  module V1
    class ******API < API::V1::Base
      before do
        PaperTrail.whodunnit = current_account.id unless request.get?
      end
      ~
      ~
      ~
```

grapeではAPIを実行する前にbeforeメソッドを実行します。ここでGETの場合、DBの書き換えは行っていないと思われるので`unless request.get?`をつけていますがなくても動くと思います。


# データベースのテーブル名を変える

## モデルごとに別テーブルを作成する場合
PaperTrailではデータベースにversionsという名前のテーブルを追加します。
しかし、モデルごとに登録されるログのテーブルを変更したい時などは別名のテーブルを追加することで実現できます。
app/models/内の各モデルファイルを以下のように変更する。

```
class PostVersion < PaperTrail::Version
  self.table_name = :post_versions # 追加されるテーブル名
  self.sequence_name = :post_versions_id_seq # postgressでなければいらない
end

class Post < ActiveRecord::Base
  has_paper_trail :class_name => 'PostVersion'　# PostVersionで定義したテーブルを使用するようになる

 .
 .
 .
end
```

この後、DBにテーブルを追加したりしなければなりませんが
versionテーブルを消す作業をやらないだけで基本はこの後に書かれた作業と同じなのでそちらを参考にしてください。
行うこととしてはversionのmigrationファイルをコピーして作成したいテーブル名に合わせるだけです。

## versionテーブルを使用しないで別の名前のテーブルを作成する場合

上記の方法は各モデルごとに別名のテーブルを追加することを考えて書きましたが、
今度はもともと存在するversionsテーブは作成しない（削除する）で別名のテーブルですべてのモデルのログを管理する方法を書きます。

まずはapp/models/paper_trail/version.rbを追加し、以下を加える。

```
module PaperTrail
  class Version < ActiveRecord::Base
    include PaperTrail::VersionConcern
    self.abstract_class = true
  end
end
```

今回は「audits」という名前でテーブルを作ることを考える
app/models/audit.rbを作成して以下のように記述

```
class Audit < PaperTrail::Version
  self.table_name = :audits # 追加されるテーブル名
  self.sequence_name = :audits_id_seq # postgressでなければいらない
end
```

各モデルで以下のようにhas_paper_trailの部分に追記します。

```
class Post < ActiveRecord::Base
  has_paper_trail :class_name => 'Audit'　
  ・
  ・
  ・
```

versionsのmigrationファイルをコピーしてversionsをauditsに書き換えます。

```
# db/migrate/20151125030055_create_audits.rb
class CreateAudits < ActiveRecord::Migration
  TEXT_BYTES = 1_073_741_823

  def change
    create_table :audits do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object,    :limit => TEXT_BYTES
      t.datetime :created_at
    end
    add_index :audits, [:item_type, :item_id]
  end
end
```

元のversionsのmigrationファイルを削除します。
そしてDBの作り直します。
私の環境ではこんな感じで行いました
```
rm db/migrate/20151120030055_create_versions.rb
bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
```

これでversionsテーブルは作成されず、auditsテーブルが作成され、
versionsテーブルで管理していたログと同じ内容がauditsテーブルに登録されるようになりました。

