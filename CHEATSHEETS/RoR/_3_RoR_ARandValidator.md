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

    has_one :setting, :class_name => 'UserSetting', :dependent => :destroy
    has_one :profile#, :dependent => :destroy
    :destroy 親と一緒に子レコードも削除する。（無理心中パターン）
    :delete_all 親と一緒に子レコードも削除する。ただし、直接DBのレコードを削除するので、子レコードのコールバック処理は実行されない。
    :nullify 子レコードの外部キーを NULL 更新する。（みなしごパターン）
    :restrict_with_exception 子レコードがある場合は ActiveRecord::DeleteRestrictionError が発生する。（引き留めパターン）
    :restrict_with_error 子レコードがある場合は削除できず、親レコードにエラー情報が付加される。（引き留めパターン）



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


snippet_ar_status ARレコードの状態をチェック語呂合わせ：= NePerDesCha? (new_record?/persisted?/destroyed?/changed?)
-----------------

snippet_ar_callbacks ActiveRecordのコールバック語呂合わせ：= _SaVaCrUD前後TouCoRoFiIn後
--------------------
    コールバック名	説明
    *ab == [after/before]
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


    SomeModel.skip_callback(:create, :before, :some_method); ****** ; SomeModel.set_callback(:create, :before, :some_method)  #<--- some_methodをかかないとうごかないんじゃないかなRoR5


snippet_ativerecord_debug: before_destroy { Rails.logger.info { "--------- DEBUG UNEXCPECTED CHANGE ---- " + caller.split.join("\n") } }


snippet_ar__attributes: == Model.columns_hash



ActiveSupport
	.camelize  <=> .underscore
	.tablerize <=>.classify
	.humanize
	.constantize.new
	.***gytes
	XML
	xml= <<-ENDOFHEARDOC
		<?xml....
		<entry>
			......
		</entry>
	ENDOFHEARDOC
	.from_xml(xml)

#メソッド名!は例外を発生させる。!がなければオブジェクトか:nilをかえすのが通例。
obj.find_by_name("dave")
ret=obj.find_by_sql("select * fro xxx")
obj.select_all
book = Product.find_or_create_by_name_and_price('book', 2079)
	リスト7●productsテーブルからnameが'book'，priceが2079であるようなProductオブジェクトを読み取り，存在しなかった場合はデータベースにレコードを新規作成する処理


なければつくる
	Model.find_or_create_by_<attribute>(:<attribute> => "")
		eg) CheckItem.find_or_create_by({ check_item_code: '9N791000000000011', updated_ip_address: '127.0.0.1' })
	Model.find_or_initialize_by_<attribute>(:<attribute> => "")
		eg) User.find_or_initialize_by(kumiai_code: "dsc#{i.to_s}", encrypted_account_id: SymmetricEncryption.encrypt("desc#{i.to_s}admin"))


一括更新
current_time　=Time.zone.now
            destination_wallet_coins.update_all do |el|
              el.number += number_tobe_transfered
              el.updated_at: current_time,
              el.save!
            end
            #XXX: validateしたければ　もしくはdestination_wallet_coins.update(destination_wallet_coins.ids, Array.new(destination_wallet_coins.ids.size,number: number_tobe_transfered))


変換前<%= f.text_field :name, [[id,val],[id2,val2]...], selected: ***  %>
変換後<%= f.select :name, VenueCity.related_names, { include_blank: '-- Select --' }, class: "browser-default custom-select", id: "XXX" %>
          <script src="https://code.jquery.com/jquery-3.1.0.slim.min.js"></script>
          <script>
            $("#project_implementation_plan_receiving_country_id").change(function(){
              var data = { id: $(this).val() };
              $.ajax({
                url: '/api/venue_city_from_country',
                method: 'GET', dataType: 'json', data: data,
                error: function(xhr, status, error){ console.error('AJAX Error: ' + status + error); },
                success: function(response){
                  $('#XXX').html("<option value=''>-- Select --</option>");
                  $.each(response, function (i, val) {
                    $('#XXX').append($("<option>").val(val[0]).text(val[1]));
                  });
                }
              });
            });
          </script>

      @M
         scope :related_names, -> { pluck(:name).zip(pluck(:name)) }
         または
           def self.related_names(venue_id)
             related_things = venue_id ? where(venue_id: venue_id).pluck(:name).uniq : all.pluck(:name).uniq
             related_things.zip(related_things)
           end
      @R
          get '/api/some_name' => 'api#some_method'
      @C
          class ApiController < ApplicationController
            def some_method
              return unless request.xhr?
              render json: SomeClass.related_names(params[:id]), status: :ok
            end
          end






