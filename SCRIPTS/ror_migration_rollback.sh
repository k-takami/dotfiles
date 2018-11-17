alias bxrdbmdown='     bundle exec rake db:migrate:down'
alias bxrdbm='         bundle exec rake db:migrate'
alias bxrdbmtest='     bundle exec rake db:migrate RAILS_ENV=test'

bxrdbmdown RAILS_ENV=development VERSION=$1
bxrdbm
# bxrdbmdown RAILS_ENV=test VERSION=$1
# bxrdbmtest

20181107034010 #create_master_hanbaitens.rb
20181107034104 #ate_hoken_eigyou_rirekis.rb
20181107034112 #reate_hoken_eigyou_files.rb
20181107034238 #reate_hoken_kyouyu_tasks.rb
