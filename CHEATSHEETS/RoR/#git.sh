#git-setup
	$** git config --global color.ui auto**

	パスワード省略したきゃ vi ~/.netrc
	machine adp.adniss.jp
login hayashi.masanori@adniss.jp　←ここは各自の
password XXXXXX　←ここは各自の

# 2. リポジトリのクローン
#   コマンドプロンプト(Windows)、ターミナル(macOS)で以下を実行。
  git clone --recursive git@github-ext.dena.jp:Thelxinoe/platinum-dev-env.git

  # 2.1 public-keyでエラーが出たとき
    # Permission denied (publickey). fatal: Could not read from remote repository.
    # Please make sure you have the correct access rights and the repository exists.
    # Git clone時に上記のようなエラーが出たら 公開鍵をGitHubに登録する。 http://qiita.com/shizuma/items/2b2f873a0034839e47ce 鍵の生成はTeratermからも行える。

    # 設定 ＞ SSH鍵生成
    #   鍵の種類＝RSA ビット数＝2048 で鍵を生成し、 公開鍵の保存、秘密鍵の保存で 公開鍵（id_rsa.pub）と秘密鍵（rsa.pub）を保存する。



#gitブランチ作業完了からpushまでの作法
	#作業開始
	git checkout -b feature/[new-branch-name]
　git checkout feature/[new-branch-name]
	installing git with #homebrew
		sudo chown -R `whoami` /usr/local
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		==> Next steps:
		- Install the Command Line Tools for Xcode:
			https://developer.apple.com/downloads
			Apple ID= some_body@gmail.com / Jbc
			https://developer.apple.com/download/more/?=xcode
				https://download.developer.apple.com/Developer_Tools/command_line_tools_os_x_mountain_lion_for_xcode__april_2014/command_line_tools_for_osx_mountain_lion_april_2014.dmg
			$ brew install git
			$ git -version

		brew install libevent
		#brew link --overwrite libevent

	#git設定
		vi /home/apl/.gitconfig
		コマンドラインでの設定

	**git rebase 毎回打つのは面倒なので、下記コマンドでデフォルトの設定を変更します。
$ git config --global pull.rebase true

トピックブランチを github に push する前に最新の master に対して rebase する

トピックブランチを pull request する際、以下のような手順でローカル環境で最新の master ブランチに対して rebase を実行することでコンフリクト等を解消しておきます。

$ git checkout master           # master ブランチへ切り替え
$ git pull --rebase             # 最新化(前述の設定により --rebase は省略可能)
$ git checkout feature/xxxxxx   # push したい自分のブランチへ切り替え
$ git rebase master             # 最新化した master ブランチに対して自分のブランチをリベース
（コンフリクトがあれば解消して git rebase --continue 中断は git rebase --abort）
$ git push -u origin feature/xxxxxx  # <- ブランチを最初に push するときオプションが必要、2回目以降は、2回目以降は単に git push で良い


WIKI: git pull と pull request 時のルール
https://github.com/access-company/Publus_Server/wiki/Git-pull-and-pull-request-rule
このページですね・・・
—rebans オプションつけるつけない の違いは
http://kray.jp/blog/git-pull-rebase/
に代弁されていますね。。。


		**遠近間で差分をpullしたら適用したい差分コミットのパッチ適用になるまで git rebase --skip**
		**ローカルブランチ間で差が出たら　cherry-pick適用**
		git rebase -i HEAD~~ でローカルコミットまとめる。~回数はまとめたい回数
		-->vim 起動するので
pick
fixup
fixup
pick
みたいな感じでまとめる

コミットメッセージ修正は
refowd
:wqで保存、再度vimが立ち上がる
メッセージ編集