**(options_for_select(KV二次元配列やハッシュ、:selected=>選択状態にしたい値).sub(/="selected/,'="yes') ** #<---selected=yesにしないと最近のブラウザーが認識しない傾向
options_from_collection_for_select(:value列、:選択肢文言列、selected: 値)
#Scope
	Passcode.limit(1000).offset(0).by_hokensha_bango(hokensha_bango).includes(member: [:hokenshas, :member_peculiarity, :work_place]).includes(:passcode_transitions).where(state: [:issued, :reissued]).where(members: {expired: false}).to_sql


# transaction や同時アクセス　対策
  # ARELキャッシュリロード：　author.reload.books.reload.empty?





  NDL
  ]
  class UserSetting < ActiveRecord::Base
    belongs_to :user
    accepts_nested_attributes_for :user, :update_only => true

    #validates :name, :presence => true, :length => {:maximum => 100}
    validates :city, :presence => {:if  => :prefecture_id}

    before_save :set_lat_lng

    private
    def set_lat_lng
      return unless self.prefecture_id
      return unless Prefecture.find(self.prefecture_id)
      return unless self.city

      address = Prefecture.find(self.prefecture_id).name + self.city
      geo = EnjuNdl::GoogleGeocode.lat_lng(address)
      if geo
        self.lat = geo.lat
        self.lng = geo.lng
      end
      geo
    end
  end
  ~
  require 'openssl'
  class User < ActiveRecord::Base
    #PASSWORD_RESET_TIMEOUT = 24.hours

    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable, :lockable and :timeoutable
    #devise :database_authenticatable, :confirmable, :recoverable, :rememberable
  #         :registerable, :trackable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :login, :email, :password, :password_confirmation, :remember_me, :setting_attributes

    acts_as_paranoid

    has_and_belongs_to_many :roles

    accepts_nested_attributes_for :setting
    has_many :modification_requests
    belongs_to :ndl_library #librarian の所属図書館

    before_validation :set_tokens, :on => :create
    #before_validation :set_dummy_password
    #before_validation :set_login #, :on => :create
    before_validation :convert_email

    #PASSWORD_REGEX = /^[a-zA-Z0-9_\-\+\=\!\#\$\%\&\'\@\,\.\/]+$/i
    #SNIPPET: validates :some_attr, presence: true, numericality: true, length: { "is/maximum/inimum": 2 }, uniqueness: { scope: :deleted_at } #非削除レコードの中でunique制約
    # gem 'validates_timeliness', '~> 5.0.0.alpha3'
         validates_date :date_start, on_or_after: ->{ 1.month.ago.beginning_of_month.to_date }, on_or_after_message: 'は先月一日以降を入力してください', on: :create, unless: :data_import
         validates_date :date_start, after: :today, after_message: 'は翌日以降を入力してください', on: :update, if: :date_start_changed?

         def date_from_doesnt_overlap_last_period
           return unless date_from == Master::TaxRate.where.not(id: id).order(:date_from).last.date_to.tomorrow
           errors.add(:date_from, 'は 直前の消費税の終了日翌日の日付を入力してください。')
         end

    #
    #validates_presence_of :password, :on => :update, :if => :no_confirmed?
    #validates_presence_of :password_confirmation, :on => :update, :if => :no_confirmed?
    #validates_length_of :password, :on => :update, :minimum => 8, :allow_blank => true
    #validates_length_of :password_confirmation, :on => :update, :minimum => 8, :allow_blank => true
    #validates_format_of :password, :with  => PASSWORD_REGEX, :allow_blank => true
    #validates_format_of :password_confirmation, :with  => PASSWORD_REGEX, :allow_blank => true
    #validates_confirmation_of :password

    EMAIL_REGEX = /^[A-Z0-9_\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,4}|museum|travel)$/i
    #validates_presence_of   :email
    #validates_uniqueness_of :email
    #validates_format_of     :email, :with  => EMAIL_REGEX, :allow_blank => true

    # ユーザ設定テーブルの属性をUserから直接使えるようにする
    delegate :name, :to => :setting, :allow_nil => true
    delegate :prefecture_id, :to => :setting, :allow_nil => true
    delegate :city, :to => :setting, :allow_nil => true
    delegate :lat, :to => :setting, :allow_nil => true
    delegate :lng, :to => :setting, :allow_nil => true
    delegate :url, :to => :setting, :allow_nil => true
    delegate :library, :to => :setting, :allow_nil => true #ユーザ画面で設定する図書館
    delegate :max_display_size, :to => :setting, :allow_nil => true
    delegate :sort, :to => :setting, :allow_nil => true
  #  migrationが失敗するのでとりあえず
  #  (UserSetting.column_names - ["id", "user_id"]).each do |column|
  #    delegate column.to_sym, :to => :setting, :allow_nil => true
  #  end




# 略記方法
    # nested_model_query ORM関連先を条件にしたwhere : .where( orm_symbols:{some_column1: x, some_column2: y} )


### snippet-rails-model モデルにありがちな処理
  https://qiita.com/hmuronaka/items/818c421dc632e3efb7a6
  snippet_Rails5 FK制約テーブルドロップ ---> Rails5
  DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=development  rake db:drop
  ORM 一方向：keyは両方書かないとバギー　uniratarall
  has_one :master_torihikisaki, class_name: 'Master::Torihikisaki', foreign_key: 'id',  primary_key: 'master_torihikisaki_id'
  Rack::Utils.parse_nested_query(format)['master_torihikisaki_id']

# Cracking
  DB password:  ActiveRecord::Base.connection.execute("select COUNT(*) from XXXX") で多分表示される



