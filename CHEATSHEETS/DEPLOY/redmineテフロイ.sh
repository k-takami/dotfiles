bundle install
rake tmp:clear RAILS_ENV=production
rake assets:clean RAILS_ENV=production
rake db:migrate RAILS_ENV=production
rake redmine:plugins:migrate RAILS_ENV=production
rake redmine:load_default_data RAILS_ENV=production
rake db:seed RAILS_ENV=production
rake assets:precompile RAILS_ENV=production
rails runner Batches::MemcacheStore.execute -e production
unicorn_rails  -c config/unicorn.rb -E production -p 3003 -D --path /redmine
