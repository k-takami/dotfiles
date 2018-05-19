#vim差分 
	g;    --> jump to previous editing place 
	dap   --> delete paragraph block 
config
	yum -y install vim-enhanced
		vi /etc/profile || ~/bashrc
			# 最終行にエイリアス追記
				alias vi='vim'
	#1設定ファイル移植
		cd ~;rm vimhomeold.tar*;tar -cvf vimhomeold.tar .vim* *vim* .ve_* MyWiki/ .*rc  ;gzip vimhomeold.tar; cd -
		chgrp -R root .vim* *vim* .ve_* MyWiki/ .*rc
		chown -R root .vim* *vim* .ve_* MyWiki/ .*rc    
		vim -S ~/Session.vim +VE +MRU
		:source ~/.vimrc
	CTRL-W =        Make all windows (almost) equally high and wide,
		: set scrollbind   ;2窓同時スクロール　左ペインでコマンド発行
	#diff
		:vertical diffsplit C:\VMstatic\SOAP\SOAPClientExample-1.2\adsoltest.xml
		#今のペインをdiffモードにきりかえ｡左右両窓でやる
			:diffthis 
	#カーソル下利用
		* 検索
		yiw yank
	・spell checker
		:setlocal spell spelllang=en_us | set spell
		:set nospell
		:h spell
		[s / ]s  <--  jump prev/fwd
		z=       <--- suggest
		zg / zw  <--- register current word as good/wrong
	ファイルの文字コードや、改行コードを変更 
		" 文字コードutf-8を指定保存。
		:set fenc=utf-8
		" Unixの改行形式を指定。
		:set ff=unix
		" Windowsの改行形式を指定。
		:set ff=dos
		" Macの改行形式を指定。
		:set ff=mac
	
	combo
		「++enc」「++ff」を同時に指定する場合のコマンド例
		:e ++ff=unix ++enc=utf-8
	encoding change
		" エンコーディングeuc-jpを指定して開き直す。
		:e ++enc=euc-jp
		" エンコーディングshift_jisを指定して開き直す。
		:e ++enc=shift_jis
		" エンコーディングutf-8を指定して開き直す。
		:e ++enc=utf-8
	・文字コードの変更
		:set fileencoding=文字コード
		:set fenc=文字コード (上のコマンドの短い形式。こちらでも良い。)
		:set fileencoding=euc-jp (エンコーディングEUC-JPに変更。)
		:set fileencoding=shift_jis (エンコーディングSHIFT_JISに変更。)
		:set fileencoding=utf-8 (エンコーディングUTF-8に変更。)
	・ファイルフォーマットの種類の変更
		:set fileformat=ファイルフォーマットの種類
		:set ff=ファイルフォーマットの種類 (上のコマンドの短い形式。こちらでも良い。)
		:set fileformat=dos (改行をWindowsの形式に変更。)
		:set fileformat=mac (改行をMacの形式に変更。)
		:set fileformat=unix (改行をUnixの形式に変更。)
	#plugin
		#align
			comment box square:     :\abox
				:AlignCtrl |
				:Align -\+
			" 最初のセパレータを左寄せ
			" 2番目のセパレータを左寄せ
			" 3番目のセパレータを右寄せ
			" 以後、ループ
			:AlignCtrl <<>
	#vimgrep補習
		" カレントディレクトリ以下のあらゆるファイルを対象にする
		:vim {pattern} **
		" app/views以下のあらゆるファイルを対象にする（ディレクトリを再帰的に検索）
		:vim {pattern} app/views/**
		" app/views/users内のファイルを対象にする
		:vim {patter} app/views/users/*
		" app/views以下で_で始まるerbファイルを対象にする
		:vim {pattern} app/views/**/_*.erb
		:ar path/to/search/dir/**
		何度も同じ検索対象を使う場合?――>## 展開
		:vim foo ##
	
#vim-command 
	変換
		雑文構造化　:%s/\n\n\n*/\r/gc | %s/\t/  /gc
		文字列比較(全角半角同一視)
		　=EXACT(LOWER(E2), LOWER(J2))
		半角変換
		　=ASC("ペット相談有無フラグが atbb定数")
		// CRLF変換@VIM
			:set fileformat=ファイルフォーマットの種類
			:set ff=ファイルフォーマットの種類 (上のコマンドの短い形式。こちらでも良い。)
			:set fileformat=dos (改行をWindowsの形式に変更。)
			:set fileformat=mac (改行をMacの形式に変更。)
			:set fileformat=unix (改行をUnixの形式に変更。)
		#SGS//vim MPE testingvimgrep /\(2507\|5002\|2606\).*31546960/ D:\temp\MPE-IDV-containingTestProducts-full\**/*#//VENUS flat 改行:%s/EO/\rEO/gc|M/\d{6}301700 
		#HTML-sidebar into selenium Curser
			:%s/.*href="/open<\/td>/gc
			:%s/".*/<\/td><\/td><\/tr>/gc
			:%s/\/e\//${site_root}\/e\//gc
			:%s/###/### /gc
				#コメントpatternは　＊＊＊＊
		ruby/JS ハッシュ
			=LOWER(E8)& ": :" & LOWER(J8)&","
			//before Rails STDOUT diff
				年月日&実行時間抽象化　:%s/\[.*\]//gc | %s/(\d\d*\.\dms)//gc
				UUID抽象化： :%s/uid=\w*/uid=.../gc | diffthis
		rb2rspec  **rubyソースからRSpecシナリオに**
			$ grep "^.*# "  [filename]
			%s/\(^  *\)# \(.*\)/\1it "\2" do end/gc
		//Excel//excel列→vim正規表現%s/\n/|/ |%s/|$// |%s/^/(/ |%s/|*// |%s/|*$/)/ //excel列→vim正規表現 括弧なし%s/\n/|/ |%s/|$// |%s/|*// |%s/|*$////vimgrep結果をTSVに%s/ */|\t/gc | %s/ */|\t/gc//Excelタテ2列をSQL横1行に%s/\t//gc | %s/\n/,/gc//vlookup常套句=IF(VLOOKUP( D167 ,'notify to'!A2:A36,1)<>"", D167 ,"ng"):%s/\t//gc Excelで文字列組み立てる 　 ="transform :"&J36&", method: transform_" & J36 &" # 設備特記"
		#Office365toExcel
			go to https://outlook.office.com/owa/?path=/mail/sentitems and sort itema in time sequence
			:%s/\(出社時間.\|退社時間.\|休憩時間.\|作業時間.\|【\|】\|■今日の作業 *\n/\)//gc
			
Vi機能別主要コマンドリファレンス
	起動
	% vi フォアグラウンド起動
	% vi <ファイル名> <ファイル名>のファイルを読み込んで起動
	終了
	:q 終了
	:wq 保存して終了
	:q!  保存せずに強制終了
	ZZ 終了（内容が変更された場合は保存して終了）
	モード移行
	ESC コマンドモードへ移行
	i カーソルの左隣へ挿入
	a カーソルの右隣へ挿入
	I カーソル行の先頭に挿入
	A カーソル行の末尾に挿入
	O カーソル行の上に1行空けて挿入
	o カーソル行の下に1行空けて挿入
	カーソル操作
	h 1文字左へ
	j 1行下へ
	k 1行上へ
	l 1文字右へ
	0 カーソル行の左端へ
	^ 行頭（行頭が空白の場合は空白部分の右）へ
	$ 行末へ
	- 1行上の左端へ
	RETURN 1行下の左端へ
	b 左隣の単語の先頭へ
	w 右隣の単語の先頭へ
	e 単語の末尾へ
	カーソル位置が単語の途中の場合はその単語の末尾
	カーソルが単語末尾なら次の単語の末尾
	カーソルが行末なら次行先頭の単語の末尾
	H 画面最上行の左端へ
	M 画面中央行の左端へ
	L 画面最下行の左端へ
	nG ファイルの先頭からn行目の左端へ
	画面操作
	C-f 1ページ分下に画面を移動
	C-b 1ページ分上に画面を移動
	C-d 半ページ分下に画面を移動
	C-u 半ページ分上に画面を移動
	C-l 画面を再描画
	C-g 行番号を表示
	検索
	/<文字列> <文字列>を順方向に検索
	f<文字> <文字>を順方向に検索
	?<文字列> <文字列>を逆方向に検索
	F<文字> <文字>を逆方向に検索
	n 順方向に検索を再実行
	N 逆方向に検索を再実行
	削除
	x カーソル上一文字削除
	X カーソル左一文字削除
	dd カーソル行削除
	dw カーソル位置から現単語末尾まで削除
	df<文字> カーソル位置から<文字>の位置まで削除
	d^ カーソル位置から左削除
	d$ カーソル位置から右削除
	置換
	r カーソル上一文字置換
	R カーソル位置から複数文字置換
	s カーソル上一文字を複数文字に置換
	r カーソル行全体を置換
	cc カーソル行全体を置換
	cw カーソル位置から現単語置換
	cf<文字> カーソル位置から<文字>の位置まで置換
	貼付け
	yw カーソル位置の単語をコピー
	yy カーソル行をコピー
	P カーソル行の上にペースト（xやddで削除したものもペーストできる）
	p カーソル行の下にペースト（xやddで削除したものもペーストできる）
	ファイル操作
	:e <ファイル名> <ファイル名>を読込む
	:r <ファイル名> カーソル行の下に<ファイル名>の内容を挿入
	:w 上書保存
	:w <ファイル名> 編集中のデータを<ファイル名>のファイルに保存
	その他
		.  直前のコマンド繰返し
	u 直前に実行したコマンドの取り消し
	U カーソル行に対して行った変更を全部取消す
	:!cmd シェルコマンドの実行
	!!cmd コマンドを実行し，その結果を挿入
	:shell シェルを呼び出す。exitなどでシェルを抜ければviに戻る
	:set number 行番号を表示
	:set nonumber 行番号表示を止める
	:h ヘルプ表示
	:viusage [<コマンド>] viコマンドモードのコマンド一覧表示。<コマンド>を付加するとそのコマンドの説明を表示。
	:exusage [<コマンド>] exコマンドモードのコマンド一覧表示。<コマンド>を付加するとそのコマンドの説明を表示。 
よく使うコマンド†
	h           ←
	j           ↓
	k           ↑
	l           →
	<C-f>       PageDown
	<C-b>       PageUp
	カーソル移 gg          ファイルの先頭へ移動
	動         G           ファイルの末尾へ移動
		^           行頭へ移動
		$           行末へ移動
		H           画面上の１行目へ移動（2Hで２行目へ）
		M           画面中央行へ移動
		L           画面上の最下行へ移動（2Lで下から２行目へ）
		%           対応する括弧へ移動
		z<enter>    現在のカーソルがページのトップになる
		x           文字削除
		dd          行削除
		D           カーソル位置から行末まで削除
		J           次の行と連結する（カレント行の改行等削除）
		~           カーソル位置の文字の大文字/小文字を切換える (a -> A and A -> a)
		<C-a>       カーソル位置の数字を１つ増やす(0x100という形なら16進数と見なし
	編集                   てくれる)
		<C-x>       カーソル位置の数字を１つ減らす
		>           カーソル位置の行をインデントする
		<           カーソル位置の行を逆インデントする
			インデントの体裁を整える。
		gg=G        ファイルの先頭に移動し(gg)、= によるインデントの修正をG(ファイ
			ルの末尾)まで行う。
	UNDO       u           UNDO
		<C-r>       REDO
		/keyword    keywordを検索する
	検索       n           次のkeywordに移動する
		N           前のkeywordに移動する
		:%s/from/to 全行に対してfromをtoに置換する。（gをつけると行中で複数マッチす
	置換       /[g]        る。）
		:n1,n2s/    n1行目からn2行目の範囲に対してfromをtoに置換する。（nに . を指
		from/to/[g] 定するとカレント行、$ は最終行の意味になる）
		qx          レジスタxへコマンドの記録を開始する。（レジスタに利用出来るのは
			a-z の26文字）
		qX          レジスタxへコマンドの追記を開始する。（通常レジスタは小文字を使
	レジスタを             うが、大文字への記録は追記になる）
	使う       q（記録中に 記録を終了する。
		）
		@x          レジスタxに記録されたコマンドを再生する。
		@@          最後に実行したレジスタを再生する。
		v           カーソルで範囲選択が出来るようになる（y や d で yank や切り取り
			が出来る）
		V           行選択モード
			ボックス選択モード
	ビジュアル
	モード     <C-v>       以下のような３行を行末まで選択するには $ する。
		****
		*******
		**
		gv          最後の選択範囲を選択しなおす（間違えてESC押したりして選択範囲が
			クリアされてしまった時などに使う）
		:sp         画面を水平に分割する
		:vsp        画面を垂直に分割する
		<C-w><C-w>  分割したウィンドウ間を順番に移動する。
		<C-w>       分割したウィンドウ間を{上,下,左,右}に移動する
		{h,j,k,l}
		<C-w>       カーソルのあるウィンドウ位置を一番{上,下,左,右}に移動する
	画面分割   {H,J,K,L}
		:q          ウィンドウを閉じる。
		:qall       すべてのウィンドウを閉じて終了する
		:only       カーソルのあるウィンドウ以外を全部閉じる。
		<C-w>+      ウィンドウサイズを増やす。
		<C-w>-      ウィンドウサイズを減らす。
		<C-w>o      今のウィンドウ以外を閉じる
		:q[!]       閉じる（保存しないで編集を破棄してでも閉じる）
	ファイル   :w[!]       保存（読み込み専用ファイルでも保存する）
		ZZ          保存して閉じる
		:new|edit   fileを開く
		file
	複数ファイ :ls         バッファ一覧表示
	ル         :bp         前のバッファ
		:bn         次のバッファ
		:bd         バッファを消す
	ディレクト :cd path    カレントディレクトリを path に移動する。
	リ移動     :cd %:h     カレントディレクトリを現在編集中のファイルのあるパスへ移動する
		。
		:!cmd       cmdを実行してステータスラインの下へ結果を表示(編集中のバッファ
			には影響しない)
	システムコ :範囲指定!  選択範囲のバッファをcmdの標準入力に流し込み、代わりにcmdの出力
	マンド     cmd         で置換する。
		例えば :%!sort を実行すればバッファ全行がsortされる。
		:r!cmd      cmdを実行して標準出力をカーソル位置へ挿入
		ga          カーソル位置の文字コードの値を調べる。
	その他     :ascii
		:!cmd       外部プログラムを実行する
