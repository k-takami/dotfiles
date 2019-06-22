# Rails Models

### Generating models ATOM visual rails generatorでしたいこと；

    $ rails g model User

    インデックス追加 #add_index 例 AddIndexToPluralClasses column:type:index
    bx rails generate migration AddIndexToWalletCoinBalances account_id:integer:index
    bx rails generate migration AddIndexToAccounts status:integer:index
    bx rails generate migration AddIndexToCoinPurchaseHistories coin_type:integer:index

    複数のフィールドの追加/削除のmigrationファイルの作成
    	rails g migration RemoveFooFromProducts foo:string
    	rails g migration add_foo_and_bar_to_products foo:integer bar:integer

    PK否定
      create_table :zokugaras, id: false, primary_key: :zokugara_code do |t|


    特定のmigrationをrevertするmigration
    	require_relative '20130414_migratino_file_name_without_extention_rb'
      class RevertProductsChangePrimaryKey < ActiveRecord::Migration
        def change1
          revert ChangeProductsPrimaryKey end end

    Joinテーブルの作成をするmigrationファイルの作成
    	書式: `CreateJoinTableXXXYYY XXX YYY` XXX, YYYには結合するモデル名を指定する。
    	以下の場合はproductとcategoryのN:Nを結合するテーブルcategories_productsが生成される。
    	rails g migration create_join_table_product_category product category

### Associations

    [JMN=結合モデル名]
    [PVJMN=ポリモーフィック関連付でつかう仮想モデル名]

                                        has_one         has_many          belongs_to    has_and_belongs_to_many
                                        (through: JMN)  (through: JMN)
        autosave:
        .new, .createと同時に関連モデルも保存
        :destroy従属モデルがあればそれも破棄    有           有                有              有

        class_name:                             有           有                有              有
        validate:                               有           有                有              有
        foreign_key:                            有           有                有              有
        dependent:                              有           有                有
          :destroyを指定すると、関連付けられたオブジェクトも同時にdestroy
          :deleteを指定すると、関連付けられたオブジェクトはデータベースから物理削除。コールバックは実行なし
          :nullifyを指定すると、外部キーがNULLに設定されます。コールバックは実行なし
          :restrict_with_exceptionを指定すると、関連付けられたレコードがある場合に例外が発生
          :restrict_with_errorを指定すると、関連付けられたオブジェクトがある場合にエラーがオーナーに追加

        inverse_of:                             有           有                有
        primary_key:                            有           有                有
                                             source:         source:
        as: PVJMN                               有           有                polymorphic: true
                                                                              (as: PVJMN, source_type: )
        counter_cache: (true|カラム名)                        有                有
        .sizeメソッド呼び出しでつかう。      
        SQL回避
                                                                                             association_foreign_key:
                                                                                             ＊多対多の自己結合を行いたいときに
                                                                             touch: trueならば
                                                                             updated_atに関連モデル
                                                                             のdestroy時刻も記録

                                                                             optional: true
                                                                             ならば関連付けMの
                                                                             validateしない
                                        has_one対象はbuild_すると
　　　　　　　　　　　　　　　　　　　　ORMで自動消去される


|                                                                                    | has_one(through: 結合モデル名)                    | has_many    | belongs_to                                                | has_and_belongs_to_many                                    |     |
| ---------------------------------------------------------------------------------- | ------------------------------------------------- | ----------- | --------------------------------------------------------- | ---------------------------------------------------------- | --- |
| autosave:.new, .createと同時に関連モデルも保存:destroy従属モデルがあればそれも破棄 | 有                                                | 有          | 有                                                        | 有                                                         |     |
| class_name:                                                                        | 有                                                | 有          | 有                                                        | 有                                                         |     |
| validate:                                                                          | 有                                                | 有          | 有                                                        | 有                                                         |     |
| foreign_key:                                                                       | 有                                                | 有          | 有                                                        | 有                                                         |     |
| inverse_of:                                                                        | 有                                                | 有          | 有                                                        |                                                            |     |
| primary_key:                                                                       | 有                                                | 有          | 有                                                        |                                                            |     |
|                                                                                    | source: ???                                       | source: ??? |                                                           |                                                            |     |
| as: ポリモーフィック関連付でつかう仮想モデル名                                     | 有                                                | 有          | polymorphic: true(as: ***, source_type: ***)              |                                                            |     |
| counter_cache: (true                                                               | カラム名) *.sizeメソッド呼び出しでつかう。SQL回避 |             | 有                                                        | 有                                                         |     |
|                                                                                    |                                                   |             |                                                           | association_foreign_key:＊多対多の自己結合を行いたいときに |     |
|                                                                                    |                                                   |             | touch: trueならばupdated_at=関連モデルのdestroy時刻も記録 | join_table:結合テーブルの辞書順生成名を上書き指定          |     |
|                                                                                    |                                                   |             | optional: false*trueならば関連付けvalidateしない          |                                                            |     |
| dependent:                                                                         | 有                                                | 有          | 有                                                        |                                                            |     |
|                                                                                    |                                                   |             |                                                           |                                                            |     |
|                                                                                    |                                                   |             |                                                           |                                                            |     |

  *  :destroyを指定すると、関連付けられたオブジェクトも同時にdestroy
  *  :deleteを指定すると、関連付けられたオブジェクトはデータベースから物理削除。コールバックは実行なし
  *  :nullifyを指定すると、外部キーがNULLに設定されます。コールバックは実行なし
  *  :restrict_with_exceptionを指定すると、関連付けられたレコードがある場合に例外が発生
  *  :restrict_with_errorを指定すると、関連付けられたオブジェクトがある場合にエラーがオーナーに追加

    #### ORM設定後の自動派生メソッド
    + build_関連モデル名(attributes = {}) <--- NOTE: has_one対象はbuild_するとORMで自動消去される
    + create_関連モデル名(attributes = {})
    + create_関連モデル名!(attributes = {})
    + reload_関連モデル名
    + before_add
    + after_add
    + before_remove
    + after_remove


