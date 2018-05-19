Migration files
	**#Generator rails generate model SINGULAR_TENSE [field[:type][:index] field[:type][:index]] [options]**
	#vim #xls 2migrate: ExcelToGenerateModel
		:'<,'>s/  */:/gc |'<,'>s/bigint/integer{8}/gc |'<,'>s/\n/ /gc | <,'>s/^/bx rails generate model SINGLEMODELCAMELCASE/gc
		**decimal--->decimal{'10,0'}**  **'¥d+,¥d'にすること。数字の間に空白禁止**
	rails generate model MemberAddress member_id:integer{8} postal_code:string{7} address:string{191} 

	#bigint create_table :member_addresses, comment: "被保険者住所情報" do |t|
		t.integer :member_id, limit: 8, null: false, unsigned: true, comment: '被保険者ID'
	#Add after
		$ rails generate migration AddNotificationMethodToPasscode notification_method:string{1}
		**#手作業でafter指定
class AddNotificationMethodToPasscode < ActiveRecord::Migration
    def change add_column :passcodes, :notification_method, :string, limit: 1, after: :state
    end
end


	インデックス追加 #add_index 例 __AddIndexToPluralClasses column:type:index__
	 bx rails generate migration AddIndexToWalletCoinBalances account_id:integer:index
 bx rails generate migration AddIndexToAccounts status:integer:index
 bx rails generate migration AddIndexToCoinPurchaseHistories coin_type:integer:index
	特定のmigrationをrevertするmigration
	require_relative '20130414_migratino_file_name_without_extention_rb'

class RevertProductsChangePrimaryKey < ActiveRecord::Migration
    def change
        revert ChangeProductsPrimaryKey
    end
end


	複数のフィールドの追加/削除のmigrationファイルの作成
		rails g migration RemoveFooFromProducts foo:string
		rails g migration add_foo_and_bar_to_products foo:integer bar:integer
	#PK create_table :zokugaras, id: false, primary_key: :zokugara_code do |t| 
	migration-file[[http://namakesugi.blog42.fc2.com/blog-entry-157.html
		Joinテーブルの作成をするmigrationファイルの作成
			書式: `CreateJoinTableXXXYYY XXX YYY` XXX, YYYには結合するモデル名を指定する。
			以下の場合はproductとcategoryのN:Nを結合するテーブルcategories_productsが生成される。
			rails g migration create_join_table_product_category product category
		
#add_index
#association 
#特定ロールバック $ bundle exec rake db:migrate:down VERSION=20161215052230 
#class_name つけよう
	class NotificationMethod < ActiveRecord::Base has_many :notification_method_errs, class_name: 'notification_method_err', dependent: :destroy end
	#migration
