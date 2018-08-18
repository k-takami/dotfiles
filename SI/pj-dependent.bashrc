#dotfiles-maint-command ##################################################
alias tarzip='echo $_ ; tar cvf $_.tar $_ ; zip -P JBC03142 $_.tar.zip $_.tar ; rm $_ ;'
alias tarzipsi='cd ~/.dotfiles ; tar cvf  SI.tar SI/ ; zip -P JBC03142 SI.tar.zip SI.tar ; rm $_ ; cd - ;'

alias dotfilespush='git commit SI.tar.zip ; git push https://k-takami@github.com/k-takami/dotfiles master'
# alias dotfilespush=' cd ~/.dotfiles/SI; rm pj-dependent.tgz; tar zcvf pj-dependent.tgz *; gwr pj-dependent.tgz; cd .. ; git commit; git push https://k-takami@github.com/k-takami/dotfiles master'
alias regrepgsub_bak='grep -lnirE "\w+takami" . --exclude=*.bak --include=*txt* |xargs -n1 ruby -pi.bak -e "gsub(/\w+takami/i, 'some_body')"'



# alias myapp='   cd $DL_HOME/platinum-dev-env/cms'
# alias myapp='   cd $DL_HOME'
export PATH="$PATH:/opt/apache-jmeter-3.2/bin"
alias myapp='   cd $DL_HOME/src'
alias myapp1='   cd /opt/enju-flower/'
alias myapp2='   cd /opt/enju-management'
export GITSTART1=b0895aadd11edd3a0c6e2e430bdaa70f8b31d291 
export GITSTART2=419e94e39e34e04520840bfbfac52d9580cee5d2 
alias mytodo1='   myapp1; gdino $GITSTART1 |xargs grep     -niE  "(todo|xxx|fixme|pending): " ; cd -'
alias mytodo2='   myapp2; gdino $GITSTART2 |xargs grep     -niE  "(todo|xxx|fixme|pending): " ; cd -'
alias mytodo1c3=' myapp1; gdino $GITSTART1 |xargs grep -C3 -niE  "(todo|xxx|fixme|pending): " ; cd -'
alias mytodo2c3=' myapp2; gdino $GITSTART2 |xargs grep -C3 -niE  "(todo|xxx|fixme|pending): " ; cd -'
alias mytodo='    echo; echo "###APP1 ###"; mytodo1; echo ;echo "###APP2 ###"; mytodo2; '
alias mytodoc3='  echo; echo "###APP1 ###"; mytodo1; echo ;echo "###APP2 ###"; mytodo2; '
alias myrubocopyml='cd ~; ln -s ~/.dotfiles/RAILS_ROOT/.rubocop.yml.tokyo_realistic_v1.8 .rubocop.yml'

alias startmyapp='sh $DL_HOME/src/ginger/Init-mobi0.sh '
# APIの名前空間
# alias cvfmysubapp='myapp;cd ../;     tar zcvf cms-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" cms ;lat; myapp'

# alias cvffluorite=' myapp;tar zcvf kp-fluorite-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" --exclude=vendor/* kp-fluorite;lat; myapp; cd *rite; gst'
# alias cvfberyl=' myapp;tar zcvf kp-beryl-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" --exclude=vendor/* kp-beryl; lat; myapp; cd *ryl; gst'
# alias cvfgarnet=' myapp;tar zcvf kp-garnet-`date '+%Y%m%d'`.tar.gz --exclude "log/*log" --exclude=vendor/* kp-garnet; lat; myapp; cd *net; gst' # --exclude tmp 
# alias cvfpublus=' myapp;tar zcvf Publus_Server-`date '+%Y%m%d'`.tar.gz --exclude "log/*log" --exclude=vendor/* Publus_Server; lat; myapp; cd Publus_Server; gst' # --exclude tmp 

# alias cvfmyapp='myapp;cd ../;     tar zcvf cms-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" cms ;lat; myapp'
# alias cvfmyapp='myapp;cd ../;     tar zcvf platinum-dev-env-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "log/*log" platinum-dev-env ;lat; myapp'
# alias cvfmyapp='myapp;  tar zcvf react5-`date '+%Y%m%d'`.tar.gz --exclude tmp --exclude "node_modules" --exclude "log/*log" react5/ ;lat; myapp'
alias xvfmyapp='myapp;cd ../;lat; tar zxvf '
alias cvfmyenv='cd $DL_HOME; tar zcvf backup.tar.gz ~/.*rc seleniumIDE/ diff/session* $DL_HOME/src/ginger/.rubocop.yml $DL_HOME/src/ginger/Gemfile* $DL_HOME/src/ginger/ENV_BACKUP.sh $DL_HOME/src/ginger/.gitignore; lat ; tar ztvf backup.tar.gz ; cd -; '

# alias mydb='      mysql -h localhost -u cassia -pcassia cassiadb'
# alias mydb='      mysql -h localhost -u root -p'
alias mydbstg='psql -U catalog -h 10.2.82.102'
alias mydbprod='psql -U catalog -h 10.2.66.212'
# alias db4='     mysql -h 172.19.51.133 -u neo -pneoneo neo_db4'
# alias db2='     mysql -h 172.19.51.133 -u neo -pneoneo neo_db2'
# alias ssh133='  ssh  172.19.51.133'
# alias sftp133=' sftp 172.19.51.133'
# alias srpw='grandsphere'
# alias mydbimportall='mysql -uroot < ../DUMP_ALL_DB_DEV-`date '+%Y%m%d'`.sql '
# alias mydbbackup='mysqldump -u root -h localhost -A > ../DUMP_ALL_DB_DEV-`date '+%Y%m%d'`.sql ; lat ../ ; pwd ; '
# alias mydbbackup='mysqldump -u root -pcassiadb -h localhost cassiadb > ../cassiadb-`date '+%Y%m%d'`.sql ; lat ../ ; pwd ; '
alias myappbackup='sh ~/.SCRIPTS/tar_cvf_all.sh;  sh ~/.dotfiles/SI/backapp_core.sh'


#KenCom
 # cd kp-garnet;
 # $bx $command -p 3005 &
 # cd ../ ; cd kp-dravite
 # $bx $command -p 3004 &
 # cd ../ ; cd kp-fluorite
 # $bx $command -p 3002 &
 # cd ../ ; cd kp-beryl
 # $bx $command -p 3001 &
 # cd ../ ;cd kp-amber
 # $bx $command -p 3000 &


