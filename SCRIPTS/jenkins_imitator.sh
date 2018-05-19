export CI_DIR=~/Downloads/TMP/local-ci

#rm    -rf $CI_DIR
#ls -a $CI_DIR | grep -v -E '\.+|vendor\/?' | xargs ls

mkdir -p  $CI_DIR/vendor
rsync -a  ./ $CI_DIR/ --exclude=vendor/ 
cd $CI_DIR
ls -alt
git pull origin master
bundle install --path vendor/bundle
bundle exec rspec

#mydbbackup
#cd ARG[0]
#bdlx rake db:reset; bdlx rake db:migrate
#bdlx rspec spec/

#mydbimportall

#src grep byebug TODO Rails.env
#rubocop gidic *.rb
#
