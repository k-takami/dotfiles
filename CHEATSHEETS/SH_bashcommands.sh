find . -name '*.orig' -exec command1 {} \; -exec command2 {} \; # ; は bashに解釈されるのでエスケープが必要

#archiver
	#archive specific file =  " tar zxvf (tarball file) (full-path to a specific file[s] inside the tarball file) "
		$ tar ztvf ginger-mae-last.tar.gz | grep rspec.rake
		$ tar zxvf ginger-mae-last.tar.gz ginger_mae/lib/tasks/rspec.rake
#step数ステップ数 メソッド数
	# find . -name "*rb" -o -name "*.yml" | xargs wc -l
	grep -nirE "def \w" .  --include=**  --exclude=*.sw* --exclude=*~ --exclude=*.log > ../../GrepDef.txt
	rake -T |grep stat
	rake stats
#UNIX万能コマンド
　　 --help |grep  -nirE "(ignor|exclu|skip|行|名|\-e|show|list|disp|time)"

#This account is currently not available.対策
  $ sudo usermod -s /bin/bash apache; cat /etc/passwd; 
  ref: http://server-setting.info/centos/login_user.html#login_user_2 



