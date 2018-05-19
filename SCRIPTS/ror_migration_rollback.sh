alias bxrdbmdown='     bundle exec rake db:migrate:down'
alias bxrdbm='         bundle exec rake db:migrate'
alias bxrdbmtest='     bundle exec rake db:migrate RAILS_ENV=test'

bxrdbmdown VERSION=$1 RAILS_ENV=test
bxrdbmdown VERSION=$1 RAILS_ENV=development
bxrdbm
bxrdbmtest