### Has many

    # あるモデルと異なる名前空間にあるモデルを関連付けるには、関連付けの宣言で完全なクラス名を指定する必要があります
      module MyApplication
        module Business
          class Supplier < ApplicationRecord
            has_one :account,
            class_name: "MyApplication::Billing::Account" end end
        module Billing
          class Account < ApplicationRecord
            belongs_to :supplier,
            class_name: "MyApplication::Business::Supplier" end end end

    has_manyの関連付けを宣言するときに:inverse_ofオプションも含めることで、Active Recordは双方向の関連付けを認識するようになります。
      class Author < ApplicationRecord
        has_many :books, inverse_of: 'writer' end
      class Book < ApplicationRecord
        belongs_to :writer, class_name: 'Author', foreign_key: 'author_id' end
      a = Author.first
      b = a.books.first
      a.first_name == b.writer.first_name # => true
      a.first_name = 'David'
      a.first_name == b.writer.first_name # => troubles

    has_many :comments, :order => "posted_on"
    has_many :comments, :include => :author
    has_many :people, :class_name => "Person", :conditions => "deleted = 0", :order => "name"
    has_many :tracks, :order => "position", :dependent => :destroy
    has_many :comments, :dependent => :nullify
    has_many :tags, :as => :taggable
    has_many :reports, :readonly => true
    has_many :subscribers, :through => :subscriptions, :source => :user
    has_many :subscribers, :class_name => "Person", :finder_sql =>
        'SELECT DISTINCT people.* ' +
        'FROM people p, post_subscriptions ps ' +
        'WHERE ps.post_id = #{id} AND ps.person_id = p.id ' +
        'ORDER BY p.first_name'


### Many-to-many

If you have a join model:

    class Programmer < ActiveRecord::Base
      has_many :assignments
      has_many :projects, :through => :assignments
    end

    class Project < ActiveRecord::Base
      has_many :assignments
      has_many :programmers, :through => :assignments
    end

    class Assignment
      belongs_to :project
      belongs_to :programmer
    end

Or HABTM:

    has_and_belongs_to_many :projects
    has_and_belongs_to_many :projects, :include => [ :milestones, :manager ]
    has_and_belongs_to_many :nations, :class_name => "Country"
    has_and_belongs_to_many :categories, :join_table => "prods_cats"
    has_and_belongs_to_many :categories, :readonly => true
    has_and_belongs_to_many :active_projects, :join_table => 'developers_projects', :delete_sql =>
    "DELETE FROM developers_projects WHERE active=1 AND developer_id = #{id} AND project_id = #{record.id}"

### Polymorphic associations

    class Post
      has_many :attachments, :as => :parent
    end

    class Image
      belongs_to :parent, :polymorphic => true
    end

And in migrations:

    create_table :images do |t|
      t.references :post, :polymorphic => true
    end


Migrations
----------

### Run migrations

    $ rake db:migrate

### Migrations

    create_table :users do |t|
      t.string :name
      t.text   :description

      t.primary_key :id
      t.string
      t.text
      t.integer
      t.float
      t.decimal
      t.datetime
      t.timestamp
      t.time
      t.date
      t.binary
      t.boolean
    end

    options:
      :null (boolean)
      :limit (integer)
      :default
      :precision (integer)
      :scale (integer)

### Tasks

    create_table
    change_table
    drop_table
    add_column
    change_column
    rename_column
    remove_column
    add_index
    remove_index

    # Rails4~
      t.references :user, foreign_key: true
      #===> user_idカラムとインデックスを自動作成し、FK制約もつくる

