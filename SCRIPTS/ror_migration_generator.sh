alias bx='DISABLE_SPRING=1 bundle exec '
#bx rails generate model DetailedStatsOfSale                 id target_date:datetime client_id:integer{8} currency:integer purchase_target:integer total_price:decimal{'10,0'}

#bx rails generate model SummarizedStatsOfSale               id target_date:datetime client_id:integer{8} currency:integer purchase_target:integer total_price:decimal{'10,0'}
#bx rails generate model Detai1ledStatsOfProductSale          id target_date:datetime client_id:integer{8} product_id:integer{8} sales_type_id:integer{8} sales_type:integer content_id_token:string series_id_token:string product_purchase_histories_id:integer{8} currency:integer account_id:integer{8}
#bx rails generate model IntermediateStatsOfProductSale      id target_date:datetime client_id:integer{8} product_id:integer{8} sales_type:integer currency:integer series_id_token:string content_id_token:string wallet_id:integer{8} sales_count:integer price:integer
#bx rails generate model SummarizedStatsOfProductSale        id target_date:datetime client_id:integer{8} sales_type:integer total_sales:integer
#bx rails generate model DetailedStatsOfCoinProductSale      id target_date:datetime client_id:integer{8} coin_product_id:integer{8} coin_purchase_histories_id:integer{8} account_id:integer{8}
#bx rails generate model SummarizedStatsOfCoinProductSale    id target_date:datetime client_id:integer{8} coin_product_id:integer{8} total_sales:integer
#bx rails generate model DetailedStatsOfCoinBalance          id target_date:datetime client_id:integer{8} account_id:integer{8} wallet_id:integer{8} balance_type:integer number:integer
#bx rails generate model SummarizedStatsOfCoinBalance        id target_date:datetime client_id:integer{8} wallet_id:integer{8} carried_over:integer issues:integer consumptions:integer deletions:integer balances:integer
#bx rails generate model SummarizedStatsOfAccount            id target_date:datetime client_id:integer{8} daily_active_users:integer monthly_active_users:integer last_accumulated_user_counts:integer new_users:integer resigned_users:integer accumulated_user_counts:integer
#bx rails generate model SummarizedStatsOfCoinConversion     id target_date:datetime client_id:integer{8} currency:integer purchase_unique_users:integer purchase_counts:integer conversion_rate:float average_revenue_per_user:float average_revenue_per_paid_user:float
#bx rails generate model SummarizedStatsOfProductConversion  id target_date:datetime client_id:integer{8} currency:integer purchase_unique_users:integer purchase_counts:integer conversion_rate:float average_revenue_per_user:float average_revenue_per_paid_user:float

#bx rails generate migration AddAmazonAppleOrientedIdColumnsToClient ama_app_id:string ama_identity_pool_id:string package_id:string android_custom_url_scheme:string play_store_link:string bundle_id:string ios_custom_url_scheme:string app_store_link:string
#bx rails generate migration AddIndexToWalletCoinBalances account_id:integer:index
#bx rails generate migration AddIndexToAccounts status:integer:index
#bx rails generate migration AddIndexToCoinPurchaseHistories coin_type:integer:index


# bx rails generate model CaRewardHistory  account_id:integer{8} coin_suppling_trigger_id:integer{8} action_id:string cid:string number:integer data_json:text


#特定ロールバック $ bundle exec rake db:migrate:down VERSION=20161215052230
# =========================================
#ref1: http://maeharin.hatenablog.com/entry/20130212/rails_generate
#ref2:   config/initializers/inflections.rb:  inflect.uncountable %w( sso fish sheep )

## Resetting Creation of  test DB with schema.rb
# rake db:create RAILS_ENV=test
##           Creation of test DB with schema.rb
# rake db:create RAILS_ENV=test

## rails4
  # bundle exec rake db:test:prepare
  # bundle exec rake db:migrate RAILS_ENV=test