その後git push   -fオプションもあり

		fatal: Unable to create '/home/vagrant/Publus_Server/.git/index.lock':
			rm -f ./.git/index.lock

	#作業完了
	#状況に応じて現在のブランチ名変更
		git branch -m feature[new-name]
	!service ntpd stop;ntpdate clock.nc.fukuoka-u.ac.jp;service ntpd start; date;
	git st
	git diff --cached
	git diff Gemfile
	git commit -m " #2285  論理削除対応 レビュー前"
	git stash save (これをしないと最新フェッチされず、エラーもでない)
	git fetch
	#rebase
		git rebase origin/develop
		  mergeとrebaseは共に履歴を統合しますが、特徴が異なります。
    merge
    変更内容の履歴はそのまま残るが、履歴が複雑になる。
    rebase
    履歴は単純になるが、元のコミットから変更内容が変更される。
    そのため、元のコミットを動かない状態にしてしまうことがある。
    mergeとrebaseは、チームの運用方針に応じて使い分けます。
    例えば、履歴を一本化するように運用をするのであれば
    トピックブランチに統合ブランチの最新のコードを取り込む場合はrebaseを使う
    統合ブランチにトピックブランチを取り込む場合は、まずrebaseしてからmerge
    Gitでのブランチの運用モデルとして、A successful Git branching modelを紹介します。
    日本語訳:
    http://keijinsonyaban.blogspot.jp/2010/10/successful-git-branching-model.html
  #configurations.yml やroutes.rbなど開発専用ファイルを設定

		rubocop ;bundle exec rspec ;script/exec_remote_integration_test.rb
		#本流ブランチの内容にあわせて手作業編集
			git diff [confilected file]
			vi [confilected file]
			git add  [confilected file]
			git diff --cached
		git rebase --continue
			#Gemfile変更かもしれないので起動確認
			RAILS_ENV=test rails c
			bundle install
			RAILS_ENV=test bundle exec rails c
			RAILS_ENV=test bundle exec rails s
			# not good?
				RAILS_ENV=integration_test  bundle exec rake db:migrate
				RAILS_ENV=test              bundle exec rake db:migrate
		git stash pop
		#conflict後の動作確認
			rspec
			rspec integration
		#continue後のローカルリポジトリーへのファイル追加
			git add [additional-filename]
			git commit --amend
			(commitとりけしは git reset --soft HEAD@{1}　)
			    head~n = -n generation
    head^n = -n parantes
			(continue後のstagingとりけしは git rm --cached [filename] )
	#状況に応じて現在のブランチ名変更
		git branch -m feature[new-name]
	#push to remote branch
		git push origin feature/ronri_sakujo
		#"To prevent you from losing history, non-fast-forward updates were rejectedi"
		# は+ブランチ名で強制する
		git push origin +feature/bukken_fudosan_saiban
		git push -f origin [branch-name] と同義
		#ローカルとリモートブランチ名がちがうときは、:でくぎる
		git push -f origin feature/togo_iko_buk_horei_seigen:feature/togo_hourei_tochitate
		#ptary_joishumoku= merge-requestig
		#Home-> 'Crete Merge Request'
		#description無記入、リクエスト後にdiscussion欄にマージ担当への挨拶記入
			(Gitlabのばあい。コミットメッセージに挨拶が混入しなくなる)
				検討課題： TODO コメント をご覧いただきたいと思います。あすの黒柳さんとの相談にもつながる箇所があるとおもいます。
				不明点：苗字の社歴というか現場歴がもっとも新参なので、「似て非なる処理対象」を厳密に理解できているか、あやしい。
					例：土地建物transformer 36行目：       when JBSC.uri_kodate, JBSC.chintai_kyojuyo_ichibu, JBSC.chintai_kyojuyo_ikkatsu
					　　　　　　居住用（一部）と居住用（一括）両方を条件に加えている、
					　　　　　　というのは「おそらくこういう仕様でこういう条件だろう」という推測の部分がふくまれます。

		宿口さん仕様レビュー、綿貫さん後続レビューをおねがいいたします。
		#Assignee変更でマージ担当が変更できる
		#Gemfile個人設定にもどす
			git stash pop
			git reset HEAD (<--staging cancel)
			cp -p /home/apl/.gitconfig /root/
			cat  /root/.gitconfig
			git checkout master
			git status
			git pull      差分解消
				エラーには
					git commit -a   <--'automatic'
				か　
					git reset --hard　
				で対処
			git status
			git branch -a
			git bra:qnch
			git push origin master
			ls -alt /root/.git*
			git status
			git rm config/routes.rb~ db/schema.rb
			git rm config/environments/development.rb~
		★refrain
			git status
			git st
			git diff [suspicious filename X]
			git add [suspicious filename X]
		★refrain
			git commit -m "some_body:苗字外部出力作成部分 不要ファイル削除版"
			git pull  #<----auto-merge 同じ窓で作業せず､初回pull履歴を別窓に貼って一気に修正すること｡
			git add [手でmerge編集した個別のconflicted file]
			git diff
		★end of refrain
			git push origin master
			git branch -a
			Rails.root.Gemfile* Plugin[pluginname]Gemfile* をdiff後に復帰
			remote 削除はgit rm [deletable remote-filename]
		★pattern#2 rebase and push
		#submodule
			2450  vim ../.git/modules/cms/config
			2451  vim ../.git/config
			2454  vim ../.gitmodules

