alias cvfndlfront='cd /opt ;  tar zcvf app1-`date '+%Y%m%d'`.tgz  --exclude tmp --exclude "log/*log" *app1/ '
alias cvfndlkanri='cd /opt ;  tar zcvf app2-`date '+%Y%m%d'`.tgz  --exclude tmp --exclude "log/*log" *app2 '
cvfndlfront
cvfndlkanri

cd /opt/app1
ls -alt
git status
cd /opt/app2
ls -alt
git status

