#killosx_zombieprocess
#redis-server &

source ~/.bashrc
rvmusesys
sudo /setc/init.d/httpd stop
myps 
# sudo kill -9 [passenger/ruby] 
# export LANG=ja_JP.UTF-8

cd /opt
#cd ~/Downloads/src
#/Users/kenichi.takami/Downloads/src

export bx='bundle exec'
export command='rails s' # < rails 4.2
export env='-e production'
export debugoption='--debugger'
#export command='bin/rails s' # > rails 4.2

cd ./ ; cd app1
$bx $command $env $debugoption -p 3000 &

cd ../ ;cd app2
$bx $command $env $debugoption -p 3001 &

#cd ../ ; cd app3
#$bx sidekiq &

#mysqldump
cd ../ ;
#tail -f kp-*/log/*.log* &
 tail -f /opt/app-prefix-*/log/production.log