#苗字がよくつかうコマンド
	vim -S Session.vim +VE   <---> after closing VE window by "qa", do ":mks[ession]"
	vim -S ~/Session.vim +VE +tabnew +BookmarksPage
	:helptags ++t ~/.vim/doc
	:helptags ++t $VIMRUNTIME/doc
	|CTRL-^|   N   CTRL-^    Edit alternate file N (equivalent to ":e #N").
	|gf|         gf  or ]f  Edit the file whose name is under the cursor
	|:dig|     :dig[raphs]    show current list of digraphs
	/////vim
	whereis vim --->  /usr/bin/vim /usr/bin/vim.basic /etc/vim /usr/share/vim /usr/share/man/man1/vim.1.gz
	/usr/share/vim/vim71/plugin
	#keymapping
		F9    (vimrc-customized) reload .vimrc
		C+]  :  rcodetool+fri help 
		\r  :  rcodetool+fri fuzzy help showing andidate
		C-XC-O : omni-completion by vim-ruby (app+gem I/F)
		C-xC-u : user-defined-omini-completion by rcodetool
		F7F8F12:  xmpfilter  
	改行をなくして連結する(各行末に空白なし） g shift + j
	マクロ（記録開始）:qa　aは任意のアルファベット
	マクロ（記録終了）:q
	マクロ（実行）:@a aは記録したマクロのキー
	畳み込み　set fdm=marker
	R    いまのファイルを更新表示（よみなおし）
	zA    toggle curent open/close of folding
	zM    Close all folds: set 'foldlevel' to 0. 'foldenable' will be set.
	zR    Open all folds.  This sets 'foldlevel' to highest fold level.
		開く. 大文字だと中も再起的に. zo, zO
		たたむ. 大文字だと外まで再起的に.# zc, zC - close,
		foldの作成.zf
		全体的に１段開く(foldlevel+=1). zr
		全体的に１段閉じる(foldlevel-=1).zm
		そもそもインデントが崩れないようにコピペする:a
		改行をなくして連結する(各行末に空白あり）　shift + j
		コメントアウト（※繰り返すと消えます！ので、注意が必要です）\x
		コメントアウト（確実）　CTRL+Vで矩形選択後SHIFT+i // + ESC これで、ちょっとだけ待つと、矩形全体にコメントが入ります。
		インデント >とか、<
		コピペ対策自動インデント =
	名前つきバッファ("+大文字+ビジュアル選択)と履歴バッファ(:di)の活用
		MacやWindowsの操作を知っている人ならば,"a"から"z"までの26種類の名前のついた「クリップボード」があって,それぞれ自由にコピー,追加コピー,カット, ペーストなどの操作ができるようなものと思えば分かりやすいと思います
		たとえば,現在カーソルがある行全体を名前付きバッファ"a"に覚えておくようにしたいのであれば
		"ayy
		" (バッファ名)(コマンド)
		という形式で…つまり行単位のYankコマンドである yy コマンドの直前に「二重引用符とアルファベット小文字をひとつ」打つようにすると,いつもの yy と違って Yank内容を指定した名前の場所(バッファ)に格納 します
		(コマンド)部分では実際は 「Yank」,「削除」,「変更コマンド」のいずれかを打ちます
			* Yankコマンドならば Yankした領域
			* 削除コマンドならば 削除した領域
			* 変更コマンドならば 変更によって削除された領域
		いくつか例を書きます
		"gdw カーソル位置からカーソルのある単語の末尾までを削除しますその時に実際に削除された文字列は,名前つきバッファ g に入ります
		"by5H 「画面に表示されている上から5行目」からカーソル位置までの領域を, 名前つきバッファ b に入れます
		"ap とすれば,(この例なら) 名前つきバッファ a の内容をカーソル位置の後ろに書き出す ことになります. 通常のPutコマンドと同様に,格納する時に 行単位で入れたのであれば次の行に書き出されるし,文字単位で格納したのであればカーソル文字のすぐ後ろ に書き出されます
		"Ay$ とすれば,行末までのテキストは,今まで"a"に入っていた内容に追加されます
			追加するつもりで間違えて小文字で打ってしまったら,戻せないので気を付けて操作しましょう
		:di または :dis または :display と打つと, 現在使われている バッファの一覧表示 をします
			まず, % には現在の編集対象ファイル名が入っています
			. (ピリオドです)には 最も最近挿入した文字列が入っています. 挿入モード中で CTRL-A や CTRL-@ キーを押した時に書き出される文字列です
			また, : (コロン)には 最も最近打ったコマンド文字列が入っています
			:di コマンドでも表示はされませんが - には「最も最近に一行以内の範囲を 削除した内容」が入ってます. 他にも,マニュアルにも書いてないバッファがあるみたいです
		"3p なら 3番目の履歴内容が書き出されるといった具合に使えます
		また,すでに挿入モードにいる時であれば 挿入モードのまま CTRL-R を押してからバッファ名の文字を押した瞬間に 内容がカーソル位置に書き出されます
		例えば 挿入中に CTRL-R a などという操作で 名前aの内容を書き出すことができます
		普段, 名前をつけないで削除,Yank,変更コマンドを使っている時には 文字列はどこに記録されているのかというと… " という名前(二重引用符一個だけの名前です)で記録されています. これはいわゆる「一時バッファ」の名前 というわけです. よって, 普段 名前を指定せずに使っている p や P コマンドは ""p とか ""P と打つのと全く同じで, 普段打っているコマンドはこれの省略形 のようなものだということです. そしてこの内容は削除やYankや変更コマンドを実行するたびに 内容が書きかわります
	CTRL-Z または :suspend --> {任意のシェルコマンドを実行}a --> fgでresume
	1. Introduction            *tab-page-intro*
		A tab page holds one or more windows.  You can easily switch between tab
		pages, so that you have several collections of windows to work on different
		things.
		Usually you will see a list of labels at the top of the Vim window, one for
		each tab page.  With the mouse you can click on the label to jump to that tab
		page.  There are other ways to move between tab pages, see below.
		Most commands work only in the current tab page.  That includes the |CTRL-W|
		commands, |:windo|, |:all| and |:ball| (when not using the |:tab| modifier).
		The commands that are aware of other tab pages than the current one are
		mentioned below.
		Tabs are also a nice way to edit a buffer temporarily without changing the
		current window layout.  Open a new tab page, do whatever you want to do and
		close the tab page.
		==============================================================================
		2. Commands            *tab-page-commands*
		OPENING A NEW TAB PAGE:
		When starting Vim "vim -p filename ..." opens each file argument in a separate
		tab page (up to 'tabpagemax'). |-p|
		A double click with the mouse in the non-GUI tab pages line opens a new, empty
		tab page.  It is placed left of the position of the click.  The first click
		may select another tab page first, causing an extra screen update.
		This also works in a few GUI versions, esp. Win32 and Motif.  But only when
		clicking right of the labels.
		In the GUI tab pages line you can use the right mouse button to open menu.
		|tabline-menu|.
		:tabe[dit]        *:tabe* *:tabedit* *:tabnew*
		:tabnew    Open a new tab page with an empty window, after the current
			tab page.
		:tabe[dit] [++opt] [+cmd] {file}
		:tabnew [++opt] [+cmd] {file}
			Open a new tab page and edit {file}, like with |:edit|.
		:tabf[ind] [++opt] [+cmd] {file}      *:tabf* *:tabfind*
			Open a new tab page and edit {file} in 'path', like with
			|:find|.
			{not available when the |+file_in_path| feature was disabled
			at compile time}
		:[count]tab {cmd}          *:tab*
			Execute {cmd} and when it opens a new window open a new tab
			page instead.  Doesn't work for |:diffsplit|, |:diffpatch|,
			|:execute| and |:normal|.
			When [count] is omitted the tab page appears after the current
			one.  When [count] is specified the new tab page comes after
			tab page [count].  Use ":0tab cmd" to get the new tab page as
			the first one.  Examples: >
				:tab split  " opens current buffer in new tab page
				:tab help gt  " opens tab page with help for "gt"
		CTRL-W gf  Open a new tab page and edit the file name under the cursor.
			See |CTRL-W_gf|.
		CTRL-W gF  Open a new tab page and edit the file name under the cursor
			and jump to the line number following the file name.
			See |CTRL-W_gF|.
		CLOSING A TAB PAGE:
		Closing the last window of a tab page closes the tab page too, unless there is
		only one tab page.
		Using the mouse: If the tab page line is displayed you can click in the "X" at
		the top right to close the current tab page.  A custom |'tabline'| may show
		something else.
			*:tabc* *:tabclose*
		:tabc[lose][!]  Close current tab page.
			This command fails when:
			- There is only one tab page on the screen.    *E784*
			- When 'hidden' is not set, [!] is not used, a buffer has
				changes, and there is no other window on this buffer.
			Changes to the buffer are not written and won't get lost, so
			this is a "safe" command.
		:tabc[lose][!] {count}
			Close tab page {count}.  Fails in the same way as ':tabclose"
			above.
				*:tabo* *:tabonly*
		:tabo[nly][!]  Close all other tab pages.
			When the 'hidden' option is set, all buffers in closed windows
			become hidden.
			When 'hidden' is not set, and the 'autowrite' option is set,
			modified buffers are written.  Otherwise, windows that have
			buffers that are modified are not removed, unless the [!] is
			given, then they become hidden.  But modified buffers are
			never abandoned, so changes cannot get lost.
		SWITCHING TO ANOTHER TAB PAGE:
		Using the mouse: If the tab page line is displayed you can click in a tab page
		label to switch to that tab page.  Click where there is no label to go to the
		next tab page.  |'tabline'|
		:tabn[ext]        *:tabn* *:tabnext* *gt*
		<C-PageDown>        *CTRL-<PageDown>* *<C-PageDown>*
		gt          *i_CTRL-<PageDown>* *i_<C-PageDown>*
			Go to the next tab page.  Wraps around from the last to the
			first one.
		:tabn[ext] {count}
		{count}<C-PageDown>
		{count}gt  Go to tab page {count}.  The first tab page has number one.
		:tabp[revious]        *:tabp* *:tabprevious* *gT* *:tabN*
		:tabN[ext]        *:tabNext* *CTRL-<PageUp>*
		<C-PageUp>       *<C-PageUp>* *i_CTRL-<PageUp>* *i_<C-PageUp>*
		gT    Go to the previous tab page.  Wraps around from the first one
			to the last one.
		:tabp[revious] {count}
		:tabN[ext] {count}
		{count}<C-PageUp>
		{count}gT  Go {count} tab pages back.  Wraps around from the first one
			to the last one.
		:tabr[ewind]      *:tabfir* *:tabfirst* *:tabr* *:tabrewind*
		:tabfir[st]  Go to the first tab page.
			*:tabl* *:tablast*
		:tabl[ast]  Go to the last tab page.
		Other commands:
			*:tabs*
		:tabs    List the tab pages and the windows they contain.
			Shows a ">" for the current window.
			Shows a "+" for modified buffers.
		REORDERING TAB PAGES:
		:tabm[ove] [N]            *:tabm* *:tabmove*
			Move the current tab page to after tab page N.  Use zero to
			make the current tab page the first one.  Without N the tab
			page is made the last one.
		LOOPING OVER TAB PAGES:
			*:tabd* *:tabdo*
		:tabd[o] {cmd}  Execute {cmd} in each tab page.
			It works like doing this: >
				:tabfirst
				:{cmd}
				:tabnext
				:{cmd}
				etc.
		<    This only operates in the current window of each tab page.
			When an error is detected on one tab page, further tab pages
			will not be visited.
			The last tab page (or where an error occurred) becomes the
			current tab page.
			{cmd} can contain '|' to concatenate several commands.
			{cmd} must not open or close tab pages or reorder them.
			{not in Vi} {not available when compiled without the
			|+listcmds| feature}
			Also see |:windo|, |:argdo| and |:bufdo|.
		=  
	gHL  :全角半角スイッチ
	:tabm[ove] [N]            *:tabm* *:tabmove*
ウィンドウの分割
	関係のない２つの違ったファイルを表示したい。１つのファイルの２個所を同時に
	見たい。２つのファイルを横に並べて差分を見てみたい。
	ウィンドウ分割を使えばどれもできてしまいます。
	|08.1| ウィンドウの分割
	|08.2| ウィンドウを分割してファイルを開く
	|08.3| ウィンドウのサイズ
	|08.4| 縦分割
	|08.5| ウィンドウの移動
	|08.6| 全ウィンドウに対するコマンド
	|08.7| vimdiff で差分を表示する
	|08.8| その他
	|08.9| タブページ
	次章: |usr_09.txt| GUI を使う
	前章: |usr_07.txt| 複数のファイルを開く
	目次: |usr_toc.txt|
	==============================================================================
	*08.1* ウィンドウの分割
	新しいウィンドウを開く一番簡単なコマンドはこれです。
	:split
	画面が２つのウィンドウに分割されます。カーソルは上側のウィンドウに置かれます。
	+----------------------------------+
	|/* file one.c */ |
	|~ |
	|~ |
	|one.c=============================|
	|/* file one.c */ |
	|~ |
	|one.c=============================|
	| |
	+----------------------------------+
	二つのウィンドウに同じファイルが表示されています。"====" のラインはステータス
	行です。各ウィンドウの一番下にあってそのウィンドウの情報を表示します。(実際に
	はステータス行は反転表示になります)
	各ウィンドウには同じファイルの違う場所を表示できます。例えば、上側のウィンド
	ウにはプログラムの変数宣言部を表示し、下の方にはその変数を使っている箇所を
	表示させる、といったことができます。
	CTRL-W w コマンドでウィンドウ間をジャンプできます。上側のウィンドウにカーソル
	がある時に CTRL-W w を押すとその下のウィンドウにジャンプします。一番下のウィン
	ドウにカーソルがある時は一番上のウィンドウに戻ります。(CTRL-W CTRL-W も同じ動
	作をするので、CTRL キーを離すのがちょっと遅れても大丈夫です)
	ウィンドウを閉じる
	------------------
	ウィンドウを閉じるのは次のコマンドです。
	:close
	":quit" や "ZZ" のようなファイルを閉じるコマンドでもウィンドウを閉じることがで
	きますが、":close" を使えば、最後のウィンドウを閉じて Vim を終了してしまうよう
	な間違いを防げます。
	他ウィンドウを全部閉じる
	------------------------
	ウィンドウをたくさん開いたときに、どれか一つのウィンドウに集中したいと思った場
	合は、次のコマンドが便利です。
	:only
	カーソルのあるウィンドウを残して全てのウィンドウが閉じます。他のウィンドウに保
	存されていない変更がある場合には、エラーメッセージが表示され、そのウィンドウは
	閉じません。
	==============================================================================
	*08.2* ウィンドウを分割してファイルを開く
	次のコマンドを実行すると、２つ目のウィンドウが開き、指定されたファイルの編集が
	開始されます。
	:split two.c
	例えば、one.c を編集していたなら、結果は次のようになります。
	+----------------------------------+
	|/* file two.c */ |
	|~ |
	|~ |
	|two.c=============================|
	|/* file one.c */ |
	|~ |
	|one.c=============================|
	| |
	+----------------------------------+
	新しいウィンドウに新規ファイルを開くには、次のコマンドを使います。
	:new
	":split" や ":new" コマンドを使って好きなだけウィンドウを作成できます。
	==============================================================================
	*08.3* ウィンドウのサイズ
	":split" コマンドは数値を引数として取れます。その値は新しいウィンドウの高さと
	なります。例えば、次のコマンドは３行分の高さのウィンドウを作成し、alpha.c を開
	きます。
	:3split alpha.c
	ウィンドウのサイズを変更する方法はいくつかあります。マウスが使えれば話は簡単で
	す。ウィンドウを分割しているステータス行にマウスを動かし、上下にドラッグしてく
	ださい。
	ウィンドウを大きくするには次のようにします:
	CTRL-W +
	小さくするには次のようにします:
	CTRL-W -
	どちらのコマンドも数値を引数として取り、その行数分、ウィンドウサイズを増減しま
	す。つまり、"4 CTRL-W +" ならウィンドウが４行分大きくなります。
	ウィンドウの高さを明示的に指定するには次のコマンドを使います:
	{height}CTRL-W _
	{height} に数値を指定し、CTRL-W と _ (アンダースコア) を入力します。
	ウィンドウを最大まで大きくするには、CTRL-W _ コマンドを数値指定なしで実行して
	ください。
	マウスを使う
	Vim では様々なことをキーボードから極めて素早く操作できますが、残念ながら、ウィ
	ンドウサイズを変更するのは少し面倒です。この場合、マウスを使う方が簡単です。マ
	ウスポインタをステータス行に合せてから左ボタンを押してドラッグしてください。ス
	テータス行が動き、片方のウィンドウが大きくなり、もう片方は小さくなります。
	オプション
	'winheight' オプションにはウィンドウの最小の高さ (それ以上は小さくならない) の
	希望値を、'winminheight' には最小の高さの強制値を設定できます。
	同様に、'winwidth' オプションにはウィンドウの最小の幅の希望値を、'winminwidth'
	には最小の幅の強制値を設定できます。
	'equalalways' オプションが設定されていると、ウィンドウを閉じたり開いたりするた
	びに、全てのウィンドウのサイズが同じになります。
	==============================================================================
	*08.4* 縦分割
	":split" コマンドは現在のウィンドウの上側に新しいウィンドウを作ります。ウィン
	ドウを左側に作るには、次のコマンドを使います:
	:vsplit
	あるいは、
	:vsplit two.c
	実行後は次のようになります。
	+--------------------------------------+
	|/* file two.c */ |/* file one.c */ |
	|~ |~ |
	|~ |~ |
	|~ |~ |
	|two.c===============one.c=============|
	| |
	+--------------------------------------+
	中央の縦棒 (|) は実際には反転表示されます。これは縦セパレータと呼ばれ、これに
	よって左右のウィンドウが区切られます。
	ウィンドウを縦分割して新しい空ファイルを作成する ":vnew" コマンドもあります。
	次のコマンドでも同じことができます:
	:vertical new
	":vertical" コマンドは、ウィンドウを分割する他のコマンドにも適用できます。これ
	を指定すると、ウィンドウは横ではなく、縦に分割されるようになります。(ウィンド
	ウを分割しないコマンドの場合は何も変わりません）
	他のウィンドウへの移動
	横でも縦でも好きなようにウィンドウを分割できるので、自在にウィンドウを配置でき
	ます。他のウィンドウへ移動するには次のコマンドを使います。
	CTRL-W h 左側のウィンドウに移動
	CTRL-W j 下側のウィンドウに移動
	CTRL-W k 上側のウィンドウに移動
	CTRL-W l 右側のウィンドウに移動
	CTRL-W t 一番上のウィンドウに移動
	CTRL-W b 一番下のウィンドウに移動
	カーソル移動と同じ文字を使っていることに注目してください。もちろん、矢印キーも
	使うことができます。
	他のウィンドウへ移動するためのコマンドは他にもあります: |Q_wi|
	==============================================================================
	*08.5* ウィンドウの移動
	ウィンドウを分割したが、配置が好ましくなかった場合、ウィンドウをどこか別の場所
	に動かしたいと思うしょう。例えば、次のように三つのウィンドウがあるとします:
	+----------------------------------+
	|/* file two.c */ |
	|~ |
	|~ |
	|two.c=============================|
	|/* file three.c */ |
	|~ |
	|~ |
	|three.c===========================|
	|/* file one.c */ |
	|~ |
	|one.c=============================|
	| |
	+----------------------------------+
	明らかに一番下のウィンドウが一番上にくるべきです。一番下のウィンドウに移動して
	(CTRL-W w を使用)、次のコマンドを入力してください:
	CTRL-W K
	ここでは大文字の K を使います。これを実行すると、ウィンドウが一番上に移動しま
	す。上への移動に K が使われていることに注目してください。
	縦分割しているときに CTRL-W K を使うと、ウィンドウが一番上に移動し、Vim ウィン
	ドウと同じ幅になります。例えば、次のようなレイアウトになっているとします。
	+-------------------------------------------+
	|/* two.c */ |/* three.c */ |/* one.c */ |
	|~ |~ |~ |
	|~ |~ |~ |
	|~ |~ |~ |
	|~ |~ |~ |
	|~ |~ |~ |
	|two.c=========three.c=========one.c========|
	| |
	+-------------------------------------------+
	中央のウィンドウ (three.c) で CTRL-W K を実行すると、次のような結果になります:
	+-------------------------------------------+
	|/* three.c */ |
	|~ |
	|~ |
	|three.c====================================|
	|/* two.c */ |/* one.c */ |
	|~ |~ |
	|two.c==================one.c===============|
	| |
	+-------------------------------------------+
	他に同じようなコマンドが三つあります。(説明する必要はありませんね)
	CTRL-W H ウィンドウを左端に移動
	CTRL-W J ウィンドウを下端に移動
	CTRL-W L ウィンドウを右端に移動
	==============================================================================
	*08.6* 全ウィンドウを対象とするコマンド
	Vim を終了しようと思ったときに、複数のウィンドウが開いていた場合、ウィンドウを
	一つずつ閉じていけば Vim を終了できますが、次のコマンドを使えばもっと速く終了
	できます。:
	:qall
	これは "quit all" (すべて閉じる) という意味です。まだ保存していないファイルが
	ある場合は、Vim は終了しません。保存していないファイルを表示しているウィンドウ
	にカーソルが自動的に移動するので、":write" で保存するか ":quit!" で変更を破棄
	するかしてください。
	未保存のファイルを全て保存するには、次のコマンドを使ってください:
	:wall
	これは "write all" (すべて保存) という意味です。とはいっても、実際に保存される
	のは変更のあったファイルだけです。変更していないファイルを上書きしても意味がな
	いことを Vim はわかってますから。
	":qall" と ":wall" を組み合わせた "write and quit all" (すべて保存して終了) コ
	マンドもあります:
	:wqall
	このコマンドは、変更されたファイルをすべて保存して Vim を終了します。
	最後に、次のコマンドは、すべての変更を破棄して Vim を終了するコマンドです:
	:qall!
	このコマンドはアンドゥできないので、使う時には慎重に！
	引数で指定したすべてのファイルをウィンドウで開く
	それぞれのファイルごとにウィンドウを開くには、起動パラメタに "-o" を指定します。
	vim -o one.txt two.txt three.txt
	結果はこうなります。
	+-------------------------------+
	|file one.txt |
	|~ |
	|one.txt========================|
	|file two.txt |
	|~ |
	|two.txt========================|
	|file three.txt |
	|~ |
	|three.txt======================|
	| |
	+-------------------------------+
	起動パラメタ "-O" を使えば、ウィンドウが縦分割になります。
	Vim が既に起動している場合、":all" コマンドを使うと引数リストの各ファイルごと
	にウィンドウを開くことができます。":vertical all"だと縦分割になります。
	==============================================================================
	*08.7* vimdiff で差分を表示する
	特別な方法で Vim を起動すると、二つのファイルの差分を表示することができます。
	例えば、"main.c" というファイルを開き、どこかの行に文字を挿入したとします。そ
	して、オプション 'backup' を有効にしてファイルを保存しました。バックアップファ
	イル "main.c~" には変更前のファイルが保存されています。
	シェルで (vim上ではありません) 次のコマンドを入力します:
	vimdiff main.c~ main.c
	二つのウィンドウを左右に並べた状態で Vim が起動します。画面には先ほど文字を挿
	入した行とその前後の数行が表示されています。
	VV VV
	+-----------------------------------------+
	|+ +--123 lines: /* a|+ +--123 lines: /* a| <- 折り畳み
	| text | text |
	| text | text |
	| text | text |
	| text | changed text | <- 変更された行
	| text | text |
	| text | ------------------| <- 削除された行
	| text | text |
	| text | text |
	| text | text |
	|+ +--432 lines: text|+ +--432 lines: text| <- 折り畳み
	| ~ | ~ |
	| ~ | ~ |
	|main.c~==============main.c==============|
	| |
	+-----------------------------------------+
	(上の図は強調表示されてないので、ちゃんと見たければ、vimdiff コマンドを実行し
	てみてください)
	変更のない行は一行に折り畳まれて表示されます。これを閉じた折り畳みと呼びます。
	上の図では "<- 折り畳み" とある行がそうです。最初の折り畳みは 123 行を折り畳ん
	でいます。それらの行は両方のファイルで一致しています。
	"<- 変更された行" とある行は強調表示されていて、挿入した文字列が別の色で表示さ
	れています。強調表示されているので、どこが違うのかが一目でわかります。
	削除された行は main.c のウィンドウにあるように "---" と表示されます。上の図の、
	"<- 削除された行" とある行を見てください。実際には、そこに文字はありません。そ
	の行は、main.c を別のウィンドウと同じ行数で表示するために使われています。
	折り畳み表示列
	各ウィンドウの左側に色の違う列があります。上の図では "VV" で示されています。そ
	の列の、閉じた折り畳みのある行に、"+" 記号が表示されています。マウスポインタを
	その "+" 記号に合わせて、左ボタンをクリックしてください。折り畳みが開き、折り
	畳まれていたテキストが表示されます。
	開いた折り畳みは "-" 記号で表示されます。"-" 記号をクリックすると折り畳みは閉
	じます。
	当り前ですが、これはマウスが利用できる場合のみ機能します。キーボードの場合は
	"zo" で折り畳みを開いたり、"zc" で閉じたりできます。
	Vim の中で差分を取る
	Vim の中から差分モードを開始する方法もあります。"main.c" を開いて、ウィンドウ
	を分割し差分を表示するには、次のようにします:
	:edit main.c
	:vertical diffsplit main.c~
	":vertical" コマンドはウィンドウを縦分割するために使用します。使わなかった場合
	は横分割になります。
	パッチ、または diff ファイルがある場合は、三つめの方法で差分モードを開始できま
	す。最初に、パッチを適用するファイルを開き、次に、Vim にパッチファイルの名前を
	教えてやります:
	:edit main.c
	:vertical diffpatch main.c.diff
	警告: パッチファイルは、開いているファイル用のパッチが一つだけ含まれているもの
	でなければなりません。そうでない場合は、大量のエラーメッセージが表示されたり、
	予期せずに、他のファイルにパッチが適用されてしまう場合があります。
	パッチ処理は Vim 内部の、ファイルのコピーに対して実行されます。ハードディスク
	上のファイルは (それを上書きしない限り) 変更されません。
	同期スクロール
	ファイル間の差分がたくさんある場合、通常どおりスクロールすればそれらを表示でき
	ます。もう一方のウィンドウも同じ場所を表示するように自動的にスクロールされるの
	で、簡単に差分を並べて表示できます。
	同期スクロールを無効にするには、次のコマンドを使います:
	:set noscrollbind
	変更された場所にジャンプする
	折り畳みを無効にしている場合、変更された場所を見つけるのは簡単ではありません。
	次のコマンドを使うと、前方の変更にジャンプできます:
	]c
	逆方向にジャンプするには次のコマンドを使います:
	[c
	回数指定を使えば、さらに遠くまでジャンプできます。
	変更を取り除く
	ウィンドウからウィンドウへテキストを移動できます。これによって、差分が増えたり
	減ったりします。強調表示は自動的に更新されません。更新するには次のコマンドを使
	います:
	:diffupdate
	差分を取り除くには、強調表示された範囲のテキストをもう一方のウィンドウに移動し
	ます。上述の "main.c" と "main.c~" の例を使って説明します。左ウィンドウに移動
	して、もう一方のウィンドウでは削除されている行に移動します。そして、次のコマン
	ドを入力します:
	dp
	カレントウィンドウのテキストがもう一方のウィンドウにプットされ、変更がなくなり
	ます。"dp" は "diff put" の意味です。
	別の方法でも同じことができます。右のウィンドウに移動して、"changed" が挿入され
	た行に移動します。そして、次のコマンドを入力します:
	do
	もう一方のファイルからテキストがコピーされ、変更はなくなります。これで変更がな
	くなってしまったので、すべてのテキストが折り畳まれて表示されます。"do" は
	"diff obtain" の意味です。意味的には"dg"の方が良いのですが、それはすでに他で
	使われています ("dgg" でカーソル位置から最初の行まで削除されます)。
	差分モードの詳細は |vimdiff| をご覧ください。
	==============================================================================
	*08.8* その他
	'laststatus' オプションを使うと、最後のウィンドウにステータスラインを表示する
	かどうかを設定できます:
	0 表示しない
	1 分割ウィンドウがある時だけ表示 (初期設定)
	2 常に表示
	ほとんどの、ファイルを開くコマンドには、ウィンドウを分割するバージョンが存在し
	ます。
	Ex コマンドの場合、先頭に "s" が付いています。例えば、":tag" はタグジャンプで
	すが、":stag" はウィンドウを分割してからタグジャンプします。
	ノーマルモードコマンドの場合、CTRL-W を前置します。例えば、CTRL-^ はオルタネー
	トファイルへのジャンプですが、CTRL-W CTRL-^ はウィンドウを分割してからオルタネー
	トファイルを開きます。
	'splitbelow' オプションを設定すると、カレントウィンドウの下に新しいウィンドウ
	が作られるようになります。'splitright' オプションを設定すると、縦分割したとき
	に、カレントウィンドウの右に新しいウィンドウが作られるようになります。
	ウィンドウを分割するときに、次の修飾コマンドを使うと、ウィンドウの位置を指定で
	きます:
	:leftabove {cmd} カレントウィンドウの左、または上
	:aboveleft {cmd} 同上
	:rightbelow {cmd} カレントウィンドウの右、または下
	:belowright {cmd} 同上
	:topleft {cmd} 上、または左の端
	:botright {cmd} 下、または右の端
	==============================================================================
	*08.9* タブページ
	ウィンドウは重ねることができないので、画面がすぐにいっぱいになってしまいます。
	それを解決するために、タブページ、というものが用意されています。
	"thisfile" というファイルを開いているとしましょう。新しいタブページを作成する
	ために次のコマンドを実行します:
	:tabedit thatfile
	"thatfile" が開かれ、Vim ウィンドウ全体を占める大きさのウィンドウに表示されま
	す。そして、上部にバーが表示され、ファイル名が二つ表示されているのが確認できる
	と思います:
	+----------------------------------+
	| thisfile | /thatfile/ __________X| (thatfile は太字)
	|/* thatfile */ |
	|that |
	|that |
	|~ |
	|~ |
	|~ |
	| |
	+----------------------------------+
	これは二つのタブページがある状態です。一つ目のタブページには "thisfile" を開い
	ているウィンドウが、二つ目のタブページには "thatfile" を開いているウィンドウが
	入っています。これは、紙が二枚重なっていて、それぞれの紙にファイル名が書かれた
	ラベルが付いているようなものです。
	マウスを使って "thisfile" をクリックしてみましょう。次のようになります。
	+----------------------------------+
	| /thisfile/ | thatfile __________X| (thisfile は太字)
	|/* thisfile */ |
	|this |
	|this |
	|~ |
	|~ |
	|~ |
	| |
	+----------------------------------+
	上部のラベルをクリックすると、タブページを切替えることができます。マウスがな
	い、あるいは使いたくない場合には、"gt" コマンドでも切替えられます。"gt" は
	Goto Tab の略です。
	次のコマンドを実行し、タブページをもう一つ作成してみましょう:
	:tab split
	ウィンドウを一つもったタブページが作成され、そのウィンドウには、さっきまで開い
	ていたのと同じバッファが表示されています:
	+-------------------------------------+
	| thisfile | /thisfile/ | thatfile __X| (thisfile は太字)
	|/* thisfile */ |
	|this |
	|this |
	|~ |
	|~ |
	|~ |
	| |
	+-------------------------------------+
	":tab" コマンドは、ウィンドウを開く Ex コマンドと組み合わせて使います。そうす
	ると、ウィンドウは新しいタブページで開かれます。もう一つ例をあげます:
	:tab help gt
	このコマンドを実行すると、"gt" についてのヘルプが新しいタブページで開きます。
	タブページの操作には、他にも次のようなものがあります:
	- 上部バーの最後のラベルより右 (ラベルのないとこ) をマウスでクリック
	"gt" と同じように、次のタブページを選択します。
	- 上部右端の "X" をクリック
	現在のタブページを閉じます。ただし、そのタブページ内に未保存の変更があ
	る場合は閉じません。
	- 上部バーをダブルクリック
	新しいタブページを作成します。
	- "tabonly" コマンド
	現在のタブページ以外を閉じます。ただし、それらのタブページ内に未保存の
	変更がある場合は閉じません。
	タブページについての詳細は |tab-page| を参照してください。
	==============================================================================
	次章: |usr_09.txt| GUI を使う
	Copyright: see |manual-copyright| vim:tw=78:ts=8:ft=help:norl:
	------------------------------------------------------------------------------------------------------------------------------------------------
	top - main help file
	Download (not html): vimdoc.zip
	Vim日本語ドキュメント
	苦情は yukihiro.nakadaira@gmail.com まで。
		{Google} ]> 
		Google 検索
		( ) WWW を検索 (*) vimdoc を検索
	Vim documentation: tabpage
	==========================
	main help file
	------------------------------------------------------------------------------------------------------------------------------------------------
	*tabpage.txt* For Vim バージョン 7.2. Last change: 2007 Mar 11
	VIM REFERENCE MANUAL by Bram Moolenaar
	タブページの使い方 *tab-page* *tabpage*
	タブページを使うために追加されたコマンドについて説明します。複数のタブページを
	開いていると違う働きをするコマンドについても説明します。
	1. はじめに |tab-page-intro|
	2. コマンド |tab-page-commands|
	3. その他 |tab-page-other|
	4. 'tabline' の設定 |setting-tabline|
	5. 'guitablabel' の設定 |setting-guitablabel|
	{Vi にはこれらのコマンドはありません}
	{|+windows| が有効な場合のみ利用できます}
	==============================================================================
	1. はじめに *tab-page-intro*
	タブページは複数のウィンドウを持てます。タブページを使うと、作業別のウィンドウ
	の集合を簡単に切り替えることができます。
	通常、Vim ウィンドウの最上部にタブページを表すラベルの一覧が表示されます。その
	ラベルをマウスでクリックすると、そのタブページにジャンプできます。他の方法でも
	タブページを移動できます。
	ほとんどのコマンドは作業中のタブページ内だけで動作します。|CTRL-W| コマンド
	や、|:tab| を前置しない |:windo|、|:all|、|:ball| なども同様です。カレントタブ
	ページ以外にも作用するコマンドについては以下で説明しています。
	タブページを使うと、一時的なバッファを使用するときに、作業中のウィンドウレイア
	ウトを変更しなくてすみます。新しいタブページを開いて、何か作業をし、そのタブ
	ページを閉じる、という具合です。
	==============================================================================
	2. コマンド *tab-page-commands*
	タブページを開くには:
	Vim を "vim -p filename ..." と起動すると、それぞれのファイルごとに
	('tabpagemax' までの) タブページを開けます。|-p|
	CUI の Vim でタブページラインをダブルクリックすると新しいタブページが作成され
	ます。新しいタブページはクリックした場所の左に作成されます。最初のクリックが他
	のタブページの選択になってしまうときは、スクリーンが余計に更新されます。
	この機能は Win32 と Motif の GUI でも使えます。ただし、ラベルの右をクリックし
	た場合のみです。
	GUI でタブページラインを右クリックするとメニューが表示されます。|tabline-menu|
	:tabe[dit] *:tabe* *:tabedit* *:tabnew*
	:tabnew カレントタブページの後ろに空のウィンドウを持った新しいタブペー
	ジを作成します。
	:tabe[dit] [++opt] [+cmd] {file}
	:tabnew [++opt] [+cmd] {file}
	{file} を新しいタブページで開きます。|:edit| と同じです。
	:tabf[ind] [++opt] [+cmd] {file} *:tabf* *:tabfind*
	'path' 内の {file} を新しいタブページで開きます。|:find| と同
	じです。
	{|+file_in_path| が有効な場合のみ利用できます}
	:[count]tab {cmd} *:tab*
	{cmd} を実行します。そのコマンドが新しいウィンドウを作成すると
	きは、その代わりに新しいタブページを作成します。|:diffsplit|と
	|:diffpatch|, |:execute|, |:normal| に対しては機能しません。
	[count] を省略すると、新しいタブページはカレントタブページの後
	ろに作成されます。
	[count] を指定すると、[count] 番目のタブページの後ろに作成され
	ます。タブページを一番左に作成するには ":0tab cmd" とします。
	例:
	:tab split " opens current buffer in new tab page
	:tab help gt " opens tab page with help for "gt"
	CTRL-W gf カーソル下のファイル名のファイルを新しいタブページで開きます。
	|CTRL-W_gf| を参照してください。
	CTRL-W gF カーソル下のファイル名のファイルを新しいタブページで開きます。
	そして、ファイル名の後ろに指定された行番号にジャンプします。
	|CTRL-W_gF| を参照してください。
	タブページを閉じるには:
	複数のタブページを開いているときは、タブページ内の最後のウィンドウを閉じると、
	そのタブページが閉じられます。
	タブページラインが表示されているときは、右上に表示されている "X" をマウスでク
	リックすると、カレントタブページが閉じます。|'tabline'| を設定しているときは、
	他の何かが表示されているかもしれません。
	*:tabc* *:tabclose*
	:tabc[lose][!] カレントタブページを閉じます。
	このコマンドは次のときに失敗します:
	- タブページが一つしかないとき。 *E784*
	- 'hidden' がオフのときに [!] を使わず、バッファに変更があり、
	そのバッファを表示しているウィンドウが他にない場合。
	バッファの変更はファイルに保存されませんが、失われることもあり
	ません。このコマンドは安全なコマンドです。
	:tabc[lose][!] {count}
	{count} 番目のタブページを閉じます。|:tabclose| と同じ理由で失
	敗することがあります。
	*:tabo* *:tabonly*
	:tabo[nly][!] カレントタブページ以外のすべてのタブページを閉じます。
	オプション 'hidden' がオンのとき、閉じたウィンドウのバッファは
	すべて隠しバッファになります。
	'hidden' がオフ、'autowrite' がオンのときは、変更のあるバッ
	ファはファイルに保存されます。そうでないときは、変更のあるバッ
	ファを表示しているウィンドウは閉じません。[!] を指定した場合
	は、変更のあるバッファは隠しバッファになります。変更のあるバッ
	ファは絶対に破棄されないので、変更を失うことはありません。
	タブページを切り替えるには:
	タブページラインが表示されているときは、タブページラベルをマウスでクリックする
	と、そのタブページに移動できます。ラベルが表示されていない場所をクリックする
	と、次のタブページに移動できます。 |'tabline'|
	:tabn[ext] *:tabn* *:tabnext* *gt*
	<C-PageDown> *CTRL-<PageDown>* *<C-PageDown>*
	gt *i_CTRL-<PageDown>* *i_<C-PageDown>*
	次のタブページに移動します。次のタブページがない場合は、最初の
	タブページに移動します。
	:tabn[ext] {count}
	{count}<C-PageDown>
	{count}gt {count} 番目のタブページに移動します。最初のタブページの番号は
	1 です。
	:tabp[revious] *:tabp* *:tabprevious* *gT* *:tabN*
	:tabN[ext] *:tabNext* *CTRL-<PageUp>*
	<C-PageUp> *<C-PageUp>* *i_CTRL-<PageUp>* *i_<C-PageUp>*
	gT 前のタブページに移動します。前のタブページがない場合は、最後の
	タブページに移動します。
	:tabp[revious] {count}
	:tabN[ext] {count}
	{count}<C-PageUp>
	{count}gT {count} の数だけ前のタブページに移動します。前のタブページがな
	い場合は最後のタブページに移動します。
	:tabr[ewind] *:tabfir* *:tabfirst* *:tabr* *:tabrewind*
	:tabfir[st] 最初のタブページに移動します。
	*:tabl* *:tablast*
	:tabl[ast] 最後のタブページに移動します。
	その他のコマンド:
	*:tabs*
	:tabs タブページと、含まれているウィンドウの一覧を表示します。
	">" と表示されるのはカレントウィンドウです。
	"+" と表示されるのは変更のあるバッファです。
	タブページを並べ替えるには:
	:tabm[ove] [N] *:tabm* *:tabmove*
	カレントタブページを N 番目のタブページの後ろに移動します。カ
	レントタブページを一番目のタブページにするにはゼロを指定します。
	N を省略すると最後に移動します。
	タブページごとにコマンドを実行するには:
	*:tabd* *:tabdo*
	:tabd[o] {cmd} タブページごとにコマンドを実行します。
	これは次のような動作をします:
	:tabfirst
	:{cmd}
	:tabnext
	:{cmd}
	etc.
	このコマンドは各タブページのカレントウィンドウで実行されます。
	いずれかのタブページでエラーが起きたときは、その場で実行を中断
	します。
	最後のタブページ (またはエラーが起きたタブページ) がカレントタ
	ブページになります。
	{cmd} は '|' を使って複数のコマンドを繋げることができます。
	{cmd} はタブページを開いたり閉じたり並べ替えたりしてはいけませ
	ん。
	{Vi にはない機能です}
	{|+listcmds| が有効な場合のみ利用できます}
	|:windo|、|:argdo|、|:bufdo| も参照してください。
	==============================================================================
	3. その他 *tab-page-other*
	*tabline-menu*
	GUI のタブページラインにはポップアップメニューがあります。右クリックで次のメ
	ニューが表示されます:
	Close マウスポインタの下のタブページを閉じます。マウスがラベ
	ルの上にないときは、カレントタブページを閉じます。
	New Tab タブページを新規バッファで開きます。マウスポインタの左
	側に作成されます。
	Open Tab... "New Tab" と同じですが、ファイル選択ダイアログを使っ
	て選択したファイルを新しいタブページで開きます。
	Diff モードはタブページ単位で機能します。一つのタブページ内でファイル間の差分
	を表示できます。そして、他のタブページでは他のファイルとの差分を表示することが
	できます。
	タブページローカル変数は "t:" で始まります。|tabpage-variable|
	現在、タブページローカルなオプションは 'cmdheight' だけです。
	オートコマンドイベントの TabLeave と TabEnter を使って、タブページを切り替える
	ときにコマンドを実行できます。イベントが起きる正確な順番は何をしたかによって変
	わります。新しいタブページを作成したときは、例えば、編集中のバッファを新しい
	ウィンドウで開き、それからそのウィンドウで別のバッファを開いたときと同じような
	動きをします。つまり、":tabnew" では次の順番でイベントが実行されます:
	WinLeave カレントウィンドウから離れる
	TabLeave カレントタブページから離れる
	TabEnter 新しいタブページに入る
	WinEnter 新しいタブページのウィンドウに入る
	BufLeave カレントバッファから離れる
	BufEnter 新しい空のバッファに入る
	タブページを切り替えたときは次の順番です:
	BufLeave
	WinLeave
	TabLeave
	TabEnter
	WinEnter
	BufEnter
	==============================================================================
	4. 'tabline' の設定 *setting-tabline*
	オプション 'tabline' を設定してタブページラベルの表示方法を指定できます。これ
	は CUI の タブページラインで使います。
	オプション 'showtabline' を設定してタブページラインを表示するかどうかを指定で
	きます。表示しない、タブページが複数あるときだけ表示する、常に表示する、から選
	べます。
	タブページラインの強調表示には TabLine、TabLineSel、TabLineFill が使われます。
	|hl-TabLine| |hl-TabLineSel| |hl-TabLineFill|
	変更されているウィンドウを含むタブページには "+" が表示されます。タブページ内
	のウィンドウの個数も表示されます。よって "3+" という表示は3個のウィンドウを含
	む、そのうちの1つが変更されているバッファを含むということを意味します。
	オプション 'tabline' を使って、タブページラベルを好みの表示に設定できます。こ
	れはあまり簡単ではないので、サンプルを用意してあります。
	基本的には 'statusline' を参照してください。同じアイテムが 'tabline' で使用で
	きます。加えて、|tabpagebuflist()|、|tabpagenr()|、|tabpagewinnr()| という関数
	も使えます。
	タブページラベルの数は変化するので、オプションには式を使う必要があります。次の
	ように設定します:
	:set tabline=%!MyTabLine()
	では、関数 MyTabLine() を定義して、すべてのタブページラベルを表示するようにし
	ます。タブページラベル全体の作成と、個々のタブページラベルの作成、という二つの
	段階に分けると簡単です。
	function MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
	" 強調表示グループの選択
	if i + 1 == tabpagenr()
	let s .= '%#TabLineSel#'
	else
	let s .= '%#TabLine#'
	endif
	" タブページ番号の設定 (マウスクリック用)
	let s .= '%' . (i + 1) . 'T'
	" ラベルは MyTabLabel() で作成する
	let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	endfor
	" 最後のタブページの後は TabLineFill で埋め、タブページ番号をリセッ
	" トする
	let s .= '%#TabLineFill#%T'
	" カレントタブページを閉じるボタンのラベルを右添えで作成
	if tabpagenr('$') > 1
	let s .= '%=%#TabLine#%999Xclose'
	endif
	return s
	endfunction
	関数 MyTabLabel() は個々のタブページラベルを得るために呼ばれます。
	function MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return bufname(buflist[winnr - 1])
	endfunction
	このサンプルは単純なものです。生成されるのは未設定時のタブページラインとほぼ同
	じですが、変更のあるバッファに + が付けたり、名前を切り詰めたりはしません。十
	分な表示領域がない場合など、なんらかのうまい方法でラベルの幅を減らしたいでしょ
	う。利用できる表示領域はオプション 'columns' を確認してください。
	==============================================================================
	5. 'guitablabel' の設定 *setting-guitablabel*
	GUI のタブページラインが表示されているとき、'guitablabel' を設定してタブページ
	ラベルの表示方法を指定できます。'tabline' とは違い、一度にタブページライン全体
	を指定するのではなく、個々のラベルを得るために 'guitablabel' が使われます。
	'guitabtooltip' という良く似たオプションがあります。これはラベルのツールチップ
	を表示するために使われます。ツールチップはマウスポインタがラベルの上に乗ってい
	るときだけ表示されるので、普通は、長い文字を表示します。いくつかのシステムだけ
	サポートされています。
	書式についてはオプション 'statusline' を参照してください。
	"%N" はカレントタブページ番号になります。このオプションを評価するときに、
	|v:lnum| にも同じ番号が設定されます。ファイル名を参照するアイテムにはタブペー
	ジのカレントウィンドウのものが使われます。
	Note: このオプションでは強調表示は使えません。%T と %X は無視されます。
	簡単な例として、次のものはタブページ番号とバッファ名をラベルに表示します:
	:set guitablabel=%N\ %f
	次の例は 'guitablabel' の標準設定の動作と似た動作をします。タブページのウィン
	ドウ数と、変更のあるバッファがあるときには '+' を表示します:
	function GuiTabLabel()
	let label = ''
	let bufnrlist = tabpagebuflist(v:lnum)
	" このタブページに変更のあるバッファがるときには '+' を追加する
	for bufnr in bufnrlist
	if getbufvar(bufnr, "&modified")
	let label = '+'
	break
	endif
	endfor
	" ウィンドウが複数あるときにはその数を追加する
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
	let label .= wincount
	endif
	if label != ''
	let label .= ' '
	endif
	" バッファ名を追加する
	return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
	endfunction
	set guitablabel=%{GuiTabLabel()}
	Note: この関数はオプションを設定する前に定義しておく必要があります。そうしない
	と、関数未定義のエラーが表示されてしまいます。
	標準のラベルを使いたい場合は、空文字列を返してください。
	あるタブページに固有の何かを表示したいときは、タブページローカル変数 |t:var|
	が便利です。
	vim:tw=78:ts=8:ft=help:norl:
	------------------------------------------------------------------------------------------------------------------------------------------------
	top - main help file
	Download (not html): vimdoc.zip
	Vim日本語ドキュメント
	苦情は yukihiro.nakadaira@gmail.com まで。
#TODO
	`QuickNote-Java` memos
#YANKTMP.
	vim 他のファイルにコピペするプラグインyanktmp.vim 2009 年 7 月 16 日
	しかしyanktmp.vimプラグインを使うことで解決。
	１．yanktmp.vimをダウンロード
	ダウンロードは以下より
	http://www.vim.org/scripts/script.php?script_id=1598
	２．ダウンロードしたyanktmp.vimファイルをプラグインディレクトリに配置する。
	/Users/<username>/.vim/plugin/yanktmp.vim
	３．.vimrcに以下を追記する
	map sy :call YanktmpYank()<CR>
	map sp :call YanktmpPaste_p()<CR>
	map sP :call YanktmpPaste_P()<CR>
	コピーしたい箇所を選択して、ｓｙでコピーして、他のタブ（プロセス）に切り替えてsp(またはsP)でペースト。
	※spとsPの違いは、pとPの違いと一緒一
	#SURROUND.---------------------------------------------------------------------------------------
		with the cursor on "Hello world!  (iw is a text object.The "." command will work with ds, cs, and yss with repeat.vim, vimscript #2136.)
		dsの中ではtがタグを表現する。以下の文章(*はカーソルの位置) iwは、inner word。
		#
		ySS  インデントするyss
		yssb or yss) .    ({ Hello } world!)
			ysテキストオブジェクトを使ったcsができる。"Hello *world!"に対して「ysiw)」とすると"Hello (*world!)"
			yss  カレントラインに対するcs。
			yS  インデントするys
		#changing side-quotaton:
		cs"'              "Hello world!" to 'Hello world!'
		cs'<q> to change it to <q>Hello world!</q>
		cst" to get "Hello world!"
		ds" .  Hello world!
		dst    remove side tags
		di    remove innertext
		Revert to the original text: ds{ds) Hello world!
		Emphasize hello:  ysiw<em> <em>Hello</em> world!
		#visual mode combo:   V-S<p class="important">.  <p class="important"> <em>Hello</em> world! </p>
		カスタマイズ
			括弧やタグみたいに自分の好きな文字を入れる時は以下のようにする。
			let g:surround_45 = "<?php \r ?>"
			これは-が押されたときにPHPタグを指定できる。surround_45の45が-を示している。-のASCIIコードが45．-のASCIIコードを調べるには:echo char2nr
			("-"))とすればよい。
		install details
			Extract to ~/.vim, or ~\vimfiles (Windows).  You'll need to regenerate helptags (fill in the install path below)
			:helptags ~/.vim/doc
	#RUBY-MACRO----------------------------------------------------------------------------------------
		Typing "for" on a blank line will result in
			for  in  
			end
		with the cursor positioned before the "in".  
		The same will happen with "while", "until", and so on.  But if the line is not blank, "for" will just insert itself.
		Also, symbols like " are inserted in matching pairs, with the cursor in between.
		"K" runs ruby on the current buffer, and the "F1" function key puts a line #!/usr/math/bin/ruby on the first line.  (You will have to edit
		this part).
		install details
			put this in an ftplugin directory in your runtime path.  or Put something like the following line in your .vimrc file:
			autocmd Filetype ruby source ~/.Vim/ruby-macros.vim
	#SNIPMATE----------------------------------------------------------------------------------------
		snipMate.vim aims to be an unobtrusive, concise vim script that implements some of TextMate's snippets features in Vim. A snippet is a
		piece of often-typed text that you can insert into your document using a trigger word followed by a <tab>.
		For instance, in a C file using the default installation of snipMate.vim, if you type "for<tab>" in insert mode, it will expand a
		typical for loop in C:
		for (i = 0; i < count; i++) {
		}
		To go to the next item in the loop, simply <tab> over to it; if there is repeated code, such as the "i" variable in this example, you
		can simply start typing once it's highlighted and all the matches specified in the snippet will be updated.
		snipMate.vim has the following features among others:
			- The syntax of snippets is very similar to TextMate's, allowing easy conversion.
			- The position of the snippet is kept transparently (i.e., it does not use marks/placeholders inserted into the buffer), allowing you
		to escape out of an incomplete snippet, something particularly useful in Vim.
			- Variables in snippets are updated as-you-type.
			- Snippets can have multiple matches.
			- Snippets can be out of order. For instance, in a do...while loop, the condition can be added before the code.
		Bug reports, feature requests, etc. are welcome and can be emailed to me or submitted on the issue tracker: http://code.google.com/p/
		snipmate/issues/list
		For a quick introduction, see this screencast: http://vimeo.com/3535418
		For more help see the  documentation that comes with snipMate in ~/.vim/doc/snipMate.txt.
		install details
			Requires Vim 7 or higher.
			filetype plugin on" to your .vimrc 
			unzip snipMate.zip -d ~/.vim (or equivalent, e.g. $HOME\vimfiles on Windows)
			:helptags ~/.vim/doc
		Keep in mind this will overwrite any files included with older versions of snipMate, including the default *.snippets files for the
		included filetypes. If you don't want your snippets overwritten, just name them name them differently than the default snippets, e.g.
		c-mysnips.snippets.
	#TEMPLATE.---------------------------------------------------------------------------------------
		Vimで新しいファイルを作ったときに、拡張子に応じて自動的にテンプレートを適用する方法です。
		まずは準備として、VIMHOMEを設定。.bashrcとか.zshrcに以下の設定。
			export VIMHOME=$HOME/.vim
		次に.vimrcの設定。autocmdを使って、テンプレートを読み込むようにします。
			autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
		これでvimで新規ファイルを作成すると、その拡張子に応じて$HOME/.vim/templates以下の<拡張子>.tplファイルをテンプレートとして読み込む設定が
		できました。
		あとはテンプレートファイルの作成。例えばhtmlファイルならこんな感じ。
			$ vim $HOME/.vim/templstes/html.tpl
			<html>
			<head>
			<title></title>
			</head>
			<body>
			</body>
			</html>
		拡張子に応じたテンプレートを作ったら、後はその拡張子のファイルを作成したら、自動でテンプレートが適用されます。
	#CHINESE.---------------------------------------------------------------------------------------
		VimIM 是?? Vim 玩家??的插件，可作? Vim 内嵌中文?入法。只要?的 Vim 能?示中文，?就能用 Vim ?入搜索中文。
		install details
		(1) download any data file you like from
			http://code.google.com/p/vimim/downloads/list
		(2) save this file and the data file in the Vim plugin directory
		Usage (1): [in Insert Mode] 【点石成金】没有所?模式??
			# to insert: type keycode and hit <C-\> to trigger
			# to search: hit '/' or '?' from popup menu
		Usage (2): [in Insert Mode] 【中文?入模式】 Ctrl-6 切?
			# [dynamic] mode: any valid key code => Chinese
			# [static]  mode: Space=>Chinese  Enter=>English
		官方网址:  http://vim.sourceforge.net/scripts/script.php?script_id=2506
		新???:  http://groups.google.com/group/vimim
		??下?:  http://code.google.com/p/vimim/downloads/list
		最新主?:  http://maxiangjiang.googlepages.com/vimim.html
		程式框架:  http://maxiangjiang.googlepages.com/vimim.vim.html
