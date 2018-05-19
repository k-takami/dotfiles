if [ $1 == "restart"  ]; then
 vagrant halt
fi

vagrant up
sshfs vagrant@192.168.**.**:/home/guest_user/app_name /host_home/host_user/Downloads/src/app_name
mount
ssh 192.168.**.**
myapp
sh ./SCRIPTS/RHELntpsync.sh 
