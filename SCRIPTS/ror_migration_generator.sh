#ref: http://maeharin.hatenablog.com/entry/20130212/rails_generate
#ref2:   config/initializers/inflections.rb:  inflect.uncountable %w( sso fish sheep ) 
alias bx='DISABLE_SPRING=1 bundle exec '
#bx rails generate model DetailedStatsOfSale                 id target_date:datetime client_id:integer{8} currency:integer purchase_target:integer total_price:decimal{'10,0'}

#bx rails generate model SummarizedStatsOfSale               id target_date:datetime client_id:integer{8} currency:integer purchase_target:integer total_price:decimal{'10,0'}
#bx rails generate model DetailedStatsOfProductSale          id target_date:datetime client_id:integer{8} product_id:integer{8} sales_type_id:integer{8} sales_type:integer content_id_token:string series_id_token:string product_purchase_histories_id:integer{8} currency:integer account_id:integer{8}
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


bx rake db:migrate:down VERSION=20170420045140 #create_detailed_stats_of_sales.rb

# =========================================

## Resetting Creation of  test DB with schema.rb
# rake db:create RAILS_ENV=test
##           Creation of test DB with schema.rb
# rake db:create RAILS_ENV=test

## rails4
  # bundle exec rake db:test:prepare
  # bundle exec rake db:migrate RAILS_ENV=test