`#vim-ruby`
	#vim-rubyインストール手順は既存の設定ファイルやプラグインに影響しないが、心配ならば ~/.vimrc と~./vimを事前バックアップ
	デフォルトのvimはrubyインタフェースを実装していないので、対応版をインストール (upgradeだと依存環境全部更新するのでinstall )
		sudo apt-get install vim-ruby
	vim-rubyのインストール。上記と名前は一緒ですが、今回はrubyのvimのライブラリです。
		sudo gem1.8 install vim-ruby
		sudo vim-ruby-install.rb
			Possible Vim installation directories:
				1) /home/[yourID]/.vim
			Please select one (or anything else to specify another directory):  ←1を入力


#David Rayner's VIMTIPS.---------------------------------------------------------------------------------------
	David Rayner's Best of Vim Tips part 1
	http://www.rayninfo.co.uk/vimtips.html より。
	" 検索
	/joe/e                      : カーソルをマッチの末尾へ
	/joe/e+1                    : カーソルをマッチの末尾＋1へ
	/joe/s-2                    : カーソルをマッチの先頭－2へ
	/^joe.*fred.*bill/          : normal
	/^[A-J]\+/                  : 1個以上のA-Jで始まる行を検索
	/begin\_.*end               : 複数行にまたがることを許す検索
	/fred\_s*joe/i              : 改行を含む任意のホワイトスペース
	/fred\|joe                  : fred または joe を検索
	/.*fred\&.*joe              : fred と joe を検索（順序は問わない！）
	/\<fred\>/i                 : fred を検索。alfred や frederick を除く
	/\<\d\d\d\d\>               : ちょうど4個の数字を検索
	/\D\d\d\d\d\D               : ちょうど4個の数字を検索
	/\<\d\{4}\>                 : 同じ
	/\([^0-9]\|^\)%.*%          : Search for absence of a digit or beginning of line
	" 空行を検索
	/^\n\{3}                    : 連続する3つの空行を検索
	" 正規表現の記憶を検索中で使う
	/\(fred\).*\(joe\).*\2.*\1
	" パターンの繰り返し (rather than what the Regexp finds)
	/^\([^,]*,\)\{8}
	" ヴィジュアル検索
	:vmap // y/<C-R>"<CR>       : 選択したテキストを検索
	:vmap <silent> //    y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR> : 特殊文字のエスケープ付き版
	" \zs and \ze 正規表現のデリミタ :h /\zs
	/<\zs[^>]*\ze>              : タグの中身を検索。<> は無視
	" ゼロ幅 :h /\@=
	/<\@<=[^>]*>\@=             : タグの中身を検索。<> は無視
	/<\@<=\_[^>]*>\@=           : 複数行にわたってタグを検索
	" 複数行に渡る検索。 \_ は改行を含むという意味
	/<!--\_p\{-}-->                   : 複数行に渡るコメントを検索
	/fred\_s*joe/i                    : 改行を含む任意のホワイトスペース
	/bugs\(\_.\)*bunny                : bunny が後に続く bugs。ファイル中のどこでも。
	:h \_                             : help
	<moge>     <sage>
	" カーソル下のサブルーチン／関数の宣言を検索
	:nmap gx yiw/^\(sub\<bar>function\)\s\+<C-R>"<CR>
	" 複数ファイルから検索
	:bufdo /searchstr/                : 検索を再開するには :rewind を使う
	" 複数ファイルからの検索。ベターだがチート
	:bufdo %s/searchstr/&/gic   : 停止するには n を選択してから a
	" バックスラッシュを使わないで URL を検索する方法
	?http://www.vim.org/        : 後方検索を使う。clever huh!
	" 「探さない」ものを指定する（母音）
	/\c\v([^aeiou]&\a){4}       : 連続する4つの子音を検索
	----------------------------------------
	#substitution
	:%s/fred/joe/igc            : 一般的な置換コマンド
	:%s/\r//g                   : DOS の改行 ^M を削除
	" ファイルがぐちゃぐちゃになっていたらこれを使う
	:%s/\r/\r/g                 : DOS の改行 ^M を本当の改行に置換
	:%s=  *$==                  : 行末のスペースを削除
	:%s= \+$==                  : 同上
	:%s#\s*\r\?$##              : 行末の空白とDOSの改行両方を削除
	:%s#\s*\r*$##               : 同上
	" 空行を削除する
	:%s/^\n\{3}//               : 3個の連続する空行を削除
	:%s/^\n\+/\r/               : 空行を圧縮する
	:%s#<[^>]\+>##g             : テキストを残したままhtmlタグを削除(non-greedy)
	:%s#<\_.\{-1,}>##g          : 複数行にわたってhtmlタグを削除(non-greedy)
	" IF YOU ONLY WANT TO KNOW ONE THING
	:'a,'bg/fred/s/dick/joe/igc : VERY USEFUL
	" カラムを重複させる
	:%s= [^ ]\+$=&&=            : 最後のカラムを重複させる
	:%s= \f\+$=&&=              : 同上
	:%s= \S\+$=&&               : 普通は同上
	" 記憶
	:s/\(.*\):\(.*\)/\2 : \1/   : : で区切られるフィールドを反転
	:%s/^\(.*\)\n\1$/\1/        : 重複する行を削除
	" non-greedy matching \{-}
	:%s/^.\{-}pdf/new.pdf/      : 最初のpdfまでを削除
	" 直前の項目が0個または1個を意味するアトム \?
	:%s#\<[zy]\?tbl_[a-z_]\+\>#\L&#gc : lowercase with optional leading characters
	" 複数行に渡ることを許す
	:%s/<!--\_.\{-}-->//        : 複数行に渡るコメントを削除
	:help /\{-}                 : help non-greedy
	" レジスタを使った置換
	:s/fred/<c-r>a/g            : "fred" をレジスタ"a"の中身で置き換える
	:s/fred/<c-r>asome_text<c-r>s/g
	:s/fred/\=@a/g              : レジスタの中身が表示されないのでベター
	" 1行に対して複数のコマンド
	:%s/\f\+\.gif\>/\r&\r/g | v/\.gif$/d | %s/gif/jpg/
	:%s/a/but/gie|:update|:next : これを繰り返すには @: を使う
	" ORing（分岐）
	:%s/suck\|buck/loopy/gc     : ORing (パイプ記号 | をエスケープすること)
	" VIM の関数を呼ぶ
	:s/__date__/\=strftime("%c")/ : 日付を挿入する
	" 列を操作する。3列目の str1 を置換する
	:%s:\(\(\w\+\s\+\)\{2}\)str1:\1str2:
	" 最初と最後の列を入れ替える（4列ある場合）
	:%s:\(\w\+\)\(.*\s\+\)\(\w\+\)$:\3\2\1:
	" form の全ての要素をペーストレジスタに入れる
	:redir @*|sil exec 'g#<\(input\|select\|textarea\|/\=form\)\>#p'|redir END
	:nmap ,z :redir @*<Bar>sil exec 'g@<\(input\<Bar>select\<Bar>textarea\<Bar>/\=form\)\>@p'<Bar>redir END<CR>
	" 数字を3デクリメントする
	:%s/\d\+/\=(submatch(0)-3)/
	" ある行についてだけ数字を6インクリメントする
	:g/loc\|function/s/\d/\=submatch(0)+6/
	" ベター
	:%s#txtdev\zs\d#\=submatch(0)+1#g
	:h /\zs
	" gg\d\d の数字だけを6インクリメントする
	:%s/\(gg\)\@<=\d\+/\=submatch(0)+6/
	:h zero-width
	" 文字列を増加していく数字で置き換える
	:let i=10 | 'a,'bg/Abc/s/yy/\=i/ |let i=i+1 # yy を10,11,12 ...で置き換える
	" 同上。ただしより正確
	:let i=10 | 'a,'bg/Abc/s/xx\zsyy\ze/\=i/ |let i=i+1 # convert xxyy to xx11,xx12,xx13
	" 置換するテキストを見つけ、メモリにおく。それから \zs を使って単純に置換する
	:%s/"\([^.]\+\).*\zsxx/\1/
	" カーソル下の単語を置換の検索語として挿入する
	:nmap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>#
	" 選択されたテキストを置換の検索語として挿入する
	:vmap <leader>z :<C-U>%s/\<<c-r>*\>/
	----------------------------------------
	" all following performing similar task, substitute within substitution
	" Multiple single character substitution in a portion of line only
	:%s,\(all/.*\)\@<=/,_,g     : "all/" の後に現れる / をすべて _ で置換する
	" 同上
	:s#all/\zs.*#\=substitute(submatch(0), '/', '_', 'g')#
	" 行を分割し、再結合することによって置換
	:s#all/#&^M#|s#/#_#g|-j!
	" 置換中で置換する
	:%s/.*/\='cp '.submatch(0).' all/'.substitute(submatch(0),'/','_','g')/
	----------------------------------------
	" global コマンドの表示
	:g/gladiolli/#              : g/ の結果を行番号つきで表示(YOU WANT THIS!)
	:g/fred.*joe.*dick/         : fred,joe & dick すべてを含む行を表示
	:g/\<fred\>/                : fred に一致する単語を含む行すべてを表示
	:g/^\s*$/d                  : 空行をすべて削除
	:g!/^dd/d                   : 文字列を含まない行を削除
	:v/^dd/d                    : 文字列を含まない行を削除
	:g/fred/,/joe/d             : 非行指向(very powerfull)
	:g/-------/.-10,.d          : 文字列と上の10行を削除
	:g/{/ ,/}/- s/\n\+/\r/g     : {...}の中の空行を削除
	:v/\S/d                     : 空行を削除 (both types)
	:v/./,/./-j                 : 空行を圧縮
	:g/^$/,/./-j                : 空行を圧縮
	:g/<input\|<form/p          : OR
	:g/^/put_                   : 全ての行と行の間に空行を挿入(pu = put) "_はブラックホールレジスタ
	:g/^/m0                     : ファイルを反転させる(m = move)
	:'a,'bg/^/m'b               : a から b のセクションを反転
	:g/^/t.                     : 各行を重複させる
	:g/fred/t$                  : fredにマッチする行をEOFにコピー
	:g/stage/t'a                : stageにマッチする行をマークaへコピー
	:g/\(^I[^^I]*\)\{80}/d      : 80個以上のタブを含む行すべてを削除
	" 1行おきに置換を行う
	:g/^/ if line('.')%2|s/^/zz /
	" マーク a と b の間で"somestr"を含む行すべてにマッチ
	:'a,'bg/somestr/co/otherstr/ : co(py) or mo(ve)
	" 同上。ただし置換も行う
	:'a,'bg/str1/s/str1/&&&/|mo/str2/
	:%norm jdd                  : 1行置きに削除
	" 数字をインクリメントする（<c-a>は5文字タイプすること）
	:.,$g/^\d/exe "norm! \<c-a>": 数字をインクリメント
	:'a,'bg/\d\+/norm! ^A       : 数字をインクリメント
	" :g の結果を保存する（レジスタ名を大文字にしなければならない）。最初に qaq でレジスタを空にしておくこと。
	" 結果をレジスタ／ペーストバッファに保存する
	:g/fred/y A                 : fred を含む行すべてをレジスタaに追加する
	:g/fred/y A | :let @*=@a    : ペーストバッファにコピー
	:let @a=''|g/Barratt/y A |:let @*=@a
	" 行をフィルタしてファイルに書き出す（ファイルは既に存在しなければならない）
	:'a,'b g/^Error/ . w >> errors.txt
	" duplicate every line in a file wrap a print '' around each duplicate
	:g/./yank|put|-1s/'/"/g|s/.*/Print '&'/
	" 文字列をファイルの中身で置換する。-d が MARK を削除する
	:g/^MARK$/r tmp.txt | -d
	" きれいに表示
	:g/<pattern>/z#.5           : コンテキストつきで表示
	:g/<pattern>/z#.5|echo "=========="  : 美しく表示
	" g// とノーマルモードコマンドを組み合わせる
	:g/|/norm 2f|r*                      : 2番めの | を * で置き換える
	" global コマンドの出力を新しいウィンドウに送る
	:nmap <F3>  :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>
	----------------------------------------
	" :global と置換を組み合わせる(power editing)
	:'a,'bg/fred/s/joe/susan/gic :  can use memory to extend matching
	:g/fred/,/joe/s/fred/joe/gic :  non-line based (ultra)
	----------------------------------------
	" joe の検索を始める前に fred を見つける
	:/fred/;/joe/-2,/sid/+3s/sally/alley/gIC
	----------------------------------------
	" ファイル中の各行に対して新しいファイルを作る。1.txt, 2.txt, 3.txt etc
	:g/^/exe ".w ".line(".").".txt"
	----------------------------------------
	" Absolutely essential
	----------------------------------------
	* # g* g#           : カーソル下の単語を検索 (<cword>) (forwards/backwards)
	%                   : 対応括弧に移動 {}[]()
		.                   : 最後の変更を繰り返す
		@:                  : 最後の : コマンドを繰り返す (then @@)
		matchit.vim         : % で <tr><td><script> <?php などのタグにマッチさせるプラグイン
		<C-N><C-P>          : インサートモードで単語補完
		<C-X><C-L>          : 行補完 SUPER USEFUL
		/<C-R><C-W>         : <cword> を検索／コマンドラインに挿入する
		/<C-R><C-A>         : <CWORD> を検索／コマンドラインに挿入する
		:set ignorecase     : you nearly always want this
	:syntax on          : Perl,HTML,PHP などで色づけを有効にする
	━━━━━━━━━━━━━ :h regexp<C-D>      : control-D をタイプすると regexp を含むヘルプトピックを全てリスト
		（tabでそのリスト中を巡回）
		----------------------------------------
		" _vimrc の更新、再読み込みを簡単にするマップ
		:nmap ,s :source $VIM/_vimrc
	:nmap ,v :e $VIM/_vimrc
	━━━━━━━━━━━━━ ----------------------------------------
	"VISUAL MODE (easy to add other HTML Tags)
		:vmap sb "zdi<b><C-R>z</b><ESC>  : 選択したテキストを<b></b> で囲む
		:vmap st "zdi<?= <C-R>z ?><ESC>  : 選択したテキストを <?=   ?> で囲む
		----------------------------------------
		"vim 7 tabs
		:tabe fred.php
	:tab ball
	━━━━━━━━━━━━━ vim -p fred.php joe.php          : ファイルをタブで開く
	" vim 7 forcing use of tabs
	nnoremap gf <C-W>gf
	━━━━━━━━━━━━━ cab      e  tabe
	----------------------------------------
	" Exploring
	:e .                            : ファイルエクスプローラ
	:Exp(lore)                      : file explorer note capital Ex
	:Sex(plore)                     : ファイルエクスプローラ。ウィンドウ分割
	:browse e                       : ウィンドウズスタイルのファイルを開くダイアログ
	:ls                             : バッファのリスト
	:cd ..                          : 親ディレクトリへ移動
	:args                           : ファイルのリスト
		:lcd %:p:h                      : 現在のファイルのディレクトリへ移動
	:autocmd BufEnter * lcd %:p:h   : 自動的に現在のファイルのディレクトリへ移動(_vimrcに書く）
	----------------------------------------
	" バッファエクスプローラ (Top Ten Vim Script)
		" bufexplorer.vim が必要 http://www.vim.org/script.php?script_id=42
	\be                             : バッファリスト
	\bs                             : バッファエクスプローラ（ウィンドウ分割）
	----------------------------------------
		" Changing Case
	guu                             : 行を小文字に
	gUU                             : 行を大文字に
	Vu                              : 行を小文字に
		VU                              : 行を大文字に
		g~~                             : 大文字小文字を反転
		vEU                             : 単語を大文字に
	vE~                             : 単語の大文字小文字を反転
	ggguG                           : ファイル全体を小文字に
	" 選択したテキストをキャピタライズ (map for .vimrc)
		vmap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>
	" 文の最初の文字を大文字に
	:%s/[.!?]\_s\+\a/\U&\E/g
	----------------------------------------
		gf                              : カーソル下のファイル名を開く (SUPER)
		:nnoremap gF :view <cfile><cr>  : カーソル下のファイル名を開く。なければ作る
	ga                              : カーソルしたの文字の16進アスキー値を表示
	ggVGg?                          : ファイル全体を rot13 変換
	ggg?G                           : ファイル全体を rot13 変換（大きいファイルに対して速い）
		:8 | normal VGg?                : 8行目から rot13
	:normal 10GVGg?                 : 8行目から rot13
	<C-A>,<C-X>                     : カーソル下の数字をインクリメント、デクリメント
		win32 users must remap CNTRL-A
		<C-R>=5*5                       : 25 をテキストに挿入 (ミニ計算機）
		----------------------------------------
	" Makes all other tips superfluous
	:h 42            : also http://www.google.com/search?q=42
	:h holy-grail
		:h!
		----------------------------------------
	" マークと移動
	'.               : 最後に変更された行へ移動 (SUPER)
	`.               : 最後に変更された行、桁へ移動
		g;               : 最近の変更箇所を回る（古いのが最初）(new in vim6.3)
	g,               : 逆方向 (new in vim6.3)
	:changes
	:h changelist    : help for above
		<C-O>            : ジャンプ履歴を戻る
	<C-I>            : ジャンプ履歴を進む
	:ju(mps)         : ジャンプの履歴
	:help jump-motions
		:history         : あなたが打ったコマンドを表示
	:his c           : コマンドライン履歴
	:his s           : 検索履歴
	q/               : 検索履歴ウィンドウ (puts you in full edit mode)
		q:               : コマンドライン履歴ウィンドウ (puts you in full edit mode)
	:<C-F>           : 履歴ウィンドウ
	----------------------------------------
	" 略語とマップ
		:map   <f7>   :'a,'bw! c:/aaa/x
	:map   <f8>   :r c:/aaa/x
	:map   <f11>  :.w! c:/aaa/xr<CR>
	:map   <f12>  :r c:/aaa/xr<CR>
		:ab php          : php で始まる略語を表示
	:map ,           : , で始まるマッピングを表示
	" F10 をマッピングに使えるようにする (win32)
	set wak=no       : :h winaltkeys
		" For use in Maps
	<CR>             : リターン
	<ESC>            : エスケープ
	<LEADER>         : 通常は \
		<BAR>            : | パイプ記号
	<BACKSPACE>      : バックスペース
	<SILENT>         : シェルウィンドウを出さない
	#display RGB colour under the cursor eg #445588
		:nmap <leader>c :hi Normal guibg=#<c-r>=expand("<cword>")<cr><cr>
	map <f2> /price only\\|versus/ :バックスラッシュが必要
	----------------------------------------
	" Simple PHP debugging display all variables yanked into register a
		iab phpdb exit("<hr>Debug <C-R>a  ");
	----------------------------------------
	" レジスタをマップとして使う（.vimrc 中に書いておくと起動時に設定される）
	:let @m=":'a,'bs/"
		:let @s=":%!sort -u"
	----------------------------------------
	" レジスタの中身を表示する
	:reg             : 全レジスタの中身を表示
	:reg a           : 個個のレジスタの中身を表示
	"1p....          : 数字つきレジスタ("1, "2, "3, ...)を順番に引き出す
	:let @y='yy@"'   : レジスタの pre-loading (.vimrcに書く)
	qqq              : レジスタqを空にする
	----------------------------------------
	" 便利なトリック
	"ayy@a           : テキストファイル中の vim コマンドを実行
	yy@"             : 同上（無名レジスタを使う）
	u@.              : たった今入力したテキストを実行
	----------------------------------------
	" 他のコマンドの出力を取得する（外部プログラムが必要）
	:r!ls.exe        : ls の出力を読む
	!!date           : 同上（しかし現在行を出力で置き換える）
	" 外部コマンドの sort でソート
	:%!sort -u       : 外部プログラムを使ってバッファをフィルタリング
	:'a,'b!sort -u   : 外部プログラムを使ってバッファをフィルタリング
	!1} sort -u      : パラグラフをソート(ノーマルモードに注意！)
	:g/^$/;,/^$/-1!sort : 各ブロックをソート (note the crucial ;)
	----------------------------------------
	" 複数ファイルの管理 (Essential)
	:bn              : 次のバッファへ
	:bp              : 前のバッファへ
	:wn              : ファイルを保存し次へ(super)
	:wp              : ファイルを保存し前へ
	:bd              : ファイルをバッファリストから削除 (super)
	:bun             : バッファをアンロード（ウィンドウを消すがバッファリストからは消さない）
	:badd file.c     : バッファリストにファイルを追加
	:b 3             : バッファ3へ
	:b main          : 名前に main (例. main.c)を含むバッファを開く。(ultra)
	:sav php.html    : カレントファイルを php.html に保存して php.html を開く
	:sav! %<.bak     : カレントファイルの拡張子を変えて保存 （古い方法）
	:sav! %:r.cfm    : カレントファイルの拡張子を変えて保存
	:sav %:s/fred/joe/           : ファイル名の一部を置換する
	:sav %:s/fred/joe/:r.bak2    : ファイル名と拡張子の一部を置換する
	:!mv % %:r.bak   : rename current file (DOS use Rename or DEL)
	:e!              : 修正されていない状態に戻す
	:w c:/aaa/%      : ファイルを他の場所に保存する
	:e #             : 代替ファイルを編集する (C-^ でも同じ)
	:rew             : 編集ファイルリストの最初に戻る (:args)
	:brew            : buffer rewind
	:sp fred.txt     : ウィンドウを分割して fred.txt を開く
	:sball,:sb       : 全てのバッファを分割する (super)
	:scrollbind      : これを分割した各ウィンドウ中で実行する
	:map   <F5> :ls<CR>:e # : F5 を押すと全バッファリストを表示するので番号をタイプするだけ
	:set hidden      : カレントバッファを保存せずに他のバッファに移動できるようになる
	----------------------------------------
	" 分割ウィンドウ間ですばやい移動
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	----------------------------------------
	" レコーディング(BEST TIPS of ALL)
	qq  # record to q
	your complex series of commands
	q   # end recording
	@q to execute
	@@ to Repeat
	5@@ to Repeat 5 times
	" レジスタ／レコーディングを編集する
	"qp                               :レジスタqの中身を表示する (ノーマルモード )
	<ctrl-R>q                         :レジスタqの中身を表示する (インサートモード )
	" キーレコーディングの中身を見ることができる。必要なら編集もできる
	"qdd                              :put changed contacts back into q
	@q                                :レジスタqの中身を実行する
	" 矩形範囲に対してレコーディングを実行する
	1) define recording/register
	qq:s/ to/ from/g^Mq
	2) Define Visual BLOCK
	V}
	3) hit : and the following appears
	:'<,'>
	4)Complete as follows
	:'<,'>norm @q
	----------------------------------------
	" レコーディングとマップを組み合わせる(to end up in command mode)
	nnoremap ] @q:w!<bar>bd
	----------------------------------------
	" ヴィジュアルモードは新しく通常もっとも直感的な編集モード
	" ヴィジュアルモード基礎
	v                               : ヴィジュアルモードに入る
	V                               : ヴィジュアルモード行全体
	<C-V>                           : ヴィジュアルブロックモードに入る
	gv                              : 最後の選択範囲を再選択 (ultra)
	o                               : navigate visual area
	"*y                             : 選択範囲をペーストバッファにヤンク
	V%                              : 対応するところまで選択
	V}J                             : 選択範囲を連結(great)
	V}gJ                            : 選択範囲を連結。スペースをはさまずに
	----------------------------------------
	" 以下10行の最初の2文字を削除する
	0<c-v>10j2ld
	----------------------------------------
	" 矩形選択を使って列をコピーする
	" <C-V> それから移動コマンドを使って列を選択し、c,d,y,r など
	then c,d,y,r etc
	----------------------------------------
	" 矩形選択範囲のテキストを別のブロックで上書きする方法
	最初のブロックを拾う: ctrl-v 移動 "ay
	2番めのブロックを拾う: ctrl-v 移動 c ctrl-o "aP <esc>
	----------------------------------------
	" _vimrc essentials
	:set incsearch : タイプする度に単語を検索してジャンプする(annoying but excellent)
	:set wildignore=*.o,*.obj,*.bak,*.exe : タブ補完がこれらを無視するようになる
	:set shiftwidth=3                     : シフト／タブに関係する
	:set vb t_vb=".                       : 静かにさせる（ビープを止める）
	:set browsedir=buffer                 : GUI の「ファイルを開く」ダイアログでカレントバッファ
		のディレクトリをカレントディレクトリにさせる。
	----------------------------------------
	" Windows インターネットエクスプローラを起動する
	:nmap ,f :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p<CR>
	:nmap ,i :update<CR>: !start c:\progra~1\intern~1\iexplore.exe <cWORD><CR>
	----------------------------------------
	" FTPing from VIM
	cmap ,r  :Nread ftp://209.51.134.122/public_html/index.html
	cmap ,w  :Nwrite ftp://209.51.134.122/public_html/index.html
	gvim ftp://www.somedomain.com/index.html # uses netrw.vim
	----------------------------------------
	" レジスタに追加する (大文字にする)
	" 5行を "a" にヤンクし、さらに5行追加する
	"a5yy
	10j
	"A5yy
	----------------------------------------
	[I     : カーソル下の単語 <cword> にマッチする行を一覧表示 (super)
	----------------------------------------
	" 昔ながらのシフト／インデント
	:'a,'b>>
	" 選択してシフト (選択範囲が解除されないのでそのまま繰り返せる)
	:vnoremap < <gv
	:vnoremap > >gv
	" ブロックをシフトする (magic)
	>i{
	>a{
	" または
	>% and <%
	----------------------------------------
	" リダイレクトとペーストレジスタ *
	:redir @*                    : コマンドの出力をペーストバッファにリダイレクト
	:redir END                   : リダイレクト終了
	:redir >> out.txt            : ファイルへリダイレクト
	" ペーストバッファを使う
	"*yy                         : ペーストバッファにヤンク
	"*p                          : ペーストバッファから貼り付け
	" ペーストバッファにヤンク
	:'a,'by*                     : 範囲をヤンク
	:%y*                         : バッファ全体をヤンク
	:.y*                         : 現在行をヤンク
	" 印字不能文字をフィルタする
	" gui アプリから貼りつけたときに便利
	:nmap <leader>p :let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p
	----------------------------------------
	" テキストの整形
	gq}                          : パラグラフを整形する
	gqap                         : パラグラフを整形する
	ggVGgq                       : ファイル全体を整形
	Vgq                          : 現在行
	" 70 文字目で改行を挿入する。できるなら ; の後で
	:s/.\{,69\};\s*\|.\{,69\}\s\+/&\r/g
	----------------------------------------
	" コマンドを複数ファイルに対して実行
	:argdo %s/foo/bar/e          : :args のすべてのファイルに対して実行
	:bufdo %s/foo/bar/e
	:windo %s/foo/bar/e
	:argdo exe '%!sort'|w!       : 外部コマンドを含む例
	----------------------------------------
	" コマンドラインのトリック
	gvim -h                    : help
	ls | gvim -                : ストリームを編集する！
	cat xx | gvim - -c "v/^\d\d\|^[3-9]/d " : ストリームをフィルタする
	gvim -o file1 file2        : 分割して開く
	" ファイルを開いた後でコマンドを実行する
	gvim.exe -c "/main" joe.c  : Open joe.c & jump to "main"
	" 1つのファイルに複数のコマンドを実行する
	vim -c "%s/ABC/DEF/ge | update" file1.c
	" 複数ファイルに複数コマンドを実行する
	vim -c "argdo %s/ABC/DEF/ge | update" *.c
	" 複数ファイルからテキストのブロックを削除
	vim -c "argdo /begin/+1,/end/-1g/^/d | update" *.c
	" ファイルの編集を自動化する（convert.vim中のExコマンド）
	vim -s "convert.vim" file.c
	#.vimrcとプラグインを読まずにVIMを起動する(clean VIM)
	gvim -u NONE -U NONE -N
	" Access paste buffer contents (put in a script/batch file)
	" ペーストバッファの中身にアクセス（スクリプトかバッチファイルに書く）
	gvim -c 'normal ggdG"*p' c:/aaa/xp
	" ペーストバッファの中身をデフォルトのプリンタに出力
	gvim -c 's/^/\=@*/|hardcopy!|q!'
	" gvim の外部grepの使い道(Win32 or *nix)
	:grep somestring *.php     : creates a list of all matching files
	" リストを進む・戻るには :cn(ext) :cp(rev)
	:h grep
	----------------------------------------
	" diff 機能 (Brilliant)
	*  dp                         : カーソル下の差分を他方のファイルに "put" する
	*  do                         : カーソル下の差分を他方のファイルから "get" する
		----------------------------------------
		" Vim のトラップ
		正規表現 バックスラッシュが必要 \+ （1個以上）
		正規表現 バックスラッシュが必要 \| （or）
		正規表現 バックスラッシュが必要 \( （グループ化）
		正規表現 バックスラッシュが必要 \{ （繰り返し）
		/fred\+/                   : fredまたはfreddyにマッチ。しかしfreeにはマッチしない
		/\(fred\)\{2,3}/           : note what you have to break
		----------------------------------------
		" \v または very magic (usually) を使うとバックスラッシュの数を減らせる
		/codes\(\n\|\s\)*where  : 通常の正規表現
	*  /\vcodes(\n|\s)*where   : very magic
		----------------------------------------
		" オブジェクトをコマンド／検索ラインにひっぱり出す (SUPER)
	*  <C-R><C-W> : カーソル下の word をコマンドラインや検索にひっぱり出す
		<C-R><C-A> : カーソル下の WORD をコマンドラインや検索にひっぱり出す
		<C-R>-                  : スモールレジスタの中身を挿入 (also insert mode)
		<C-R>[0-9a-z]           : 名前付きレジスタの中身を挿入 (also insert mode)
		<C-R>%                  : ファイル名を挿入 (# も可) (also insert mode)
		<C-R>=somevar           : 変数の値を挿入 (例 :let sray="ray[0-9]")
		----------------------------------------
		" レジスタ操作
		:let @a=@_              : レジスタaをクリア
		:let @a=""              : レジスタaをクリア
		:let @*=@a              : レジスタaをペーストバッファにコピー
		:let @*=@:              : 最後のコマンドをペーストバッファにコピー
		:let @*=@/              : 最後の検索語をペーストバッファにコピー
		:let @*=@%              : 現在のファイル名をペーストバッファにコピー
		----------------------------------------
		" help for help (USE TAB)
		:h quickref             : VIM クイックリファレンスシート (ultra)
		:h tips                 : Vim 自身の tips help
	*  :h visual<C-D><tab>     : visual に関するヘルプを全部リストする
		: その後 tab でそれらを1個1個回っていける
	*  :h ctrl<C-D>            : コントロールキーのヘルプを全部リストする
	*  :helpg uganda           : grep HELP Files use :cn, :cp to find next
	*  :helpgrep edit.*director: 正規表現を使ってヘルプを検索
	*  :h :r                   : :ex コマンドのヘルプ
		:h CTRL-R               : ノーマルモード
		:h /\r                  : 正規表現中で \r は何を意味するか(<CR>にマッチする)
		:h \\zs                 : ヘルプで \zs を見つけるにはバックスラッシュを2個にする
		:h i_CTRL-R             : インサートモードでの<C-R>のヘルプ
		:h c_CTRL-R             : コマンドモードでの<C-R>のヘルプ
		:h v_CTRL-V             : ヴィジュアルモード
		:h tutor                : VIM チュートリアル
		<C-[>, <C-T>            : ヘルプの履歴を前後に移動
		gvim -h                 : VIM コマンドラインヘルプ
		----------------------------------------
		" このオプションはどこで :set されたのか
		:scriptnames            : 読み込まれたプラグイン, _vimrc らを全て表示(super)
		:verbose set history?   : history の値とどこで設定されたかを表示
		:function               : 関数をリストする
		:func SearchCompl       : 特定の関数をリストする
		----------------------------------------
		" 独自の vim help を作る
		:helptags /vim/vim64/doc  : rebuild all *.txt help files in /doc
		:help add-local-help
		----------------------------------------
		" ファイルに外部プログラムをかける(例 php)
		map   <f9>   :w<CR>:!c:/php/php.exe %<CR>
		map   <f2>   :w<CR>:!perl -c %<CR>
		----------------------------------------
		" 現在のスクリプトの出力を別のバッファに出力する
		:new | r!perl #                   : 新しいバッファを開き、それまでいたバッファの実行結果を読み込む
		:new! x.out | r!perl #            : 上と同様。名前付きのファイル。
		:new+read!ls
		----------------------------------------
		" 新規バッファを作り、その中にレジスタqをペーストし、新バッファをソートする
		:new +put q|%!sort
		----------------------------------------
		" DOS 改行を挿入する
		:%s/$/\<C-V><C-M>&/g          :  that's what you type
		:%s/$/\<C-Q><C-M>&/g          :  for Win32
		:%s/$/\^M&/g                  :  what you'll see where ^M is ONE character
		----------------------------------------
		" 自動的に行末のDOS改行、ホワイトスペースを削除
	*  autocmd BufRead * silent! %s/[\r \t]\+$//
	*  autocmd BufEnter *.php :%s/[ \t\r]\+$//e
		----------------------------------------
		" 特定のファイルやファイルタイプに対してアクションを引き起こす
		autocmd VimEnter c:/intranet/note011.txt normal! ggVGg?
		autocmd FileType *.pl exec('set fileformats=unix')
		----------------------------------------
		" 最後のコマンドラインコマンドをテキストに挿入する
	*  i<c-r>:
		" 最後の検索語をテキストに挿入する
		i<c-r>/
		----------------------------------------
		" さらなる補完
		<C-X><C-F>                        :カレントディレクトリのファイル名を挿入
			----------------------------------------
			" 選択範囲内で置換
			" 普通に選択して(:h visual) :s/Emacs/Vim/ などとタイプする
			:'<,'>s/Emacs/Vim/g               : '<.'> はタイプする必要ない
			gv                                : 前に選択した範囲を再選択 (ULTRA)
			----------------------------------------
			" ファイルに行番号を挿入
	*   :g/^/exec "s/^/".strpart(line(".")."    ", 0, 4)
		:%s/^/\=strpart(line(".")."     ", 0, 5)
			━━━━━━━━━━━━━━ :%s/^/\=line('.'). ' '
		----------------------------------------
			#numbering lines VIM way
			:set number                       : 行番号を表示
	*   :map <F12> :set number!<CR>       : 行番号を表示（トグル）
		:%s/^/\=strpart(line('.')."        ",0,&ts)
			━━━━━━━━━━━━━━ 任意の数字から始めて行を番号づける（PC上では Perl が必要）
		:'a,'b!perl -pne 'BEGIN{$a=223} substr($_,2,0)=$a++'
			#数字のリストを生成
			#Type in number on line say 223 in an empty file
			qqmnYP`n^Aq                       : q にレコードするので @q で繰り返す
			" ファイルの最後まで、すでにある数字をインクリメント(type <c-a> as 5 characters)
			:.,$g/^\d/exe "normal! \<c-a>"
		" 高度なインクリメンティング
			━━━━━━━━━━━━━━ http://vim.sourceforge.net/tip_view.php?tip_id=150
		----------------------------------------
		" 高度なインクリメンティング (really useful)
			━━━━━━━━━━━━━━ " 以下を _vimrc に書く
		let g:I=0
		function! INC(increment)
		let g:I =g:I + a:increment
		return g:I
		endfunction
		" 例）マークa,bの間に223から始まり5ずつ増えるリストを作成
		:let I=223
		:'a,'bs/^/\=INC(5)/
		" create a map for INC
			cab viminc :let I=223 \| 'a,'bs/$/\=INC(5)/
		----------------------------------------
		" 23から64までの数字を挿入する
		o23<ESC>qqYp<C-A>q40@q
			----------------------------------------
		" 現在のインサートモード内での編集／移動 (Really useful)
		<C-U>                             : 挿入したテキストをすべて削除
		<C-W>                             : 最後の単語を削除
			<HOME><END>                       : 行頭／行末
		<C-LEFTARROW><C-RIGHTARROW>       : 単語移動
		<C-X><C-E>,<C-X><C-Y>             : インサートモードを抜けずにスクロール
		----------------------------------------
			#暗号化 (使うときは鍵を忘れないように）
			:X                                : 鍵の入力を促される
			:h :X
		----------------------------------------
		" モードライン（ファイルを読み込み専用にするなど）は最初/最後の5行以内に無ければならない
		// vim:noai:ts=2:sw=4:readonly:
			" vim:ft=html:                    : HTML 構文強調を使うように指示
		:h modeline
		----------------------------------------
		" 独自の GUI ツールバーのエントリを作る
			amenu  Modeline.Insert\ a\ VIM\ modeline <Esc><Esc>ggOvim:ff=unix ts=4 ss=4<CR>vim60:fdm=marker<esc>gg
			----------------------------------------
		" カーソル下の単語をファイルに保存する関数
		function! SaveWord()
			normal yiw
			exe ':!echo '.@0.' >> word.txt'
		endfunction
		map ,p :call SaveWord()
		----------------------------------------
			" 重複する行を削除する関数
			function! Del()
			if getline(".") == getline(line(".") - 1)
				norm dd
			endif
			endfunction
		:g/^/ call Del()
		----------------------------------------
		" 合字 (非アルファベット・数字）
			:digraphs                         : display table
		:h dig                            : help
		i<C-K>e'                          : enters
		i<C-V>233                         : enters   (Unix)
			i<C-Q>233                         : enters   (Win32)
		ga                                : View hex value of any character
		# 非アスキー文字を削除する(いくつかは不可視文字)
		:%s/[<C-V>128-<C-V>255]//gi       : Control-v をタイプすること
			:%s/[ - ]//gi                     : Should see a black square & a dotted y
		:%s/[<C-V>128-<C-V>255<C-V>01-<C-V>31]//gi : All pesky non-asciis
		:exec "norm /[\x00-\x1f\x80-\xff]/"        : same thing
		#Pull a non-ascii character onto search bar
			yl/<C-R>"                         :
		/[^a-zA-Z0-9_[:space:][:punct:]]  : すべての非アスキーを検索する
		----------------------------------------
		" All file completions grouped (for example main_c.c)
			:e main_<tab>                     : タブ補完
		gf                                : カーソル下のファイル名を開く  (normal)
		main_<C-X><C-F>                   : ファイル名を挿入 (insert mode)
		----------------------------------------
			" Complex Vim
		" 2つの単語をスワップする
	*  :%s/\<\(on\|off\)\>/\=strpart("offon", 3 * ("off" == submatch(0)), 3)/g
		" swap two words
			:vnoremap <C-X> <Esc>`.``gvP``P
		----------------------------------------
		" テキストファイルを html に変換する
	*  :runtime! syntax/2html.vim        : txt を html に変換する
		:h 2html
		----------------------------------------
		" vim 内部から grep。（vim7からはvimに組み込みのgrepもある。:h vimgrep）
		:grep some_keyword *.c            : some_keyword を含む .c ファイルのリストを得る
			:cn                               : 次のヒット場所にジャンプ
		----------------------------------------
		" 拡張子が .pl でないファイルの色づけを強制的に Perl のものにする
		:set syntax=perl
			" 色づけをやめる (useful for all sorts of reasons)
		:set syntax off
		" カラースキームを変更 (any file in ~vim/vim??/colors)
		:colorscheme blue
			" モードラインによって html の色づけをさせる
				今回はすでに用意されているカラースキーマを利用することにします。 カラースキーマの場所
				~/vimfiles/colors
				ホームディレクトリにvimfilesディレクトリがない場合は作成します。
				mkdir vimfiles ;mkdir vimfiles/colors
				ウェブで配布されているものもしくは、/usr/share/vim/vim71/colorsにあるカラースキーマを ~/vimfiles/colors内にコピーします。
				今回は、巷で人気のzenburnを設定します。
					(ubuntu-example)
					you@ecolnux:~/vimfiles/colors$ ls /usr/share/vim/vim71/colors/
					README.txt  darkblue.vim  delek.vim   elflord.vim  koehler.vim  murphy.vim  peachpuff.vim  shine.vim  torte.vim
					blue.vim    default.vim   desert.vim  evening.vim  morning.vim  pablo.vim   ron.vim        slate.vim  zellner.vim
					cd ~/vimfiles/colors/
					wget http://slinky.imukuppi.org/zenburn/zenburn.vim
				ファイルを配置したらvimの設定ファイルを開きます。 設定ファイルの一番下に以下を追加します。
				gvim ~/.vimrc
				colorscheme zenburn
		# vim:ft=html:
		" 自動的に色づけを強制する (非標準の拡張子をもつファイルのために）
		au BufRead,BufNewFile */Content.IE?/* setfiletype html
		----------------------------------------
		:set noma (non modifiable)        : ファイルの変更を阻止する
		:set ro (Read Only)               : 意図しないファイルの書き込みを阻止する
		----------------------------------------
		" セッション（ファイルのセットを開く）
		gvim file1.c file2.c lib/lib.h lib/lib2.h : 「セッション」用のファイルを読み込む
		:mksession                        : Session ファイルを作成 (デフォルトでは Session.vim)
		:q
		gvim -S Session.vim               : すべてのファイルを読み直す
		----------------------------------------
		#tags (サブルーチン／関数へジャンプ）
		taglist.vim                       : 人気の高いプラグイン
		:Tlist                            : タグを表示（関数のリスト）
		<C-]>                             : カーソル下の関数へジャンプ
		----------------------------------------
		" columnise a csv file for display only as may crop wide columns
		:let width = 20
		:let fill=' ' | while strlen(fill) < width | let fill=fill.fill | endwhile
		:%s/\([^;]*\);\=/\=strpart(submatch(1).fill, 0, width)/ge
		:%s/\s\+$//ge
		" csv の特定のカラムをハイライト (put in .vimrc)
		function! CSVH(x)
			execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
			execute 'normal ^'.a:x.'f,'
		endfunction
		command! -nargs=1 Csv :call CSVH(<args>)
		" call with
		:Csv 5                             : 5番めのカラムをハイライト
		----------------------------------------
		" 折り畳み : hide sections to allow easier comparisons
		zf}                               : モーションを使ってパラグラフを折り畳む
		v}zf                              : ヴィジュアル選択を使ってパラグラフを折り畳む
		zf'a                              : マーク位置までを折り畳む
		zo                                : 折り畳みを開く
		zc                                : 折り畳みをまた閉じる
		----------------------------------------
		" 不可視文字を表示
		:set list
		:h listchars
		----------------------------------------
		" インサートモードに入らずに「ノーマルコマンド」をペーストする方法
		:norm qqy$jq
		----------------------------------------
		" ファイル名操作
	*  :h filename-modifiers             : ヘルプ
		:w %                              : 現在のファイル名に書き出す
	*  :w %:r.cfm                        : 拡張子を .cfm に変える
		:!echo %:p                        : フルパス＆ファイル名
		:!echo %:p:h                      : フルパスオンリー
		:!echo %:t                        : ファイル名オンリー
	*  :reg %                            : ファイル名を表示
	*  <C-R>%                            : ファイル名を挿入 (insert mode)
	*  "%p                               : ファイル名を挿入 (normal mode)
		/<C-R>%                           : テキスト中からファイル名を検索
		----------------------------------------
		" 無名レジスタに記録せずに削除
		"_d                               : what you've ALWAYS wanted
		"_dw                              : eg delete word (use blackhole)
		----------------------------------------
		" フルパスをペーストバッファにコピー。emailに貼り付けるときなんかに
		nnoremap <F2> :let @*=expand("%:p")<cr> :unix
		nnoremap <F2> :let @*=substitute(expand("%:p"), "/", "\\", "g")<cr> :win32
		----------------------------------------
		" vim を抜けずにファイルをリネームするシェルスクリプト
		$ vim
		:r! ls *.c
		:%s/\(.*\).c/mv & \1.bla
		:w !sh
		:q!
		----------------------------------------
		" ファイル中の単語数を数える
	*  g<C-G>
		----------------------------------------
		" 独自のハイライティングを定義する例
		:syn match DoubleSpace "  "
		:hi def DoubleSpace guibg=#e0e0e0
		----------------------------------------
		" 上の行を現在行に単語ごとにコピーする
		imap ]  @@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s
		nmap ] i@@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s
		" Programming keys depending on file type
		:autocmd bufenter *.tex map <F1> :!latex %<CR>
		:autocmd bufenter *.tex map <F2> :!xdvi -hush %<.dvi&<CR>
		----------------------------------------
		" Ms-Word のドキュメントを読む, antiword が必要
		:autocmd BufReadPre *.doc set ro
		:autocmd BufReadPre *.doc set hlsearch!
		:autocmd BufReadPost *.doc %!antiword "%"
		----------------------------------------
		" 折り畳み法
	*  vim: filetype=help foldmethod=marker foldmarker=<<<,>>>
		A really big section closed with a tag <<<
		--- remember folds can be nested ---
		Closing tag >>>
		----------------------------------------
		" Just Another Vim Hacker JAVH
		vim -c ":%s%s*%Cyrnfr)fcbafbe[Oenz(Zbbyranne%|:%s)[[()])-)Ig|norm Vg?"
		----------------------------------------
#Tanablog
#[Vim] Vim7 内蔵の grep を使う
	Vim7 内蔵の grep を使うには :vimgrep コマンドを使えばよい。
	:vimgrep /hogehoge/ *.txt
	最初にマッチしたファイルを開かないようにするには j フラグを使う。
	:vimgrep /hogehoge/j *.txt
	再帰的に検索するには **(starstar) を使う。
	:vimgrep /hogehoge/j **/*.txt
	検索結果は Quickfixリストに表示される。:copen で開き :ccl で閉じることができる。詳細は :he quickfix-window。
	:vimgrep /hoge/j **/*.txt | cwin  とやると、copenしなくてもQuickfixが開いてくれて幸せです。
		au QuickfixCmdPost make,grep,grepadd,vimgrep copen  #vimgrepやmake後にQuickFixウィンドウを自動的に開く方法[vim]
	パイプで次に入力したいコマンドを繋げられる。
	vimgrep をデフォルトの grep プログラムとして使用する
	:grep を :vimgrep のエイリアスにするには、gvimrc に以下の行を追加する。
	:set grepprg=internal
	:cn  :cp  vim vimgrepと併用してジャンプに使う cn, cp[vim]
ファイルフォーマット
	改行コード変更:e ++ff=unix
	:e ++ff=dos
:e ++ff=mac
:e ++ff=unix
This can also be used as saving operation (:w alone will not save using the lineendings you see on screen):

:w ++ff=dos
:w ++ff=mac
:w ++ff=unix
And you can use it from the command-line:

for file in $(ls *cpp)
do 
  vi +':w ++ff=unix' +':q' ${file}
done


	エンコード指定してよみなおし :e ++enc=utf-8
設定関連 オプション一覧 誰か親切な人が ./options に纏めてくれました。
	よく設定ファイルに書くコマンド
		? 頭の : は省略してます。
		? set ほげほげ系は noほげほげというように頭に no を付ける事でその機能の off/on を行
		います。
		set ignorecase                       検索文字列が小文字の場合は大文字小文字を区別
	検                                       なく検索する
	索  set smartcase                        検索文字列に大文字が含まれている場合は区別し
	関                                       て検索する
	連  set wrapscan                         検索時に最後まで行ったら最初に戻る
		set noincsearch                      検索文字列入力時に順次対象文字列にヒットさせ
			ない
		set number                           行番号を表示させる
		set nolist                           タブや改行を表示しない（表示する場合は行末が$
			、TABが^Iで表示される）
		set tabstop=4                        タブ幅を４文字にする
		set shiftwidth=4                     cindentやautoindent時に挿入されるタブの幅（
	装                                       tabstop と揃えておくと良い）
	飾  set showmatch                        括弧入力時の対応する括弧を表示
	関  syntax on                            シンタックスハイライトを有効にする
	連  set hlsearch                         検索結果文字列のハイライトを有効にする
		set laststatus=2                     ステータスラインを常に表示（編集中のファイル
			名が常に確認できるようになる）
		set showcmd                          入力中のコマンドをステータスに表示する
		set statusline=%<%f\ %m%r%h%w%{'['.  ステータスラインに文字コードと改行文字を表示
		(&fenc!=''?&fenc:&enc).']['.&ff.']'} する
		%=%l,%c%V%8P
	そ                                       編集中の内容を保ったまま別の画面に切替えられ
	の  set hid                              るようにする(デフォルトだと一度保存しないと切
	他                                       り替えられない)
	よく使うマップ定義†
	僕（=KaWaZ）が普段設定しているマップ定義です。
	F2 map <F2> <ESC>:bp<CR> 前のバッファ
	F3 map <F3> <ESC>:bn<CR> 次のバッファ
	F4 map <F4> <ESC>:bw<CR> バッファを削除する
	j  nnoremap j gj         表示行単位で行移動するようにする
	k  nnoremap k gk
	オプション一覧†
	これ以外のオプション一覧は ./options にあります。
	ただし、最新バージョンの全てのオプションを網羅できていないかもしれません。
文字コードの自動認識†
	以下を .vimrc に書いておけば日本語の文字コード識別は多分完璧 :D
	" 文字コードの自動認識
	if &encoding !=# 'utf-8'
		set encoding=japan
		set fileencoding=japan
	endif
	if has('iconv')
		let s:enc_euc = 'euc-jp'
		let s:enc_jis = 'iso-2022-jp'
		" iconvがeucJP-msに対応しているかをチェック
		if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
		" iconvがJISX0213に対応しているかをチェック
		elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
		endif
		" fileencodingsを構築
		if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
		else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
		endif
		" 定数を処分
		unlet s:enc_euc
		unlet s:enc_jis
	endif
	" 日本語を含まない場合は fileencoding に encoding を使うようにする
	if has('autocmd')
		function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
		endfunction
		autocmd BufReadPost * call AU_ReCheck_FENC()
	endif
	" 改行コードの自動認識
	set fileformats=unix,dos,mac
	" □とか○の文字があってもカーソル位置がずれないようにする
	if exists('&ambiwidth')
		set ambiwidth=double
	endif
	vim の文字コード判定の仕組みは以下の通りです。
		? fileencodings の設定を前から順に試してはじめにマッチしたものが採用される
		? encoding や fileencoding の設定値が途中に発見されるとそこで判定を止めてしまい後の
		設定は無視される
			□ この動作により、UNIX環境(euc-jpの場合)では euc-jp が fileencodings の前の方に
			設定されていると、cp932 や utf-8 で書いたファイルが文字化けてしまうので気をつ
			ける必要がある。
		? encoding に設定される文字コードは fileencodings に見つからなかったときのデフォルト
		値に使われるので fileencodings に設定する必要は無い。
	上記の設定では実行環境に合わせてそれらが吸収できるので windows 環境でも unix 環境でも
	上手く判定できる。
	■追記
		? EUC-JPで「～(波線)」が文字化ける問題を修正（eucjp-msが使える場合はそれを使うように
		）した。 2006-10-06 (金) 02:24
		? fileencoding=utf-8で編集中、□や○があるとその行でカーソル位置がずれる問題があった
		のだが、解決する設定（ambiwidth=double）を追加した。 2006-11-17 (金) 21:48
		? 日本語を含まないファイルを開いたときにfileencodingがiso-2022-jpになってしまう問題
		があったが、日本語の有無を再チェックしてより望ましい値（encodingの値）を
		fileencodingに設定するようにした。 2007-01-10 (水) 11:38
	文字コードを指定してファイルを開きなおす†
	普通は上記の自動認識で問題ないと思うが、それでも文字化けする場合や、わざと違う文字コー
	ドで開いてみたい場合に使う。
	例えば以下のようにするとeuc-jpでファイルを開き直せる。
	:e ++enc=euc-jp
	文字コードを変更して保存する†
	cp932 (Shift-JIS) にするには以下のようにする。
	:set fileencoding=cp932
	この状態だとまだ保存してないので :w してやれば文字コードを変更して保存になる。
改行コードの自動認識†
	以下を .vimrc に書いておけばよい。
	set fileformats=unix,dos,mac
	新規ファイルの場合 fileformats の最初の改行コードが使われるようなので好みにより順番を
	変えます。
	順番を変えても自動判定が失敗することは経験上無いようです。
	改行コードを変更する†
	:set fileformat=改行コードの種類
	ff は fileformat の短い形式なので ff でも良い。
	改行コードの種類で指定できるのは dos, max, unix の３つです。
	例）Windows形式の改行コードに変更するには以下のようにします。
	:set fileformat=dos
	改行コードの見分け方（UNIX環境前提）†
	改行コードが unix でない場合、^M という文字が大量に表示されることがあります。これは
	mac で使われる改行文字です。これを見たらきっと改行コードが違うんだなと思ってください。
	見分け方は以下の通りです。
		1. 普通に改行されていて特に問題を感じない→改行コードは unix
			2. 全ての行末に ^M がくっついている→改行コードは dos
		3. ^M が沢山表示されるうえに全てが1行に表示されてしまう→改行コードは mac
	改行コードが分かったら以下を実行すれば正常に表示されるようになります。(dosと分かった場
	合)
		:e ++ff=dos
検索語が画面の真ん中に来るようにする† .vimrc に以下のようなキーマッピングを書いておきます。
	nmap n nzz
	nmap N Nzz
	nmap * *zz
	nmap # #zz
	nmap g* g*zz
		nmap g# g#zz
	解説：zz はカレント行を画面の中心にします。（つまり n で検索語にカーソル移動したら勝手
	に zz でカレント行が画面の真ん中なるようにスクロールされるようになる）
暗号化†
	vim は単体で PKZIP とかと同じ暗号化アルゴリズムでファイルを暗号化することが出来ます。
	1. ファイルを暗号化する
		1. 暗号化したいファイルを以下のように -x オプションを付けて起動します。
			vim -x secret.txt
		2. 起動すると暗号化に使うパスワードの入力を求められます。確認の為２回聞かれます。
		3. 開いたら今まで通り普通にファイルの編集画面になります。
		4. このまま普通に :w などで保存すればファイルは暗号化して保存されます。
	2. 暗号化されたファイルを編集する
		1. vim によって暗号化されたファイルを開くには普通に vim で開くだけです。
			vim secret.txt
		2. 起動時にパスワードを要求するプロンプトが出るので正しいパスワードを入れれば普通
			に開いて編集できます。
		3. 間違ったパスワードを入れても復号化されますがそれは意味の無い只のバイナリデータ
			に見えるはずです。
	3. 暗号化を解除する、もしくはパスワードを変更する。
		1. まずは普通に起動してパスワードを入力してファイルを開きます。
		2. 以下のコマンドを実行すると新しいパスワードを要求されます。
			:X
		3. パスワードの変更後は普通に保存すれば新しいパスワードで暗号化されて保存されます
			。
		4. 暗号化を解除したい場合は :X でパスワードを空（何も入力せずにEnter）にして保存
			するだけです。
	4. 注意点
		1. 保存されたファイルは暗号化されますが、スワップファイルは暗号化されません。それ
			を読むことが出来る人はパスワードを知らなくても内容を見ることが出来ます。
				1. vim の起動時に -n を付けて起動すればスワップファイルは作成されません。
	バイナリ編集†
	vim でバイナリを編集したい場合ですが、よくある16進ダンプとそれのテキスト表示があると便
	利です。
	探してみたところこのサイトで xxd を使ってバイナリ編集をする方法を紹介していたので試し
	てみたところ便利そうなのでメモ。
	但しそのままだと少し問題があった*1 のでそれを修正した版が以下の設定です。
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
	augroup BinaryXXD
		autocmd!
		autocmd BufReadPre  *.bin let &binary =1
		autocmd BufReadPost * if &binary | silent %!xxd -g 1
		autocmd BufReadPost * set ft=xxd | endif
		autocmd BufWritePre * if &binary | %!xxd -r | endif
		autocmd BufWritePost * if &binary | silent %!xxd -g 1
		autocmd BufWritePost * set nomod | endif
	augroup END
コメント†
	? putty 繋げてリモートでvim使ってるときにIME使うとよくいらつくので、keylay21でキーボードレイアウトを変えると便利。 -- KaWaZ 2003-08-14 (木) 18:15:41
	? 文字コード自動認識だが、Fedora Core の日本語環境は UTF-8 な為、その場合も対応できるように修正した。 -- KaWaZ 2004-05-25 (火) 18:21:41
	? 「文字コードの自動認識」を使用していますが、EUC-JPのファイルで～を使用すると化けますが、これはUTF-8→EUC-JPの限界ですか？ -- 通りすがり? 2006-10-04 (水) 10:56:36
		□ 指摘サンクスです。EUC-JPのファイルで～等の文字を使えるようにしました。(iconvがeucjp-msに対応していれば) -- KaWaZ 2006-10-06 (金) 02:32:31
		□ ついでにencodingがeucjpだった場合の処理が間違ってたのでそれも修正しました。添付の .vimrc も修正してあります。 -- KaWaZ 2006-10-06 (金) 02:32:31
	? 文字コードの自動認識で、新規作成は期待通りEUC-JPになるのですが、日本語を含まないファイルを開いた時にISO-2022-JPになってしまうのが困っています。fileencodingsの先頭にEUC-JPを書くと自動認識されなくなってしまいますし、難しいですね。 -- 2006-12-07 (木) 00:20:41
		□ ISO-2022-JPとして認識した時に本当に日本語が含まれているかどうかをチェックして、日本語が含まれていなかったらencodingの値をfileencodingに使うように修正してみました。これにより日本語を含まないファイルでも eucjp がデフォの環境では eucjpが、utf-8 な環境では utf-8 で開けるようになりました。-- KaWaZ 2007-01-10 (水) 11:23:49
	? ++encが何かは分からないのですが:view ++enc=sjisこうゆう事も出きるんですね.見れないファイルがあって参考に成りました. -- en? 2008-08-20 (水) 20:44:46
vimからコマンドを実行し、その結果をバッファに取り込むことが可能です。
	:r!pwd 
	:. 
	:.!date
	:diffsplit を知った。便利だ。 -- KaWaZ 2003-10-30 (木) 18:22:17
	colordiff    diff file1 file2 | vim -vimでdiffをカラフルにして見る方法[vim]
	]c [c  vim vimdiffで差分の場所でジャンプする方法[vim]
	]p  vim インデントの深さに合わせて貼り付けをする方法[vim]
$HOME/.vimrc
	set autochdir
	au QuickfixCmdPost make,grep,grepadd,vimgrep copen  #vimgrepやmake後にQuickFixウィンドウを自動的に開く方法[vim]
	yzis  vimよりもより機能が強力で高速を目指すyzis[vim]
#vim config parametes
	#VIM CONFIG PARAMETERS:---------------------------------------------
		aleph  初期値：MS-DOSでは128、それ以外では224
		ヘブライ語アルファベットの最初の文字を表すASCIIコード。
		allowrevins  初期値：オフ
		CTRL-_で'revins'オプションをトグルさせる。挿入モードとコマンドラインモードで CTRL-_ を使用可能
		にする。これは既定ではオフになっている。ユーザが間違って SHIFT-_ ではなく CTRL-_ を打ち込み、
		右から左に書いていくモードに入って抜けられなくなる事態を防ぐためである。
		altkeymap  初期値：オフ
		編集モードで CTRL-_ で Farsi と英語のキーボードマップを切り替えられる。
		autoindent  初期値：オフ
		新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。新しい行で &lt;BS&gt; か
		CTRL-D 以外を打ち込まずに &lt;Esc&gt; か &lt;CR&gt; を打ち込むと、その行のインデントは削除され
		る。オプション 'autoindent' がオンのときは、テキストの整形処理 (コマンド "gq" を使ったり、挿入
		モードで1行の文字数が 'textwidth' に届いたとき) には最初の行のインデントが使われる。オプション
		'smartindent' オプションか 'cindent' がオンのときは、インデントの方法は違ってくる。オプション
		'paste' オプションがオンになると 'autoindent' はオフになる。
		autoread  初期値：オフ
		外部のエディタで編集中のファイルが変更されたら、自動的に読み直す。ファイルが削除された場合は読
		み直さない。
		autowrite  初期値：オフ
		自動的にファイルに保存する。 :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag,
		:! :make, CTRL-], CTRL-^ のコマンドを実行するたび、ファイルが変更されていれば、そのファイルを
		保存する。
		autowriteall  初期値：オフ
		autowriteよりもさらに多くのコマンドで自動保存する。 'autowrite' と同様のオプションだが、さらに
		":edit", ":quit", ":qall"コマンド ":exit", ":xit", ":recover" でも、ファイルが変更されているな
		ら保存する。またVimのウィンドウを閉じる際にも保存する。このオプションをオンにすると、オプショ
		ン 'autowrite' も同時にオンになったようになる。
		background  初期値："dark" または "light"
		見やすい色を表示するようにVimに背景色を教える。 "dark" に設定されていると、Vimは暗い背景によく
		合う色を使おうとする。"light" に設定されていると、Vimは明るい背景によく合う色を使おうとする。
		その他の値は無効である。
		backspace  初期値：""
		バックスペースキーの動作を決定する。
		値     効果
		indent autoindent を超えてバックスペースを働かせる
		eol    改行を超えてバックスペースを働かせる (行を連結する)
		start  挿入区間の始めでバックスペースを働かせるが CTRL-W と CTRL-U は挿入区間の始めでいったん
			止まる
		値が空のときは、Vi互換のバックスペーシングが使われる。バージョン 5.4 またはそれ以前との互換性
		にはこう設定する:
		値 効果
		0  ""と同じ
		1  "indent,eol"と同じ
		2  "indent,eol,start"と同じ
		backup  初期値：オフ
		ファイルを上書きする前にバックアップファイルを作る。書き込みが成功したらバックアップはそのまま
		置いておく。バックアップをずっと持っていたくはないが、書き込みの最中にはバックアップが欲しいと
		きには、このオプションをオフにしてオプション 'writebackup' をオンにすること (既定ではそうなっ
		ている)。全くバックアップが要らないなら両方をオフにすること (あなたのファイルシステムがほとん
		ど一杯ならこうするとよい)。
		backupcopy  初期値：Viの既定値: "yes" 、それ以外: "auto"
		バックアップファイルの作成方法を決定する。
		オプション  動作
		値
		yes         先にファイルのコピーを作ってバックアップにして、更新した内容は元のファイルに上書き
			する
		no          先に元のファイルをリネームしてバックアップにして、更新した内容は新しいファイルに書
			き出す
		auto        上の2つのどちらかで、適切な方を選ぶ
		オプション値の説明
		オプ
		ショ メリット                                     デメリット
		ン
			編集したファイルが特別な属性を持っているとき ファイルのコピーに余計な時間がかかる編集した
		yes  (例えばファイルがハードリンクまたはシンボリ  ファイルがリンクのとき、バックアップファイル
			ックリンクだったり、リソースフォークを持って の名前がリンク先の文書ファイルの名前でなく、
			いるとき)、全て元のまま保たれる              リンクファイルの名前になってしまう
				時々、元のファイルの持つ属性を新しいファイル
		no   高速である                                   にコピーしきれないことがある編集したファイル
			がリンクのとき、新しいファイルはリンクになら
			ない
			Vimが副作用なしにリネームの方法が使えると判  Vimが副作用なしにリネームの方法が使えると判
		auto 断したとき (属性がコピーでき、ファイルがリン 断したとき (属性がコピーでき、ファイルがリン
			クでないとき) は、そちらが使われる。それでは クでないとき) は、そちらが使われる。それでは
			問題がありそうなときはコピーの方法が使われる 問題がありそうなときはコピーの方法が使われる
		"no" と "auto" では問題が起きる場合がある。プログラムによっては、ファイルを開き、Vimを呼び出し
		てそのファイルを編集させ、(ファイル区別プログラムを使って) そのファイルが変更されたかどうかを
		調べるものがある。そうしたプログラムは新しく書き出されたファイルではなく、バックアップファイル
		の方を調べてしまう。例としては "crontab -e" が挙げられる。
		backupdir  初期値：Amigaでの既定値: ".,t:",Win32は、".,c:/tmp,c:、temp"、Unixでは ".,~/tmp,~/"
		バックアップファイルを作るディレクトリを設定する。値は、バックアップファイルを作るディレクトリ
		を、コンマ区切りのリストにしたもの。
		例：
		set backupdir=$HOME/backup
		バックアップファイルは、リスト内の、使用可能な最初のディレクトリの中に作られる値が空だと、バッ
		クアップファイルは作られない ('patchmode' は使えなくなる!) ディレクトリに "." を指定するのは、
		バックアップファイルを、編集されたファイルと同じディレクトリに作るということであるディレクトリ
		が "./" で (MS-DOSなどでは ".\") 始まるのは、バックアップファイルを作るディレクトリを、編集さ
		れたファイルとの相対的な位置で決めるということである。最初の "." は編集されたファイルのパス名
		で置き換えられる("." がディレクトリ名の内部にあるなら、特別な意味はない) コンマの後の空白は無
		視されるが、他の場所の空白はディレクトリ名の一部として見なされる。ディレクトリ名の先頭に空白を
		使いたいなら、その空白の前にバックスラッシュを置くことディレクトリ名にコンマを使いたいなら、そ
		のコンマの前にバックスラッシュを置くことディレクトリ名は '/' で終わってもよい環境変数は展開さ
		れる '\' には注意すること。空白の前には1個置き、オプションの値に '\' 自身を含めたいなら2個置く
		backupext  初期値："~", VMSでは: "_"
		バックアップファイルの拡張子。バックアップファイルの名前を作る際、元のファイル名の後ろに付け加
		える文字列。既定では普段使いそうもないものに定めてあるが、これは既存のファイルをバックアップフ
		ァイルで上書きするのを避けるためである。".bak" を使いたいかもしれないが、".bak" で終わるファイ
		ルに重要なものがないか確かめること。
		backupskip  初期値："/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*"
		バックアップを作成しないファイル名のパターン。ファイル名に対するパターンのリスト。この中に、書
		き込まれたファイルの名前にマッチするパターンがあれば、そのファイルのバックアップは作られない。
		ファイル名を指定してもよいし、ファイルのフルパスを指定してもよい (C:/temp/* という方法。既定値
		ではこの方法で、一時ファイル用のディレクトリを指定している) 。パターンの指定方法は |:autocmd|
		と同じである。|autocmd-patterns| を参照すること。また、特殊文字に注意するために |
		option-backslash| を参照すること。環境変数の $TMPDIR, $TMP や $TEMP が定義されていないと、既定
		値には使われない。"/tmp/*" はUnixでのみ使われる。
		balloondelay  初期値：600
		バルーン表示が出るまでの時間 (ミリ秒単位) 。
		ballooneval  初期値：オフ
		|balloon-eval| 機能を働かせる。
		binary  初期値：オフ
		バイナリモード。バイナリファイルを編集する前には、このオプションをオンにする。Vimの引数に |-b|
		を付けてもよい。このオプションがオンのときは、いくつかのオプションの設定が変わる: 'textwidth'
		は 0 'wrapmargin' は 0 'modeline' はオフ 'expandtab' はオフ
		bioskey  初期値：オン
		キーボードの入力にBIOSを使うオプション。オンのときは、キーボードの文字を得るためにバイオスが呼
		び出される。これはCTRL-C を認識するためにはよいが、コンソールでしか機能しない。ターミナルをシ
		リアルポートから利用する場合は、オフにすること。|'conskey'| も参照すること。
		bomb  初期値：オフ
		BOMの付加オプション。ファイルを書き込むときに以下の条件が満たされれば、BOM (Byte Order Mark,
		バイト順マーク) がファイル先頭に付けられる:
			? このオプションがオンであること-オプション 'binary' がオフであること
			? オプション 'fileencoding' が "utf-8", "ucs-2", "ucs-4" であるか、それらとリトルエンディア
			ンとビッグエンディアンの違いを除いて同一のエンコードであること
		breakat  初期値：" ^I!@*-+;:,./?"
		自動改行を行う文字。オプション 'linebreak' がオンのとき、どの文字で自動改行が起きるかを、この
		オプションで指定する。
		browsedir  初期値："last"
		ファイルブラウザにどのディレクトリを使うかを指定する:
		オプション値 動作
		last         前回にファイルブラウザを使ったディレクトリ
		buffer       バッファで開いているファイルのディレクトリ
		current      カレントディレクトリ
		{path}       {path} で指定されたディレクトリ
		bufhidden  初期値：""
		バッファがウィンドウ内に表示されなくなったときの動作を指定する。
		オプシ  動作
		ョン値
		&lt;
		empty&  グローバルなオプションの 'hidden' の値に従う
		gt;
		hide    バッファを隠す (解放しない)。オプション 'hidden' がオンでなくともそうする
		unload  バッファを解放する。オプション 'hidden' がオンであったり、|:hide| コマンドを使ったとき
			でもそうする
		delete  バッファをバッファリストから削除する。'hidden' オプションがオンだったり、|:hide| コマ
			ンドを使ったときでも、|:bdelete| コマンドを使ったときのように、リストからの削除を行う
		buflisted  初期値：オン
		バッファをバッファリストに表示させる。このオプションがオンならば、バッファはバッファリストに表
		示される。オフならば、そのバッファはコマンド ":bnext" コマンドや ":ls" 、バッファメニューなど
		の対象にならない。ファイル名やマークを思い出したりするためだけのバッファでは、このオプションは
		Vimによってオフにされる。ファイルの編集のためにバッファを作ったときは、このオプションはVimによ
		ってオンにされる。しかし ":buffer" コマンドでバッファに移動したときはそうではない。
		buftype  初期値：""
		バッファの種類を指定する。
		オプション値  動作
		&lt;empty&gt; 普通のバッファ
		nofile        ファイルと関連がなく、書き込まれる予定のないバッファ
		nowrite       書き込まれる予定のないバッファ
		quickfix      エラーリスト用の、quickfix バッファ
		help          ヘルプバッファ
		cdpath  初期値：環境変数 $CDPATH または ",,"
		:cdや:lcdコマンドで検索されるディレクトリのリスト。検索されるディレクトリは相対パスで指定する
		ことはできない ("/", "./" や "../" で始まってはいけない)。オプション 'cdpath' の値には、|path|
		オプションと同様の指定方法を使う。|file-searching| も参照すること。既定では、値は環境変数
		$CDPATH から取り込まれるが、カレントディレクトリを最初に探すために "," が先頭に挿入される。
		$CDPATH から取り込まれたものが望ましくないときは、値を上書きするために、次のコマンドを適当に修
		正し、あなたの vimrc ファイルに加えること:
		:let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]','\\\0', 'g'), ':', ',', 'g')
		安全上の理由から、このオプションをモードライン |modeline| から設定することはできない (オプショ
		ン cdpath の値の一部は、ファイル名を展開するためにシェルに渡すことができる)。
		cedit  初期値：Viの既定値: "", Vimの既定値: CTRL-F
		コマンドラインモード Command-line Mode で、コマンドラインウィンドウを開くために使われるキー。
		オプション 'compatible' がオフならば、既定ではCTRL-F である。
		charconvert  初期値：""
		文字エンコーディングの変換に使われる expression を定める。これは読み込まれようとしているファイ
		ルや書き込みをしたファイルのエンコーディングが、望むものと違うときに評価される。オプション
		'charconvert' の値は、内部関数 iconv() がサポートされ、それによる変換が可能ならば使われること
		はない。ずっと高速なため、iconv() の方が好まれる。
		cindent  初期値：オフ
		Cプログラムファイルの自動インデントを始める。挿入モード insert mode で再インデントを引き起こす
		文字列を指定するにはオプション 'cinkeys' を、好みのインデントスタイルを設定するにはオプション
		cinoptions を参照すること。
		cinkeys  初期値："0{,0},0),:,0#,!^F,o,O,e"
		再インデントを行わせる文字のリスト。オプション 'cindent' オプションがオンで、かつ 'indentexpr'
		が空の時のみ使われる。
		cinoptions  初期値：""
		C言語のインデント方法を決定する。このオプション 'cinoptions' は、C言語ソース内の行を 'cindent'
		で再インデントするときの方法に影響を与える。このオプションの値については|cinoptions-values| を
		、一般的なC言語ソースのインデントの情報については |C-indenting| をそれぞれ参照すること。
		cinwords  初期値："if,else,while,do,for,switch"
		行をさらにインデントするキーワード。オプション 'smartindent' オプションか 'cindent' がオンのと
		き、ここに指定したキーワードの次の行は、さらにインデントされる。 'cindent' がオンのときには、
		適切な場所 ({} の内側) でのみ機能する。Noteオプション 'ignorecase' オプションは cinwords の値
		には適用されないので注意すること。大文字か小文字かを区別したくないなら、値に両方を指定すること
		。
		例:
		"if,If,IF"
		clipboard  初期値：X-windowsでは"autoselect,exclude:cons\|linux"それ以外は、””
		クリップボードの動作設定。このオプションには、コンマ区切りのキーワードのリストを指定する。認識
		されるのは、これらのキーワードである:
		オプション値 動作
			これが含まれると、コピー、削除、変更、ペーストなどの操作で、普通なら無名レジスタ
			が使われるところで、全てクリップボードレジスタ "*" が使われるようになる。ただしレ
		unnamed      ジスタ名を陽に指定すれば、オプション 'clipboard' に"unnamed" が含まれているかいな
			いかに関わらず、指定されたレジスタが使われる。またクリップボードレジスタは、"*と
			いう記法を用いれば常にアクセスできる。
			オプション 'guioptions' の 'a' フラグのように働く: これが含まれると、Visualモード
			が開始されるたび、またはVisual選択範囲が変更されるたびに、Vimはウィンドウシステム
			のグローバルなクリップボードのオーナーになろうとするか、選択されたテキストをクリ
		autoselect   ップボード用レジスタ"*を使ってクリップボードにコピーしようとする。詳細については
			|guioptions_a| と |quotestar| を参照すること。GUI機能が有効のときはオプション
			'guioptions' の 'a' フラグが使用され、無効のときはこの"autoselect" フラグが使用さ
			れる。また、モードレスなセレクションにも適用される。
		autoselectml "autoselect" と似ているが、モードレスセレクションのみに適用される。オプション
			'guioptions' の 'A' フラグと比較してみること。
			ターミナルの名前 'term' にマッチするパターンを定義する。パターンがマッチすると、X
			サーバとの通信がなされなくなる。このオプションは次のようなときに便利である。
			- Vimをコンソールで使用しているとき。
			- アプリケーションを別のディスプレイで使うため、環境変数 $DISPLAY が設定されてい
			るとき。
		exclude:     - コンソールでVimを使用している最中にXサーバが終了させられ、Vimをキルせざるを得な
		{pattern}    いかもしれないとき。
			Xサーバと全く通信しないようにするには、次のようにする:
			exclude:.*
			これは引数 |X| を使用したのと同じ効果を持つ。Note 副作用として、ウィンドウのタイ
			トルは復元されないので注意すること。オプション 'magic' の値は無視され、 {pattern}
			はオプション 'magic' がオンのように解釈される。残りのオプションの値は {pattern}
			に適用される。
		cmdheight  初期値：1
		コマンドラインに使われるスクリーン上の行数。
		|hit-enter| プロンプトの出現を避けるのに役立つ。
		cmdwinheight  初期値：7
		コマンドライン・ウィンドウに使われるスクリーン上の行数。 |cmdwin| を参照すること。
		columns  初期値：80 またはターミナルの幅
		スクリーン上の列幅。普通このオプションはターミナルの初期化の時点で設定され、手動で設定する必要
		はない。VimがGUI環境内やサイズ変更可能なウィンドウ内で実行されているときは、このオプションを変
		更するとウィンドウサイズも変更されるかもしれない。あなたがこのオプションの値を変更したのに、
		Vimがディスプレイの列幅の物理的な値を変更できなかったら、ディスプレイ表示がめちゃめちゃになる
		おそれがある。
		comments  初期値："s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:&gt;,fb:-"
		コメント行の始まりとなる文字列の、コンマ区切りのリスト。 |format-comments| を参照すること。バ
		ックスラッシュを使って、値にスペースを含める方法については、|option-backslash| を参照すること
		。
		commentstring  初期値："/*%s*/"
		コメント用のテンプレート(雛形)。値の中の "%s" はコメントの内容と置き換えられる。現在のところ、
		折り畳み用のマーカを追加するためにのみ使用されている。|fold-marker| を参照すること。
		compatible  初期値：オン、 .vimrc ファイルが発見されたらオフ
		VimをなるべくVi互換にする。このオプションを有効にすると、Vimの便利な機能が使えなくなる。
		complete  初期値：: ".,w,b,u,t,i"
		キーワード補完に使われる単語を探す場所を指定する。このオプションは、CTRL-P コマンドや CTRL-N
		コマンドによるキーワード補完 |ins-completion| の動作を指定する。このオプションは行全体の補完|
		i_CTRL-X_CTRL-L| にも適用される。このオプションは補完の方法と、キーワード検索の対象となる場所
		を示す、コンマ区切りのフラグのリストである。
		オプシ  動作
		ョン値
		.       カレントバッファから検索 (オプション 'wrapscan' の値は無視)
		w       別のウィンドウ内のバッファから検索
		b       バッファリスト内の、現在読み込まれている別のバッファから検索
		u       バッファリスト内の、現在読み込まれていない別のバッファから検索
		U       バッファリストにないバッファから検索
		k       オプション 'dictionary' で指定されたファイルから検索
		k{dict} {dict} で与えられたファイルから検索。 "k" フラグを複数指定してもよい。ファイル名はパタ
			ーンでも指定できる :set cpt=k/usr/dict/*,k~/spanish
		s       オプション 'thesaurus' で指定されたファイルから検索
		s{str}  {str} で与えられたファイルから検索。 "s" フラグを複数指定してもよい。ファイル名はパタ
			ーンでも指定できる。
		i       カレントファイルとインクルードされるファイルから検索
		d       カレントファイルとインクルードされるファイルから、定義された名前またはマクロを検索
		]       タグ補完
		t       "]" と同じ
		confirm  初期値：オフ
		ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出すオプション。オプション
		'confirm' がオンならば、バッファへの変更を保存していないと実行に失敗する操作 (つまり ":q" と
		":e") の際、ダイアログ |dialog| を開いてファイルを保存するかどうか尋ねる。これがオンになってい
		ても、意図的に変更を廃棄したいなら ! を使える。オプション 'confirm' がオフでも、|:confirm| コ
		マンドで個別に確認を求めることができる (これはキーマッピングでとても便利である)。関数 |confirm
		()| とオプション 'guioptions' の 'v' フラグも参照すること。
		conskey  初期値：オフ
		キーボードの文字を受け取るのに直接コンソール出入力が使う。このオプションがオンのとき、キーボー
		ドの文字を受け取るのに直接コンソール出入力が使われる。これはたいていの場合有効である。|
		'bioskey'| も参照すること。合わせて、3種類のコンソール入力が使える:
		cpoptions  初期値：Vimは "aABceFs", Viでは全てのフラグ
		個別の機能をVi互換にする。 1文字のフラグの列で設定する。フラグが設定されると、対応する動作がVi
		互換になる。このオプションは、大部分、またはある程度のVi互換が求められるときに使われる。
		cscopepathcomp  初期値：0
		タグのリストの中でいくつのパスのコンポーネントを表示するかを指定する。 |cscopepathcomp| を参照
		すること。
		cscopeprg  初期値："cscope"
		Cscope を実行するコマンド名を指定する。 |cscopeprg| を参照すること。安全上の理由から、このオプ
		ションをモードライン |modeline| から設定することはできない。
		cscopetag  初期値：オフ
		タグコマンドに cscope を使う。 |cscope-options| を参照すること。NOTE: このオプションはオプショ
		ン 'compatible' がオンに設定されたときにオフに設定されるので注意すること。
		cscopetagorder  初期値：0
		コマンド ":cstag" が検索を行う順番を指定する。 |cscopetagorder| を参照すること。
		cscopeverbose  初期値：オフ
		Cscope のデータベースに情報を追加するときメッセージを表示する。 |cscopeverbose| を参照すること
		。
		debug  初期値：""
		値が "msg" に設定されると、省かれるはずのエラーメッセージも表示されるようになる。これはオプシ
		ョン 'foldexpr' オプションや 'indentexpr' をデバッグするのに便利である。
		define  初期値："^#\s*define"
		マクロ定義を発見するのに使われるパターンを指定する。値はコマンド "/" で使うのと同様の検索パタ
		ーンである。このオプションはコマンド "[i" やコマンド "[d" など |include-search| に使われる。オ
		プション 'isident' はマッチした部分の後の定義された名前を認識するのに使われる:
		delcombine  初期値：オフ
		ユニコードのファイルを編集するときの文字の削除方法。ユニコードのファイルを編集する際にこのオプ
		ションがオンならば、バックスペースとNormalモードのコマンド "x" はそれぞれの文字の上の
		combining character のみを削除する。オフのときは (これが既定値である) combining character と文
		字は同時に削除される。
		dictionary  初期値：""
		キーワード補完コマンドで使われる単語の書かれた辞書ファイル。コンマ区切りのファイル名のリスト。
		キーワード補完コマンド|i_CTRL-X_CTRL-K| 用の単語を探すために使われる。単語のリストからなるファ
		イルを指定する。その中では1行ごとに1語が並べられていてもよいし、1行にキーワードでない文字 (空
		白文字を推奨) で区切られた数語が並んでいてもよい。1行の文字数の最大値は510バイト分である。
		diff  初期値：オフ
		カレントウィンドウをファイル間の差異を示すウィンドウのグループに組み入れる。 |vimdiff| を参照
		すること。
		diffexpr  初期値：""
		2個のファイル間の差異を求める際に、ed形式のdiffファイルを求めるために評価されるexpressionを指
		定する。 |diff-diffexpr| を参照すること。
		diffopt  初期値："filler"
		Diffモード用のオプションを設定する。このオプションの値には、以下の文字列をコンマで区切ったもの
		が設定できる。
			片方のウィンドウ内のテキストのある位置に行が挿入されていたときに、ウィンドウのスクロ
		filler   ールを同調させるために、埋め立て用の行を表示する。ウィンドウが隣り合っていて、
			'scrollbind' オプションがオンのときには大抵便利である。
		context: 変更のあった行と、変更がなく折り畳まれている行の間に、{n} 行分の「コンテキスト」を表
		{n}      示する。これが設定されていないと、コンテキストは6行になる。|fold-diff| を参照すること
			。
		icase    テキストの大文字と小文字の違いを無視する。"a"と "A" は同じものと見なされる。
			'diffexpr' オプションの値が空なら、コマンド "diff" に "-i" フラグを追加する。
			空白の数の違いを無視する。'diffexpr' オプションの値が空なら、コマンド "diff" に "-b"
		iwhite   フラグを追加する。これが正確には何を指定しているのかについてはコマンド "diff" のドキ
			ュメントを参照すること。これは後ろに追加された空白は無視するが、前に追加された空白は
			無視しないはずである。
		digraph  初期値：オフ
		Insertモードで{char1} &lt;BS&gt; {char2} でダイグラフを入力できるようにする。 |digraphs| を参
		照すること。
		directory  初期値：Amigaでの既定値: ".,t:",Win32は".,c:\tmp,c:\temp"、UNIXは".,~/tmp,/var/tmp,/tmp"
		スワップファイル用のディレクトリ名を、コンマで区切って指定する。
		例
		set directory=$HOME/backup
		display  初期値：""
		テキスト表示の方法を変える。値はフラグのコンマ区切りのリストである:
		オプショ 動作
		ン値
		lastline これが含まれると、ウィンドウの最後の行ができる限りまで表示される。含まれないと、最後
			の行が収まりきらないならその行は "@" と表示される。
		uhex     印刷できない文字を &lt;xx&gt; という形式で16進数表示し、^C や ~C の形式を使わない。
		eadirection  初期値："both"
		オプション 'equalalways' の動作
		オプション値 動作
		ver          ウィンドウの高さにのみ影響がある
		hor          ウィンドウの幅にのみ影響がある
		both         ウィンドウの高さと幅、両方に影響がある
		edcompatible  初期値：オフ
		edとの互換。コマンド ":substitute" のフラグ 'g' とフラグ 'c' を、次に別の方を指定するまでずっ
		と効力を持つようにする。|complex-change| を参照すること。
		encoding  初期値："latin1"または環境変数 $LANG によって決まる値
		Vimの通常使う文字エンコーディング。 Vim内部で使われる文字エンコーディングを設定する。そのエン
		コーディングはバッファやレジスタ内のテキスト、expression内の文字列、 viminfo ファイル内のテキ
		ストなどに適用される。つまり、このオプションはVimの通常扱う文字の種類を設定する。指定できる値
		については |encoding-names| を参照すること。
		endofline  初期値：オン
		ファイルの最後に&lt;EOL&gt;をつける。ファイルを書き込むときに、このオプションがオフでオプショ
		ン 'binary' がオンならば、ファイルの最終行に &lt;EOL&gt; が書き込まれない。このオプションはフ
		ァイルの編集を始めるときには自動的にオンになる。ただし編集を始めたファイルの最終行に &lt;EOL&
		gt; がないときにはオフになる。普通はユーザがこのオプションを設定する必要はない。オプション
		'binary' がオフのときはこのオプションの値は使われない。オプション 'binary' がオンのときには、
		ファイルの最終行に &lt;EOL&gt; があったかどうかを復元するためにこのオプションが使われる。その
		ため、ユーザがファイルを書き込むときに元のファイルの状態を保つことができる。しかし状態を変更す
		ることもできる。
		equalalways  初期値：オン
		全てのウィンドウのサイズを同じにする。オンのとき、ウィンドウを分割したり閉じたりした後、全ての
		ウィンドウが自動的に同じサイズになる。オフのときは、ウィンドウを分割するとカレントウィンドウの
		サイズだけが減り、他のウィンドウに変化はない。ウィンドウを閉じると、(オプション 'splitbelow'
		と 'splitright' の値に従って) 閉じたウィンドウの隣のウィンドウの行数が増す。水平に分割されたウ
		ィンドウと垂直に分割されたウィンドウが混ざっているときは、サイズの最小値が計算され、いくつかの
		ウィンドウは (余裕があれば)大きくなる。オプション 'eadirection' はサイズの変化する方向を指定す
		る。
		equalprg  初期値：""
		コマンド "=" に使う外部プログラムを指定する。値が空のときは内部関数が整形に使われる (オプショ
		ン 'lisp', 'cindent' または 'indentexpr')。環境変数は展開される |:set_env|。値に空白やバックス
		ラッシュを含めることについては |option-backslash| を参照すること。
		errorbells  初期値：オフ
		エラーメッセージに伴ってベル (ビープ音または画面フラッシュ) を発生させる。このオプションはエラ
		ーメッセージにのみ適用され、メッセージのない多くのエラー (例えばNormalモードで &lt;ESC&gt; を
		打ち込んだとき) についてはベルは常に使用される。ベルをビープ音にしたり、画面フラッシュにしたり
		、無効にしたりするためにはオプション 'visualbell' を参照すること。
		errorfile  初期値：通常は、"errors.err"、Amigaでは"AztecC.Err",
		QuickFixモードで使われるエラーファイルの名前 (|:cf| を参照すること)。コマンドライン引数 "-q"
		が指定されたときは、オプション 'errorfile' の値はそれに続く値に設定される。|-q| を参照すること
		。
		errorformat  初期値：既定値はとても長い
		エラーファイルの内容の書式を、関数 scanf 風に指定する (|errorformat|を参照すること)。
		esckeys  初期値：Vimの既定値: オン, Viの既定値: オフ
		&lt;Esc&gt; で始まるファンクションキーもInsertモードで認識されるようになる。このオプションをオ
		ンに設定すると、&lt;Esc&gt; で始まるファンクションキーもInsertモードで認識されるようになる。こ
		のオプションがオフのときは、カーソルキーとファンクションキーは、&lt; Esc&gt; で始まるなら
		Insertモードで使うことができない。こうすることの利点は、 &lt;Esc&gt; を一回打ち込むだけですぐ
		に認識され、1秒ほど待つ必要がないことだ。このオプションをオフにしなくても、オプション
		'timeoutlen' とオプション 'ttimeoutlen' の値を変更してもいいかもしれない。
		eventignore  初期値：""
		Autocommandのイベント名のうち、無視したいものをリストにして指定する。値が "all" に設定されると
		、全ての autocommand のイベントが無視され、autocommand は実行されなくなる。
		expandtab  初期値：オフ
		Insertモードで: &lt;Tab&gt; を挿入するのに、適切な数の空白を使う。また、コマンド '&gt;' や '&
		lt;' によるインデントや、オプション 'autoindent' がオンのときのインデントでも空白を使う。オプ
		ション 'expandtab' がオンのときに本当のタブを挿入するには、CTRL-V&lt;Tab&gt; を使うこと。
		|:retab| と|ins-expandtab| も参照すること。
		exrc  初期値：オフ
		カレントディレクトリ内のファイル .vimrc, .exrc や .gvimrc などの読み込みを行う。このオプション
		をオンにするなら、オプション 'secure' もオンにするよう検討すること (|initialization| を参照す
		ること)。ファイル.exrc, .vimrc や .gvimrc でローカルなものを用いると潜在的な安全保護の漏れを招
		くので、注意して使うこと！
		fileencoding  初期値：""
		カレントバッファ内のファイルの文字エンコーディングを設定する。オプション 'fileencoding' の値が
		オプション 'encoding' の値と異なるとき、ファイルの読み書きの際に文字エンコーディングの変換が行
		われる。
		fileencodings  初期値："ucs-bom", オプション 'encoding' の値がユニコードに設定されたときは
		"ucs-bom,utf-8,latin1"
		Vimが表示できる文字エンコーディングのリスト。このオプションには、ファイルの編集時に考慮される
		文字エンコーディングのリストを指定する。ファイルが読み込まれたとき、Vimはこのオプションの値の
		先頭の文字エンコーディングを使おうとする。そのときエラーが発見されると、値のリスト内で次に並ん
		でいるエンコーディングが試される。有効なエンコーディングが見つかると、オプション
		'fileencoding' の値がそれに設定される。全て失敗した場合は、オプション 'fileencoding' の値は空
		に設定される。これはオプション 'encoding' の値が使われていることを表す。
		例：
		set fileencodings=iso-2022-jp,cp932,euc-jp,utf-8,utf-16,ucs-2-internal,ucs-2
		fileformat  初期値：MS-DOS, MS-Windows, OS/2 での既定値: "dos", UNIXでは、”unix”, Macintoshは、”mac”
		改行コードの指定。バッファにファイルを読み込んだり、バッファからファイルに書き込んだりするとき
		に使われる &lt;EOL&gt; を、カレントバッファについて設定する。
		オプション値 動作
		dos          &lt;CR&gt;&lt;NL&gt;
		unix         &lt;NL&gt;
		mac          &lt;CR&gt;
		fileformats  初期値：MS-DOS, MS-Windows OS/2: "dos,unix", Unix: "unix,dos", Mac: "mac,unix,dos", Cygwin:
		"unix,dos", others: ""
		Vimが認識できるファイルフォーマットのリスト。
		例：
		set fileformats=unix,dos
		filetype  初期値：""
		開いているファイルのタイプ。このファイルタイプにより、強調表示などがされる。
		fillchars  初期値："vert:|,fold:-"
		ステータスライン、縦のウィンドウスプリッタ、フォールドなどの空白文字を埋める文字。
		例：
		fillchars=vert:|,fold:-,stl:-
		オプション値 動作
		stc:c        アクティブなバッファのステータスライン
		stlnc:c      アクティブではないバッファのステータスライン
		vert:c       縦方向のスプリッタ
		fold:c       フォールド
		diff:c       ディフの削除された行
		fkmap  初期値：オフ
		Farsi用のキーボードマッピングのON/OFF。
		foldclose  初期値：""
		フォールドを自動的にクローズする。 allに設定するとカーソルがフォールドの外にでると、自動的にフ
		ォールドされる。
		foldcolumn  初期値：0
		ウィンドウの端に確保される折畳を示すカラムの幅を指定する数。 0ならば、折畳表示カラムは確保され
		ない。通常は4から5が一般的。使い物になる最小値は2。最大値は12。
		foldenable  初期値：オフ
		フォールドの有効/無効。 :set foldenable でフォールドされる。 :set nofoldenable でフォールドが
		解除される。
		foldexpr  初期値："0"
		フォールドレベルを計算するスクリプト。タブで始まる一連の行範囲を1つの折畳にまとめる:
		:set foldexpr=getline(v:lnum)[0]==\"\\t\"
		折畳レベルを計算するのにVimスクリプトの関数を呼び出す:
		:set foldexpr=MyFoldLevel(v:lnum)
		空行で仕切られた「段落」を折畳とする:
		:set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
		同じ事(「段落」を折畳に)をする別の表現:
		:set foldexpr=getline(v:lnum-1)=~'^\\s*$'&&getline(v:lnum)=~'\\S'?'>1':1
		foldignore  初期値："#"
		フォールドのインデントを無視する行の先頭の文字。
		foldlevel  初期値：0
		フォールドするレベル。 'foldlevel'が0の時には、全ての折畳が閉じられる。 'foldlevel'が正の時に
		は、設定値より大きなレベルの折畳が閉じられる。 'foldlevel'が非常に大きい時は、全ての折畳が開か
		れる。 'foldlevel'は変更された時に適用される。その後に手動で折畳を開いたり閉じたりできる。値を
		増やした時には、新しいレベルの値以上の折畳が開かれる。手動で開かれていた折畳は閉じられない。値
		を減らした時には、新しいレベルの値以上の折畳が閉じられる。手動で閉じられていた折畳は開かれない
		。
		foldlevelstart  初期値：-1
		ファイルを開いたときのフォールドレベルの値。ファイルを開いたときに、foldlevelの値をこのオプシ
		ョンの値にする。
		foldmarker  初期値："{{{,}}}"
		フォールドする最初と最後の文字を設定する。 foldmethodがmakerの場合に、このオプションで指定した
		文字をフォールドの開始と終了とする。
		例：
		set foldmaker={{{,}}}
		# {{{1 レベル１の折り畳み
		#
		# レベル１の内容
		#
		# {{{2 レベル２の折り畳み
		#
		# レベル２の内容
		#
		# }}}
		# }}}
		foldmethod  初期値："manual"
		フォールドする種類
		オプシ 動作
		ョン値
		manual 折畳領域を定義するためにコマンドを手動で利用する。これはテキスト中の折畳を行なう箇所を
			スクリプトにより解析するのに使うこともできる。
		indent 折畳は各行のインデントにより自動的に定義される。
		expr   折畳は"indent"方式のように、折畳レベルによって自動的に定義される。'foldexpr'オプション
			の値は、各行についてこの折畳レベルを計算するためにスクリプトとして実行される。
		marker 'foldmaker'で指定したマーカの範囲。
		syntax 折畳が"fold"引数を持つ構文要素によって定義される。
			テキストの変更された箇所とその近辺以外が自動的に折畳として定義される。この方法は現在の
		diff   ウィンドウに対して'diff'オプションが設定されている時にだけ正しく働き、変更点が表示され
			る。そうでない場合バッファ全体が1つの大きな折畳となる。
		foldminlines  初期値：1
		折り畳む最小行数。 'foldminlines'よりも少ない行数の折畳は常に開いたように表示される。
		foldnestmax  初期値：20
		折り畳むネストの最大値。 foldmetiodをindent, syntaxにしたときの入れ子の最大値。
		foldopen  初期値："block,hor,mark,percent,quickfix,search,tag,undo"
		カーソルが移動したときに自動的に折り畳みを開く
		オプション値 動作
		all          全て
		block        "(", "{", "[[", "[{", etc.
		hor          横への移動 "|", "w", "fx", etc.
		insert       挿入動作
		jump         ジャンプ
		mark         マーク位置へのジャンプ
		percent      %での移動
		quickfix     ":cn", ":crew", ":make", etc.
		search       検索結果にヒットした場合
		tag          タグジャンプ
		undo         アンドゥ
		foldtext  初期値："foldtext()"
		閉じられた折り畳みを示すテキストを得るために実行されるスクリプト
		例
		:set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
		これは折畳の最初の1行を、"/*" と "*/" を追加し"{{{"を削除して表示する。多めのバックスラッシュ
		(\ 記号)はある文字が":set"コマンドに解釈されてしまうのを避けるために使用されている。これは以下
		のように関数を定義するとより簡単になる:
		:set foldtext=MyFoldText()
		:function MyFoldText()
		:  let line = getline(v:foldstart)
		:  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
		:  return v:folddashes . sub
		:endfunction
		formatoptions  初期値：Vim : "tcq", Vi : "vt"
		Vimがテキストを整形する方法を決定するオプションのリスト。
		オプション  動作
		値
		t           textwidthを使ってテキストを自動折返しする。
		c           現在のコメント指示を挿入して、textwidthを使ってコメントを自動折返しする。
		r           挿入モードで&lt;return&gt;を打った後に、現在のコメント指示を自動的に挿入する。
		o           ノーマルモードで'o'、'O'を打った後に、現在のコメント指示を自動的に挿入する。
		q           "gq"によるコメントの整形を可能にする。
		2           テキストの整形処理時、段落の最初の行ではなく２番目の行のインデントをそれ以降の行に
			対して使う。
		v           挿入モードでVi互換の自動折返しを使う現在の挿入モードで入力された空白でのみ折返しが
			行われる。
		b           'v'と同じ、ただし空白の入力か折返しマージンの前でのみ自動折返しをする。
		l           挿入モードでは長い行は折り返されない。
		formatprg  初期値：""
		gqコマンドで実行されるプログラム。
		gdefault  初期値：オフ
		:sコマンドで'g'オプションをデフォルトにする。このオプションがONになっていると、 :s/pat/ret/ で
		:s/pat/ret/g と同じ動きになる。
		grepformat  初期値："%f:%l%m,%f %l%m"
		grepの出力形式を指定する。このオプションで指定した形式と、grepの出力が一致しないと、grep結果へ
		のジャンプができなくなる。
		grepprg  初期値："grep -n ",
		:grep で実行されるプログラム。
		guicursor  初期値："n-v-c:block-Cursor/lCursor,
		カーソルの形状をVimに教える以下のように指定する。
		mode-list:argment-list,mode-list:argment-list:mode-list:argment-list・・・
		mode-listには、下表の値を'-'で区切って指定できる。
		オプション値 動作
		n            ノーマルモード
		v            ビジュアルモード
		ve           ビジュアルモード（selectionオプションの値がexclusiveになっている場合）
		o            オペレータ待機モード（dやcを打った後）
		i            挿入モード
		r            置換モード
		c            コマンドラインのノーマルモード
		ci           コマンドラインの挿入モード
		cr           コマンドラインの置換モード
		sm           文字を打ち込んだときに対応する(などを表示したとき
		a            全てのモード
		argment-listには、下表の値を指定できる。
		オプション値 動作
		hor{N}       水平カーソル(縦につぶれた)、Nで高さを％単位で指定できる
		ver{N}       垂直カーソル(横につぶれた)、Nで幅を％単位で指定できる
		block        ブロックカーソル
		blinkwait{N} 点滅するまでの時間をNで指定する
		blinkon{N}   点滅の点灯状態の時間をNで指定する
		blinkoff{N}  点滅の消灯状態の時間をNで指定する
		例：
		set guicursor=n-v-c:blinkwait1000-blinkoff500-blinkon300
		n(ノーマルモード)-v(ビジュアルモード)-c(CUIでのノーマルモード)中は、点滅の開始まで1秒待って、
		点灯時間500ms、消灯時間300msで点滅する。
		guifont  初期値：""
		GUIでのフォント
		guifontset  初期値：""
		使用されるフォントのリスト空でない場合、使用される2つの(あるいはより多くの)フォントを指定しま
		す。１つめは、英語用のフォント、２つ目はあなたの特別の言語用のもの。
		guifontwide  初期値：""
		全角文字のために使用されるフォントのリスト
		guiheadroom  初期値：50
		GUIウィンドウを表示する際に、ディスプレイの大きさから引くピクセル数設定したピクセル数をディス
		プレイの高さから引いてウィンドウを作成する。
		guioptions  初期値："gmrLtT" (MS-Windows),"agimrLtT" (GTK, Motif and Athena)
		GUI用のオプション
		オプショ 動作
		ン値
		a        ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーション
			とクリップボードを共有するオプション。
		A        "a"に似ているが、コマンドラインで選択したときか、CTRL+SHIFTを押しながらマウスで選択し
			たときに共有のクリップボードを使用する。
		c        簡単な質問をポップアップダイアログではなく、コンソールを使うようにする。
		f        シェルから実行されたときにfork()しない。-fオプションで起動したのと同じ。
		i        Vimのアイコンを使用する。
		m        メニューを表示する。
		M        "$VIMRUNTIME/menu.vim"を読み込まなくする
		g        使用できないメニューをグレー表示する
		t        メニューの切り離しを出来るようにする
		T        ツールバーを表示する
		r        ウィンドウの右側にスクロールバーを表示する
		R        縦に分割されたウィンドウの右側にスクロールバーを表示する
		l        ウィンドウの左にスクロールバーを表示する
		L        縦に分割されたウィンドウの左側にスクロールバーを表示する
		b        水平スクロールバーを表示する
		v        ダイアログのボタンを縦に配置する
		p        ポインタコールバックを使う
		F        メッセージフッターを表示する
		guipty  初期値：オン
		guiでの:shellコマンドで、ptyを使うオプションをはずした場合は、パイプを使用して接続される。
		helpfile  初期値：MSDOSでは"$VIMRUNTIME\doc\help.txt" それ以外は"$VIMRUNTIME/doc/help.txt"
		メインのヘルプファイルを指定する。
		helpheight  初期値：20
		:helpコマンドで表示されるヘルプウィンドウの高さの最低値
		hidden  初期値：オフ
		変更中のファイルでも、保存しないで他のファイルを表示することが出来るようにする。
		highlight  初期値："8:SpecialKey, @:NonText, d:Directory, e:ErrorMsg, i:IncSearch, l:Search, m:MoreMsg,
		M:ModeMsg, n:LineNr, r:Question, s:StatusLine, S:StatusLineNC, c:VertSplit, t:Title, v:Visual,
		w:WarningMsg, W:WildMenu, f:Folded, F:FoldColumn"
		Vimのメッセージのハイライト方法を指定する
		キー 初期グループ 内容
		8    SpecialKey   スペシャルキー、^@など表示できない文字
		@    NonText      EOF以降の~など
		d    Directory    CTRL-Dで表示したディレクトリ
		e    ErrorMsg     エラーメッセージ
		f    Folded       折り畳まれた行
		F    FoldColumn   フォールドコラム
		i    IncSearch    インクリメンタルサーチの結果
		l    Search       最後の検索結果
		m    MoreMsg      -- 継続 -- のようなMoreメッセージ
		M    ModeMsg      -- 挿入 -- などのモードメッセージ
		n    LineNr       行番号
		r    Question     hit-enterやyes/noなどの質問
		s    StatusLine   ステータスライン
		S    StatusLineNC アクティブではないウィンドウのステータスライン
		t    Title        :set allや:autocmdなどで表示される「--- オプション ---」のような文字
		c    VertSplit    縦方向へのスプリットの境界
		v    Visual       ビジュアルモードの選択範囲
		V    VisualNOS    ビジュアルモードの選択範囲(Vimがアクティブではないとき)
		w    WarningMsg   警告メッセージ
		W    WildMenu     ワイルドメニュー
		たとえば、set highlight=n:ErrorMsg とすると、行番号がErrorMsgで指定した色に設定される。
		history  初期値：Vim : 20, Vi : 0
		コロンコマンドを記録する数
		hkmap  初期値：オフ
		ヘブライ語用のキーボードマッピング
		hkmapp  初期値：オフ
		ヘブライ語用の音声用キーボードで有効にする
		hlsearch  初期値：オフ
		検索結果をハイライトする
		icon  初期値：オフ
		アイコンの文字として、gvimという文字の代わりに編集中のファイル名を使う。
		iconstring  初期値：""
		アイコンの文字として表示する文字
		ignorecase  初期値：オフ
		検索で、大文字小文字を区別しない。
		例：ignorecaseオプションを有効にしていないと、
		/abc
		で検索すると abc にヒットするが、AbcやABCにはヒットしなくなる。 ignorecaseオプションを有効にす
		ると、/abcで ABCやAbcなどがヒットするようになる。
		imactivatekey  初期値：""
		Input Method(canna,tamago,xatok,etc...)を有効にするキー操作
		オプション値 動作
		S            シフトキー
		L            ロックキー
		C            コントロールキー
		1            Mod1キー
		2            Mod2キー
		3            Mod3キー
		4            Mod4キー
		5            Mod5キー
		set imactivatekey=SC-space で、Shift+Ctrl+spaceで日本語入力になる。
		imcmdline  初期値：オフ
		コマンドラインで、日本語入力モードにする
		imdisable  初期値：オフ, オン for some systems (SGI)
		日本語入力を使わない
		iminsert  初期値：0, inputメソッドがサポートされていれば、2
		入力モードで自動的に日本語入力を使う
		オプション値 動作
		0            日本語モード(Input Method)OFF
		1            lmapをONにしてIMをOFFにする
		2            lmapをOFFにしてIMをONにする
		imsearch  初期値：0, inputメソッドがサポートされていれば、2
		検索で自動的に日本語入力を使う
		オプション値 動作
		0            日本語モード(Input Method)OFF
		1            lmapをONにしてIMをOFFにする
		2            lmapをOFFにしてIMをONにする
		include  初期値："^#\s*include"
		includeディレクティブと見なす文字列
		:set include=^\s*#\s*include
		のように、正規表現で指定できる。この設定値は、]CTRL-Iや]dなど、インクルードファイルを検索対象
		とするようなコマンドで使用される。
		includeexpr  初期値：""
		includeするファイル名を決定するスクリプト
		:set includeexpr=substitute(v:fname,'h','hpp','g')
		とすると、
		#include "abc.h" ならば、abc.hppがインクルードされていると判断するようになる。 v:fnameに""に囲
		まれたファイル名がセットされている。この設定は、]CTRL-Iや]dなど、インクルードファイルを検索対
		象とするようなコマンドで使用される。
		incsearch  初期値：オフ
		インクリメンタルサーチを行う。検索文字を打っている途中で、目的の単語を見つけたらEnterを押下す
		ればよい。検索をやめたい場合はEscを押下する。
		indentexpr  初期値：""
		インデントする量を返すスクリプトを設定する cindentやsmartindentのインデント量を作成したスクリ
		プトで変更することが出来る。-1を返すと現在のインデントを維持しようとする。
		indentkeys  初期値："0{,0},:,0#,!^F,o,O,e"
		挿入モードで、現在のラインの再インデントを引き起こすキーのリスト
		infercase  初期値：オフ
		挿入モードの単語の補完(Ctrl-P, Ctrl-N)で、小文字で打った単語でも大文字で補完できるようにする。
		動作は、ignorecase や smartcase のオプションに従う。
		insertmode  初期値：オフ
		Vimを挿入モードがデフォルトで動作させる。 Escを押してもViのコマンドモードに移行しなくなる。
		isfname  初期値：MS-DOS, Win32 and OS/2では、"@,48-57,/,\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~,=" UNIX,Mac
		では"@,48-57,/,.,-,_,+,,,#,$,%,~,="
		ファイル名として使用できる文字を設定する。 gfなどのコマンドでファイル名の区切りを判断するのに
		用いられる。指定できる文字は下表。
		設定値 意味
		20     文字コード20(10進数)
		a-z    'a'から'z'までの文字
		x      文字'x'
		@      isalpha()で指定される全ての文字
		@-@    文字@
		^a-z   'a'から'z'までの文字以外
		^x     'x'以外
		isident  初期値：MS-DOS, Win32 and OS/2:"@,48-57,_,128-167,224-235"、それ以外は、"@,48-57,_,192-255"
		識別子として使用できる文字を設定する。フォーマットは、isfnameと同じ。
		iskeyword
			初期値：MS-DOS and Win32:"@,48-57,_,128-167,224-235"、それ以外は、"@,48-57,_,192-255" Viでは
		"@,48-57,_"
		単語に含まれる文字を設定する。 wコマンドなどで、ジャンプする単語を指定できる。たとえば、
		set iskeyword+=-
		とすると、"-"も単語として扱われるため、aaa-bbbのような文字で"w"を押下すると、bbbの後ろの単語に
		ジャンプする。
			↑
		isprint
			初期値：MS-DOS, Win32, OS/2 and Macintosh:"@,~-255" それ以外は、"@,161-255"
		スクリーンに表示することが出来る文字を設定する。設定のフォーマットはisfnameと同じ。
		joinspaces  初期値：オン
		行の連結 "J" で、間にスペースを入れる設定。この設定を有効にすると、"J"を押して行を連結すると最
		後がピリオド(. ! ? etc..)で終わっている行ならば、行と行の間にスペースと追加(結果結合語のスペー
		スが2つになる)する。
		key
			初期値：""
		暗号化のキーを設定する。
		keymap  初期値：""
		キーボードマッピングを設定する。
		keymodel  初期値：""
		Shift+矢印キーの動作を決める。
		オプション値 動作
		startsel     シフトキー+矢印キーで選択が出来る
		stopsel      選択モード中に矢印キーで選択を終了する
		keywordprg  初期値："man" or "man -s", DOS: "", OS/2: "view /", VMS: "help"
		"K"コマンドで実行するプログラムを変更する。
		langmap  初期値：""
		英語以外のキーボードマッピングを変更する。たとえば、
		set langmap=aj
		とすると、'a'を押下すると'j'の動作になる。
		langmenu  初期値：""
		メニュー翻訳のために使用する言語を設定する。「runtimepath」の中の「lang」ディレクトリーからど
		のファイルがロードされるか伝える。
		例：
		set lm=de.latin1
		とすると、$VIMRUNTIME/lang/menu_de.latin1.vim が読み込まれるようになる。
		laststatus  初期値：1
		ステータスラインを表示するウィンドウを設定する。
		オプション 動作
		値
		0          一番下のウィンドウはステータスラインを表示しない
		1          ウィンドウが1つの時はステータスラインを表示しない 2つ以上ある場合は、ステータスライ
			ンを表示する
		2          常にステータスラインを表示する
		lazyredraw  初期値：オフ
		スクリプト実行中に画面を描画しない。
		linebreak  初期値：オフ
		入力した行が長い場合に自動的に改行をする。 textwidthで指定した横幅で動作する。
		lines  初期値：24 or ターミナルの高さ
		ウィンドウの高さを行単位で指定する。
		linespace  初期値：0, Win32のGUIなら、1
		行間を設定する。
		lisp  初期値：オフ
		lispモードにする。
		lispwords  初期値：すごく長い
		lispのインデントに使われる単語を指定する
		list  初期値：オフ
		タブ文字、行末など不可視文字を表示する。
		listchars  初期値："eol:$"
		listで表示される文字のフォーマットを指定する。
		オプション値 動作
		eol:c        行末を文字'c'で表す
		tab:xy       タブを最初の1文字を'x'続く文字を'y'で表示する
		trail:c      空白で終わる行の空白文字を'c'で表示する
		extends:c    折り返した行の終わりに文字'c'を表示する
		precedes:c   →にスクロールして、行の先頭を表示し切れていない場合に行の先頭に'c'を表示する
		loadplugins  初期値：オン
		プラグインスクリプトを起動時にロードする。
		magic  初期値：オン
		正規表現に特殊文字を含めるようにする。
		set nomagic
		にすると、正規表現で、"*"を\*と表記するようになる。
		makeef  初期値：""
		makeのエラーやgrep結果を出力するファイル名
		:set makeef=/tmp/make##.err
		のようにファイル名に##を含めると##部分をユニークな番号に変えてくれる。
		makeprg  初期値："make", VMS: "MMS"
		makeを行うプログラムを指定する。
		matchpairs  初期値："(:),{:},[:]"
		%で一致する文字を指定する。
		set matchpairs+=<:>
		とすれば、htmlのタグ&lt;xxx&gt;を%で表示できるようになる。
		matchtime  初期値：5
		matchpairsで指定したペアのマッチを表示する時間。時間は1/10秒単位で指定する。
		maxfuncdepth  初期値：100
		ユーザファンクションでの関数のネストの深さの最大値を設定する。作成した関数で再帰が終了しない場
		合に、この設定値まで繰り返すと終了する。
		maxmapdepth  初期値：1000
		マッピングのネストの最大値を設定する。
		:map x y
		:map y x
		としても、設定した最大値で終了する
		maxmem  初期値：256 から 5120
		1つのバッファで使用できるメモリの最大値を設定する。 KB単位で指定する。
		maxmemtot  初期値：2048 から 10240
		全バッファの総メモリを制限する。 KB単位で指定する。
		menuitems  初期値：25
		メニューの中で使用するアイテムの最大の数。
		modeline  初期値：Vim: オン, Vi: オフ
		モードラインの有効無効。
		modelines  初期値：5
		モードラインを探す行数。ファイルの先頭からと終端から設定した行数を検索する。モードラインとは、
		以下のようにタブストップ、ソフトタブストップ、シフト幅などをコメント内に書くだけで指定できるも
		の。
		/* vi:set ts=8 sts=4 sw=4:
			*
			* VIM - Vi IMproved    by Bram Moolenaar
			*
			* Do ":help uganda"  in Vim to read copying and usage conditions.
			* Do ":help credits" in Vim to see a list of people who contributed.
			* See README.txt for an overview of the Vim source code.
			*/
		modifiable  初期値：オン
		バッファを変更可能にする。
		set nomodifiable
		とすると、バッファの変更が出来なくなる。
		modified  初期値：オフ
		バッファが変更されるとセットされる。自分で設定するものではない。
		more  初期値：Vim : オン, Vi : オフ
		画面に収まらずにスクロールしてしまう出力をmoreで表示する。
		mouse  初期値："", GUIなら"a"
		マウスを有効にするモードを設定する。
		オプション値 動作
		n            ノーマルモード
		v            ビジュアルモード
		i            挿入モード
		c            コマンドライン
		h            上の全てのモード（マウスをクリックしてもカーソルは動かない）
		a            上の全てのモード（マウスをクリックするとカーソルが動く）
		r            hit-enter や more-prompt プロンプト
		mousefocus  初期値：オフ
		マウスのいるウィンドウをアクティブにする。この設定は、1つのVimウィンドウの中のバッファを表示し
		ているウィンドウのアクティブ/非アクティブを切り替えます。
		mousehide  初期値：オン
		入力を開始したらマウスカーソルを隠す。
		mousemodel  初期値："extend", "popup" for MS-DOS and Win32
		マウスの動作を設定する。
		オプション値 動作
		extend       UNIXでよく使うアプリケーション(xterm)のようなマウスの動作
		popup        右クリックでメニューを表示する
		popup_setpos 右クリックでメニューを表示して、Vimのカーソルもクリック位置に移動する
		mouseshape  初期値："i:beam,r:beam,s:updown,sd:cross,m:no,v:rightup-arrow"
		マウスカーソルの形状をVimに教える以下のように指定する。（設定方法はguicursorと同じ）
		mode-list:shape,mode-list:shape:mode-list:shape・・・
		mode-listには、下表の値を'-'で区切って指定できる。
		オプション値 動作
		n            ノーマルモード
		v            ビジュアルモード
		ve           ビジュアルモード（selectionオプションの値がexclusiveになっている場合）
		o            オペレータ待機モード（dやcを打った後）
		i            挿入モード
		r            置換モード
		c            コマンドラインへの文字追加中
		ci           コマンドラインへの文字挿入中
		cr           コマンドラインの文字置換中
		m            'Hit ENTER' か 'More' プロンプト
		e            全てのモード、最後のウィンドウよりも下(コマンドライン)
		s            全てのモード、ステータスライン上のカーソル
		sd           全てのモード、ステータスラインをマウスで移動中
		vs           全てのモード、縦方向のスプリッタの上
		vd           全てのモード、縦方向のスプリッタをマウスで移動中
		a            全てのモード、全ての位置
		shapeには、下表の値を指定できる。
		オプション値   動作
		arrow          通常の矢印形のカーソル
		blank          カーソルの非表示
		beam           縦に長いI型のカーソル
		updown         上下に移動できるようなカーソル
		leftright      左右に移動できるようなカーソル
		busy           砂時計
		no             システム通常の入力できないポインタ
		udsizing       上下のリサイズ
		lrsizing       左右のリサイズ
		crosshair      十字カーソル
		hand1          手１
		hand2          手２
		pencil         鉛筆
		question       ハテナマーク
		rightup-arrow  右肩上がりの矢印形カーソル
		up-arrow       上向きのカーソル
		&lt;number&gt; X11/cursorfont.h で定義されているカーソル
		例：挿入モードでのカーソルの形状を鉛筆にするためには、
		set mouseshape=i:pencil
		とする。
		mousetime  初期値：500
		マルチクリック(ダブルクリック)の間隔(msec単位)
		nrformats  初期値："octal,hex"
		Ctrl+A、Ctrl+Xの加算減算コマンドで認識する基数
		オプション値 動作
		alpha        アルファベット
		octal        8進数
		hex          16進数
		Ctrl+Aで「007」を「008」にするには、
		set nrformats-=octal
		とする。
		number  初期値：オフ
		行番号を表示する。
		osfiletype  初期値：RISC-OS なら: "Text",それ以外は""
		ファイルタイプを保持しているOSが提供するファイルタイプ。
		paragraphs  初期値："IPLPPPQPP LIpplpipbp"
		段落を開始するnroffマクロ。
		paste  初期値：オフ
		ペーストモードにする。 'textwidth' は 0 'wrapmargin' は 0 'autoindent' は reset 'smartindent'
		は reset 'softtabstop' は 0 'revins' は reset 'ruler' は reset 'showmatch' は reset
		'formatoptions' は空のように動作する
		pastetoggle  初期値：""
		ペーストモードをトグルする
		patchexpr  初期値：""
		ファイルにパッチを適用し、かつファイルの新バージョンを生成すると評価されるスクリプト
		patchmode  初期値：""
		パッチモードに移行する。ファイルの保存時に、xxx.txt.orgというようなファイルを生成する。
		path  初期値：Unix: ".,/usr/include,OS/2:".,/emx/include,," それ以外: ".,,"
		自動的に使用するディレクトリを','で区切って指定する。
		set path=.,/usr/include,
		としておくと、カレントディレクトリが/usr/includeでなくても、
		:find ctype.h
		とすれば、/usr/include/ctype.hを開くことが出来るようになる。このpathは「gf」コマンドでも使用す
		ることが出来る。
		previewheight  初期値：12
		プレビューウィンドウの高さを指定する。
		previewwindow  初期値：オフ
		現在のウィンドウをプレビューウィンドウにする。
		printdevice  初期値：empty
		使用されるプリンタの名前。値が空のときは、システムの規定プリンタを使う。
		printexpr  初期値：複雑、help参照
		コマンド ":hardcopy" で生成されるPostScriptファイルを印刷するために評価されるスクリプトを指定
		する。印刷されるファイル名は、v:fname_in ":hardcopy" に対する引数は、v:cmdarg
		printfont  初期値："courier"
		コマンド |:hardcopy| の出力に使われるフォント名。 'guifont' と同じ書式で指定する。
		printheader  初期値："%&lt;%f%h%m%=Page %N"
		コマンド |:hardcopy| の出力のヘッダの書式を定義する。値の設定方法はオプション 'statusline' と
		同様である
		printoptions  初期値：""
		コマンド |:hardcopy| の出力書式。
		readonly  初期値：オフ
		読み込み専用
		:set readonly
		とすることで、編集しているバッファを読み込み専用(書き込むためには:w!としなければならない)にで
		きる。誤ってファイルを変更しないように予防することができる。
		:set noreadonly
		とすることで、読み込み専用を解除することができる。
		remap  初期値：オン
		再帰的マッピングを有効にする。再帰的マッピングとは、
		:map h a
		key 'h' を key 'a' に置き換える→ 'h'を押すと'a'を押したのと同じになる" この状態で
		:map b h
		とすると、'b' が 'h' に置き換えられた後、さらに 'h' が 'a' に置き換えられるため、'b'を押すと
		'a'を押したことと同じになる。これを再帰的マッピングという。特定のマッピングに対して再帰的マッ
		ピングを禁止したいときは、コマンド ":noremap[!]" を使う。
		report  初期値：2
		":"コマンドにより変更された行の数の報告が出る最小値。変更された行の数がオプション'report' より
		大きければ、ほとんどの ":" によるコマンドでメッセージが表示される。必ず報告してほしいなら
		'report' を 0 にすること。ここでいう報告とは、
		:1,3d
		として、3行削除した場合にステータスラインに"3 行削除しました"のように表示されるメッセージのこ
		と。
		:%s/pat/str/
		で更新された場合も'report'の値より多くの置換個所があれば、"1 箇所置換しました (計 1 行内)"と表
		示される。
		restorescreen  初期値：オン
		Vimを終了した後にコンソール画面の内容が復元される。このオプションをONにしておくと、コンソール
		画面がvim起動前と同じになる。 OFFの場合は、コンソール画面にvimが残る。
		revins  初期値：オフ
		挿入モードでの文字の挿入方向を通常と逆向きにする。左から右に向かって文字を入力していた場合は、
		右から左に向かって文字を入力するようになる。
		rightleft  初期値：オフ
		画面表示の方向を右から左にする。ファイルに保存されている文字は右から左の方向へ表示される。この
		オプションを使うと、ヘブライ語やアラビア語のような右から左に向かって書かれる言語によるファイル
		を編集できる。
		ruler  初期値：オフ
		カーソルが何行目の何列目に置かれているかを表示する。オプション 'rulerformat' が設定されている
		ときは、それによってルーラの内容が指定される。
		rulerformat  初期値：empty
		ルーラの内容を指定する。書式は 'statusline' のものと同様。
		runtimepath  初期値：$HOME/.vim、$VIM/vimfiles, $VIMRUNTIME, $VIM/vimfiles/after,$HOME/.vim/after"
		ランタイムファイルが検索されるディレクトリのリスト。 Vimは、このオプションで指定されたディレク
		トリからランタイムファイルを順に検索する。このため、'rumtimepath'の先頭に "~/vimfiles"を置いて
		おけば、システム共通のVim用ディレクトリではなく、自分のHOMEディレクトリ"~/vimfiles"を先に検索
		してくれる。この動作のおかげで、rootに頼まなくても、HOMEディレクトリ内に"~/vimfiles/plugin/"を
		作成しておき、中に自分の使うプラグインを置けばそれを使うことができる。
		scroll  初期値：ウィンドウの高さの半分
		コマンド CTRL-U や CTRL-D でスクロールする行数。 ":set scroll=0" とすると、値はウィンドウ高の
		半分になる。
		scrollbind  初期値：オフ
		他のスクロール同調中ウィンドウと同じだけスクロールする。同時にスクロールさせたいウィンドウのそ
		れぞれで、このオプションをONにすると同時にスクロールするようになる。ファイルの2個のヴァージョ
		ン間の違いを見るのに便利である。
		scrolljump  初期値：1
		カーソルが画面外に出たときにスクロールする行数の最小値。 "j"でカーソルを下にスクロールして行き
		、画面上に表示されていない次の行を表示しようとしたときに、このオプションで指定した行数だけ一気
		にスクロールする。
		scrolloff  初期値：0
		カーソルの上または下に表示する最小限の行数。カーソルの上または下には、最低でもこのオプションに
		指定した数の行が表示される。これにより、編集中の箇所の周辺のテキストを見ることができる。とても
		大きい値 (999等) にすると、カーソルの置かれた行は常にウィンドウの中央に表示される。
		scrollopt  初期値："ver,jump"
		スクロール同調中ウィンドウの動作設定。スクロール同調中ウィンドウの動作を設定するキーワードの、
		コンマ区切りのリスト。指定可能なキーワードは以下の通りである。
		ver  同調中ウィンドウの垂直スクロールを同調させる
		hor  同調中ウィンドウの水平スクロールを同調させる
		jump これは垂直スクロールにおいて、2個のウィンドウ間のoffset に適用される。この offset とは同
			調中ウィンドウに表示されているテキストの先頭行のずれのことである。
		ウィンドウ内を動き回るときは、別の同調中ウィンドウの表示区域が、バッファの先頭より前またはバッ
		ファの末尾より後ろに達してしまうかもしれない。それでも offset は変更されず、カーソルが戻ってき
		たときは、同調中ウィンドウは可能ならば求められる位置にスクロールしようとする。カレントウィンド
		ウを変更したときは、相対 offset を使って2つのことが行われる。
			1. 値に "jump" が含まれていないとき、新しくカレントウィンドウになったウィンドウのスクロール位
				置により相対offset が調節される。別のウィンドウに戻ったときは、新しい相対 offset が使われ
				る。
			2. 値に "jump" が含まれているとき、同じ相対オフセットを保つために他のウィンドウもスクロールす
				る。他のウィンドウに戻ったときも、同じ相対 offset を使う。
		sections  初期値："SHNHH HUnhsh"
		Nroffで使われる章を分けるためのマクロ。
		secure  初期値：オフ
		Vimを安全に使うオンのとき、コマンド ":autocmd" やシェルコマンド、書き込みコマンドがカレントデ
		ィレクトリ内のファイル ".vimrc" や ".exrc" では使用できなくなり、マッピングコマンドも表示され
		るようになる。問題が起きることはないと分かっているときか、オプション 'exrc' がオフのときにのみ
		このオプションをオフにすること。
		selection  初期値："inclusive"
		選択時の動作を設定する。設定可能な値は以下の通り。
		値        行末の後 末尾に操作
		old       X        O
		inclusive O        O
		exclusive O        X
		「行末の後」というのは、カーソルを行末より1文字後ろに置けることを表す。「末尾に操作」というの
		は、選択領域の末尾の文字が操作を受けることを表す。例えば、選択領域の削除に "x" が使われたとき
		などに違いが出る。v$xとするとexclusiveの場合は改行を削除しないが、inclusiveは削除する。
		selectmode  初期値：""
		VisualモードでなくSelectモードを開始する条件。値はキーワードのコンマ区切りのリストをである。キ
		ーワードは領域選択が開始されたときのうち、どの場合でVisualモードでなくSelectモードを開始するか
		を決定する。指定可能なキーワードは以下の通りである。
		mouse マウス使用時
		key   シフトキーと特別なキーの同時押しをしたとき
		cmd   コマンド "v", "V" または CTRL-V の使用時
		sessionoptions  初期値："blank,buffers,curdir,folds,help,options,winsize"
		コマンド |:mksession| の効果の設定コマンド |:mksession| の効果を変更する。値はキーワードのコン
		マ区切りのリストである。キーワードは、ある項目の保存と復元を有効にする。
		キーワード   復元される項目
		blank        空のウィンドウ
		buffers      ウィンドウに表示されたバッファだけでなく、隠れバッファと、リストに載っているだけ
			で読み込まれていないバッファ
		curdir       カレントディレクトリ
		folds        手動で作られた折り畳み、折り畳みの開閉の区別、折り畳み関連のローカルなオプション
		globals      大文字で始まり、最低1個の小文字を含む名前のグローバル変数
		help         ヘルプウィンドウ
		localoptions ウィンドウまたはバッファに対してローカルなオプションとマッピング (ローカルなオプ
			ションのグローバルな値ではない)
		options      全てのオプションとマッピング (ローカルなオプションのグローバルな値も)
		resize       Vimのウィンドウのサイズ: 'lines' と 'columns' の値
		sesdir       セッションファイルがおかれているディレクトリが、カレントディレクトリになる (ネッ
			トワーク越しに、異なったシステムからアクセスを受けるプロジェクトでは便利である)
		slash        ファイル名内の '\' がスラッシュに置換される
		unix         WindowsやDOS上でも、Unix形式の end-of-line (1個の<nl>) を使う
		winpos       Vimのウィンドウ全体の位置
		winsize      ウィンドウサイズ
		shell  初期値：$SHELL or "sh",MS-DOS and Win32: "command.com" or "cmd.exe", OS/2: "cmd"
		シェルの名前を設定する。 "!" や ":!" 等のコマンドで使うシェルの名前。コマンドには引数を与える
		ことができる。例えば "csh -f" である。値に空白や '\' を含めるには、スペースの前に'\'を置いて'\
		'とする。
		shellcmdflag  初期値："-c"
		シェルに渡されるフラグ。例えば、"bash.exe -c ls" や "command.com /c dir" とする。
		shellpipe  初期値："&gt;", "| tee", "|&amp; tee" or "2&gt;&amp;1| tee"
		":make" の出力をエラーファイルに導くために使われる文字列。 AmigaとMS-DOSでの既定値は "&gt;" で
		ある。出力はファイルに直接保存され、スクリーンには表示されない。Unixでの既定値は "| tee" であ
		る。コンパイラからの標準出力がファイルに保存され、画面にも表示される。
		shellquote  初期値：""
		シェルに渡すときに、コマンドを囲む引用符ユーザが必ずこのオプションを設定しなくともよいように、
		既定値は 'shell' に従って設定される。
		shellredir  初期値："&gt;", "&gt;&amp;" or "&gt;%s 2&gt;&amp;1"
		フィルタコマンドの出力をリダイレクトするための文字列。既定値は "&gt;" である。Unixでは、初期化
		の後にオプション 'shell' が"csh", "tcsh" または "zsh" だったときは、既定値は "&gt;&amp;" にな
		る。'shell'が "sh", "ksh" または "bash" だったときは、既定値は "&gt;%s 2&gt;&amp;1" になる。つ
		まり標準エラー出力も含まれる。
		shellslash  初期値：オフ
		ファイル名の展開にスラッシュを使う。これはcommand.com や cmd.exe の代わりにUnix系のシェルを使
		うときに使用する。
		shelltype  初期値：0
		シェルを使う条件を設定する。 0 または 2: "シェル名 'shellcmdflag' コマンド" で外部コマンドを実
		行 1 または 3: "シェル名コマンド" で外部コマンドを実行
		shellxquote  初期値：""; system()を使ったときは"\""
		コマンドをシェルに渡すときに、コマンドを囲む引用符 "!" や ":!" 等のコマンドでコマンドをシェル
		に渡すときに、コマンドを囲む引用符(の列)。リダイレクトの指示もこの中に含む。
		shiftround  初期値：オフ
		インデントをオプション 'shiftwidth' の値の倍数に丸める。コマンド "&gt;"と "&lt;" に適用される
		。Insertモードでの CTRL-T と CTRL-D では、インデントは常に 'shiftwidth' の倍数に丸められる
		shiftwidth  初期値：8
		自動インデントの各段階に使われる空白の数。
		shortmess  初期値：Vim "filnxtToO", Vi : ""
		CTRL-G 等によるファイル関連のメッセージのフォーマット。
		フ
		ラ  効果
		グ
		f   "(file 3 of 5)" の代わりに "(3 of 5)" を表示。
		i   "[最終行が不完全]" の代わりに "[noeol]" を表示。
		l   "999 行, 888 文字" の代わりに "999L, 888C" を表示。
		m   "[変更あり]" の代わりに "[+]" を表示。
		n   "[新ファイル]" の代わりに "[新]" を表示。
		r   "[読込専用]" の代わりに "[読専]" を表示。
		w   書き込みコマンドには "書込み" の代わりに "[w]" を、コマンド ':w &gt;&gt; file' には "追加"
			の代わりに "[a]" を表示。
		x   "[dosフォーマット]" の代わりに "[dos]", "[unixフォーマット]"の代わりに "[unix]", "[マック
			フォーマット]" の代わりに"[マック]" を表示。
		a   上記の省略を全て行う。
		o   ファイルの書き込み時のメッセージを、その後のファイルの読み込み時のメッセージで上書きする
			(":wn" を使うときやオプション'autowrite' がオンのときに便利である)
		O   ファイルの読み込み時のメッセージや Quickfix 関係のメッセージ(例えば ":cn") がその前のメッ
			セージを必ず上書きする。
		s   「下まで検索したので上に戻ります」と「上まで検索したので下に戻ります」というメッセージを表
			示しない。
		t   ファイル間連のメッセージが長すぎてコマンドラインに収まらないときは、先頭を切り詰める。先頭
			には "&lt;" が表示される。Exモードでは無視される。
		T   その他ののメッセージが長すぎてコマンドラインに収まらないときは、中央を切り詰める。中央には
			"..." が表示される。Exモードでは無視される。
		W   ファイルの書き込み時に "書込み" や "[w]" を表示しない。
		A   スワップファイルがすでにあることが発見されたときに「注意」メッセージを表示しない。
		L   Vimの開始時に挨拶メッセージを表示しない |:intro|。
		shortname  初期値：オフ
		ファイル名が8文字に3文字の拡張子を付けたものであると仮定する。
		showbreak  初期値：""
		折り返された行の先頭に表示する文字列。 &lt;Tab&gt;文字とコンマ以外の、printable な文字のみが指
		定できる (将来のヴァージョンでは、行末に表示される部分と行頭に表示される部分の区切りにコンマが
		使われるかもしれない)。
		showcmd  初期値：Vim : オン, UNIXは、オフ, Vi: オフ
		コマンドをステータスラインに表示する。 'd'を入力するとステータスラインに'd'と表示されるように
		なる。ビジュアルモーでは選択文字数や選択行数が表示されるようになる。
		showfulltag  初期値：オフ
		タグファイルから単語補完をするときに1行まるごと補完する。 Insertモードでタグファイルから単語補
		完(CTRL-X CTRL-])をするとき、タグ名と整理された検索パターン (あれば) の両方をマッチする限り表
		示する。そのため、C言語の関数にマッチすれば、どのような引数を必要とするかのテンプレートを見る
		ことができる (コーディングスタイルが適当なものであれば)。
		showmatch  初期値：オフ
		閉じ括弧が入力されたとき、対応する括弧を表示する。マッチした括弧が画面上に見えているときのみジ
		ャンプする。マッチを表示する時間はオプション 'matchtime' で設定できる。 'cpoptions' にフラグ
		'm' が含まれていないときは、ジャンプ中に文字を入力するとカーソルがすぐに元の場所に戻る。マッチ
		の表示時のカーソルの形状や点滅方法については、'guicursor' の"sm" の項目を参照。
		showmode  初期値：Vim : オン, Vi : オフ
		現在のモードを表示する。 Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表
		示する。このメッセージの強調表示の設定には、オプション 'highlight' のフラグ 'M' を使うこと。
		sidescroll  初期値：0
		水平スクロールの刻み幅。オプション 'wrap' がオフでカーソルが画面外に出るときのみ使われる。値が
		0 のときはカーソルを画面の中央に置くようにスクロールする。
		sidescrolloff  初期値：0
		カーソルの右または左に、表示する文字数。オプション 'nowrap' がオフのとき、カーソルの右または左
		には、最低でもこの数だけの列が表示される。 'sidescroll' を 1 以上に設定しているときにこのオプ
		ションも 1 以上にすると、水平スクロールをしている周辺のテキストが見えるようになる。とても大き
		い値 (999等) にすると、カーソルの置かれた列は常にウィンドウの中央に表示される。
		smartcase  初期値：オフ
		検索で小文字なら大文字を無視、大文字なら無視しない設定。検索パターンが大文字を含んでいたら大文
		字と小文字を区別して検索するようになる。小文字のみの場合は、大文字と小文字を区別しないで検索す
		る。
		smartindent  初期値：オフ
		新しい行を作ったときに高度な自動インデントを行う。 'cindent' がオンのときは、'smartindent' を
		オンにしても効果はない。
		smarttab  初期値：オフ
		行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。行頭以外では 'tabstop'
		の数だけ空白が挿入される。オフのときは、&lt;Tab&gt; を打ち込むと常に 'tabstop' の数だけインデ
		ントされる。
		softtabstop  初期値：0
		tabstopを変えずに空白を含めることにより、見た目のtabstopを変える &lt;Tab&gt; の挿入や <bs> の
		使用等の編集操作をするときに、&lt;Tab&gt; が対応する空白の数。&lt;Tab&gt; が挿入される「ように
		思える」が、実は空白と &lt;Tab&gt; の両方が混ざって使われている。
		splitbelow  初期値：オフ
		ウィンドウの横分割で新しいウィンドウをカレントウィンドウの下に開く。水平分割後にアクティブなウ
		ィンドウが現在のウィンドウの下に出来たウィンドウになる。
		splitright  初期値：オフ
		ウィンドウの縦分割で新しいウィンドウをカレントウィンドウの右に開く。垂直分割後にアクティブなウ
		ィンドウが現在のウィンドウの右に出来たウィンドウになる。
		startofline  初期値：オン
		ページアップ、ダウンでカーソル位置を最初の余白に移動する以下のコマンドで移動すると、カーソルは
		行内の最初の余白に移動する。オフのときは、カーソルは (可能ならば) 同じ列に置かれる。適用される
		コマンド: CTRL-D, CTRL-U, CTRL-B, CTRL-F, "G", "H", "M", "L", 行単位で行うときの "d", "&lt;&
		lt;", "&gt;&gt;", カウントを指定したときの "%"、バッファ変更コマンド (CTRL-^, :bnext, :bNext
		等)、行番号のみのExコマンド (例えば ":25" や ":+")。
		statusline  初期値：empty
		ステータス行の表示内容を設定する。値は、普通のテキストに挟まれた関数 printf 形式の項目からなる
		。このオプションが設定されているときは、'ruler'が表示されなくなる。
		欄     意味
		-      その項目を左寄せする。minwid が項目の長さより大きい場合は、既定では右寄せになる。
		0      数値の頭に0を表示する。欄 '-' が優先する。
		minwid 項目の長さの最小値。余白の穴埋めは '-' と '0' で設定する。
			項目の長さの最大値。文字列の項目の切り詰めでは '&lt;' が左に表示される。数値の項目は
		maxwid maxwid-2 文字に切り詰められ、それに "&gt;数" が続く。ここで "数" は表示されなかった文字
			数であり、指数表記に似ている。
		item   以下で説明するアルファベット1文字。
		以下は、指定可能なステータス行の item の説明である。"item" の2文字目はその item の種類を表す。
		N 数値
		S 文字列
		F 以下で説明するフラグ
		- 実際に表示されるものではない
		item 意味
		f S  バッファ内のファイルの、カレントディレクトリに対する相対パス。
		F S  バッファ内のファイルのフルパス。
		t S  バッファ内のファイルのファイル名 (パスを除く)。
		m F  修正フラグ。表示されるのは 'modifiable' がオフならば " [+]" または " [-]"
		M F  修正フラグ。表示されるのは ",+" または ",-"。
		r F  読み込み専用フラグ。表示されるのは " [RO]"。
		R F  読み込み専用フラグ。表示されるのは ",RO"。
		h F  ヘルプバッファフラグ。表示されるのは " [ヘルプ]"。
		H F  ヘルプバッファフラグ。表示されるのは ",HLP"。
		w F  プレビューウィンドウフラグ。表示されるのは " [プレビュー]"。
		W F  プレビューウィンドウフラグ。表示されるのは ",PRV"。
		y F  バッファ内のファイルのタイプ。例えば " [vim]"。'filetype' を参照。
		Y F  バッファ内のファイルのタイプ。例えば ",VIM"。'filetype' を参照。{Vi mが |+autocmd| 機能付
			きでコンパイルされたときのみ有効}
		k S  他言語用マッピング |:lmap| が使われているとき、変数 "b:keymap_name" または 'keymap' を "
			<keymap>" と表示する。
		n N  バッファ番号。
		b N  カーソル下の文字の文字コードの10進数表現。
		B N  同上、ただし16進数表現。
		o N  カーソル下の文字がファイル内で何バイト目であるか。先頭では1。覚え方: ファイル先頭からの隔
			たり (に1を足したもの) {Vi mが |+byte_offset| 機能付きでコンパイルされたときのみ有効}
		O N  同上、ただし16進数表現。
		N N  印刷時のページ番号 ('printheader' 内でのみ有効)。
		l N  何行目にカーソルがあるか。
		L N  バッファ内の総行数。
		c N  何列目にカーソルがあるか。
		v N  画面上の何列目にカーソルがあるか。
		V N  画面上の何列目にカーソルがあるか。表示形式は -{num}。値が 'c' と等しければ表示されない。
		p N  現在行がファイル内の何％の位置にあるか (|CTRL-G| と同様)
		P S  現在表示されているウィンドウ内のテキストが、ファイル内の何％の位置にあるか。これは
			'ruler' で説明されているものに似ている。値は常に3文字である
		a S  既定のタイトルと同様の引数ファイルリストを"({current} of {max})" と表示する。ファイル引数
			の数が0または1のときは空。
		{ NF '{' と '}' の間の expression を評価し、結果に置き換える。
		( -  項目グループの開始。グループ内の項目全てに対する幅と寄せ方の設定に使える。どこかで %) で
			閉じられなければならない。
		) -  項目グループの終了。欄 width は指定できない。
		&lt; 行が長すぎるときに切り詰める位置。既定では先頭。欄 width は指定できない。
		-
		= -  左寄せ項目と右寄せ項目の区切り。欄 width は指定できない。
			使われる強調表示グループを User{N} に設定する。ここで {N} は欄minwid から取られる。例えば
		* -  %1* と設定する。%* や %0* で通常の強調表示を復元する。強調表示グループ User{N} と
			StatusLine の違いは、非カレントウィンドウのステータス行の強調表示を設定するグループの
			StatusLineNC に適用される。数 N は 1 以上 9 以下である。|hl-User1..9| を参照。
		suffixes  初期値：".bak,~,.o,.h,.info,.swp,.obj"
		ワイルドカードで表示するときに優先度を低くする拡張子。この拡張子を持つファイルは、ワイルドカー
		ドに複数のファイルがマッチしたときの優先度が低くなる。拡張子はコンマで区切って指定する。
		suffixesadd  初期値：""
		"gf", "[I" 等のコマンドで検索されるファイルの拡張子。値は拡張子のコンマ区切りのリスト。
		例：
		:set suffixesadd=.java
		swapfile  初期値：オン
		スワップファイルを使用する設定。このオプションは、特定のバッファでスワップファイルを使いたくな
		いときにはオフに設定できる。
		swapsync  初期値："fsync"
		書き込みの後にディスク上のスワップファイルの内容を同調する設定。値が空のときは、スワップファイ
		ルの一部はメモリ内のままで、ディスクに書き込まれないかもしれない。システムがクラッシュすると、
		仕事の成果が余計ひどく失われるかもしれない。
		switchbuf  初期値：""
		バッファを切り替えるときの動作を調節する。
		useopen これが含まれたときは、指定されたバッファを開いているウィンドウがあれば、そこにジャンプ
			する。含まれないときは、他のウィンドウを調べない。
		split   これが含まれたときは、カレントウィンドウをバッファの読み込み前に分割する。含まれないと
			きは、ウィンドウを分割せず、カレントウィンドウを使う。
		syntax  初期値：emtpy
		強調表示(色付け)のON/OFF設定。強調表示をする場合は、:set syntax=ON とする。強調表示をしない場
		合は、:set syntax=OFF とする。自動的に適切な色付けがされない場合は、パラメータにファイルタイプ
		を指定することもできる。
		例：
		:set syntax=html
		tabstop  初期値：8
		ファイル内の &lt;Tab&gt; が対応する空白の数。
		tagbsearch  初期値：オン
		高速にタグジャンプする。タグの検索時には、タグファイルの二分探索と線形探索のどちらも可能である
		。このオプションで、二分探索を行うようにできる。二分探索をすると、タグの検索が「大幅に」速くな
		る。
		taglength  初期値：0
		タグ名の長さに上限を持たせる。非0 のときは、タグ名のうち、前からこの値の文字数までが意味を持つ
		。
		tagrelative  初期値：Vim : オン, Vi : オフ
		タグ名を相対的にする。タグファイルを別のディレクトリから使うと、そのタグファイルでのタグ名は、
		タグファイルのあるディレクトリに対して相対的になる。
		tags  初期値："./tags,tags", +emacs_tagsでコンパイルしたら: "./tags,./TAGS,tags,TAGS"
		タグファイルを指定する。タグを使うコマンドで必要とするタグファイルの名前の、空白またはコンマ区
		切りのリスト。ファイル名に空白やコンマを使うときは、'\' を前に置く。
		tagstack  初期値：オン
		タグスタックを使う。タグスタックとは、タグジャンプの履歴を持ち、CTRL-Tによりジャンプ元に戻る機
		能のことオフのときは、引数付きのコマンド ":tag" または ":tselect" は、タグをタグスタックにプッ
		シュしない。
		term  初期値：$TERM
		ターミナルの名前。ターミナル制御文字の選択に使われる。環境変数は展開される。
		termencoding  初期値：""
		ターミナルで使われるエンコーディング名。どの文字エンコーディングをキーボードが生成し、どの文字
		エンコーディングをディスプレイが理解できるかを指定する。
		terse  初期値：オフ
		ファイルの端まで検索してしまったときのメッセージが表示しない。オプション 'shortmess' にフラグ
		's' を追加する (こうするとファイルの端まで検索してしまったときのメッセージが表示されなくなる)
		。オフのときは、オプション 'shortmess' からフラグ 's' を取り除く。
		textauto  初期値：Vim : オン, Vi : オフ
		後方互換性のため残されたオプション、fileformatsを使う。
		textmode  初期値：MS-DOS, Win32 and OS/2: オン, それ以外は、オフ
		後方互換性のため残されたオプション、fileformatsを使う。
		textwidth  初期値：0
		入力されているテキストの最大幅。行がそれより長くなると、この幅を超えないように空白の後で改行さ
		れる。値を 0 に設定すると無効になる。
		thesaurus  初期値：""
		同義語補完コマンドで使われるファイル。同義語補完コマンド |i_CTRL-X_CTRL-T| で単語の検索に使わ
		れるファイルの名前の、コンマ区切りのリスト。そのファイルの各行には、似た意味の単語をキーワード
		を構成しない文字で (空白がよい) 区切ったものが並ぶ。行長の最大値は 510 バイトである。
		tildeop  初期値：オフ
		コマンドをオペレータとして動作させる。オンのとき、ティルデコマンド "~" が operator のように使
		用できる。大文字／小文字を変換するが、このオプションがオンのときは、"d" 等のように範囲を指定さ
		れるまで変換しない。このオプションがオフでも、"g~{motion}" なら範囲を指定できる。
		timeout  初期値：オン
		Vimが入力の確定を待つかを設定する。詳細は、ttimeoutを参照。
		timeoutlen  初期値：1000
		キーコードやマッピングされたキー列が完了するのを待つ時間。単位は、ミリ秒。
		title  初期値：オフ
		ウィンドウのタイトルを変更する設定。ウィンドウのタイトルがオプション 'titlestring' の値になる
		。 titlestringが空の場合は、以下のようになる。 filename [+=-] (path) - VIM
		-  ファイルが変更できない、つまり 'ma' がオフであることを表す
		+  ファイルが変更を受けたことを表す
		=  ファイルが読み込み専用であることを表す
		=+ ファイルが読み込み専用であるが変更を受けたことを表す
		titlelen  初期値：85
		ウィンドウタイトルが占める列の割合。タイトルがこれより長かったときは、パス名の後ろの部分のみが
		表示される。この切り詰めを示すためには、パス名の前に文字 '&lt;' が表示される。
		titleold  初期値："Thanks for flying Vim"
		Vim終了時に復元する元のウィンドウタイトルこのオプションの値は、Vimの終了時に元のウィンドウタイ
		トルが復元できない場合のタイトルに使われる。オプション 'title' がオンであるか'titlestring' が
		空でないときのみ有効である。 cygwinを使っていると、この値がEUCになっているせいで、vim終了後に
		ウィンドウタイトルが崩れてしまう。
		titlestring  初期値：""
		ウィンドウタイトルに使われる文字。空でないとき、ウィンドウタイトルに使われる。オプション
		'title' がオンのときのみ有効。
		toolbar  初期値："icons,tooltips"
		ツールバーの様々な設定。 icons ツールバーのボタンにアイコンが表示される。 text ツールバーのボ
		タンに名前が表示される。 tooltips ツールバーのボタンでツールティップが表示される。
		ttimeout  初期値：オフ
		Vimが入力の確定を待つかを設定する。
		'timeout' 'ttimeout'     動作
		オフ      オフ           タイムアウト (時間切れ) を設けない
		オン      オンまたはオフ マッピングとキーコードにタイムアウトあり
		オフ      オン           キーコードにタイムアウトあり
		待ち時間はオプション'timeoutlen' で設定できる。
		ttimeoutlen  初期値：-1
		キーコードやマッピングされたキー列が完了するのを待つ時間。普通オプション 'timeoutlen' のみが使
		われ、'ttimeoutlen' は -1 に設定される。キーコードに対して異なった待ち時間を設定したいときは、
		'ttimeoutlen' を非負の値に設定すること。
		ttimeoutlen マッピング待ち キーコード待ち
		負          'timeoutlen'   'timeoutlen'
		0以上       'timeoutlen'   'ttimeoutlen'
		ttybuiltin  初期値：オン
		組み込みのtermcapを使う。オンのときは、外部の termcap の前に組み込みの termcap を探す。オフの
		ときは、外部の termcap の後に組み込みの termcap を探す。
		ttyfast  初期値：オフ
		高速ターミナル接続を行う。再描画のとき、行挿入／削除コマンドを使う代わりに、より多くの文字が画
		面に送られる。複数のウィンドウが開かれていたり、ターミナルが部分スクロールをサポートしていない
		とき、再描画が滑らかになる。
		ttymouse  初期値：Termに依存
		ターミナルでマウスを使う設定。
		値      意味
		xterm   xterm 風にマウスを扱う。
		xterm2  "xterm" と動作が似ているが、ドラッグ中もマウス位置を返すような xterm に対して働く。
		netterm NetTerm 風にマウスを扱う。
		dec     DEC terminal 風にマウスを扱う。
		jsbterm JSB term 風にマウスを扱う。
		pterm   QNX pterm 風にマウスを扱う。
		ttyscroll  初期値：999
		画面をスクロールする行数の最大値。この行数以上スクロールするときは、ウィンドウが再描画される。
		ttytype  初期値：$TERM
		オプション'term' の別名。
		undolevels  初期値：100, UNIX,VMS,Win32,OS/2は1000
		アンドゥ可能な変更の最大値。アンドゥをするための情報はメモリに蓄えられるため、大きい数を設定す
		るとメモリの消費量も多くなる。
		updatecount  初期値：200
		スワップファイルの自動保存設定。この回数だけ文字を打ち込むと、スワップファイルがディスクに書き
		込まれる。 0 にすると、スワップファイルは全く作られない
		updatetime  初期値：4000
		スワップファイルの自動保存時間設定。この時間の間 (ミリ秒単位) 入力がなければ、スワップファイル
		がディスクに書き込まれる。
		verbose  初期値：0
		実行中の動作に関するメッセージを表示する。値が 0 より大きいとき、Vimは実行中の動作に関するメッ
		セージを表示する。
		値     意味
		1以上  ファイル viminfo が読み書きされたとき
		2以上  コマンド ":source" でファイルを読み込んだとき
		5以上  検索されたタグファイル全て
		8以上  autocommand のグループが実行されたファイル
		9以上  実行された autocommand 全て
		12以上 実行された関数全て
		15以上 実行された Ex コマンド全て (200 文字から後は切り捨て)
		viewdir  初期値：Amiga, MS-DOS, OS/2 Win32:"$VIM/vimfiles/view", Unix: "~/.vim/view",Macintosh:
		"$VIM:vimfiles:view"
		コマンド |:mkview| によるファイルを格納するディレクトリの名前。コマンド:mkviewにより現在のウィ
		ンドウのプロパティを保存して、後で同じプロパティで開きなおすことができる。この:mkviewが使用す
		るファイルを保存するディレクトリをこのオプションで指定する。
		viewoptions  初期値："folds,options,cursor"
		コマンド |:mkview| の効果を変更する。値はキーワードのコンマ区切りのリスト。
		キーワー 復元される項目
		ド
		cursor   ファイル／ウィンドウ内のカーソル位置
		folds    手動で作られた折り畳み、折り畳みの開閉の区別、折り畳み関連のローカルなオプション
		options  ウィンドウまたはバッファについてローカルなオプションとマッピング (ローカルなオプショ
			ンのグローバルな値は含めない)
		slash    ファイル名内の '\' がスラッシュに置換される
		unix     WindowsやDOS上でも、Unix形式の end-of-line (1個の) を使う
		viminfo  初期値：Vi : "", Vim MS-DOS,'20,"50,h,rA:,rB:、Amigaは: '20,"50,h,rdf0:,rdf1:,rdf2:それ以外は:
		'20,"50,h
		viminfoファイルの設定。値は指定部のコンマ区切りのリスト
		フ
		ラ 動作
		グ
		!  これが含まれると、アルファベットの大文字で始まり、小文字を含まないグローバル変数を保存・復
			元する。つまり "KEEPTHIS" と"K_L_M" は保存されるが、"KeepThis" と "_K_L_M" は保存されない。
			各レジスタで保存される行数の最大値。0 にすると、レジスタは保存されなくなる。指定されないと
		"  きは、すべての行が保存される。文字'"' の前に '\' を置くことを忘れないこと。そうでないと、コ
			メントの開始と見なされてしまう！
			これが含まれると、バッファリストを保存・復元する。Vimの起動時にファイル名が引数に含まれてい
		%  ると、バッファリストは復元されない。 Vimの起動時にファイル名が引数に含まれていないと、バッ
			ファリストが viminfo ファイルから復元される。ファイル名のないバッファとヘルプ用バッファは、
			viminfo ファイルには書き込まれない。
			マークが復元されるファイル履歴の最大値。オプション 'viminfo'が空でないときは、常にこれを設
		'  定しなければならない。また、このオプションを設定するとジャンプリスト |jumplist| もviminfo
			ファイルに蓄えられることになる。
		/  保存される検索パターンの履歴の最大値。非0 の値を指定すると、前回の検索パターンと置換パター
			ンも保存される。これが含まれないときは、'history' の値が使われる。
		:  保存されるコマンドライン履歴の最大値。これが含まれないときは、'history' の値が使われる。
		@  保存される input-line 履歴の最大値。これが含まれないときは、'history' の値が使われる。
		c  これが含まれると、viminfo ファイル内のテキストを、書き込まれたときのエンコーディングから現
			在のエンコーディングに変換する。|viminfo-encoding| (訳注: および 'encoding') を参照。
			ファイルマークを保存するかどうか。0 を指定すると、ファイルマーク ('0 から '9, 'A から 'Z)
		f  は保存されない。これが含まれなかったり、値が非0 のときは、みな保存される。 '0 は (終了時や
			コマンド ":wviminfo" の実行時の) カーソル位置の保存に使われる。
		h  viminfo ファイルの読み込み時に、'hlsearch' を無効にする。含まれないときは、最後の検索コマン
			ド以来、コマンド ":nohlsearch"が使われたかどうかによる。
			これでファイル viminfo の名前を指定する。名前は 'n' のすぐ後に続けて指定する。'viminfo' の
		n  最後に指定しなければならない！Vimの開始時に引数 "-i" が指定されると、それで指定されたファイ
			ル名がここで指定されたものを上書きする。環境変数は、オプションの設定時ではなく、ファイルの
			読み込み時に展開される。
			リムーバブル・メディア (訳注: フロッピ、CD-ROM等の取り外せる記憶装置。この中身は取り替えて
			しまえば全く変わるので、ファイル履歴の意味がない) の指定。引数は文字列 (次の ',' まで) であ
		r  る。これは複数個指定できる。それぞれがマーク履歴の対象外になるパスの先頭部を指定する。これ
			はリムーバブル・メディアを避けるためである。 MS-DOSでは "ra:,rb:", Amigaでは
			"rdf0:,rdf1:,rdf2:" とするとよい。大文字と小文字の区別はない。それぞれの 'r' の引数の最大長
			は 50 文字である。
		例:
		:set viminfo='50,\"1000,:0,n~/vim/viminfo
		'50
			最近編集した 50 ファイル内のマークは保存される。
		"1000
			レジスタの中身 (それぞれ 1000 行まで) は保存される。
		:0
			コマンドラインの履歴は保存されない。
		n~/vim/viminfo
			使用するファイル名は "~/vim/viminfo" である。
		'/' がない
			'/' が指定されていないので、既定値が使われる。つまり全ての検索履歴や前回の検索パターン、置
			換パターンが保存される。
		'%' がない
			バッファリストは、保存も復元もされない。
		'h' がない
			'hlsearch' による強調表示は復元される。
		virtualedit  初期値：""
		フリーカーソルモードにする。値は、以下のキーワードのコンマ区切りのリストである。
		値     意味
		block  Visual blockモードで仮想編集を有効にする。
		insert Insertモードで仮想編集を有効にする。
		all    全てのモードで仮想編集を有効にする。
		visualbell  初期値：オフ
		エラー音の代わりに画面フラッシュを使う。ビープ音に、実際は音でなくビジュアルベル(画面フラッシ
		ュ) を使う。
		warn  初期値：オン
		警告メッセージの表示設定。バッファが変更される間にシェルコマンドが使われたら、警告メッセージを
		表示する。
		weirdinvert  初期値：オフ
		標準出力で上書きしない。後方互換性のために残されている。termcap オプション 't_xs' と同じ効果を
		持つ。
		whichwrap  初期値：Vim : "b,s", Vi : ""
		カーソルを行頭、行末で止まらないようにする。
		フラグ キー          モード
		b      &lt;BS&gt;    NormalとVisual
		s      &lt;Space&gt; NormalとVisual
		h      "h"           NormalとVisual
		l      "l"           NormalとVisual
		&lt;   &lt;Left&gt;  NormalとVisual
		&gt;   &lt;Right&gt; NormalとVisual
		~      "~"           Normal
		[      &lt;Left&gt;  InsertとReplace
		]      &lt;Right&gt; InsertとReplace
		wildchar  初期値：Vim : &lt;Tab&gt;, Vi : CTRL-E
		ワイルドカード展開に使用する文字。オプション 'wildmode' で指定したようにワイルドカードを展開す
		るために打ち込まなければならない文字。
		wildcharm  初期値：none (0)
		マクロでも使えるワイルドカード展開に使用する文字。
		wildignore  初期値：""
		ファイル/ディレクトリ保管で無視されるファイルパターン。ファイルパターンのリスト。パターンのど
		れかにマッチしたファイルは、ファイル／ディレクトリ名の補完時に無視される。
		wildmenu  初期値：オフ
		補完候補を表示する。コマンドライン補完が拡張モードで行われる。オプション'wildchar' で指定され
		たキー (普通 <tab>) を打ち込むと補完を開始し、コマンドラインのすぐ上に可能性のあるマッチが表示
		され、最初のマッチが強調表示される。
		wildmode  初期値：Vim : "full"
		補完動作の設定。オプション 'wildchar' で指定されたキーで開始する補完モード。
		設定値       意味
			最初のマッチのみを補完する。
		full         次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び
			最初のマッチが補完される。
		longest      共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次
			の候補に移る。
		longest:full "longest" と似ているが、'wildmenu' が有効ならばそれを開始する。
		list         複数のマッチがあるときは、全てのマッチを羅列する。
		list:full    複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する。
		list:longest 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完さ
			れる。
		winaltkeys  初期値："menu"
		ALTキーの動作設定。メニューの選択に使うALTキーをマッピングで使えるようにする。
		値   意味
			ALTキーをメニューに使わない。ALTキーを使った組み合わせはマッピングに使えるが、自動的にメ
		no   ニューの操作に使われることはない。このときメニューの操作は、コマンド |:simalt| で可能であ
			る。
		yes  ALTキーの扱いはウィンドウシステムに任される。ALTキーとのキーの組み合わせは、マッピングに
			は使えない。
		menu メニューのショートカットキーになっている文字と組み合わせてALTキーを使うとウィンドウシステ
			ムが扱うが、他のキーはマッピングに使える。
		winheight  初期値：1
		カレントウィンドウの行数の最小値。カレントウィンドウの行数が指定したものより少ないときは、他の
		ウィンドウの行数を減らしてそれを増やす。
		winminheight  初期値：1
		カレントウィンドウではないウィンドウの高さの最小値。 0 に設定すると、ウィンドウは必要に応じて
		高さゼロに「潰される」 (つまり、ステータス行のみになる)。ウィンドウがアクティブになると、高さ
		は最低 1行にはなる (カーソルの居場所が必要なため)。
		winminwidth  初期値：1
		カレントウィンドウではないウィンドウの幅の最小値。 0 に設定すると、ウィンドウは必要に応じて幅
		ゼロに「潰される」 (つまり、垂直分割の区切りのみになる)。ウィンドウがアクティブになると、幅は
		最低1 列にはなる (カーソルの居場所が必要なため)。
		winwidth  初期値：20
		カレントウィンドウの列数の最小値。カレントウィンドウの列数が指定したものより少ないときは、他の
		ウィンドウの列数を減らしてそれを増やす。
		wrap  初期値：オン
		ウィンドウの幅を超える行の折り返し設定。ウィンドウの幅より長い行は折り返され、次の行に続けて表
		示される。オフのときは、折り返しは行われず、長い行は一部のみが表示される。
		wrapmargin  初期値：0
		行の折り返しをするマージン。ウィンドウの右端からこの文字数だけ離れたところで折り返しが始まる。
		この境界を超えてテキストを入力すると、 <eol> が挿入され、挿入は次行に続く。
		wrapscan  初期値：オン
		検索をファイルの末尾まで検索したら、ファイルの先頭へループする。
		write  初期値：オン
		ファイルの書き込みを有効にする。オフのときは、書き込みができない。
		writeany  初期値：オフ
		書込み保護の無視。いかなるファイルも "!" なしに書き込みができる。
		writebackup  初期値：オフ、+writebackupでコンパイルされたらオンファイルの上書きの前にバックアップを作る。
		writedelay  初期値：0 画面に表示するディレイ時間。打ち込まれた文字が画面に送られるまでの遅延時間を、1万分の1秒単位で指定する。これはデバッグ用のオプションである。

VIM USER MANUAL - by Bram Moolenaar
	新しいコマンドを作る
	Vim は拡張可能なエディタです。よく使う操作を一つにまとめて新しいコマンドを作成
	したり、既存のコマンドを再定義したりできます。自動コマンドを使うと、コマンドを
	自動的に実行できます。
	|40.1| キーマッピング
	|40.2| コマンドラインコマンドを定義する
	|40.3| 自動コマンド
	次章: |usr_41.txt| Vim スクリプト書法
	前章: |usr_32.txt| undo ツリー
	目次: |usr_toc.txt|
	==============================================================================
	*40.1* キーマッピング
	|05.3| で簡単なマップを説明しました。マップの原理は、キー操作を他のキー操作に
	変換するというものです。単純ですが強力な仕組みです。
	典型的な使い方は、一つのキーを複数のキーにマップする方法です。ファンクション
	キー (<F1>以外) には機能が割り当てられていないので、それらのキーを使うとよいで
	しょう。例:
	:map <F2> GoDate: <Esc>:read !date<CR>kJ
	このマップでは三つのモードが使われています。"G" で最後の行にジャンプし、"o" で
	新しい行を開いてインサートモードを開始、"Date: " というテキストを入力してから
	<Esc> でインサートモードを抜けます。
	特殊キーを <> で囲んで表記していますが、これは括弧表記というものです。特殊キー
	を押すのではなく、見たまま文字どおり入力してください。この表記を使ったマップは
	読むのが簡単で、そのままコピー＆ペーストして使うことができます。
	さて、":" でコマンドラインモードに入ります。":read !date" コマンドは、"date"
	コマンドの出力を読み込んで、現在行の下に追加します。<CR> は ":read" コマンドを
	実行するために必要です。
	この時点で、テキストは次のようになっています:
	Date:
	Fri Jun 15 12:54:34 CEST 2001
	最後に、"kJ" で上に移動してから二つの行を一行につなげます。
	マップするキーを選ぶときは |map-which-keys| を参考にしてください。
	マップとモード
	--------------
	":map" コマンドはノーマルモードのキーマップを定義します。同様に、他のモードの
	マップを定義することもできます。例えば ":imap" でインサートモードのマップを定
	義できます。次のマップは、カーソルの下に日付を挿入します:
	:imap <F2> <CR>Date: <Esc>:read !date<CR>kJ
	多少の違いはありますが、ノーマルモードで <F2> にマップしたものと同じです。この
	マップを定義してもノーマルモードの <F2> は消えません。このように、同じキーを
	モード別にマップすることができます。
	このマップはインサートモードの中で開始しますが、実行後はノーマルモードになって
	しまいます。インサートモードを継続したい場合はマップの最後に "a" を追加してく
	ださい。
	マップコマンドはモード別に用意されています:
	:map ノーマルモード、ビジュアルモード、オペレータ待機モード
	:vmap ビジュアルモード
	:nmap ノーマルモード
	:omap オペレータ待機モード
	:map! インサートモード、コマンドライン
	:imap インサートモード
	:cmap コマンドライン
	オペレータ待機モードとは、"d" や "y" などのオペレータを入力した後、モーション
	コマンドやテキストオブジェクトの入力を待機している状態のことです。例えば "dw"
	の "w" はオペレータ待機モードでの入力です。
	例えば、d<F7> コマンドで C プログラムのブロック ({}で囲まれたテキスト) を削除
	できるように、あるいは、y<F7> でブロックをヤンクできるようにしたい場合は、<F7>
	をマップしてプログラムブロックを選択できるようにする必要があります。次のように
	します:
	:omap <F7> a{
	オペレータ待機モードで <F7> を押すと "a{" によってブロックが選択されます。この
	マップは、{ が押しにくい位置にあるキーボードでは便利です。
	マップの一覧を表示する
	----------------------
	定義されたマップの一覧を確認したい場合は、":map" コマンドを引数なしで実行しま
	す。モード別のマップコマンドを使うこともできます。次のような一覧が表示されま
	す:
	_g :call MyGrep(1)<CR>
	v <F2> :s/^/> /<CR>:noh<CR>``
	n <F2> :.,$s/^/> /<CR>:noh<CR>``
	<xHome> <Home>
	<xEnd> <End>
	最初の列は、マップが機能するモードを示しています。"n" はノーマルモード、"i" は
	インサートモード、などなど。":map" で定義されたマップには空白が使われます。空
	白の場合はノーマルモードとビジュアルモードで使えます。
	この一覧を見れば、<> 表記で書いた特殊キーが正しく認識されているかを確認できま
	す (カラー表示がサポートされている場合に限る)。例えば、<Esc> が色付きで表示さ
	れていれば、それはエスケープ文字です。他のテキストと同じ色で表示されている場合
	は、それは "<Esc>" という 5 文字の文字列です。
	再マップ
	--------
	マップは他のマップを含むことができます。例えば、上述の <F2> のマップは次のよう
	に短くできます:
	:map <F2> G<F3>
	:imap <F2> <Esc><F3>
	:map <F3> oDate: <Esc>:read !date<CR>kJ
	ノーマルモードの <F2> は、最後の行に移動して <F3> を押すようにマップされていま
	す。インサートモードの <F2> は、<Esc> でインサートモードを停止して <F3> を押す
	ようにマップされています。そして、<F3> には目的の機能がマップされています。
	例えば、Ex モードはほとんど使わないので "Q" をテキスト整形コマンドとして使える
	ようにしたい (昔の Vim はそういう動作でした) 場合は、次のようなマップを定義し
	ます:
	:map Q gq
	しかし、Ex モードが使いたくなることもあるかもしれません。"gQ" を Q にマップし
	て、EX モードが使えるようにしましょう:
	:map gQ Q
	この状態で "gQ" を入力すると "Q" にマップされます。ここまではいいですね。とこ
	ろが、さらに "Q" が "gq" にマップされてしまいます。つまり、"gQ" は "gq" に変換
	されるので Ex モードを使うことはできないのです。
	再マップされないようにするには、":noremap" コマンドを使います:
	:noremap gQ Q
	これで、マップされた "Q" に対して他のマップが適用されなくなります。同じような
	コマンドがモード別に用意されています:
	:noremap ノーマルモード、ビジュアルモード、オペレータ待機モード
	:vnoremap ビジュアルモード
	:nnoremap ノーマルモード
	:onoremap オペレータ待機モード
	:noremap! インサートモード、コマンドライン
	:inoremap インサートモード
	:cnoremap コマンドライン
	再帰マップ
	----------
	マップが自分自身を含んでいる場合、そのマップは永遠に動き続けます。これを利用す
	れば、コマンドを無限に繰り返すことができます。
	例えば、いくつかのファイルがあって、すべてのファイルは一行目にバージョン番号が
	書かれているとします。"vim *.txt" でそれらのファイルを開くと、一つ目のファイル
	が開いた状態になります。次のマップを定義します:
	:map ,, :s/5.1/5.2/<CR>:wnext<CR>,,
	そして、",," を入力してマップを実行します。このマップは一行目の "5.1" を "5.2"
	に変更し、":wnext" で上書き保存してから次のファイルを開きます。マップの最後は
	",," になっているので同じマップが再び適用され、置換と保存が実行されます。
	このマップは、何かエラーが発生するまで止まりません。このマップの場合、置換コマ
	ンドの実行で "5.1" が見つからなかった場合にエラーが発生します。その場合は、
	"5.1" を挿入してから再びマップを実行します。最後のファイルに到達すると、
	":wnext" が失敗してマップが停止します。
	マップの途中でエラーが発生した場合は、そのマップの残りの部分は無視されます。
	マップは CTRL-C で中断できます (MS-WindowsではCTRL-Break)。
	マップを削除する
	----------------
	マップを削除するには ":unmap" コマンドを使います。このコマンドにも、モード別の
	ものが用意されています:
	:unmap ノーマルモード、ビジュアルモード、オペレータ待機モード
	:vunmap ビジュアルモード
	:nunmap ノーマルモード
	:ounmap オペレータ待機モード
	:unmap! インサートモード、コマンドライン
	:iunmap インサートモード
	:cunmap コマンドライン
	例えば、ビジュアルモードを除き、ノーマルモードとオペレータ待機モードだけでマッ
	プを定義したいような場合は次のトリックが使えます。最初に三つのモードでマップを
	定義し、ビジュアルモードのマップだけを削除します:
	:map <C-A> /---><CR>
	:vunmap <C-A>
	"<C-A>" は CTRL-A キーとして解釈されます。
	すべてのマップを削除するには |:mapclear| コマンドを使います。他のコマンドと同
	様に、これにもモード別のコマンドが用意されています。マップの削除はアンドゥでき
	ないので注意してください。
	特殊文字
	--------
	":map" コマンドの後ろには他のコマンドを続けて書くことができます。その場合は |
	文字でコマンドを区切ります。そのため、マップの中では | 文字が使えません。この
	文字を使いたい場合は <Bar> (5文字) を使ってください。例:
	:map <F8> :write <Bar> !checkin %<CR>
	同じ問題は ":unmap" コマンドにもあります。":unmap" の場合はさらに末尾のスペー
	スにも注意しなければなりません。以下の二つのコマンドは動作が違います:
	:unmap a | unmap b
	:unmap a| unmap b
	一つ目のコマンドは "a " (スペース付き) のマップを削除します。
	マップの中でスペースを使いたい場合は <Space> (7文字) を使ってください:
	:map <Space> W
	このマップはスペースキーを押すと、次の単語 (空白区切り) に移動します。
	マップコマンドの末尾にはコメントを付けられません。なぜなら、" 文字はマップの一
	部として処理されてしまうからです。代わりに |" を使ってください。これは、新しい
	空のコマンドを開始して、そのコマンドにコメントをつけます。例:
	:map <Space> W| " 次の単語に移動するのにスペースバーを使う
	マップと短縮入力
	----------------
	インサートモードのマップは短縮入力とよく似ています。引数は同じ方法で処理されま
	す。主な違いは実行されるタイミングです。短縮入力は単語の後で単語以外の文字を入
	力したときに実行されます。マップはマップ文字列の最後の文字を入力したときに実行
	されます。
	違いは他にもあります。短縮入力では入力した文字がすぐに挿入されます。短縮入力が
	実行されると元の文字が削除されて指定された文字列に置換されます。マップされた文
	字を入力したときは最後の文字を入力してマップが実行されるまで何も挿入されませ
	ん。'showcmd' オプションがオンに設定されている場合は、入力途中の文字がウィンド
	ウ下部に表示されます。
	マップがあいまいな場合は少し違う動作になります。例えば、次の二つのマップがある
	とき:
	:imap aa foo
	:imap aaa bar
	"aa" と入力した時点では、一つ目のマップを適用すべきか、それとも二つ目のマップ
	を使うべきか、判断できません。その場合は、他の文字が入力されるまで待機状態にな
	ります。"a" を入力すると二つ目のマップが適用されて "bar" が挿入されます。他の
	文字、例えばスペース、を入力すると一つ目のマップが適用されて "foo" が挿入さ
	れ、さらにスペースが挿入されます。
	さらに...
	---------
	<script> キーワードを使うと、スクリプトローカルなマップを定義できます。
	|:map-<script>| 参照。
	<buffer> キーワードを使うと、バッファローカルなマップを定義できます。
	|:map-<buffer>| 参照。
	<unique> キーワードを使うと、定義しようとしたマップがすでに定義されていた場合
	にコマンドが失敗します。このキーワードを使わない場合は、古いマップが上書き定義
	されます。|:map-<unique>| 参照。
	何もしないキーを定義したい場合は <Nop> (5文字) を使います。次のコマンドは、
	<F7> キーが何もしないように設定しています:
	:map <F7> <Nop>| map! <F7> <Nop>
	<Nop> の後に空白を入れないでください。
	==============================================================================
	*40.2* コマンドラインコマンドを定義する
	Vim では新しいコマンドを定義することができます。定義したコマンドはコマンドライ
	ンモードの他のコマンドと同じように使えます。
	コマンドを定義するには ":command" コマンドを使います:
	:command DeleteFirst 1delete
	":DeleteFirst" コマンドを実行すると、":1delete" が実行され、最初の行が削除され
	ます。
	Note:
	ユーザー定義コマンドの名前は必ず大文字で開始する必要があります。":X"、
	":Next"、":Print" を使うことはできません。アンダースコア ("_") も使え
	ません。数字は使えますがお勧めしません。
	ユーザー定義コマンドの一覧を見るには、次のコマンドを実行します:
	:command
	組み込みコマンドと同じように、ユーザー定義コマンドも省略できます。他のコマンド
	と区別するのに十分な長さの文字を入力するだけでコマンドを実行できます。コマンド
	ライン補完を使って完全な名前を得ることもできます。
	引数の数
	--------
	ユーザー定義コマンドは引数を取ることができます。引数の数は -nargs オプションで
	指定する必要があります。例えば、上述の :DeleteFirst コマンドは引数を取らないの
	で、次のように定義できます:
	:command -nargs=0 DeleteFirst 1delete
	指定が無ければ 0 が使われるので、わざわざ "-nargs=0" を指定する必要はありませ
	ん。-nargs には次の値を指定できます:
	-nargs=0 引数なし
	-nargs=1 引数 1 個
	-nargs=* いくつでも
	-nargs=? 引数なし、もしくは 1 個
	-nargs=+ 引数 1 個以上
	引数の使い方
	------------
	コマンド定義の中では、<args> キーワードを使って引数を表します。例:
	:command -nargs=+ Say :echo "<args>"
	次のコマンドを実行すると:
	:Say Hello World
	"Hello World" と表示されます。引数に引用符 (") が使われると、これはうまく動き
	ません。例:
	:Say he said "hello"
	特殊な文字が含まれているときにそれを適切にエスケープして文字列として使えるよう
	にするには "<q-args>" を使います:
	:command -nargs=+ Say :echo <q-args>
	上記の ":Say" コマンドを実行すると、次のコマンドが実行されます:
	:echo "he said \"hello\""
	<f-args> キーワードを使うと、引数が関数呼び出しに適した形に展開されます。例:
	:command -nargs=* DoIt :call AFunction(<f-args>)
	:DoIt a b c
	次のコマンドが実行されます:
	:call AFunction("a", "b", "c")
	範囲指定
	--------
	いくつかのコマンドは範囲指定を受け付けますが、そのようなコマンドを定義したい場
	合は -range オプションを使います。このオプションには次の値を指定できます:
	-range 範囲指定を許可。省略時は現在行が選択される。
	-range=% 範囲指定を許可。省略時はファイル全体が選択される。
	-range={count} 範囲指定を許可。範囲指定の最後の数値だけを使う。省略時
	は {count} が使われる。
	範囲指定を使う場合は、<line1> キーワードと <line2> キーワードを使って範囲の最
	初と最後の行を取得できます。例えば、次のコマンドは、指定された範囲のテキストを
	"save_file" に保存するコマンドを定義しています:
	:command -range=% SaveIt :<line1>,<line2>write! save_file
	他のオプション
	--------------
	使用できるオプションやキーワードは他にもあります:
	-count={number} カウント指定を受け付ける。省略時は {number}。
	カウント指定は <count> キーワードで取得できま
	す。
	-bang ! の指定を受け付ける。! が使われた場合は
	<bang> キーワードが ! に置き換わります。
	-register レジスタの指定を受け付ける。(省略時は無名レジ
	スタ。)
	指定されたレジスタは <reg> (または <register>)
	で取得できます。
	-complete={type} コマンドライン補完の種類を指定する。使用できる
	補完の種類は |:command-completion| を参照。
	-bar コマンドの後ろに | を使って他のコマンド (ある
	いはコメント) を続けて書くことを許可する。
	-buffer カレントバッファでのみ使用できるコマンドを定義
	する。
	最後に <lt> キーワードを説明します。これは文字 "<" を意味します。<> 表記をエス
	ケープして、特殊な意味を消すために使います。
	再定義と削除
	------------
	同じ名前のコマンドを再定義したい場合は ! を使います:
	:command -nargs=+ Say :echo "<args>"
	:command! -nargs=+ Say :echo <q-args>
	コマンドを削除したい場合は ":delcommand" を使います。削除したいコマンドの名前
	を引数に指定してください。例:
	:delcommand SaveIt
	次のコマンドですべてのユーザー定義コマンドを削除できます:
	:comclear
	コマンドの削除はアンドゥできないので注意してください。
	ユーザー定義コマンドについての詳細はリファレンスマニュアルを参照してください。
	|user-commands|。
	==============================================================================