　　#windows
	find . -name *.rdf -o  -name *.sw* -o -name *.log -o -name *.*~ -o -name Thumbs.* -print |xargs rm --verbose
　　#linux
	find . -name *.rdf -o  -name *.sw* -o -name *.log -o -name *.*~  -print |xargs rm --verbose
rm ../public/*.rdf;  rm ../logs/*.log
find ./ -name *vim73* -print |xargs rm -rf --verbose
	git add [files 1..n]
	git commit -m ""
	git status
	git fetch
	git status
	git stash save
	git pull --rebase origin module_board
	git status
	git push origin module_board
	git stash pop
	★こわれそうなとき、堂々巡りのときはcloneしなおす
　　git reflog
	git reset --hard HEAD@{6}
**日々の開発のブランチの使い方**
1. git checkout master
2. git pull origin master
3. git checkout -b feature-XXXXX
4. 修正をガシガシやる
5. git add && git commmit
6. 自信がない場合はここでbackup用のブランチを作成しとくと、めちゃくちゃになってもここで作ったブランチに戻せばなんとかなる。
7. git pull --rebase origin master
8. コンフリクトしたら色々直してaddして　git rebase --continue
9. git checkout master
10. git merge feature-XXXX --no-ff
11. git push origin master
feature-XXXとかはtopicブランチとかで検索すると意味がわかったりするかもしれませんが。
とりあえず機能追加はfeature-xxxx
バグフィックスはhotfix-xxxx
	#git そのほか
		stash一覧　（＋詳細つき）
			git stash list (-p)
			Stash-merge-conflict解消方法
			% git checkout --theirs test.txt
			直前のマージが衝突を起こしてまだ解決されていない時、ステージングエリアには“両側”の内容が記録されています。
			stashした内容を作業ツリーに持ってくるには--oursオプション、
			マージした内容を持ってくるには--theirsオプションを付けてgit checkoutコマンドを実行します。
			コンフリクトが発生した直後の状態にtest.txtを戻したい場合は、次のコマンドを実行します。
			% git checkout --merge test.txt

		★GIT禁則NG:
			Git revert [commit-id]も変な手編集のあとは怪しい動作をする。
		　 stashは手でマージするな・。
		git checkout [filename/commit-id]
			変更前に移動したりまたもとに戻ってきたりできる
			ここでの違いは、ワーキングツリーの変更されたファイルは保護されることだ。も
		し checkout コマンドに -f オプションを渡したら、reset --hard をしたのと同じこ
		とになる。ただし、checkout がワーキングツリーだけを変更するのに対して、reset
		--hard は現在のブランチの HEAD を、指定したバージョンの tree を参照するように
		変更する
		#gitでいろいろ とりけす方法
			git checkout [filename/commit-id]
				変更前に移動したりまたもとに戻ってきたりできる
				ここでの違いは、ワーキングツリーの変更されたファイルは保護されることだ。も
			し checkout コマンドに -f オプションを渡したら、reset --hard をしたのと同じこ
			とになる。ただし、checkout がワーキングツリーだけを変更するのに対して、reset
			--hard は現在のブランチの HEAD を、指定したバージョンの tree を参照するように
			変更する
			git revert
				変更をなかったことにするためのコミットを作る(ログに残る)
			git reset
				変更をなかったことにする
					--------------------------------------------------
				git reset --hard 05203ab6a8bfb4e18b01d831a745aad31fe26074
				git reset HEAD [filename-in-relative-path]
			#Gemfile.lockなどを中央管理からけすやりかた
				#管理下においてpush
				git add Gemfile.lock
				git add app/assets/javascripts/application.js
				git commit
				git push origin master
				#管理下からはずしてpush
				git rm app/assets/javascripts/application.js
				git rm Gemfile.lock
				<div class="actions">
					<%= f.submit %>
				</div>
			<% end %>
			root@localhost:/opt/me/sample# cat app/views/x06s/index.html.erb
				git commit
				git push origin master
			#git commitとりけし
			「git reset --soft filename」 → ワークディレクトリの内容はそのままでコミットだけを取り消す。
			「git reset --hard filename」 → コミット取り消した上でワークディレクトリの内容も書き換える。
			message cancel
			git commit --amend -m "fixed_commit_message_desu" -->

		#git検索
			特定のファイルの変更履歴を見る場合は
			git blame db/migrate/20130601182525_create_categories_contents.rb
			git log -p filename
			git log --follow -p filename
			コメント検索
			git log --grep=検索語正規表現
			ファイル名一覧だけ表示
			git show --name-only 1e78c04013e75b9faccc8d85c5d15741d770ebcd
			～以降の更新ファイル名差分だけ表示
　　  git diff --name-only eb7d5ebe05fae487fa7a89a03e4a0202c50cdda3

	#git試行錯誤環境
	　git co -b branchname
	　git co master
		git merge　branchname
		http://git-scm.com/book/ja/Git-%E3%81%AE%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E6%A9%9F%E8%83%BD-%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E3%81%A8%E3%83%9E%E3%83%BC%E3%82%B8%E3%81%AE%E5%9F%BA%E6%9C%AC

		path = cms
		url = git@github-ext.dena.jp:Thelxinoe/platinum-cms2.git
#git障害対応
	*GIT: error: bad index file sha1 signature fatal: index file corrupt
		rm .git/index; git reset
	*error: src refspec maser does not match any.
	*error: failed to push some refs to 'https://github.com/sigmixcorp/oksales.git'
		git show-ref ;
		git push origin HEAD:master
	*unable to update local ref)
		git gc --prune=now
		git remote prune origin
	*git branch detached from ([local branch name])
		差分fileをバックアップ待避 (Rails4root/binは不要)
		git checkout master
		差分fileを上書き復元
		commit & push
	* fatal: Unable to create '/opt/me/oksales_unistandard/.git/index.lock':
		rm .git/index.lock
	fatal: refusing to merge unrelated histories
		git merge --allow-unrelated-histories  対象ローカルブランチ名
**git-sub-module**
	$ cat ../.gitmodules 
	[submodule "cms"]
	path = cms
	url = git@github-ext.dena.jp:Thelxinoe/platinum-cms2.git

**逆引き：git**
	error: Cannot access URL http://.../, return code 22
		.gitconfigに名前など設定
		git config -l;
		git remote rm origin; git remote add origin http://some_body:AlphaNumerics@192.168.200.200/git/ndc10-enju-management




==========

初心者手順



git
	linux GUI

	commit=pg uploading
	clone = pg downloading with history

	push = history uploading
		default repositry name = 'origin'
	pull = histoy downloading
		default repositry name = 'origin'
		エラーには
			git commit -a 	<--'automatic'
		か　
			git reset --hard　
		で対処

	merge(ウィthnon-fast-forwarding option)
	統合ブランチ（本流）と
	トピックブランチ（支流）
		default repositry name = 'head'
		checkout [of some branch]= work tree place of head
			stash	=	まだコミットしていない変更点が他のブランチのヘッドに移ることをふせぐ変更点隔離措置



		head~n = -n generation
		head^n = -n parantes

	mergeとrebaseは共に履歴を統合しますが、特徴が異なります。
		merge
		変更内容の履歴はそのまま残るが、履歴が複雑になる。
		rebase
		履歴は単純になるが、元のコミットから変更内容が変更される。
		そのため、元のコミットを動かない状態にしてしまうことがある。
		mergeとrebaseは、チームの運用方針に応じて使い分けます。
		例えば、履歴を一本化するように運用をするのであれば

		トピックブランチに統合ブランチの最新のコードを取り込む場合はrebaseを使う
		統合ブランチにトピックブランチを取り込む場合は、まずrebaseしてからmerge


		Gitでのブランチの運用モデルとして、A successful Git branching modelを紹介します。
		日本語訳:
		http://keijinsonyaban.blogspot.jp/2010/10/successful-git-branching-model.html





    #準備
    cp -p /home/apl/.gitconfig /root/
    cat  /root/.gitconfig
    git checkout master
    git status
    git pull			差分解消
    git status
    git branch -a
    git bra:qnch
    git push origin master
    ls -alt /root/.git*
    git status
    git rm config/routes.rb~ db/schema.rb
    git rm config/environments/development.rb~

	★refrain
    git status
    git st
    git diff [suspicious filename X]
    git add [suspicious filename X]

	★refrain
    git commit -m "some_body:苗字外部出力作成部分 不要ファイル削除版"
    git pull	#<----auto-merge 同じ窓で作業せず､初回おpull履歴を別窓に貼って一気に修正すること｡
    git add [手でmerge編集した個別のconflicted file]

		git diff
	★end of refrain


    git push origin master
    git branch -a
		Rails.root.Gemfile* Plugin[pluginname]Gemfile* をdiff後に復帰

		remote 削除はgit rm [deletable remote-filename]


  ★pattern#2 rebase and push
　　#windows
    find . -name *.rdf -o  -name *.sw* -o -name *.log -o -name *.*~ -o -name Thumbs.* -print |xargs rm --verbose
　　#linux
    find . -name *.rdf -o  -name *.sw* -o -name *.log -o -name *.*~  -print |xargs rm --verbose

rm ../public/*.rdf;  rm ../logs/*.log

find ./ -name *vim73* -print |xargs rm -rf --verbose

    git add [files 1..n]
    git commit -m ""
    git status
    git fetch
    git status
    git stash save
    git pull --rebase origin module_board
    git status
    git push origin module_board
    git stash pop

 ★こわれそうなとき、堂々巡りのときはcloneしなおす
　　git reflog
    git reset --hard HEAD@{6}


日々の開発のブランチの使い方
1. git checkout master
2. git pull origin master
3. git checkout -b feature-XXXXX
4. 修正をガシガシやる
5. git add && git commmit
6. 自信がない場合はここでbackup用のブランチを作成しとくと、めちゃくちゃになってもここで作ったブランチに戻せばなんとかなる。
7. git pull --rebase origin master
8. コンフリクトしたら色々直してaddして　git rebase --continue
9. git checkout master
10. git merge feature-XXXX --no-ff
11. git push origin master

feature-XXXとかはtopicブランチとかで検索すると意味がわかったりするかもしれませんが。
とりあえず機能追加はfeature-xxxx
バグフィックスはhotfix-xxxx



	#git そのほか
		stash一覧　（＋詳細つき）
			git stash list (-p)

      Stash-merge-conflict解消方法
      % git checkout --theirs test.txt
      直前のマージが衝突を起こしてまだ解決されていない時、ステージングエリアには“両側”の内容が記録されています。
      stashした内容を作業ツリーに持ってくるには--oursオプション、
      マージした内容を持ってくるには--theirsオプションを付けてgit checkoutコマンドを実行します。
      コンフリクトが発生した直後の状態にtest.txtを戻したい場合は、次のコマンドを実行します。
      % git checkout --merge test.txt



    ★GIT禁則NG:

       Git revert [commit-id]も変な手編集のあとは怪しい動作をする。
    　 stashは手でマージするな・。



    git checkout [filename/commit-id]
        変更前に移動したりまたもとに戻ってきたりできる
        ここでの違いは、ワーキングツリーの変更されたファイルは保護されることだ。も
    し checkout コマンドに -f オプションを渡したら、reset --hard をしたのと同じこ
    とになる。ただし、checkout がワーキングツリーだけを変更するのに対して、reset
    --hard は現在のブランチの HEAD を、指定したバージョンの tree を参照するように
    変更する



    #git localでいろいろ とりけす方法
      git checkout [filename/commit-id]
          変更前に移動したりまたもとに戻ってきたりできる
          ここでの違いは、ワーキングツリーの変更されたファイルは保護されることだ。も
      し checkout コマンドに -f オプションを渡したら、reset --hard をしたのと同じこ
      とになる。ただし、checkout がワーキングツリーだけを変更するのに対して、reset
      --hard は現在のブランチの HEAD を、指定したバージョンの tree を参照するように
      変更する

      git revert
          変更をなかったことにするためのコミットを作る(ログに残る)
      git reset
          変更をなかったことにする

    #git remote でいろいろ とりけす方法
     git push -f origin HEAD^:master
     #そのあとローカルの変更をpush

           --------------------------------------------------
        git reset --hard 05203ab6a8bfb4e18b01d831a745aad31fe26074
        git reset HEAD [filename-in-relative-path]

      #Gemfile.lockなどを中央管理からけすやりかた
        #管理下においてpush
        git add Gemfile.lock
        git add app/assets/javascripts/application.js
        git commit
        git push origin master
        #管理下からはずしてpush
        git rm app/assets/javascripts/application.js
        git rm Gemfile.lock

        <div class="actions">
          <%= f.submit %>
        </div>
      <% end %>
      root@localhost:/opt/me/sample# cat app/views/x06s/index.html.erb
        git commit
        git push origin master

      #git commitとりけし
      「git reset --soft filename」 → ワークディレクトリの内容はそのままでコミットだけを取り消す。
      「git reset --hard filename」 → コミット取り消した上でワークディレクトリの内容も書き換える。

      message cancel
      git commit --amend -m "fixed_commit_message_desu" -->



    #git検索
      特定のファイルの変更履歴を見る場合は
      git blame db/migrate/20130601182525_create_categories_contents.rb

      git log -p filename
      git log --follow -p filename

      コメント検索
      git log --grep=検索語正規表現

     ファイル名一覧だけ表示
     git show --name-only 1e78c04013e75b9faccc8d85c5d15741d770ebcd

     ～以降の更新ファイル名差分だけ表示
　　  git diff --name-only eb7d5ebe05fae487fa7a89a03e4a0202c50cdda3




    #git試行錯誤環境
    　git co -b branchname
    　git co master
      git merge　branchname
     http://git-scm.com/book/ja/Git-%E3%81%AE%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E6%A9%9F%E8%83%BD-%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E3%81%A8%E3%83%9E%E3%83%BC%E3%82%B8%E3%81%AE%E5%9F%BA%E6%9C%AC


    #git障害対応
      *GIT: error: bad index file sha1 signature fatal: index file corrupt
        rm .git/index; git reset
      *error: src refspec maser does not match any.
      *error: failed to push some refs to 'https://github.com/*****/*****.git'
        git show-ref ;
        git push origin HEAD:master

      *unable to update local ref)
         git gc --prune=now
         git remote prune origin

      *git branch detached from ([local branch name])
        差分fileをバックアップ待避 (Rails4root/binは不要)
        git checkout master
        差分fileを上書き復元
        commit & push
      * fatal: Unable to create '/opt/me/oksales_unistandard/.git/index.lock':
        rm .git/index.lock