#XXX: 主要generateコマンドで生成されるファイル
# デフォルトでは（オプションを与えなければ）、以下のようにファイルが生成される
  # コマンド名	コントローラ	ビュー	モデル	マイグレーション	アセット	ルート	テスト	ヘルパー
  # scaffold	○	○	○	○	○	○	○	○
  # scaffold_controller	○	○	×	×	×	×	○	○
  # controller	○	○	×	×	○	○	○	○
  # model	×	×	○	○	×	×	○	×
  # migration	×	×	×	○	×	×	○	×
  # eg)
    # NOTE : rails5 、特にdockerコンテナ内部ではbin/railsにすること。；
    # $ rails generate scaffold AdminUser name:string mail:string
    # $ rails generate scaffold_controller NAME [options]
    # $ rails generate controller NAME [action action] [options]
    # $ rails generate model NAME [field[:type][:index] field[:type][:index]] [options]
    # $ rails g migration NAME [field[:type][:index] field[:type][:index]] [options]


## Migration files
       # **#Generator rails generate model SINGULAR_TENSE [field[:type][:index] field[:type][:index]] [options]**
       # #vim #xls 2migrate: ExcelToGenerateModel
               # :'<,'>s/  */:/gc |'<,'>s/bigint/integer{8}/gc |'<,'>s/\n/ /gc | <,'>s/^/bx rails generate model SINGLEMODELCAMELCASE/gc
               # **decimal--->decimal{'10,0'}**  **'¥d+,¥d'にすること。数字の間に空白禁止**
       # rails generate model MemberAddress member_id:integer{8} postal_code:string{7} address:string{191}

       # #bigint create_table :member_addresses, comment: "被保険者住所情報" do |t|
               # t.integer :member_id, limit: 8, null: false, unsigned: true, comment: '被保険者ID'
       # #Add after
               # $ rails generate migration AddNotificationMethodToPasscode notification_method:string{1}
               # **#手作業でafter指定
# class AddNotificationMethodToPasscode < ActiveRecord::Migration
    # def change add_column :passcodes, :notification_method, :string, limit: 1, after: :state
    # end
# end

  # rake db:abort_if_pending_migrations       # Raises an error if there are pending migrations
  # rake db:charset                           # Retrieves the charset for the current environment's database
  # rake db:collation                         # Retrieves the collation for the current environment's database
  # rake db:create                            # Create the database defined in config/database.yml for the current RAILS_ENV
  # rake db:create:all                        # Create all the local databases defined in config/database.yml
  # rake db:migrate:prepare                   # Copy migrations from plugins to db/migrate
  # rake db:migrate                           # Migrate the database through scripts in db/migrate and update db/schema.rb by invoking db:schem...
  # rake db:drop                              # Drops the database for the current RAILS_ENV
    # rake db:drop:all                          # Drops all the local databases defined in config/database.yml
    # rake db:migrate:reset                     # Resets your database using your migrations for the current environment
    # rake db:reset                             # Drops and recreates the database from db/schema.rb for the current environment.
  # rake db:fixtures:identify                 # Search for a fixture given a LABEL or ID.
  # rake db:fixtures:load                     # Load fixtures into the current environment's database.
  # rake db:rollback                          # Rolls the schema back to the previous version.
    # rake db:migrate:down                      # Runs the "down" for a given migration VERSION.
    # #特定ロールバック $ bundle exec rake db:migrate:down VERSION=20161215052230

    # rake db:migrate:up                        # Runs the "up" for a given migration VERSION.
    # rake db:migrate:redo                      # Rollbacks the database one migration and re migrate up.
    # rake db:version                           # Retrieves the current schema version number
  # rake db:schema:dump                       # Create a db/schema.rb file that can be portably used against any DB supported by AR
  # rake db:schema:load                       # Load a schema.rb file into the database
  # rake db:sessions:clear                    # Clear the sessions table
  # rake db:sessions:create                   # Creates a sessions migration for use with ActiveRecord::SessionStore
  # rake db:structure:dump                    # Dump the database structure to a SQL file
  # rake db:test:clone                        # Recreate the test database from the current environment's database schema
  # rake db:test:clone_structure              # Recreate the test databases from the development structure
  # rake db:test:load                         # Recreate the test database from the current schema.rb
  # rake db:test:prepare                      # Check for pending migrations and load the test schema
  # rake db:test:purge                        # Empty the test database
