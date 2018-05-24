注意点：
	rvmはscript記録コマンドで動作不調になるので併用するな
	#case of no web connection
		> Unable to download data from https://rubygems.org/ - no such name (https://rubygems.org/specs.4.8.gz)
	#Ubuntu デフォルト端末 Gnome-terminalの注意点：
		For RVM to work properly, you have to check the 'Run command as login shell' checkbox on the Title and Command tab of gnome-terminal's Edit ▸ Profile Preferences menu dialog, in case the menu is missing right click the terminal app and navigate Profiles ▸ Profile Preferences.
		
installation
	$ supkgupdate
	$ supkgadd curl

	#linuxRHEL :
		$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

	#OSX 
		$  sudo chmod -R 775 /usr/local/
		$ pkgadd gpg2; gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 
		vi ~/.bash_profile
			[[ -s "/root/.rvm/scripts/rvm" ]] && source "/root/.rvm/scripts/rvm"
			source /etc/profile.d/rvm.sh

	#linuxDebian https://github.com/rvm/ubuntu_rvm
		supkgadd rvm
    **\curl -sSL https://get.rvm.io | bash -s stable**

	__不明手順__
		sh -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
	**$ source ~/.rvm/scripts/rvmsource ~/.rvm/scripts/rvm ; type rvm | head -n 1**
	** vi ~/.bashrc に永続化**
	source ~/.rvm/scripts/rvm ; type rvm | head -n 1
export PATH="$HOME/.rvm/scripts/rvm:$HOME/.rvm/bin:$PATH"
echo $GEM_HOME; echo $GEM_PATH # https://github.com/rvm/rvm/issues/2817

	$ rvm requirements

	#installation of ruby
		$ rvm list known
		$ rvm install 2.2
		$ rvm install 2.2.2 #rails5 
	$ rvm list
	＃つづいて$ gem install rails -v=5.0.0.1 --no-ri --no-rdoc　など・・・

#gemsets
	#Rails3-4
		プロジェクトごとに rvm の gemset を作るワンライナー
			rvm use --create <ruby version>@<gemset name> 
				$ rvm use ruby-2.0.0-p195@rails3.2.13 --default
rvm gemset help  #そのほかgemsetコマンド
	{import,export,create,copy,rename,empty,delete,name,dir,list,list_all,gemdir,install,pristine,clear,use,update,unpack,globalcache}
	##$ rvm gemset create 名称 # セットを新規作成
	**$ rvm use 名称 # セットの切り替え**
		**rvm gemset use rails323 --default**
	**rvm gemset rename rails323 rail40**
	$ rvm gemset empty # インストールしたgem を取り除く
	$ rvm gemset delete 名称 # セット自体を消去
	$ rvm gemset install 名称 # gem install... と同じ
	$ rvm gemset name # 現在使っているセット
	$ rvm gemset list # 現在使っているruby のバージョン内のgemセット一覧
	$ rvm gemset list_all # rubyのバージョンをまたいだgemセット一覧
	$ rvm gemset dir # 現在使っているセットのディレクトリパス
	**rubyのバージョンを変えて同じgemsetを使いたい場合**
		$ rvm gemset copy ruby1.9.2-p180@global ruby1.9.2-p290@global
#pj-dependent
	oksales ; rvm use ruby-2.0.0-p195; rvm gemset use rails405
	rublancer; rvm use ruby-1.9.3-p429; rvm gemset use rails323
	NDL private: rvm use --create 2.4@5.0.1