### Associations


    t.references :category   # kinda same as t.integer :category_id

    # Can have different types
    t.references :category, polymorphic: true

### Add/remove columns

    $ rails generate migration RemovePartNumberFromProducts part_number:string

    class RemovePartNumberFromProducts < ActiveRecord::Migration
      def up
        remove_column :products, :part_number
      end

      def down
        add_column :products, :part_number, :string
      end
    end



ENUM
----------

### Rails4.1~ ENUM: default値がDBにないとエラーになる
###	gem Enumerize
		CoinSupplyingTrigger.trigger_type.find_value(:expired).value
		﻿  enumerize :trigger_type, in: { time: 1, lot: 2, request: 3, purchase: 4, bonus: 5, consume: 6, direct_add: 7, direct_reduce: 8, expired: 9 }, scope: true


snippet_ar_validators
--------------------
  validates :some_attr, presence: true, numericality: {true|false|other_than: 0 }{only_integer: true }, length: { "is/maximum/minimum": 2, in: 6..20, too_short: " %{count} is shortness", too_log: " %{count} is exceeding",tokenizer: lambda {|str| str.scan(/\w+/)} }, uniqueness: { scope: :deleted_at }, :format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }

### Validate if and custom
  with_options if: :filter_date do
    validates :date, presence: true
    validate :foo_cant_be_nil
  end
  def foo_cant_be_nil
    errors.add(:foo, 'cant be nil')  if foo.nil?
  end

### Validate checkboxes
      validates :terms_of_service, :acceptance => true
### Validate associated records
      has_many :books
      validates_associated :books
### Confirmations (like passwords)
      validates :email, :confirmation => true
        

API
---

    items = Model.find_by_email(email)
    items = Model.where(first_name: "Harvey")

    item = Model.find(id)

    item.serialize_hash
    item.new_record?

    item.create     # Same an #new then #save
    item.create!    # Same as above, but raises an Exception

    item.save
    item.save!      # Same as above, but raises an Exception

    item.update
    item.update_attributes
    item.update_attributes!

    item.valid?
    item.invalid?


http://guides.rubyonrails.org/active_record_validations_callbacks.html

### Mass updates

    # Updates person id 15
    Person.update 15, name: "John", age: 24
    Person.update [1,2], [{name: "John"}, {name: "foo"}]

### Joining

    Student.joins(:schools).where(:schools => { :type => 'public' })
    Student.joins(:schools).where('schools.type' => 'public' )

### Serialize

    class User < ActiveRecord::Base
      serialize :preferences
    end

    user = User.create(:preferences => { "background" => "black", "display" => large })

You can also specify a class option as the second parameter that’ll raise an
exception if a serialized object is retrieved as a descendant of a class not in
the hierarchy.

    class User < ActiveRecord::Base
      serialize :preferences, Hash
    end

    user = User.create(:preferences => %w( one two three ))
    User.find(user.id).preferences    # raises SerializationTypeMismatch

Overriding accessors
--------------------

    class Song < ActiveRecord::Base
      # Uses an integer of seconds to hold the length of the song

      def length=(minutes)
        write_attribute(:length, minutes.to_i * 60)
      end

      def length
        read_attribute(:length) / 60
      end
    end

 * http://api.rubyonrails.org/classes/ActiveRecord/Base.html


snippet_ar_callbacks ActiveRecordのコールバック語呂合わせ：= _SaVaCrUD前後TouCoRoFiIn後
--------------------
    コールバック名	説明
    *ab == [avter/before] 
    ab_save	オブジェクトがDBに保存される前後で実行。INSERT、UPDATE両方で実行
    ab_validation	バリデーションが行われる前後で実行。カラム値の微調整に利用
    ab_create	オブジェクトがDBに新規保存(INSERT)される前後で実行されます
    ab_update	オブジェクトにより、DBを更新(UPDATE)する前後で実行されます
    ab_destroy	destroyメソッドで削除される前後に実行されます

    after_touch	touchメソッドが呼び出された直後に実行されます
    after_commit	after_save後のDBにCOMMITされた直後に実行されます
    after_rollback	バリデーションエラーやSQLエラーが発生した場合に実行されます
    after_find	findなどでオブジェクトが見つかった場合に実行。検索結果の数だけコールバックが実行
    after_initialize	オブジェクトがインスタンス化されたタイミングで実行。オブジェクト分だけ実行

snippet_ativerecord_debug: before_destroy { Rails.logger.info { "--------- DEBUG UNEXCPECTED CHANGE ---- " + caller.split.join("\n") } }


snippet_ar__attributes: == Model.columns_hash


