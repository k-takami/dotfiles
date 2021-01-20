# paiza
  https://paiza.cloud/containers
  #rails, mysql, phpmyadmin のボタンをおす
  sudo systemctl enable mysql ; sudo systemctl start mysql
  rails new sample-app --database=mysql --webpack=react
  cd sample-app ; rake db:create ;
  bundle exec rails webpacker:install webpacker:install:coffee
  rails server
  #o https://localhost/phpmyadmin
  #o https://localhost-standarde-uni-1.paiza-user-free.cloud:3000/

