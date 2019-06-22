1
  " 正規表現検索は/\v で で               : 普通は同上

	g;    --> jump to previous editing place place               : 普通は同上
	dap   --> delete paragraph block block               : 普通は同上
config
	yum -y install vim-enhanced vim-enhanced               : 普通は同上
		vi /etc/profile || ~/bashrc ~/bashrc               : 普通は同上
			# 最終行にエイリアス追記 最終行にエイリアス追記               : 普通は同上
				alias vi='vim' vi='vim'               : 普通は同上
	#1設定ファイル移植
		cd ~;rm vimhomeold.tar*;tar -cvf vimhomeold.tar .vim* *vim* .ve_* MyWiki/ .*rc  ;gzip vimhomeold.tar; cd - -               : 普通は同上
		chgrp -R root .vim* *vim* .ve_* MyWiki/ .*rc .*rc               : 普通は同上
		chown -R root .vim* *vim* .ve_* MyWiki/ .*rc .*rc               : 普通は同上
		vim -S ~/Session.vim +VE +MRU +MRU               : 普通は同上
		:source ~/.vimrc ~/.vimrc               : 普通は同上
	CTRL-W =        Make all windows (almost) equally high and wide, wide,               : 普通は同上
		: set scrollbind   ;2窓同時スクロール　左ペインでコマンド発行 ;2窓同時スクロール　左ペインでコマンド発行               : 普通は同上
	#diff
		:vertical diffsplit C:\VMstatic\SOaP\SOaPClientExample-1.2\adsoltest.xml C:\VMstatic\SOaP\SOaPClientExample-1.2\adsoltest.xml               : 普通は同上
		#今のペインをdiffモードにきりかえ｡左右両窓でやる
			:diffthis
	#カーソル下利用
		* 検索 検索               : 普通は同上
		yiw yank yank               : 普通は同上
	・spell checker checker               : 普通は同上
		:setlocal spell spelllang=en_us | set spell spell               : 普通は同上
		:set nospell nospell               : 普通は同上
		:h spell spell               : 普通は同上
		[s / ]s  <--  jump prev/fwd prev/fwd               : 普通は同上
		z=       <--- suggest suggest               : 普通は同上
		zg / zw  <--- register current word as good/wrong good/wrong               : 普通は同上
	ファイルの文字コードや、改行コードを変更
		" 文字コードutf-8を指定保存。 文字コードutf-8を指定保存。               : 普通は同上
		:set fenc=utf-8 fenc=utf-8               : 普通は同上
		" Unixの改行形式を指定。 Unixの改行形式を指定。               : 普通は同上
		:set ff=unix ff=unix               : 普通は同上
		" Windowsの改行形式を指定。 Windowsの改行形式を指定。               : 普通は同上
		:set ff=dos ff=dos               : 普通は同上
		" Macの改行形式を指定。 Macの改行形式を指定。               : 普通は同上
		:set ff=mac ff=mac               : 普通は同上

	combo
		「++enc」「++ff」を同時に指定する場合のコマンド例
		:e ++ff=unix ++enc=utf-8 ++enc=utf-8               : 普通は同上
	encoding change change               : 普通は同上
		" エンコーディングeuc-jpを指定して開き直す。 エンコーディングeuc-jpを指定して開き直す。               : 普通は同上
		:e ++enc=euc-jp ++enc=euc-jp               : 普通は同上
		" エンコーディングshift_jisを指定して開き直す。 エンコーディングshift_jisを指定して開き直す。               : 普通は同上
		:e ++enc=shift_jis ++enc=shift_jis               : 普通は同上
		" エンコーディングutf-8を指定して開き直す。 エンコーディングutf-8を指定して開き直す。               : 普通は同上
		:e ++enc=utf-8 ++enc=utf-8               : 普通は同上
	・文字コードの変更
		:set fileencoding=文字コード fileencoding=文字コード               : 普通は同上
		:set fenc=文字コード (上のコマンドの短い形式。こちらでも良い。) (上のコマンドの短い形式。こちらでも良い。)               : 普通は同上
		:set fileencoding=euc-jp (エンコーディングEUC-JPに変更。) (エンコーディングEUC-JPに変更。)               : 普通は同上
		:set fileencoding=shift_jis (エンコーディングSHIFT_JISに変更。) (エンコーディングSHIFT_JISに変更。)               : 普通は同上
		:set fileencoding=utf-8 (エンコーディングUTF-8に変更。) (エンコーディングUTF-8に変更。)               : 普通は同上
	・ファイルフォーマットの種類の変更
		:set fileformat=ファイルフォーマットの種類 fileformat=ファイルフォーマットの種類               : 普通は同上
		:set ff=ファイルフォーマットの種類 (上のコマンドの短い形式。こちらでも良い。) (上のコマンドの短い形式。こちらでも良い。)               : 普通は同上
		:set fileformat=dos (改行をWindowsの形式に変更。) (改行をWindowsの形式に変更。)               : 普通は同上
		:set fileformat=mac (改行をMacの形式に変更。) (改行をMacの形式に変更。)               : 普通は同上
		:set fileformat=unix (改行をUnixの形式に変更。) (改行をUnixの形式に変更。)               : 普通は同上
	#plugin
		#align
			comment box square:     :\abox :\abox               : 普通は同上
				:alignCtrl | |               : 普通は同上
				:align -\+ -\+               : 普通は同上
			" 最初のセパレータを左寄せ 最初のセパレータを左寄せ               : 普通は同上
			" 2番目のセパレータを左寄せ 2番目のセパレータを左寄せ               : 普通は同上
			" 3番目のセパレータを右寄せ 3番目のセパレータを右寄せ               : 普通は同上
			" 以後、ループ 以後、ループ               : 普通は同上
			:alignCtrl <<> <<>               : 普通は同上
	#vimgrep補習
		" カレントディレクトリ以下のあらゆるファイルを対象にする カレントディレクトリ以下のあらゆるファイルを対象にする               : 普通は同上
		:vim {pattern} ** **               : 普通は同上
		" app/views以下のあらゆるファイルを対象にする（ディレクトリを再帰的に検索） app/views以下のあらゆるファイルを対象にする（ディレクトリを再帰的に検索）               : 普通は同上
		:vim {pattern} app/views/** app/views/**               : 普通は同上
		" app/views/users内のファイルを対象にする app/views/users内のファイルを対象にする               : 普通は同上
		:vim {patter} app/views/users/* app/views/users/*               : 普通は同上
		" app/views以下で_で始まるerbファイルを対象にする app/views以下で_で始まるerbファイルを対象にする               : 普通は同上
		:vim {pattern} app/views/**/_*.erb app/views/**/_*.erb               : 普通は同上
		:ar path/to/search/dir/** path/to/search/dir/**               : 普通は同上
		何度も同じ検索対象を使う場合?――>## 展開 展開               : 普通は同上
		:vim foo ## ##               : 普通は同上


Vi機能別主要コマンドリファレンス
	起動
	% vi フォアグラウンド起動 フォアグラウンド起動               : 普通は同上
	% vi <ファイル名> <ファイル名>のファイルを読み込んで起動 <ファイル名>のファイルを読み込んで起動               : 普通は同上
	終了
	:q 終了 終了               : 普通は同上
	:wq 保存して終了 保存して終了               : 普通は同上
	:q!  保存せずに強制終了 保存せずに強制終了               : 普通は同上
	ZZ 終了（内容が変更された場合は保存して終了） 終了（内容が変更された場合は保存して終了）               : 普通は同上
	モード移行
	ESC コマンドモードへ移行 コマンドモードへ移行               : 普通は同上
	i カーソルの左隣へ挿入 カーソルの左隣へ挿入               : 普通は同上
	a カーソルの右隣へ挿入 カーソルの右隣へ挿入               : 普通は同上
	I カーソル行の先頭に挿入 カーソル行の先頭に挿入               : 普通は同上
	a カーソル行の末尾に挿入 カーソル行の末尾に挿入               : 普通は同上
	O カーソル行の上に1行空けて挿入 カーソル行の上に1行空けて挿入               : 普通は同上
	o カーソル行の下に1行空けて挿入 カーソル行の下に1行空けて挿入               : 普通は同上
	カーソル操作
	h 1文字左へ 1文字左へ               : 普通は同上
	j 1行下へ 1行下へ               : 普通は同上
	k 1行上へ 1行上へ               : 普通は同上
	l 1文字右へ 1文字右へ               : 普通は同上
	0 カーソル行の左端へ カーソル行の左端へ               : 普通は同上
	^ 行頭（行頭が空白の場合は空白部分の右）へ 行頭（行頭が空白の場合は空白部分の右）へ               : 普通は同上
	$ 行末へ 行末へ               : 普通は同上
	- 1行上の左端へ 1行上の左端へ               : 普通は同上
	RETURN 1行下の左端へ 1行下の左端へ               : 普通は同上
	b 左隣の単語の先頭へ 左隣の単語の先頭へ               : 普通は同上
	w 右隣の単語の先頭へ 右隣の単語の先頭へ               : 普通は同上
	e 単語の末尾へ 単語の末尾へ               : 普通は同上
	カーソル位置が単語の途中の場合はその単語の末尾
	カーソルが単語末尾なら次の単語の末尾
	カーソルが行末なら次行先頭の単語の末尾
	H 画面最上行の左端へ 画面最上行の左端へ               : 普通は同上
	M 画面中央行の左端へ 画面中央行の左端へ               : 普通は同上
	L 画面最下行の左端へ 画面最下行の左端へ               : 普通は同上
	nG ファイルの先頭からn行目の左端へ ファイルの先頭からn行目の左端へ               : 普通は同上
	画面操作
	C-f 1ページ分下に画面を移動 1ページ分下に画面を移動               : 普通は同上
	C-b 1ページ分上に画面を移動 1ページ分上に画面を移動               : 普通は同上
	C-d 半ページ分下に画面を移動 半ページ分下に画面を移動               : 普通は同上
	C-u 半ページ分上に画面を移動 半ページ分上に画面を移動               : 普通は同上
	C-l 画面を再描画 画面を再描画               : 普通は同上
	C-g 行番号を表示 行番号を表示               : 普通は同上
	検索
	/<文字列> <文字列>を順方向に検索 <文字列>を順方向に検索               : 普通は同上
	f<文字> <文字>を順方向に検索 <文字>を順方向に検索               : 普通は同上
	?<文字列> <文字列>を逆方向に検索 <文字列>を逆方向に検索               : 普通は同上
	F<文字> <文字>を逆方向に検索 <文字>を逆方向に検索               : 普通は同上
	n 順方向に検索を再実行 順方向に検索を再実行               : 普通は同上
	N 逆方向に検索を再実行 逆方向に検索を再実行               : 普通は同上
	削除
	x カーソル上一文字削除 カーソル上一文字削除               : 普通は同上
	X カーソル左一文字削除 カーソル左一文字削除               : 普通は同上
	dd カーソル行削除 カーソル行削除               : 普通は同上
	dw カーソル位置から現単語末尾まで削除 カーソル位置から現単語末尾まで削除               : 普通は同上
	df<文字> カーソル位置から<文字>の位置まで削除 カーソル位置から<文字>の位置まで削除               : 普通は同上
	d^ カーソル位置から左削除 カーソル位置から左削除               : 普通は同上
	d$ カーソル位置から右削除 カーソル位置から右削除               : 普通は同上
	置換
	r カーソル上一文字置換 カーソル上一文字置換               : 普通は同上
	R カーソル位置から複数文字置換 カーソル位置から複数文字置換               : 普通は同上
	s カーソル上一文字を複数文字に置換 カーソル上一文字を複数文字に置換               : 普通は同上
	r カーソル行全体を置換 カーソル行全体を置換               : 普通は同上
	cc カーソル行全体を置換 カーソル行全体を置換               : 普通は同上
	cw カーソル位置から現単語置換 カーソル位置から現単語置換               : 普通は同上
	cf<文字> カーソル位置から<文字>の位置まで置換 カーソル位置から<文字>の位置まで置換               : 普通は同上
	貼付け
	yw カーソル位置の単語をコピー カーソル位置の単語をコピー               : 普通は同上
	yy カーソル行をコピー カーソル行をコピー               : 普通は同上
	P カーソル行の上にペースト（xやddで削除したものもペーストできる） カーソル行の上にペースト（xやddで削除したものもペーストできる）               : 普通は同上
	p カーソル行の下にペースト（xやddで削除したものもペーストできる） カーソル行の下にペースト（xやddで削除したものもペーストできる）               : 普通は同上
	ファイル操作
	:e <ファイル名> <ファイル名>を読込む <ファイル名>を読込む               : 普通は同上
	:r <ファイル名> カーソル行の下に<ファイル名>の内容を挿入 カーソル行の下に<ファイル名>の内容を挿入               : 普通は同上
	:w 上書保存 上書保存               : 普通は同上
	:w <ファイル名> 編集中のデータを<ファイル名>のファイルに保存 編集中のデータを<ファイル名>のファイルに保存               : 普通は同上
	その他
		.  直前のコマンド繰返し 直前のコマンド繰返し               : 普通は同上
	u 直前に実行したコマンドの取り消し 直前に実行したコマンドの取り消し               : 普通は同上
	U カーソル行に対して行った変更を全部取消す カーソル行に対して行った変更を全部取消す               : 普通は同上
	:!cmd シェルコマンドの実行 シェルコマンドの実行               : 普通は同上
	!!cmd コマンドを実行し，その結果を挿入 コマンドを実行し，その結果を挿入               : 普通は同上
	:shell シェルを呼び出す。exitなどでシェルを抜ければviに戻る シェルを呼び出す。exitなどでシェルを抜ければviに戻る               : 普通は同上
	:set number 行番号を表示 行番号を表示               : 普通は同上
	:set nonumber 行番号表示を止める 行番号表示を止める               : 普通は同上
	:h ヘルプ表示 ヘルプ表示               : 普通は同上
	:viusage [<コマンド>] viコマンドモードのコマンド一覧表示。<コマンド>を付加するとそのコマンドの説明を表示。 viコマンドモードのコマンド一覧表示。<コマンド>を付加するとそのコマンドの説明を表示。               : 普通は同上
	:exusage [<コマンド>] exコマンドモードのコマンド一覧表示。<コマンド>を付加するとそのコマンドの説明を表示。 exコマンドモードのコマンド一覧表示。<コマンド>を付加するとそのコマンドの説明を表示。               : 普通は同上
よく使うコマンド†
	h           ← ←               : 普通は同上
	j           ↓ ↓               : 普通は同上
	k           ↑ ↑               : 普通は同上
	l           → →               : 普通は同上
	<C-f>       PageDown PageDown               : 普通は同上
	<C-b>       PageUp PageUp               : 普通は同上
	カーソル移 gg          ファイルの先頭へ移動 ファイルの先頭へ移動               : 普通は同上
	動         G           ファイルの末尾へ移動 ファイルの末尾へ移動               : 普通は同上
		^           行頭へ移動 行頭へ移動               : 普通は同上
		$           行末へ移動 行末へ移動               : 普通は同上
		H           画面上の１行目へ移動（2Hで２行目へ） 画面上の１行目へ移動（2Hで２行目へ）               : 普通は同上
		M           画面中央行へ移動 画面中央行へ移動               : 普通は同上
		L           画面上の最下行へ移動（2Lで下から２行目へ） 画面上の最下行へ移動（2Lで下から２行目へ）               : 普通は同上
		%           対応する括弧へ移動 対応する括弧へ移動               : 普通は同上
		z<enter>    現在のカーソルがページのトップになる 現在のカーソルがページのトップになる               : 普通は同上
		x           文字削除 文字削除               : 普通は同上
		dd          行削除 行削除               : 普通は同上
		D           カーソル位置から行末まで削除 カーソル位置から行末まで削除               : 普通は同上
		J           次の行と連結する（カレント行の改行等削除） 次の行と連結する（カレント行の改行等削除）               : 普通は同上
		~           カーソル位置の文字の大文字/小文字を切換える (a -> a and a -> a) a)               : 普通は同上
		<C-a>       カーソル位置の数字を１つ増やす(0x100という形なら16進数と見なし カーソル位置の数字を１つ増やす(0x100という形なら16進数と見なし               : 普通は同上
	編集                   てくれる) てくれる)               : 普通は同上
		<C-x>       カーソル位置の数字を１つ減らす カーソル位置の数字を１つ減らす               : 普通は同上
		>           カーソル位置の行をインデントする カーソル位置の行をインデントする               : 普通は同上
		<           カーソル位置の行を逆インデントする カーソル位置の行を逆インデントする               : 普通は同上
			インデントの体裁を整える。
		gg=G        ファイルの先頭に移動し(gg)、= によるインデントの修正をG(ファイ によるインデントの修正をG(ファイ               : 普通は同上
			ルの末尾)まで行う。
	UNDO       u           UNDO UNDO               : 普通は同上
		<C-r>       REDO REDO               : 普通は同上
		/keyword    keywordを検索する keywordを検索する               : 普通は同上
	検索       n           次のkeywordに移動する 次のkeywordに移動する               : 普通は同上
		N           前のkeywordに移動する 前のkeywordに移動する               : 普通は同上
		:%s/from/to 全行に対してfromをtoに置換する。（gをつけると行中で複数マッチす 全行に対してfromをtoに置換する。（gをつけると行中で複数マッチす               : 普通は同上
	置換       /[g]        る。） る。）               : 普通は同上
		:n1,n2s/    n1行目からn2行目の範囲に対してfromをtoに置換する。（nに . を指 を指               : 普通は同上
		from/to/[g] 定するとカレント行、$ は最終行の意味になる） は最終行の意味になる）               : 普通は同上
		qx          レジスタxへコマンドの記録を開始する。（レジスタに利用出来るのは レジスタxへコマンドの記録を開始する。（レジスタに利用出来るのは               : 普通は同上
			a-z の26文字） の26文字）               : 普通は同上
		qX          レジスタxへコマンドの追記を開始する。（通常レジスタは小文字を使 レジスタxへコマンドの追記を開始する。（通常レジスタは小文字を使               : 普通は同上
	レジスタを             うが、大文字への記録は追記になる） うが、大文字への記録は追記になる）               : 普通は同上
	使う       q（記録中に 記録を終了する。 記録を終了する。               : 普通は同上
		）
		@x          レジスタxに記録されたコマンドを再生する。 レジスタxに記録されたコマンドを再生する。               : 普通は同上
		@@          最後に実行したレジスタを再生する。 最後に実行したレジスタを再生する。               : 普通は同上
		v           カーソルで範囲選択が出来るようになる（y や d で yank や切り取り や切り取り               : 普通は同上
			が出来る）
		V           行選択モード 行選択モード               : 普通は同上
			ボックス選択モード
	ビジュアル
	モード     <C-v>       以下のような３行を行末まで選択するには $ する。 する。               : 普通は同上
		****
		*******
		**
		gv          最後の選択範囲を選択しなおす（間違えてESC押したりして選択範囲が 最後の選択範囲を選択しなおす（間違えてESC押したりして選択範囲が               : 普通は同上
			クリアされてしまった時などに使う）
		:sp         画面を水平に分割する 画面を水平に分割する               : 普通は同上
		:vsp        画面を垂直に分割する 画面を垂直に分割する               : 普通は同上
		<C-w><C-w>  分割したウィンドウ間を順番に移動する。 分割したウィンドウ間を順番に移動する。               : 普通は同上
		<C-w>       分割したウィンドウ間を{上,下,左,右}に移動する 分割したウィンドウ間を{上,下,左,右}に移動する               : 普通は同上
		{h,j,k,l}
		<C-w>       カーソルのあるウィンドウ位置を一番{上,下,左,右}に移動する カーソルのあるウィンドウ位置を一番{上,下,左,右}に移動する               : 普通は同上
	画面分割   {H,J,K,L} {H,J,K,L}               : 普通は同上
		:q          ウィンドウを閉じる。 ウィンドウを閉じる。               : 普通は同上
		:qall       すべてのウィンドウを閉じて終了する すべてのウィンドウを閉じて終了する               : 普通は同上
		:only       カーソルのあるウィンドウ以外を全部閉じる。 カーソルのあるウィンドウ以外を全部閉じる。               : 普通は同上
		<C-w>+      ウィンドウサイズを増やす。 ウィンドウサイズを増やす。               : 普通は同上
		<C-w>-      ウィンドウサイズを減らす。 ウィンドウサイズを減らす。               : 普通は同上
		<C-w>o      今のウィンドウ以外を閉じる 今のウィンドウ以外を閉じる               : 普通は同上
		:q[!]       閉じる（保存しないで編集を破棄してでも閉じる） 閉じる（保存しないで編集を破棄してでも閉じる）               : 普通は同上
	ファイル   :w[!]       保存（読み込み専用ファイルでも保存する） 保存（読み込み専用ファイルでも保存する）               : 普通は同上
		ZZ          保存して閉じる 保存して閉じる               : 普通は同上
		:new|edit   fileを開く fileを開く               : 普通は同上
		file
	複数ファイ :ls         バッファ一覧表示 バッファ一覧表示               : 普通は同上
	ル         :bp         前のバッファ 前のバッファ               : 普通は同上
		:bn         次のバッファ 次のバッファ               : 普通は同上
		:bd         バッファを消す バッファを消す               : 普通は同上
	ディレクト :cd path    カレントディレクトリを path に移動する。 に移動する。               : 普通は同上
	リ移動     :cd %:h     カレントディレクトリを現在編集中のファイルのあるパスへ移動する カレントディレクトリを現在編集中のファイルのあるパスへ移動する               : 普通は同上
		。
		:!cmd       cmdを実行してステータスラインの下へ結果を表示(編集中のバッファ cmdを実行してステータスラインの下へ結果を表示(編集中のバッファ               : 普通は同上
			には影響しない)
	システムコ :範囲指定!  選択範囲のバッファをcmdの標準入力に流し込み、代わりにcmdの出力 選択範囲のバッファをcmdの標準入力に流し込み、代わりにcmdの出力               : 普通は同上
	マンド     cmd         で置換する。 で置換する。               : 普通は同上
		例えば :%!sort を実行すればバッファ全行がsortされる。 を実行すればバッファ全行がsortされる。               : 普通は同上
		:r!cmd      cmdを実行して標準出力をカーソル位置へ挿入 cmdを実行して標準出力をカーソル位置へ挿入               : 普通は同上
		ga          カーソル位置の文字コードの値を調べる。 カーソル位置の文字コードの値を調べる。               : 普通は同上
	その他     :ascii :ascii               : 普通は同上
		:!cmd       外部プログラムを実行する 外部プログラムを実行する               : 普通は同上
#苗字がよくつかうコマンド
	vim -S Session.vim +VE   <---> after closing VE window by "qa", do ":mks[ession]" ":mks[ession]"               : 普通は同上
	vim -S ~/Session.vim +VE +tabnew +BookmarksPage +BookmarksPage               : 普通は同上
	:helptags ++t ~/.vim/doc ~/.vim/doc               : 普通は同上
	:helptags ++t $VIMRUNTIME/doc $VIMRUNTIME/doc               : 普通は同上
	|CTRL-^|   N   CTRL-^    Edit alternate file N (equivalent to ":e #N"). #N").               : 普通は同上
	|gf|         gf  or ]f  Edit the file whose name is under the cursor cursor               : 普通は同上
	|:dig|     :dig[raphs]    show current list of digraphs digraphs               : 普通は同上
	/////vim
	whereis vim --->  /usr/bin/vim /usr/bin/vim.basic /etc/vim /usr/share/vim /usr/share/man/man1/vim.1.gz /usr/share/man/man1/vim.1.gz               : 普通は同上
	/usr/share/vim/vim71/plugin
	#keymapping
		F9    (vimrc-customized) reload .vimrc .vimrc               : 普通は同上
		C+]  :  rcodetool+fri help help               : 普通は同上
		\r  :  rcodetool+fri fuzzy help showing andidate andidate               : 普通は同上
		C-XC-O : omni-completion by vim-ruby (app+gem I/F) I/F)               : 普通は同上
		C-xC-u : user-defined-omini-completion by rcodetool rcodetool               : 普通は同上
		F7F8F12:  xmpfilter xmpfilter               : 普通は同上
	改行をなくして連結する(各行末に空白なし） g shift + j j               : 普通は同上
	マクロ（記録開始）:qa　aは任意のアルファベット
	マクロ（記録終了）:q
	マクロ（実行）:@a aは記録したマクロのキー aは記録したマクロのキー               : 普通は同上
	畳み込み　set fdm=marker fdm=marker               : 普通は同上
	R    いまのファイルを更新表示（よみなおし） いまのファイルを更新表示（よみなおし）               : 普通は同上
	za    toggle curent open/close of folding folding               : 普通は同上
	zM    Close all folds: set 'foldlevel' to 0. 'foldenable' will be set. set.               : 普通は同上
	zR    Open all folds.  This sets 'foldlevel' to highest fold level. level.               : 普通は同上
		開く. 大文字だと中も再起的に. zo, zO zO               : 普通は同上
		たたむ. 大文字だと外まで再起的に.# zc, zC - close, close,               : 普通は同上
		foldの作成.zf
		全体的に１段開く(foldlevel+=1). zr zr               : 普通は同上
		全体的に１段閉じる(foldlevel-=1).zm
		そもそもインデントが崩れないようにコピペする:a
		改行をなくして連結する(各行末に空白あり）　shift + j j               : 普通は同上
		コメントアウト（※繰り返すと消えます！ので、注意が必要です）\x
		コメントアウト（確実）　CTRL+Vで矩形選択後SHIFT+i // + ESC これで、ちょっとだけ待つと、矩形全体にコメントが入ります。 これで、ちょっとだけ待つと、矩形全体にコメントが入ります。               : 普通は同上
		インデント >とか、< >とか、<               : 普通は同上
		コピペ対策自動インデント = =               : 普通は同上
	名前つきバッファ("+大文字+ビジュアル選択)と履歴バッファ(:di)の活用
		MacやWindowsの操作を知っている人ならば,"a"から"z"までの26種類の名前のついた「クリップボード」があって,それぞれ自由にコピー,追加コピー,カット, ペーストなどの操作ができるようなものと思えば分かりやすいと思います ペーストなどの操作ができるようなものと思えば分かりやすいと思います               : 普通は同上
		たとえば,現在カーソルがある行全体を名前付きバッファ"a"に覚えておくようにしたいのであれば
		"ayy
		" (バッファ名)(コマンド) (バッファ名)(コマンド)               : 普通は同上
		という形式で…つまり行単位のYankコマンドである yy コマンドの直前に「二重引用符とアルファベット小文字をひとつ」打つようにすると,いつもの yy と違って Yank内容を指定した名前の場所(バッファ)に格納 します します               : 普通は同上
		(コマンド)部分では実際は 「Yank」,「削除」,「変更コマンド」のいずれかを打ちます 「Yank」,「削除」,「変更コマンド」のいずれかを打ちます               : 普通は同上
			* Yankコマンドならば Yankした領域 Yankした領域               : 普通は同上
			* 削除コマンドならば 削除した領域 削除した領域               : 普通は同上
			* 変更コマンドならば 変更によって削除された領域 変更によって削除された領域               : 普通は同上
		いくつか例を書きます
		"gdw カーソル位置からカーソルのある単語の末尾までを削除しますその時に実際に削除された文字列は,名前つきバッファ g に入ります に入ります               : 普通は同上
		"by5H 「画面に表示されている上から5行目」からカーソル位置までの領域を, 名前つきバッファ b に入れます に入れます               : 普通は同上
		"ap とすれば,(この例なら) 名前つきバッファ a の内容をカーソル位置の後ろに書き出す ことになります. 通常のPutコマンドと同様に,格納する時に 行単位で入れたのであれば次の行に書き出されるし,文字単位で格納したのであればカーソル文字のすぐ後ろ に書き出されます に書き出されます               : 普通は同上
		"ay$ とすれば,行末までのテキストは,今まで"a"に入っていた内容に追加されます とすれば,行末までのテキストは,今まで"a"に入っていた内容に追加されます               : 普通は同上
			追加するつもりで間違えて小文字で打ってしまったら,戻せないので気を付けて操作しましょう
		:di または :dis または :display と打つと, 現在使われている バッファの一覧表示 をします をします               : 普通は同上
			まず, % には現在の編集対象ファイル名が入っています には現在の編集対象ファイル名が入っています               : 普通は同上
			. (ピリオドです)には 最も最近挿入した文字列が入っています. 挿入モード中で CTRL-a や CTRL-@ キーを押した時に書き出される文字列です キーを押した時に書き出される文字列です               : 普通は同上
			また, : (コロン)には 最も最近打ったコマンド文字列が入っています 最も最近打ったコマンド文字列が入っています               : 普通は同上
			:di コマンドでも表示はされませんが - には「最も最近に一行以内の範囲を 削除した内容」が入ってます. 他にも,マニュアルにも書いてないバッファがあるみたいです 他にも,マニュアルにも書いてないバッファがあるみたいです               : 普通は同上
		"3p なら 3番目の履歴内容が書き出されるといった具合に使えます 3番目の履歴内容が書き出されるといった具合に使えます               : 普通は同上
		また,すでに挿入モードにいる時であれば 挿入モードのまま CTRL-R を押してからバッファ名の文字を押した瞬間に 内容がカーソル位置に書き出されます 内容がカーソル位置に書き出されます               : 普通は同上
		例えば 挿入中に CTRL-R a などという操作で 名前aの内容を書き出すことができます 名前aの内容を書き出すことができます               : 普通は同上
		普段, 名前をつけないで削除,Yank,変更コマンドを使っている時には 文字列はどこに記録されているのかというと… " という名前(二重引用符一個だけの名前です)で記録されています. これはいわゆる「一時バッファ」の名前 というわけです. よって, 普段 名前を指定せずに使っている p や P コマンドは ""p とか ""P と打つのと全く同じで, 普段打っているコマンドはこれの省略形 のようなものだということです. そしてこの内容は削除やYankや変更コマンドを実行するたびに 内容が書きかわります 内容が書きかわります               : 普通は同上
	CTRL-Z または :suspend --> {任意のシェルコマンドを実行}a --> fgでresume fgでresume               : 普通は同上
	1. Introduction            *tab-page-intro* *tab-page-intro*               : 普通は同上
		a tab page holds one or more windows.  You can easily switch between tab tab               : 普通は同上
		pages, so that you have several collections of windows to work on different different               : 普通は同上
		things.
		Usually you will see a list of labels at the top of the Vim window, one for for               : 普通は同上
		each tab page.  With the mouse you can click on the label to jump to that tab tab               : 普通は同上
		page.  There are other ways to move between tab pages, see below. below.               : 普通は同上
		Most commands work only in the current tab page.  That includes the |CTRL-W| |CTRL-W|               : 普通は同上
		commands, |:windo|, |:all| and |:ball| (when not using the |:tab| modifier). modifier).               : 普通は同上
		The commands that are aware of other tab pages than the current one are are               : 普通は同上
		mentioned below. below.               : 普通は同上
		Tabs are also a nice way to edit a buffer temporarily without changing the the               : 普通は同上
		current window layout.  Open a new tab page, do whatever you want to do and and               : 普通は同上
		close the tab page. page.               : 普通は同上
		==============================================================================
		2. Commands            *tab-page-commands* *tab-page-commands*               : 普通は同上
		OPENING a NEW TaB PaGE: PaGE:               : 普通は同上
		When starting Vim "vim -p filename ..." opens each file argument in a separate separate               : 普通は同上
		tab page (up to 'tabpagemax'). |-p| |-p|               : 普通は同上
		a double click with the mouse in the non-GUI tab pages line opens a new, empty empty               : 普通は同上
		tab page.  It is placed left of the position of the click.  The first click click               : 普通は同上
		may select another tab page first, causing an extra screen update. update.               : 普通は同上
		This also works in a few GUI versions, esp. Win32 and Motif.  a only when when               : 普通は同上
		clicking right of the labels. labels.               : 普通は同上
		In the GUI tab pages line you can use the right mouse aton to open menu. menu.               : 普通は同上
		|tabline-menu|.
		:tabe[dit]        *:tabe* *:tabedit* *:tabnew* *:tabnew*               : 普通は同上
		:tabnew    Open a new tab page with an empty window, after the current current               : 普通は同上
			tab page. page.               : 普通は同上
		:tabe[dit] [++opt] [+cmd] {file} {file}               : 普通は同上
		:tabnew [++opt] [+cmd] {file} {file}               : 普通は同上
			Open a new tab page and edit {file}, like with |:edit|. |:edit|.               : 普通は同上
		:tabf[ind] [++opt] [+cmd] {file}      *:tabf* *:tabfind* *:tabfind*               : 普通は同上
			Open a new tab page and edit {file} in 'path', like with with               : 普通は同上
			|:find|.
			{not available when the |+file_in_path| feature was disabled disabled               : 普通は同上
			at compile time} time}               : 普通は同上
		:[count]tab {cmd}          *:tab* *:tab*               : 普通は同上
			Execute {cmd} and when it opens a new window open a new tab tab               : 普通は同上
			page instead.  Doesn't work for |:diffsplit|, |:diffpatch|, |:diffpatch|,               : 普通は同上
			|:execute| and |:normal|. |:normal|.               : 普通は同上
			When [count] is omitted the tab page appears after the current current               : 普通は同上
			one.  When [count] is specified the new tab page comes after after               : 普通は同上
			tab page [count].  Use ":0tab cmd" to get the new tab page as as               : 普通は同上
			the first one.  Examples: > >               : 普通は同上
				:tab split  " opens current buffer in new tab page page               : 普通は同上
				:tab help gt  " opens tab page with help for "gt" "gt"               : 普通は同上
		CTRL-W gf  Open a new tab page and edit the file name under the cursor. cursor.               : 普通は同上
			See |CTRL-W_gf|. |CTRL-W_gf|.               : 普通は同上
		CTRL-W gF  Open a new tab page and edit the file name under the cursor cursor               : 普通は同上
			and jump to the line number following the file name. name.               : 普通は同上
			See |CTRL-W_gF|. |CTRL-W_gF|.               : 普通は同上
		CLOSING a TaB PaGE: PaGE:               : 普通は同上
		Closing the last window of a tab page closes the tab page too, unless there is is               : 普通は同上
		only one tab page. page.               : 普通は同上
		Using the mouse: If the tab page line is displayed you can click in the "X" at at               : 普通は同上
		the top right to close the current tab page.  a custom |'tabline'| may show show               : 普通は同上
		something else. else.               : 普通は同上
			*:tabc* *:tabclose* *:tabclose*               : 普通は同上
		:tabc[lose][!]  Close current tab page. page.               : 普通は同上
			This command fails when: when:               : 普通は同上
			- There is only one tab page on the screen.    *E784* *E784*               : 普通は同上
			- When 'hidden' is not set, [!] is not used, a buffer has has               : 普通は同上
				changes, and there is no other window on this buffer. buffer.               : 普通は同上
			Changes to the buffer are not written and won't get lost, so so               : 普通は同上
			this is a "safe" command. command.               : 普通は同上
		:tabc[lose][!] {count} {count}               : 普通は同上
			Close tab page {count}.  Fails in the same way as ':tabclose" ':tabclose"               : 普通は同上
			above.
				*:tabo* *:tabonly* *:tabonly*               : 普通は同上
		:tabo[nly][!]  Close all other tab pages. pages.               : 普通は同上
			When the 'hidden' option is set, all buffers in closed windows windows               : 普通は同上
			become hidden. hidden.               : 普通は同上
			When 'hidden' is not set, and the 'autowrite' option is set, set,               : 普通は同上
			modified buffers are written.  Otherwise, windows that have have               : 普通は同上
			buffers that are modified are not removed, unless the [!] is is               : 普通は同上
			given, then they become hidden.  a modified buffers are are               : 普通は同上
			never abandoned, so changes cannot get lost. lost.               : 普通は同上
		SWITCHING TO aNOTHER TaB PaGE: PaGE:               : 普通は同上
		Using the mouse: If the tab page line is displayed you can click in a tab page page               : 普通は同上
		label to switch to that tab page.  Click where there is no label to go to the the               : 普通は同上
		next tab page.  |'tabline'| |'tabline'|               : 普通は同上
		:tabn[ext]        *:tabn* *:tabnext* *gt* *gt*               : 普通は同上
		<C-PageDown>        *CTRL-<PageDown>* *<C-PageDown>* *<C-PageDown>*               : 普通は同上
		gt          *i_CTRL-<PageDown>* *i_<C-PageDown>* *i_<C-PageDown>*               : 普通は同上
			Go to the next tab page.  Wraps around from the last to the the               : 普通は同上
			first one. one.               : 普通は同上
		:tabn[ext] {count} {count}               : 普通は同上
		{count}<C-PageDown>
		{count}gt  Go to tab page {count}.  The first tab page has number one. one.               : 普通は同上
		:tabp[revious]        *:tabp* *:tabprevious* *gT* *:tabN* *:tabN*               : 普通は同上
		:tabN[ext]        *:tabNext* *CTRL-<PageUp>* *CTRL-<PageUp>*               : 普通は同上
		<C-PageUp>       *<C-PageUp>* *i_CTRL-<PageUp>* *i_<C-PageUp>* *i_<C-PageUp>*               : 普通は同上
		gT    Go to the previous tab page.  Wraps around from the first one one               : 普通は同上
			to the last one. one.               : 普通は同上
		:tabp[revious] {count} {count}               : 普通は同上
		:tabN[ext] {count} {count}               : 普通は同上
		{count}<C-PageUp>
		{count}gT  Go {count} tab pages back.  Wraps around from the first one one               : 普通は同上
			to the last one. one.               : 普通は同上
		:tabr[ewind]      *:tabfir* *:tabfirst* *:tabr* *:tabrewind* *:tabrewind*               : 普通は同上
		:tabfir[st]  Go to the first tab page. page.               : 普通は同上
			*:tabl* *:tablast* *:tablast*               : 普通は同上
		:tabl[ast]  Go to the last tab page. page.               : 普通は同上
		Other commands: commands:               : 普通は同上
			*:tabs*
		:tabs    List the tab pages and the windows they contain. contain.               : 普通は同上
			Shows a ">" for the current window. window.               : 普通は同上
			Shows a "+" for modified buffers. buffers.               : 普通は同上
		REORDERING TaB PaGES: PaGES:               : 普通は同上
		:tabm[ove] [N]            *:tabm* *:tabmove* *:tabmove*               : 普通は同上
			Move the current tab page to after tab page N.  Use zero to to               : 普通は同上
			make the current tab page the first one.  Without N the tab tab               : 普通は同上
			page is made the last one. one.               : 普通は同上
		LOOPING OVER TaB PaGES: PaGES:               : 普通は同上
			*:tabd* *:tabdo* *:tabdo*               : 普通は同上
		:tabd[o] {cmd}  Execute {cmd} in each tab page. page.               : 普通は同上
			It works like doing this: > >               : 普通は同上
				:tabfirst
				:{cmd}
				:tabnext
				:{cmd}
				etc.
		<    This only operates in the current window of each tab page. page.               : 普通は同上
			When an error is detected on one tab page, further tab pages pages               : 普通は同上
			will not be visited. visited.               : 普通は同上
			The last tab page (or where an error occurred) becomes the the               : 普通は同上
			current tab page. page.               : 普通は同上
			{cmd} can contain '|' to concatenate several commands. commands.               : 普通は同上
			{cmd} must not open or close tab pages or reorder them. them.               : 普通は同上
			{not in Vi} {not available when compiled without the the               : 普通は同上
			|+listcmds| feature} feature}               : 普通は同上
			also see |:windo|, |:argdo| and |:bufdo|. |:bufdo|.               : 普通は同上
		=
	gHL  :全角半角スイッチ :全角半角スイッチ               : 普通は同上
	:tabm[ove] [N]            *:tabm* *:tabmove* *:tabmove*               : 普通は同上
ウィンドウの分割
	関係のない２つの違ったファイルを表示したい。１つのファイルの２個所を同時に
	見たい。２つのファイルを横に並べて差分を見てみたい。
	ウィンドウ分割を使えばどれもできてしまいます。
	|08.1| ウィンドウの分割 ウィンドウの分割               : 普通は同上
	|08.2| ウィンドウを分割してファイルを開く ウィンドウを分割してファイルを開く               : 普通は同上
	|08.3| ウィンドウのサイズ ウィンドウのサイズ               : 普通は同上
	|08.4| 縦分割 縦分割               : 普通は同上
	|08.5| ウィンドウの移動 ウィンドウの移動               : 普通は同上
	|08.6| 全ウィンドウに対するコマンド 全ウィンドウに対するコマンド               : 普通は同上
	|08.7| vimdiff で差分を表示する で差分を表示する               : 普通は同上
	|08.8| その他 その他               : 普通は同上
	|08.9| タブページ タブページ               : 普通は同上
	次章: |usr_09.txt| GUI を使う を使う               : 普通は同上
	前章: |usr_07.txt| 複数のファイルを開く 複数のファイルを開く               : 普通は同上
	目次: |usr_toc.txt| |usr_toc.txt|               : 普通は同上
	==============================================================================
	*08.1* ウィンドウの分割 ウィンドウの分割               : 普通は同上
	新しいウィンドウを開く一番簡単なコマンドはこれです。
	:split
	画面が２つのウィンドウに分割されます。カーソルは上側のウィンドウに置かれます。
	+----------------------------------+
	|/* file one.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|one.c=============================|
	|/* file one.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|one.c=============================|
	| | |               : 普通は同上
	+----------------------------------+
	二つのウィンドウに同じファイルが表示されています。"====" のラインはステータス のラインはステータス               : 普通は同上
	行です。各ウィンドウの一番下にあってそのウィンドウの情報を表示します。(実際に
	はステータス行は反転表示になります)
	各ウィンドウには同じファイルの違う場所を表示できます。例えば、上側のウィンド
	ウにはプログラムの変数宣言部を表示し、下の方にはその変数を使っている箇所を
	表示させる、といったことができます。
	CTRL-W w コマンドでウィンドウ間をジャンプできます。上側のウィンドウにカーソル コマンドでウィンドウ間をジャンプできます。上側のウィンドウにカーソル               : 普通は同上
	がある時に CTRL-W w を押すとその下のウィンドウにジャンプします。一番下のウィン を押すとその下のウィンドウにジャンプします。一番下のウィン               : 普通は同上
	ドウにカーソルがある時は一番上のウィンドウに戻ります。(CTRL-W CTRL-W も同じ動 も同じ動               : 普通は同上
	作をするので、CTRL キーを離すのがちょっと遅れても大丈夫です) キーを離すのがちょっと遅れても大丈夫です)               : 普通は同上
	ウィンドウを閉じる
	------------------
	ウィンドウを閉じるのは次のコマンドです。
	:close
	":quit" や "ZZ" のようなファイルを閉じるコマンドでもウィンドウを閉じることがで のようなファイルを閉じるコマンドでもウィンドウを閉じることがで               : 普通は同上
	きますが、":close" を使えば、最後のウィンドウを閉じて Vim を終了してしまうよう を終了してしまうよう               : 普通は同上
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
	*08.2* ウィンドウを分割してファイルを開く ウィンドウを分割してファイルを開く               : 普通は同上
	次のコマンドを実行すると、２つ目のウィンドウが開き、指定されたファイルの編集が
	開始されます。
	:split two.c two.c               : 普通は同上
	例えば、one.c を編集していたなら、結果は次のようになります。 を編集していたなら、結果は次のようになります。               : 普通は同上
	+----------------------------------+
	|/* file two.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|two.c=============================|
	|/* file one.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|one.c=============================|
	| | |               : 普通は同上
	+----------------------------------+
	新しいウィンドウに新規ファイルを開くには、次のコマンドを使います。
	:new
	":split" や ":new" コマンドを使って好きなだけウィンドウを作成できます。 コマンドを使って好きなだけウィンドウを作成できます。               : 普通は同上
	==============================================================================
	*08.3* ウィンドウのサイズ ウィンドウのサイズ               : 普通は同上
	":split" コマンドは数値を引数として取れます。その値は新しいウィンドウの高さと コマンドは数値を引数として取れます。その値は新しいウィンドウの高さと               : 普通は同上
	なります。例えば、次のコマンドは３行分の高さのウィンドウを作成し、alpha.c を開 を開               : 普通は同上
	きます。
	:3split alpha.c alpha.c               : 普通は同上
	ウィンドウのサイズを変更する方法はいくつかあります。マウスが使えれば話は簡単で
	す。ウィンドウを分割しているステータス行にマウスを動かし、上下にドラッグしてく
	ださい。
	ウィンドウを大きくするには次のようにします:
	CTRL-W + +               : 普通は同上
	小さくするには次のようにします:
	CTRL-W - -               : 普通は同上
	どちらのコマンドも数値を引数として取り、その行数分、ウィンドウサイズを増減しま
	す。つまり、"4 CTRL-W +" ならウィンドウが４行分大きくなります。 ならウィンドウが４行分大きくなります。               : 普通は同上
	ウィンドウの高さを明示的に指定するには次のコマンドを使います:
	{height}CTRL-W _ _               : 普通は同上
	{height} に数値を指定し、CTRL-W と _ (アンダースコア) を入力します。 を入力します。               : 普通は同上
	ウィンドウを最大まで大きくするには、CTRL-W _ コマンドを数値指定なしで実行して コマンドを数値指定なしで実行して               : 普通は同上
	ください。
	マウスを使う
	Vim では様々なことをキーボードから極めて素早く操作できますが、残念ながら、ウィ では様々なことをキーボードから極めて素早く操作できますが、残念ながら、ウィ               : 普通は同上
	ンドウサイズを変更するのは少し面倒です。この場合、マウスを使う方が簡単です。マ
	ウスポインタをステータス行に合せてから左ボタンを押してドラッグしてください。ス
	テータス行が動き、片方のウィンドウが大きくなり、もう片方は小さくなります。
	オプション
	'winheight' オプションにはウィンドウの最小の高さ (それ以上は小さくならない) の の               : 普通は同上
	希望値を、'winminheight' には最小の高さの強制値を設定できます。 には最小の高さの強制値を設定できます。               : 普通は同上
	同様に、'winwidth' オプションにはウィンドウの最小の幅の希望値を、'winminwidth' オプションにはウィンドウの最小の幅の希望値を、'winminwidth'               : 普通は同上
	には最小の幅の強制値を設定できます。
	'equalalways' オプションが設定されていると、ウィンドウを閉じたり開いたりするた オプションが設定されていると、ウィンドウを閉じたり開いたりするた               : 普通は同上
	びに、全てのウィンドウのサイズが同じになります。
	==============================================================================
	*08.4* 縦分割 縦分割               : 普通は同上
	":split" コマンドは現在のウィンドウの上側に新しいウィンドウを作ります。ウィン コマンドは現在のウィンドウの上側に新しいウィンドウを作ります。ウィン               : 普通は同上
	ドウを左側に作るには、次のコマンドを使います:
	:vsplit
	あるいは、
	:vsplit two.c two.c               : 普通は同上
	実行後は次のようになります。
	+--------------------------------------+
	|/* file two.c */ |/* file one.c */ | |               : 普通は同上
	|~ |~ | |               : 普通は同上
	|~ |~ | |               : 普通は同上
	|~ |~ | |               : 普通は同上
	|two.c===============one.c=============|
	| | |               : 普通は同上
	+--------------------------------------+
	中央の縦棒 (|) は実際には反転表示されます。これは縦セパレータと呼ばれ、これに は実際には反転表示されます。これは縦セパレータと呼ばれ、これに               : 普通は同上
	よって左右のウィンドウが区切られます。
	ウィンドウを縦分割して新しい空ファイルを作成する ":vnew" コマンドもあります。 コマンドもあります。               : 普通は同上
	次のコマンドでも同じことができます:
	:vertical new new               : 普通は同上
	":vertical" コマンドは、ウィンドウを分割する他のコマンドにも適用できます。これ コマンドは、ウィンドウを分割する他のコマンドにも適用できます。これ               : 普通は同上
	を指定すると、ウィンドウは横ではなく、縦に分割されるようになります。(ウィンド
	ウを分割しないコマンドの場合は何も変わりません）
	他のウィンドウへの移動
	横でも縦でも好きなようにウィンドウを分割できるので、自在にウィンドウを配置でき
	ます。他のウィンドウへ移動するには次のコマンドを使います。
	CTRL-W h 左側のウィンドウに移動 左側のウィンドウに移動               : 普通は同上
	CTRL-W j 下側のウィンドウに移動 下側のウィンドウに移動               : 普通は同上
	CTRL-W k 上側のウィンドウに移動 上側のウィンドウに移動               : 普通は同上
	CTRL-W l 右側のウィンドウに移動 右側のウィンドウに移動               : 普通は同上
	CTRL-W t 一番上のウィンドウに移動 一番上のウィンドウに移動               : 普通は同上
	CTRL-W b 一番下のウィンドウに移動 一番下のウィンドウに移動               : 普通は同上
	カーソル移動と同じ文字を使っていることに注目してください。もちろん、矢印キーも
	使うことができます。
	他のウィンドウへ移動するためのコマンドは他にもあります: |Q_wi| |Q_wi|               : 普通は同上
	==============================================================================
	*08.5* ウィンドウの移動 ウィンドウの移動               : 普通は同上
	ウィンドウを分割したが、配置が好ましくなかった場合、ウィンドウをどこか別の場所
	に動かしたいと思うしょう。例えば、次のように三つのウィンドウがあるとします:
	+----------------------------------+
	|/* file two.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|two.c=============================|
	|/* file three.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|three.c===========================|
	|/* file one.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|one.c=============================|
	| | |               : 普通は同上
	+----------------------------------+
	明らかに一番下のウィンドウが一番上にくるべきです。一番下のウィンドウに移動して
	(CTRL-W w を使用)、次のコマンドを入力してください: を使用)、次のコマンドを入力してください:               : 普通は同上
	CTRL-W K K               : 普通は同上
	ここでは大文字の K を使います。これを実行すると、ウィンドウが一番上に移動しま を使います。これを実行すると、ウィンドウが一番上に移動しま               : 普通は同上
	す。上への移動に K が使われていることに注目してください。 が使われていることに注目してください。               : 普通は同上
	縦分割しているときに CTRL-W K を使うと、ウィンドウが一番上に移動し、Vim ウィン ウィン               : 普通は同上
	ドウと同じ幅になります。例えば、次のようなレイアウトになっているとします。
	+-------------------------------------------+
	|/* two.c */ |/* three.c */ |/* one.c */ | |               : 普通は同上
	|~ |~ |~ | |               : 普通は同上
	|~ |~ |~ | |               : 普通は同上
	|~ |~ |~ | |               : 普通は同上
	|~ |~ |~ | |               : 普通は同上
	|~ |~ |~ | |               : 普通は同上
	|two.c=========three.c=========one.c========|
	| | |               : 普通は同上
	+-------------------------------------------+
	中央のウィンドウ (three.c) で CTRL-W K を実行すると、次のような結果になります: を実行すると、次のような結果になります:               : 普通は同上
	+-------------------------------------------+
	|/* three.c */ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|three.c====================================|
	|/* two.c */ |/* one.c */ | |               : 普通は同上
	|~ |~ | |               : 普通は同上
	|two.c==================one.c===============|
	| | |               : 普通は同上
	+-------------------------------------------+
	他に同じようなコマンドが三つあります。(説明する必要はありませんね)
	CTRL-W H ウィンドウを左端に移動 ウィンドウを左端に移動               : 普通は同上
	CTRL-W J ウィンドウを下端に移動 ウィンドウを下端に移動               : 普通は同上
	CTRL-W L ウィンドウを右端に移動 ウィンドウを右端に移動               : 普通は同上
	==============================================================================
	*08.6* 全ウィンドウを対象とするコマンド 全ウィンドウを対象とするコマンド               : 普通は同上
	Vim を終了しようと思ったときに、複数のウィンドウが開いていた場合、ウィンドウを を終了しようと思ったときに、複数のウィンドウが開いていた場合、ウィンドウを               : 普通は同上
	一つずつ閉じていけば Vim を終了できますが、次のコマンドを使えばもっと速く終了 を終了できますが、次のコマンドを使えばもっと速く終了               : 普通は同上
	できます。:
	:qall
	これは "quit all" (すべて閉じる) という意味です。まだ保存していないファイルが という意味です。まだ保存していないファイルが               : 普通は同上
	ある場合は、Vim は終了しません。保存していないファイルを表示しているウィンドウ は終了しません。保存していないファイルを表示しているウィンドウ               : 普通は同上
	にカーソルが自動的に移動するので、":write" で保存するか ":quit!" で変更を破棄 で変更を破棄               : 普通は同上
	するかしてください。
	未保存のファイルを全て保存するには、次のコマンドを使ってください:
	:wall
	これは "write all" (すべて保存) という意味です。とはいっても、実際に保存される という意味です。とはいっても、実際に保存される               : 普通は同上
	のは変更のあったファイルだけです。変更していないファイルを上書きしても意味がな
	いことを Vim はわかってますから。 はわかってますから。               : 普通は同上
	":qall" と ":wall" を組み合わせた "write and quit all" (すべて保存して終了) コ コ               : 普通は同上
	マンドもあります:
	:wqall
	このコマンドは、変更されたファイルをすべて保存して Vim を終了します。 を終了します。               : 普通は同上
	最後に、次のコマンドは、すべての変更を破棄して Vim を終了するコマンドです: を終了するコマンドです:               : 普通は同上
	:qall!
	このコマンドはアンドゥできないので、使う時には慎重に！
	引数で指定したすべてのファイルをウィンドウで開く
	それぞれのファイルごとにウィンドウを開くには、起動パラメタに "-o" を指定します。 を指定します。               : 普通は同上
	vim -o one.txt two.txt three.txt three.txt               : 普通は同上
	結果はこうなります。
	+-------------------------------+
	|file one.txt | |               : 普通は同上
	|~ | |               : 普通は同上
	|one.txt========================|
	|file two.txt | |               : 普通は同上
	|~ | |               : 普通は同上
	|two.txt========================|
	|file three.txt | |               : 普通は同上
	|~ | |               : 普通は同上
	|three.txt======================|
	| | |               : 普通は同上
	+-------------------------------+
	起動パラメタ "-O" を使えば、ウィンドウが縦分割になります。 を使えば、ウィンドウが縦分割になります。               : 普通は同上
	Vim が既に起動している場合、":all" コマンドを使うと引数リストの各ファイルごと コマンドを使うと引数リストの各ファイルごと               : 普通は同上
	にウィンドウを開くことができます。":vertical all"だと縦分割になります。 all"だと縦分割になります。               : 普通は同上
	==============================================================================
	*08.7* vimdiff で差分を表示する で差分を表示する               : 普通は同上
	特別な方法で Vim を起動すると、二つのファイルの差分を表示することができます。 を起動すると、二つのファイルの差分を表示することができます。               : 普通は同上
	例えば、"main.c" というファイルを開き、どこかの行に文字を挿入したとします。そ というファイルを開き、どこかの行に文字を挿入したとします。そ               : 普通は同上
	して、オプション 'backup' を有効にしてファイルを保存しました。バックアップファ を有効にしてファイルを保存しました。バックアップファ               : 普通は同上
	イル "main.c~" には変更前のファイルが保存されています。 には変更前のファイルが保存されています。               : 普通は同上
	シェルで (vim上ではありません) 次のコマンドを入力します: 次のコマンドを入力します:               : 普通は同上
	vimdiff main.c~ main.c main.c               : 普通は同上
	二つのウィンドウを左右に並べた状態で Vim が起動します。画面には先ほど文字を挿 が起動します。画面には先ほど文字を挿               : 普通は同上
	入した行とその前後の数行が表示されています。
	VV VV VV               : 普通は同上
	+-----------------------------------------+
	|+ +--123 lines: /* a|+ +--123 lines: /* a| <- 折り畳み 折り畳み               : 普通は同上
	| text | text | |               : 普通は同上
	| text | text | |               : 普通は同上
	| text | text | |               : 普通は同上
	| text | changed text | <- 変更された行 変更された行               : 普通は同上
	| text | text | |               : 普通は同上
	| text | ------------------| <- 削除された行 削除された行               : 普通は同上
	| text | text | |               : 普通は同上
	| text | text | |               : 普通は同上
	| text | text | |               : 普通は同上
	|+ +--432 lines: text|+ +--432 lines: text| <- 折り畳み 折り畳み               : 普通は同上
	| ~ | ~ | |               : 普通は同上
	| ~ | ~ | |               : 普通は同上
	|main.c~==============main.c==============|
	| | |               : 普通は同上
	+-----------------------------------------+
	(上の図は強調表示されてないので、ちゃんと見たければ、vimdiff コマンドを実行し コマンドを実行し               : 普通は同上
	てみてください)
	変更のない行は一行に折り畳まれて表示されます。これを閉じた折り畳みと呼びます。
	上の図では "<- 折り畳み" とある行がそうです。最初の折り畳みは 123 行を折り畳ん 行を折り畳ん               : 普通は同上
	でいます。それらの行は両方のファイルで一致しています。
	"<- 変更された行" とある行は強調表示されていて、挿入した文字列が別の色で表示さ とある行は強調表示されていて、挿入した文字列が別の色で表示さ               : 普通は同上
	れています。強調表示されているので、どこが違うのかが一目でわかります。
	削除された行は main.c のウィンドウにあるように "---" と表示されます。上の図の、 と表示されます。上の図の、               : 普通は同上
	"<- 削除された行" とある行を見てください。実際には、そこに文字はありません。そ とある行を見てください。実際には、そこに文字はありません。そ               : 普通は同上
	の行は、main.c を別のウィンドウと同じ行数で表示するために使われています。 を別のウィンドウと同じ行数で表示するために使われています。               : 普通は同上
	折り畳み表示列
	各ウィンドウの左側に色の違う列があります。上の図では "VV" で示されています。そ で示されています。そ               : 普通は同上
	の列の、閉じた折り畳みのある行に、"+" 記号が表示されています。マウスポインタを 記号が表示されています。マウスポインタを               : 普通は同上
	その "+" 記号に合わせて、左ボタンをクリックしてください。折り畳みが開き、折り 記号に合わせて、左ボタンをクリックしてください。折り畳みが開き、折り               : 普通は同上
	畳まれていたテキストが表示されます。
	開いた折り畳みは "-" 記号で表示されます。"-" 記号をクリックすると折り畳みは閉 記号をクリックすると折り畳みは閉               : 普通は同上
	じます。
	当り前ですが、これはマウスが利用できる場合のみ機能します。キーボードの場合は
	"zo" で折り畳みを開いたり、"zc" で閉じたりできます。 で閉じたりできます。               : 普通は同上
	Vim の中で差分を取る の中で差分を取る               : 普通は同上
	Vim の中から差分モードを開始する方法もあります。"main.c" を開いて、ウィンドウ を開いて、ウィンドウ               : 普通は同上
	を分割し差分を表示するには、次のようにします:
	:edit main.c main.c               : 普通は同上
	:vertical diffsplit main.c~ main.c~               : 普通は同上
	":vertical" コマンドはウィンドウを縦分割するために使用します。使わなかった場合 コマンドはウィンドウを縦分割するために使用します。使わなかった場合               : 普通は同上
	は横分割になります。
	パッチ、または diff ファイルがある場合は、三つめの方法で差分モードを開始できま ファイルがある場合は、三つめの方法で差分モードを開始できま               : 普通は同上
	す。最初に、パッチを適用するファイルを開き、次に、Vim にパッチファイルの名前を にパッチファイルの名前を               : 普通は同上
	教えてやります:
	:edit main.c main.c               : 普通は同上
	:vertical diffpatch main.c.diff main.c.diff               : 普通は同上
	警告: パッチファイルは、開いているファイル用のパッチが一つだけ含まれているもの パッチファイルは、開いているファイル用のパッチが一つだけ含まれているもの               : 普通は同上
	でなければなりません。そうでない場合は、大量のエラーメッセージが表示されたり、
	予期せずに、他のファイルにパッチが適用されてしまう場合があります。
	パッチ処理は Vim 内部の、ファイルのコピーに対して実行されます。ハードディスク 内部の、ファイルのコピーに対して実行されます。ハードディスク               : 普通は同上
	上のファイルは (それを上書きしない限り) 変更されません。 変更されません。               : 普通は同上
	同期スクロール
	ファイル間の差分がたくさんある場合、通常どおりスクロールすればそれらを表示でき
	ます。もう一方のウィンドウも同じ場所を表示するように自動的にスクロールされるの
	で、簡単に差分を並べて表示できます。
	同期スクロールを無効にするには、次のコマンドを使います:
	:set noscrollbind noscrollbind               : 普通は同上
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
	ます。上述の "main.c" と "main.c~" の例を使って説明します。左ウィンドウに移動 の例を使って説明します。左ウィンドウに移動               : 普通は同上
	して、もう一方のウィンドウでは削除されている行に移動します。そして、次のコマン
	ドを入力します:
	dp
	カレントウィンドウのテキストがもう一方のウィンドウにプットされ、変更がなくなり
	ます。"dp" は "diff put" の意味です。 の意味です。               : 普通は同上
	別の方法でも同じことができます。右のウィンドウに移動して、"changed" が挿入され が挿入され               : 普通は同上
	た行に移動します。そして、次のコマンドを入力します:
	do
	もう一方のファイルからテキストがコピーされ、変更はなくなります。これで変更がな
	くなってしまったので、すべてのテキストが折り畳まれて表示されます。"do" は は               : 普通は同上
	"diff obtain" の意味です。意味的には"dg"の方が良いのですが、それはすでに他で の意味です。意味的には"dg"の方が良いのですが、それはすでに他で               : 普通は同上
	使われています ("dgg" でカーソル位置から最初の行まで削除されます)。 でカーソル位置から最初の行まで削除されます)。               : 普通は同上
	差分モードの詳細は |vimdiff| をご覧ください。 をご覧ください。               : 普通は同上
	==============================================================================
	*08.8* その他 その他               : 普通は同上
	'laststatus' オプションを使うと、最後のウィンドウにステータスラインを表示する オプションを使うと、最後のウィンドウにステータスラインを表示する               : 普通は同上
	かどうかを設定できます:
	0 表示しない 表示しない               : 普通は同上
	1 分割ウィンドウがある時だけ表示 (初期設定) (初期設定)               : 普通は同上
	2 常に表示 常に表示               : 普通は同上
	ほとんどの、ファイルを開くコマンドには、ウィンドウを分割するバージョンが存在し
	ます。
	Ex コマンドの場合、先頭に "s" が付いています。例えば、":tag" はタグジャンプで はタグジャンプで               : 普通は同上
	すが、":stag" はウィンドウを分割してからタグジャンプします。 はウィンドウを分割してからタグジャンプします。               : 普通は同上
	ノーマルモードコマンドの場合、CTRL-W を前置します。例えば、CTRL-^ はオルタネー はオルタネー               : 普通は同上
	トファイルへのジャンプですが、CTRL-W CTRL-^ はウィンドウを分割してからオルタネー はウィンドウを分割してからオルタネー               : 普通は同上
	トファイルを開きます。
	'splitbelow' オプションを設定すると、カレントウィンドウの下に新しいウィンドウ オプションを設定すると、カレントウィンドウの下に新しいウィンドウ               : 普通は同上
	が作られるようになります。'splitright' オプションを設定すると、縦分割したとき オプションを設定すると、縦分割したとき               : 普通は同上
	に、カレントウィンドウの右に新しいウィンドウが作られるようになります。
	ウィンドウを分割するときに、次の修飾コマンドを使うと、ウィンドウの位置を指定で
	きます:
	:leftabove {cmd} カレントウィンドウの左、または上 カレントウィンドウの左、または上               : 普通は同上
	:aboveleft {cmd} 同上 同上               : 普通は同上
	:rightbelow {cmd} カレントウィンドウの右、または下 カレントウィンドウの右、または下               : 普通は同上
	:belowright {cmd} 同上 同上               : 普通は同上
	:topleft {cmd} 上、または左の端 上、または左の端               : 普通は同上
	:botright {cmd} 下、または右の端 下、または右の端               : 普通は同上
	==============================================================================
	*08.9* タブページ タブページ               : 普通は同上
	ウィンドウは重ねることができないので、画面がすぐにいっぱいになってしまいます。
	それを解決するために、タブページ、というものが用意されています。
	"thisfile" というファイルを開いているとしましょう。新しいタブページを作成する というファイルを開いているとしましょう。新しいタブページを作成する               : 普通は同上
	ために次のコマンドを実行します:
	:tabedit thatfile thatfile               : 普通は同上
	"thatfile" が開かれ、Vim ウィンドウ全体を占める大きさのウィンドウに表示されま ウィンドウ全体を占める大きさのウィンドウに表示されま               : 普通は同上
	す。そして、上部にバーが表示され、ファイル名が二つ表示されているのが確認できる
	と思います:
	+----------------------------------+
	| thisfile | /thatfile/ __________X| (thatfile は太字) は太字)               : 普通は同上
	|/* thatfile */ | |               : 普通は同上
	|that | |               : 普通は同上
	|that | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	| | |               : 普通は同上
	+----------------------------------+
	これは二つのタブページがある状態です。一つ目のタブページには "thisfile" を開い を開い               : 普通は同上
	ているウィンドウが、二つ目のタブページには "thatfile" を開いているウィンドウが を開いているウィンドウが               : 普通は同上
	入っています。これは、紙が二枚重なっていて、それぞれの紙にファイル名が書かれた
	ラベルが付いているようなものです。
	マウスを使って "thisfile" をクリックしてみましょう。次のようになります。 をクリックしてみましょう。次のようになります。               : 普通は同上
	+----------------------------------+
	| /thisfile/ | thatfile __________X| (thisfile は太字) は太字)               : 普通は同上
	|/* thisfile */ | |               : 普通は同上
	|this | |               : 普通は同上
	|this | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	| | |               : 普通は同上
	+----------------------------------+
	上部のラベルをクリックすると、タブページを切替えることができます。マウスがな
	い、あるいは使いたくない場合には、"gt" コマンドでも切替えられます。"gt" は は               : 普通は同上
	Goto Tab の略です。 の略です。               : 普通は同上
	次のコマンドを実行し、タブページをもう一つ作成してみましょう:
	:tab split split               : 普通は同上
	ウィンドウを一つもったタブページが作成され、そのウィンドウには、さっきまで開い
	ていたのと同じバッファが表示されています:
	+-------------------------------------+
	| thisfile | /thisfile/ | thatfile __X| (thisfile は太字) は太字)               : 普通は同上
	|/* thisfile */ | |               : 普通は同上
	|this | |               : 普通は同上
	|this | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	|~ | |               : 普通は同上
	| | |               : 普通は同上
	+-------------------------------------+
	":tab" コマンドは、ウィンドウを開く Ex コマンドと組み合わせて使います。そうす コマンドと組み合わせて使います。そうす               : 普通は同上
	ると、ウィンドウは新しいタブページで開かれます。もう一つ例をあげます:
	:tab help gt gt               : 普通は同上
	このコマンドを実行すると、"gt" についてのヘルプが新しいタブページで開きます。 についてのヘルプが新しいタブページで開きます。               : 普通は同上
	タブページの操作には、他にも次のようなものがあります:
	- 上部バーの最後のラベルより右 (ラベルのないとこ) をマウスでクリック をマウスでクリック               : 普通は同上
	"gt" と同じように、次のタブページを選択します。 と同じように、次のタブページを選択します。               : 普通は同上
	- 上部右端の "X" をクリック をクリック               : 普通は同上
	現在のタブページを閉じます。ただし、そのタブページ内に未保存の変更があ
	る場合は閉じません。
	- 上部バーをダブルクリック 上部バーをダブルクリック               : 普通は同上
	新しいタブページを作成します。
	- "tabonly" コマンド コマンド               : 普通は同上
	現在のタブページ以外を閉じます。ただし、それらのタブページ内に未保存の
	変更がある場合は閉じません。
	タブページについての詳細は |tab-page| を参照してください。 を参照してください。               : 普通は同上
	==============================================================================
	次章: |usr_09.txt| GUI を使う を使う               : 普通は同上
	Copyright: see |manual-copyright| vim:tw=78:ts=8:ft=help:norl: vim:tw=78:ts=8:ft=help:norl:               : 普通は同上
	------------------------------------------------------------------------------------------------------------------------------------------------
	top - main help file file               : 普通は同上
	Download (not html): vimdoc.zip vimdoc.zip               : 普通は同上
	Vim日本語ドキュメント
	苦情は yukihiro.nakadaira@gmail.com まで。 まで。               : 普通は同上
		{Google} ]> ]>               : 普通は同上
		Google 検索 検索               : 普通は同上
		( ) WWW を検索 (*) vimdoc を検索 を検索               : 普通は同上
	Vim documentation: tabpage tabpage               : 普通は同上
	==========================
	main help file file               : 普通は同上
	------------------------------------------------------------------------------------------------------------------------------------------------
	*tabpage.txt* For Vim バージョン 7.2. Last change: 2007 Mar 11 11               : 普通は同上
	VIM REFERENCE MaNUaL by Bram Moolenaar Moolenaar               : 普通は同上
	タブページの使い方 *tab-page* *tabpage* *tabpage*               : 普通は同上
	タブページを使うために追加されたコマンドについて説明します。複数のタブページを
	開いていると違う働きをするコマンドについても説明します。
	1. はじめに |tab-page-intro| |tab-page-intro|               : 普通は同上
	2. コマンド |tab-page-commands| |tab-page-commands|               : 普通は同上
	3. その他 |tab-page-other| |tab-page-other|               : 普通は同上
	4. 'tabline' の設定 |setting-tabline| |setting-tabline|               : 普通は同上
	5. 'guitablabel' の設定 |setting-guitablabel| |setting-guitablabel|               : 普通は同上
	{Vi にはこれらのコマンドはありません} にはこれらのコマンドはありません}               : 普通は同上
	{|+windows| が有効な場合のみ利用できます} が有効な場合のみ利用できます}               : 普通は同上
	==============================================================================
	1. はじめに *tab-page-intro* *tab-page-intro*               : 普通は同上
	タブページは複数のウィンドウを持てます。タブページを使うと、作業別のウィンドウ
	の集合を簡単に切り替えることができます。
	通常、Vim ウィンドウの最上部にタブページを表すラベルの一覧が表示されます。その ウィンドウの最上部にタブページを表すラベルの一覧が表示されます。その               : 普通は同上
	ラベルをマウスでクリックすると、そのタブページにジャンプできます。他の方法でも
	タブページを移動できます。
	ほとんどのコマンドは作業中のタブページ内だけで動作します。|CTRL-W| コマンド コマンド               : 普通は同上
	や、|:tab| を前置しない |:windo|、|:all|、|:ball| なども同様です。カレントタブ なども同様です。カレントタブ               : 普通は同上
	ページ以外にも作用するコマンドについては以下で説明しています。
	タブページを使うと、一時的なバッファを使用するときに、作業中のウィンドウレイア
	ウトを変更しなくてすみます。新しいタブページを開いて、何か作業をし、そのタブ
	ページを閉じる、という具合です。
	==============================================================================
	2. コマンド *tab-page-commands* *tab-page-commands*               : 普通は同上
	タブページを開くには:
	Vim を "vim -p filename ..." と起動すると、それぞれのファイルごとに と起動すると、それぞれのファイルごとに               : 普通は同上
	('tabpagemax' までの) タブページを開けます。|-p| タブページを開けます。|-p|               : 普通は同上
	CUI の Vim でタブページラインをダブルクリックすると新しいタブページが作成され でタブページラインをダブルクリックすると新しいタブページが作成され               : 普通は同上
	ます。新しいタブページはクリックした場所の左に作成されます。最初のクリックが他
	のタブページの選択になってしまうときは、スクリーンが余計に更新されます。
	この機能は Win32 と Motif の GUI でも使えます。ただし、ラベルの右をクリックし でも使えます。ただし、ラベルの右をクリックし               : 普通は同上
	た場合のみです。
	GUI でタブページラインを右クリックするとメニューが表示されます。|tabline-menu| でタブページラインを右クリックするとメニューが表示されます。|tabline-menu|               : 普通は同上
	:tabe[dit] *:tabe* *:tabedit* *:tabnew* *:tabnew*               : 普通は同上
	:tabnew カレントタブページの後ろに空のウィンドウを持った新しいタブペー カレントタブページの後ろに空のウィンドウを持った新しいタブペー               : 普通は同上
	ジを作成します。
	:tabe[dit] [++opt] [+cmd] {file} {file}               : 普通は同上
	:tabnew [++opt] [+cmd] {file} {file}               : 普通は同上
	{file} を新しいタブページで開きます。|:edit| と同じです。 と同じです。               : 普通は同上
	:tabf[ind] [++opt] [+cmd] {file} *:tabf* *:tabfind* *:tabfind*               : 普通は同上
	'path' 内の {file} を新しいタブページで開きます。|:find| と同 と同               : 普通は同上
	じです。
	{|+file_in_path| が有効な場合のみ利用できます} が有効な場合のみ利用できます}               : 普通は同上
	:[count]tab {cmd} *:tab* *:tab*               : 普通は同上
	{cmd} を実行します。そのコマンドが新しいウィンドウを作成すると を実行します。そのコマンドが新しいウィンドウを作成すると               : 普通は同上
	きは、その代わりに新しいタブページを作成します。|:diffsplit|と
	|:diffpatch|, |:execute|, |:normal| に対しては機能しません。 に対しては機能しません。               : 普通は同上
	[count] を省略すると、新しいタブページはカレントタブページの後 を省略すると、新しいタブページはカレントタブページの後               : 普通は同上
	ろに作成されます。
	[count] を指定すると、[count] 番目のタブページの後ろに作成され 番目のタブページの後ろに作成され               : 普通は同上
	ます。タブページを一番左に作成するには ":0tab cmd" とします。 とします。               : 普通は同上
	例:
	:tab split " opens current buffer in new tab page page               : 普通は同上
	:tab help gt " opens tab page with help for "gt" "gt"               : 普通は同上
	CTRL-W gf カーソル下のファイル名のファイルを新しいタブページで開きます。 カーソル下のファイル名のファイルを新しいタブページで開きます。               : 普通は同上
	|CTRL-W_gf| を参照してください。 を参照してください。               : 普通は同上
	CTRL-W gF カーソル下のファイル名のファイルを新しいタブページで開きます。 カーソル下のファイル名のファイルを新しいタブページで開きます。               : 普通は同上
	そして、ファイル名の後ろに指定された行番号にジャンプします。
	|CTRL-W_gF| を参照してください。 を参照してください。               : 普通は同上
	タブページを閉じるには:
	複数のタブページを開いているときは、タブページ内の最後のウィンドウを閉じると、
	そのタブページが閉じられます。
	タブページラインが表示されているときは、右上に表示されている "X" をマウスでク をマウスでク               : 普通は同上
	リックすると、カレントタブページが閉じます。|'tabline'| を設定しているときは、 を設定しているときは、               : 普通は同上
	他の何かが表示されているかもしれません。
	*:tabc* *:tabclose* *:tabclose*               : 普通は同上
	:tabc[lose][!] カレントタブページを閉じます。 カレントタブページを閉じます。               : 普通は同上
	このコマンドは次のときに失敗します:
	- タブページが一つしかないとき。 *E784* *E784*               : 普通は同上
	- 'hidden' がオフのときに [!] を使わず、バッファに変更があり、 を使わず、バッファに変更があり、               : 普通は同上
	そのバッファを表示しているウィンドウが他にない場合。
	バッファの変更はファイルに保存されませんが、失われることもあり
	ません。このコマンドは安全なコマンドです。
	:tabc[lose][!] {count} {count}               : 普通は同上
	{count} 番目のタブページを閉じます。|:tabclose| と同じ理由で失 と同じ理由で失               : 普通は同上
	敗することがあります。
	*:tabo* *:tabonly* *:tabonly*               : 普通は同上
	:tabo[nly][!] カレントタブページ以外のすべてのタブページを閉じます。 カレントタブページ以外のすべてのタブページを閉じます。               : 普通は同上
	オプション 'hidden' がオンのとき、閉じたウィンドウのバッファは がオンのとき、閉じたウィンドウのバッファは               : 普通は同上
	すべて隠しバッファになります。
	'hidden' がオフ、'autowrite' がオンのときは、変更のあるバッ がオンのときは、変更のあるバッ               : 普通は同上
	ファはファイルに保存されます。そうでないときは、変更のあるバッ
	ファを表示しているウィンドウは閉じません。[!] を指定した場合 を指定した場合               : 普通は同上
	は、変更のあるバッファは隠しバッファになります。変更のあるバッ
	ファは絶対に破棄されないので、変更を失うことはありません。
	タブページを切り替えるには:
	タブページラインが表示されているときは、タブページラベルをマウスでクリックする
	と、そのタブページに移動できます。ラベルが表示されていない場所をクリックする
	と、次のタブページに移動できます。 |'tabline'| |'tabline'|               : 普通は同上
	:tabn[ext] *:tabn* *:tabnext* *gt* *gt*               : 普通は同上
	<C-PageDown> *CTRL-<PageDown>* *<C-PageDown>* *<C-PageDown>*               : 普通は同上
	gt *i_CTRL-<PageDown>* *i_<C-PageDown>* *i_<C-PageDown>*               : 普通は同上
	次のタブページに移動します。次のタブページがない場合は、最初の
	タブページに移動します。
	:tabn[ext] {count} {count}               : 普通は同上
	{count}<C-PageDown>
	{count}gt {count} 番目のタブページに移動します。最初のタブページの番号は 番目のタブページに移動します。最初のタブページの番号は               : 普通は同上
	1 です。 です。               : 普通は同上
	:tabp[revious] *:tabp* *:tabprevious* *gT* *:tabN* *:tabN*               : 普通は同上
	:tabN[ext] *:tabNext* *CTRL-<PageUp>* *CTRL-<PageUp>*               : 普通は同上
	<C-PageUp> *<C-PageUp>* *i_CTRL-<PageUp>* *i_<C-PageUp>* *i_<C-PageUp>*               : 普通は同上
	gT 前のタブページに移動します。前のタブページがない場合は、最後の 前のタブページに移動します。前のタブページがない場合は、最後の               : 普通は同上
	タブページに移動します。
	:tabp[revious] {count} {count}               : 普通は同上
	:tabN[ext] {count} {count}               : 普通は同上
	{count}<C-PageUp>
	{count}gT {count} の数だけ前のタブページに移動します。前のタブページがな の数だけ前のタブページに移動します。前のタブページがな               : 普通は同上
	い場合は最後のタブページに移動します。
	:tabr[ewind] *:tabfir* *:tabfirst* *:tabr* *:tabrewind* *:tabrewind*               : 普通は同上
	:tabfir[st] 最初のタブページに移動します。 最初のタブページに移動します。               : 普通は同上
	*:tabl* *:tablast* *:tablast*               : 普通は同上
	:tabl[ast] 最後のタブページに移動します。 最後のタブページに移動します。               : 普通は同上
	その他のコマンド:
	*:tabs*
	:tabs タブページと、含まれているウィンドウの一覧を表示します。 タブページと、含まれているウィンドウの一覧を表示します。               : 普通は同上
	">" と表示されるのはカレントウィンドウです。 と表示されるのはカレントウィンドウです。               : 普通は同上
	"+" と表示されるのは変更のあるバッファです。 と表示されるのは変更のあるバッファです。               : 普通は同上
	タブページを並べ替えるには:
	:tabm[ove] [N] *:tabm* *:tabmove* *:tabmove*               : 普通は同上
	カレントタブページを N 番目のタブページの後ろに移動します。カ 番目のタブページの後ろに移動します。カ               : 普通は同上
	レントタブページを一番目のタブページにするにはゼロを指定します。
	N を省略すると最後に移動します。 を省略すると最後に移動します。               : 普通は同上
	タブページごとにコマンドを実行するには:
	*:tabd* *:tabdo* *:tabdo*               : 普通は同上
	:tabd[o] {cmd} タブページごとにコマンドを実行します。 タブページごとにコマンドを実行します。               : 普通は同上
	これは次のような動作をします:
	:tabfirst
	:{cmd}
	:tabnext
	:{cmd}
	etc.
	このコマンドは各タブページのカレントウィンドウで実行されます。
	いずれかのタブページでエラーが起きたときは、その場で実行を中断
	します。
	最後のタブページ (またはエラーが起きたタブページ) がカレントタ がカレントタ               : 普通は同上
	ブページになります。
	{cmd} は '|' を使って複数のコマンドを繋げることができます。 を使って複数のコマンドを繋げることができます。               : 普通は同上
	{cmd} はタブページを開いたり閉じたり並べ替えたりしてはいけませ はタブページを開いたり閉じたり並べ替えたりしてはいけませ               : 普通は同上
	ん。
	{Vi にはない機能です} にはない機能です}               : 普通は同上
	{|+listcmds| が有効な場合のみ利用できます} が有効な場合のみ利用できます}               : 普通は同上
	|:windo|、|:argdo|、|:bufdo| も参照してください。 も参照してください。               : 普通は同上
	==============================================================================
	3. その他 *tab-page-other* *tab-page-other*               : 普通は同上
	*tabline-menu*
	GUI のタブページラインにはポップアップメニューがあります。右クリックで次のメ のタブページラインにはポップアップメニューがあります。右クリックで次のメ               : 普通は同上
	ニューが表示されます:
	Close マウスポインタの下のタブページを閉じます。マウスがラベ マウスポインタの下のタブページを閉じます。マウスがラベ               : 普通は同上
	ルの上にないときは、カレントタブページを閉じます。
	New Tab タブページを新規バッファで開きます。マウスポインタの左 タブページを新規バッファで開きます。マウスポインタの左               : 普通は同上
	側に作成されます。
	Open Tab... "New Tab" と同じですが、ファイル選択ダイアログを使っ と同じですが、ファイル選択ダイアログを使っ               : 普通は同上
	て選択したファイルを新しいタブページで開きます。
	Diff モードはタブページ単位で機能します。一つのタブページ内でファイル間の差分 モードはタブページ単位で機能します。一つのタブページ内でファイル間の差分               : 普通は同上
	を表示できます。そして、他のタブページでは他のファイルとの差分を表示することが
	できます。
	タブページローカル変数は "t:" で始まります。|tabpage-variable| で始まります。|tabpage-variable|               : 普通は同上
	現在、タブページローカルなオプションは 'cmdheight' だけです。 だけです。               : 普通は同上
	オートコマンドイベントの TabLeave と TabEnter を使って、タブページを切り替える を使って、タブページを切り替える               : 普通は同上
	ときにコマンドを実行できます。イベントが起きる正確な順番は何をしたかによって変
	わります。新しいタブページを作成したときは、例えば、編集中のバッファを新しい
	ウィンドウで開き、それからそのウィンドウで別のバッファを開いたときと同じような
	動きをします。つまり、":tabnew" では次の順番でイベントが実行されます: では次の順番でイベントが実行されます:               : 普通は同上
	WinLeave カレントウィンドウから離れる カレントウィンドウから離れる               : 普通は同上
	TabLeave カレントタブページから離れる カレントタブページから離れる               : 普通は同上
	TabEnter 新しいタブページに入る 新しいタブページに入る               : 普通は同上
	WinEnter 新しいタブページのウィンドウに入る 新しいタブページのウィンドウに入る               : 普通は同上
	BufLeave カレントバッファから離れる カレントバッファから離れる               : 普通は同上
	BufEnter 新しい空のバッファに入る 新しい空のバッファに入る               : 普通は同上
	タブページを切り替えたときは次の順番です:
	BufLeave
	WinLeave
	TabLeave
	TabEnter
	WinEnter
	BufEnter
	==============================================================================
	4. 'tabline' の設定 *setting-tabline* *setting-tabline*               : 普通は同上
	オプション 'tabline' を設定してタブページラベルの表示方法を指定できます。これ を設定してタブページラベルの表示方法を指定できます。これ               : 普通は同上
	は CUI の タブページラインで使います。 タブページラインで使います。               : 普通は同上
	オプション 'showtabline' を設定してタブページラインを表示するかどうかを指定で を設定してタブページラインを表示するかどうかを指定で               : 普通は同上
	きます。表示しない、タブページが複数あるときだけ表示する、常に表示する、から選
	べます。
	タブページラインの強調表示には TabLine、TabLineSel、TabLineFill が使われます。 が使われます。               : 普通は同上
	|hl-TabLine| |hl-TabLineSel| |hl-TabLineFill| |hl-TabLineFill|               : 普通は同上
	変更されているウィンドウを含むタブページには "+" が表示されます。タブページ内 が表示されます。タブページ内               : 普通は同上
	のウィンドウの個数も表示されます。よって "3+" という表示は3個のウィンドウを含 という表示は3個のウィンドウを含               : 普通は同上
	む、そのうちの1つが変更されているバッファを含むということを意味します。
	オプション 'tabline' を使って、タブページラベルを好みの表示に設定できます。こ を使って、タブページラベルを好みの表示に設定できます。こ               : 普通は同上
	れはあまり簡単ではないので、サンプルを用意してあります。
	基本的には 'statusline' を参照してください。同じアイテムが 'tabline' で使用で で使用で               : 普通は同上
	きます。加えて、|tabpagebuflist()|、|tabpagenr()|、|tabpagewinnr()| という関数 という関数               : 普通は同上
	も使えます。
	タブページラベルの数は変化するので、オプションには式を使う必要があります。次の
	ように設定します:
	:set tabline=%!MyTabLine() tabline=%!MyTabLine()               : 普通は同上
	では、関数 MyTabLine() を定義して、すべてのタブページラベルを表示するようにし を定義して、すべてのタブページラベルを表示するようにし               : 普通は同上
	ます。タブページラベル全体の作成と、個々のタブページラベルの作成、という二つの
	段階に分けると簡単です。
	function MyTabLine() MyTabLine()               : 普通は同上
	let s = '' ''               : 普通は同上
	for i in range(tabpagenr('$')) range(tabpagenr('$'))               : 普通は同上
	" 強調表示グループの選択 強調表示グループの選択               : 普通は同上
	if i + 1 == tabpagenr() tabpagenr()               : 普通は同上
	let s .= '%#TabLineSel#' '%#TabLineSel#'               : 普通は同上
	else
	let s .= '%#TabLine#' '%#TabLine#'               : 普通は同上
	endif
	" タブページ番号の設定 (マウスクリック用) (マウスクリック用)               : 普通は同上
	let s .= '%' . (i + 1) . 'T' 'T'               : 普通は同上
	" ラベルは MyTabLabel() で作成する で作成する               : 普通は同上
	let s .= ' %{MyTabLabel(' . (i + 1) . ')} ' '               : 普通は同上
	endfor
	" 最後のタブページの後は TabLineFill で埋め、タブページ番号をリセッ で埋め、タブページ番号をリセッ               : 普通は同上
	" トする トする               : 普通は同上
	let s .= '%#TabLineFill#%T' '%#TabLineFill#%T'               : 普通は同上
	" カレントタブページを閉じるボタンのラベルを右添えで作成 カレントタブページを閉じるボタンのラベルを右添えで作成               : 普通は同上
	if tabpagenr('$') > 1 1               : 普通は同上
	let s .= '%=%#TabLine#%999Xclose' '%=%#TabLine#%999Xclose'               : 普通は同上
	endif
	return s s               : 普通は同上
	endfunction
	関数 MyTabLabel() は個々のタブページラベルを得るために呼ばれます。 は個々のタブページラベルを得るために呼ばれます。               : 普通は同上
	function MyTabLabel(n) MyTabLabel(n)               : 普通は同上
	let buflist = tabpagebuflist(a:n) tabpagebuflist(a:n)               : 普通は同上
	let winnr = tabpagewinnr(a:n) tabpagewinnr(a:n)               : 普通は同上
	return bufname(buflist[winnr - 1]) 1])               : 普通は同上
	endfunction
	このサンプルは単純なものです。生成されるのは未設定時のタブページラインとほぼ同
	じですが、変更のあるバッファに + が付けたり、名前を切り詰めたりはしません。十 が付けたり、名前を切り詰めたりはしません。十               : 普通は同上
	分な表示領域がない場合など、なんらかのうまい方法でラベルの幅を減らしたいでしょ
	う。利用できる表示領域はオプション 'columns' を確認してください。 を確認してください。               : 普通は同上
	==============================================================================
	5. 'guitablabel' の設定 *setting-guitablabel* *setting-guitablabel*               : 普通は同上
	GUI のタブページラインが表示されているとき、'guitablabel' を設定してタブページ を設定してタブページ               : 普通は同上
	ラベルの表示方法を指定できます。'tabline' とは違い、一度にタブページライン全体 とは違い、一度にタブページライン全体               : 普通は同上
	を指定するのではなく、個々のラベルを得るために 'guitablabel' が使われます。 が使われます。               : 普通は同上
	'guitabtooltip' という良く似たオプションがあります。これはラベルのツールチップ という良く似たオプションがあります。これはラベルのツールチップ               : 普通は同上
	を表示するために使われます。ツールチップはマウスポインタがラベルの上に乗ってい
	るときだけ表示されるので、普通は、長い文字を表示します。いくつかのシステムだけ
	サポートされています。
	書式についてはオプション 'statusline' を参照してください。 を参照してください。               : 普通は同上
	"%N" はカレントタブページ番号になります。このオプションを評価するときに、 はカレントタブページ番号になります。このオプションを評価するときに、               : 普通は同上
	|v:lnum| にも同じ番号が設定されます。ファイル名を参照するアイテムにはタブペー にも同じ番号が設定されます。ファイル名を参照するアイテムにはタブペー               : 普通は同上
	ジのカレントウィンドウのものが使われます。
	Note: このオプションでは強調表示は使えません。%T と %X は無視されます。 は無視されます。               : 普通は同上
	簡単な例として、次のものはタブページ番号とバッファ名をラベルに表示します:
	:set guitablabel=%N\ %f %f               : 普通は同上
	次の例は 'guitablabel' の標準設定の動作と似た動作をします。タブページのウィン の標準設定の動作と似た動作をします。タブページのウィン               : 普通は同上
	ドウ数と、変更のあるバッファがあるときには '+' を表示します: を表示します:               : 普通は同上
	function GuiTabLabel() GuiTabLabel()               : 普通は同上
	let label = '' ''               : 普通は同上
	let bufnrlist = tabpagebuflist(v:lnum) tabpagebuflist(v:lnum)               : 普通は同上
	" このタブページに変更のあるバッファがるときには '+' を追加する を追加する               : 普通は同上
	for bufnr in bufnrlist bufnrlist               : 普通は同上
	if getbufvar(bufnr, "&modified") "&modified")               : 普通は同上
	let label = '+' '+'               : 普通は同上
	break
	endif
	endfor
	" ウィンドウが複数あるときにはその数を追加する ウィンドウが複数あるときにはその数を追加する               : 普通は同上
	let wincount = tabpagewinnr(v:lnum, '$') '$')               : 普通は同上
	if wincount > 1 1               : 普通は同上
	let label .= wincount wincount               : 普通は同上
	endif
	if label != '' ''               : 普通は同上
	let label .= ' ' '               : 普通は同上
	endif
	" バッファ名を追加する バッファ名を追加する               : 普通は同上
	return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]) 1])               : 普通は同上
	endfunction
	set guitablabel=%{GuiTabLabel()} guitablabel=%{GuiTabLabel()}               : 普通は同上
	Note: この関数はオプションを設定する前に定義しておく必要があります。そうしない この関数はオプションを設定する前に定義しておく必要があります。そうしない               : 普通は同上
	と、関数未定義のエラーが表示されてしまいます。
	標準のラベルを使いたい場合は、空文字列を返してください。
	あるタブページに固有の何かを表示したいときは、タブページローカル変数 |t:var| |t:var|               : 普通は同上
	が便利です。
	vim:tw=78:ts=8:ft=help:norl:
	------------------------------------------------------------------------------------------------------------------------------------------------
	top - main help file file               : 普通は同上
	Download (not html): vimdoc.zip vimdoc.zip               : 普通は同上
	Vim日本語ドキュメント
	苦情は yukihiro.nakadaira@gmail.com まで。 まで。               : 普通は同上
#TODO
	`QuickNote-Java` memos memos               : 普通は同上
#YaNKTMP.
	vim 他のファイルにコピペするプラグインyanktmp.vim 2009 年 7 月 16 日 日               : 普通は同上
	しかしyanktmp.vimプラグインを使うことで解決。
	１．yanktmp.vimをダウンロード
	ダウンロードは以下より
	http://www.vim.org/scripts/script.php?script_id=1598
	２．ダウンロードしたyanktmp.vimファイルをプラグインディレクトリに配置する。
	/Users/<username>/.vim/plugin/yanktmp.vim
	３．.vimrcに以下を追記する
	map sy :call YanktmpYank()<CR> YanktmpYank()<CR>               : 普通は同上
	map sp :call YanktmpPaste_p()<CR> YanktmpPaste_p()<CR>               : 普通は同上
	map sP :call YanktmpPaste_P()<CR> YanktmpPaste_P()<CR>               : 普通は同上
	コピーしたい箇所を選択して、ｓｙでコピーして、他のタブ（プロセス）に切り替えてsp(またはsP)でペースト。
	※spとsPの違いは、pとPの違いと一緒一
	#SURROUND.---------------------------------------------------------------------------------------
		with the cursor on "Hello world!  (iw is a text object.The "." command will work with ds, cs, and yss with repeat.vim, vimscript #2136.) #2136.)               : 普通は同上
		dsの中ではtがタグを表現する。以下の文章(*はカーソルの位置) iwは、inner word。 word。               : 普通は同上
		#
		ySS  インデントするyss インデントするyss               : 普通は同上
		yssb or yss) .    ({ Hello } world!) world!)               : 普通は同上
			ysテキストオブジェクトを使ったcsができる。"Hello *world!"に対して「ysiw)」とすると"Hello (*world!)" (*world!)"               : 普通は同上
			yss  カレントラインに対するcs。 カレントラインに対するcs。               : 普通は同上
			yS  インデントするys インデントするys               : 普通は同上
		#changing side-quotaton: side-quotaton:               : 普通は同上
		cs"'              "Hello world!" to 'Hello world!' world!'               : 普通は同上
		cs'<q> to change it to <q>Hello world!</q> world!</q>               : 普通は同上
		cst" to get "Hello world!" world!"               : 普通は同上
		ds" .  Hello world! world!               : 普通は同上
		dst    remove side tags tags               : 普通は同上
		di    remove innertext innertext               : 普通は同上
		Revert to the original text: ds{ds) Hello world! world!               : 普通は同上
		Emphasize hello:  ysiw<em> <em>Hello</em> world! world!               : 普通は同上
		#visual mode combo:   V-S<p class="important">.  <p class="important"> <em>Hello</em> world! </p> </p>               : 普通は同上
		カスタマイズ
			括弧やタグみたいに自分の好きな文字を入れる時は以下のようにする。
			let g:surround_45 = "<?php \r ?>" ?>"               : 普通は同上
			これは-が押されたときにPHPタグを指定できる。surround_45の45が-を示している。-のaSCIIコードが45．-のaSCIIコードを調べるには:echo char2nr char2nr               : 普通は同上
			("-"))とすればよい。
		install details details               : 普通は同上
			Extract to ~/.vim, or ~\vimfiles (Windows).  You'll need to regenerate helptags (fill in the install path below) below)               : 普通は同上
			:helptags ~/.vim/doc ~/.vim/doc               : 普通は同上
	#RUBY-MaCRO----------------------------------------------------------------------------------------
		Typing "for" on a blank line will result in in               : 普通は同上
			for  in in               : 普通は同上
			end
		with the cursor positioned before the "in". "in".               : 普通は同上
		The same will happen with "while", "until", and so on.  a if the line is not blank, "for" will just insert itself. itself.               : 普通は同上
		also, symbols like " are inserted in matching pairs, with the cursor in between. between.               : 普通は同上
		"K" runs ruby on the current buffer, and the "F1" function key puts a line #!/usr/math/bin/ruby on the first line.  (You will have to edit edit               : 普通は同上
		this part). part).               : 普通は同上
		install details details               : 普通は同上
			put this in an ftplugin directory in your runtime path.  or Put something like the following line in your .vimrc file: file:               : 普通は同上
			autocmd Filetype ruby source ~/.Vim/ruby-macros.vim ~/.Vim/ruby-macros.vim               : 普通は同上
	#SNIPMaTE----------------------------------------------------------------------------------------
		snipMate.vim aims to be an unobtrusive, concise vim script that implements some of TextMate's snippets features in Vim. a snippet is a a               : 普通は同上
		piece of often-typed text that you can insert into your document using a trigger word followed by a <tab>. <tab>.               : 普通は同上
		For instance, in a C file using the default installation of snipMate.vim, if you type "for<tab>" in insert mode, it will expand a a               : 普通は同上
		typical for loop in C: C:               : 普通は同上
		for (i = 0; i < count; i++) { {               : 普通は同上
		}
		To go to the next item in the loop, simply <tab> over to it; if there is repeated code, such as the "i" variable in this example, you you               : 普通は同上
		can simply start typing once it's highlighted and all the matches specified in the snippet will be updated. updated.               : 普通は同上
		snipMate.vim has the following features among others: others:               : 普通は同上
			- The syntax of snippets is very similar to TextMate's, allowing easy conversion. conversion.               : 普通は同上
			- The position of the snippet is kept transparently (i.e., it does not use marks/placeholders inserted into the buffer), allowing you you               : 普通は同上
		to escape out of an incomplete snippet, something particularly useful in Vim. Vim.               : 普通は同上
			- Variables in snippets are updated as-you-type. as-you-type.               : 普通は同上
			- Snippets can have multiple matches. matches.               : 普通は同上
			- Snippets can be out of order. For instance, in a do...while loop, the condition can be added before the code. code.               : 普通は同上
		Bug reports, feature requests, etc. are welcome and can be emailed to me or submitted on the issue tracker: http://code.google.com/p/ http://code.google.com/p/               : 普通は同上
		snipmate/issues/list
		For a quick introduction, see this screencast: http://vimeo.com/3535418 http://vimeo.com/3535418               : 普通は同上
		For more help see the  documentation that comes with snipMate in ~/.vim/doc/snipMate.txt. ~/.vim/doc/snipMate.txt.               : 普通は同上
		install details details               : 普通は同上
			Requires Vim 7 or higher. higher.               : 普通は同上
			filetype plugin on" to your .vimrc .vimrc               : 普通は同上
			unzip snipMate.zip -d ~/.vim (or equivalent, e.g. $HOME\vimfiles on Windows) Windows)               : 普通は同上
			:helptags ~/.vim/doc ~/.vim/doc               : 普通は同上
		Keep in mind this will overwrite any files included with older versions of snipMate, including the default *.snippets files for the the               : 普通は同上
		included filetypes. If you don't want your snippets overwritten, just name them name them differently than the default snippets, e.g. e.g.               : 普通は同上
		c-mysnips.snippets.
	#TEMPLaTE.---------------------------------------------------------------------------------------
		Vimで新しいファイルを作ったときに、拡張子に応じて自動的にテンプレートを適用する方法です。
		まずは準備として、VIMHOMEを設定。.bashrcとか.zshrcに以下の設定。
			export VIMHOME=$HOME/.vim VIMHOME=$HOME/.vim               : 普通は同上
		次に.vimrcの設定。autocmdを使って、テンプレートを読み込むようにします。
			autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl $VIMHOME/templates/%:e.tpl               : 普通は同上
		これでvimで新規ファイルを作成すると、その拡張子に応じて$HOME/.vim/templates以下の<拡張子>.tplファイルをテンプレートとして読み込む設定が
		できました。
		あとはテンプレートファイルの作成。例えばhtmlファイルならこんな感じ。
			$ vim $HOME/.vim/templstes/html.tpl $HOME/.vim/templstes/html.tpl               : 普通は同上
			<html>
			<head>
			<title></title>
			</head>
			<body>
			</body>
			</html>
		拡張子に応じたテンプレートを作ったら、後はその拡張子のファイルを作成したら、自動でテンプレートが適用されます。
	#CHINESE.---------------------------------------------------------------------------------------
		VimIM 是?? Vim 玩家??的插件，可作? Vim 内嵌中文?入法。只要?的 Vim 能?示中文，?就能用 Vim ?入搜索中文。 ?入搜索中文。               : 普通は同上
		install details details               : 普通は同上
		(1) download any data file you like from from               : 普通は同上
			http://code.google.com/p/vimim/downloads/list
		(2) save this file and the data file in the Vim plugin directory directory               : 普通は同上
		Usage (1): [in Insert Mode] 【点石成金】没有所?模式?? 【点石成金】没有所?模式??               : 普通は同上
			# to insert: type keycode and hit <C-\> to trigger trigger               : 普通は同上
			# to search: hit '/' or '?' from popup menu menu               : 普通は同上
		Usage (2): [in Insert Mode] 【中文?入模式】 Ctrl-6 切? 切?               : 普通は同上
			# [dynamic] mode: any valid key code => Chinese Chinese               : 普通は同上
			# [static]  mode: Space=>Chinese  Enter=>English Enter=>English               : 普通は同上
		官方网址:  http://vim.sourceforge.net/scripts/script.php?script_id=2506 http://vim.sourceforge.net/scripts/script.php?script_id=2506               : 普通は同上
		新???:  http://groups.google.com/group/vimim http://groups.google.com/group/vimim               : 普通は同上
		??下?:  http://code.google.com/p/vimim/downloads/list http://code.google.com/p/vimim/downloads/list               : 普通は同上
		最新主?:  http://maxiangjiang.googlepages.com/vimim.html http://maxiangjiang.googlepages.com/vimim.html               : 普通は同上
		程式框架:  http://maxiangjiang.googlepages.com/vimim.vim.html http://maxiangjiang.googlepages.com/vimim.vim.html               : 普通は同上
`#vim-ruby`
	#vim-rubyインストール手順は既存の設定ファイルやプラグインに影響しないが、心配ならば ~/.vimrc と~./vimを事前バックアップ と~./vimを事前バックアップ               : 普通は同上
	デフォルトのvimはrubyインタフェースを実装していないので、対応版をインストール (upgradeだと依存環境全部更新するのでinstall ) )               : 普通は同上
		sudo apt-get install vim-ruby vim-ruby               : 普通は同上
	vim-rubyのインストール。上記と名前は一緒ですが、今回はrubyのvimのライブラリです。
		sudo gem1.8 install vim-ruby vim-ruby               : 普通は同上
		sudo vim-ruby-install.rb vim-ruby-install.rb               : 普通は同上
			Possible Vim installation directories: directories:               : 普通は同上
				1) /home/[yourID]/.vim /home/[yourID]/.vim               : 普通は同上
			Please select one (or anything else to specify another directory):  ←1を入力 ←1を入力               : 普通は同上


#David Rayner's VIMTIPS.--------------------------------------------------------------------------------------- VIMTIPS.---------------------------------------------------------------------------------------               : 普通は同上
	David Rayner's Best of Vim Tips part 1 1               : 普通は同上
	http://www.rayninfo.co.uk/vimtips.html より。 より。               : 普通は同上
	" 検索 検索               : 普通は同上
	/joe/e                      : カーソルをマッチの末尾へ カーソルをマッチの末尾へ               : 普通は同上
	/joe/e+1                    : カーソルをマッチの末尾＋1へ カーソルをマッチの末尾＋1へ               : 普通は同上
	/joe/s-2                    : カーソルをマッチの先頭－2へ カーソルをマッチの先頭－2へ               : 普通は同上
	/^joe.*fred.*bill/          : normal normal               : 普通は同上
	/^[a-J]\+/                  : 1個以上のa-Jで始まる行を検索 1個以上のa-Jで始まる行を検索               : 普通は同上
	/begin\_.*end               : 複数行にまたがることを許す検索 複数行にまたがることを許す検索               : 普通は同上
	/fred\_s*joe/i              : 改行を含む任意のホワイトスペース 改行を含む任意のホワイトスペース               : 普通は同上
	/fred\|joe                  : fred または joe を検索 を検索               : 普通は同上
	/.*fred\&.*joe              : fred と joe を検索（順序は問わない！） を検索（順序は問わない！）               : 普通は同上
	/\<fred\>/i                 : fred を検索。alfred や frederick を除く を除く               : 普通は同上
	/\<\d\d\d\d\>               : ちょうど4個の数字を検索 ちょうど4個の数字を検索               : 普通は同上
	/\D\d\d\d\d\D               : ちょうど4個の数字を検索 ちょうど4個の数字を検索               : 普通は同上
	/\<\d\{4}\>                 : 同じ 同じ               : 普通は同上
	/\([^0-9]\|^\)%.*%          : Search for absence of a digit or beginning of line line               : 普通は同上
	" 空行を検索 空行を検索               : 普通は同上
	/^\n\{3}                    : 連続する3つの空行を検索 連続する3つの空行を検索               : 普通は同上
	" 正規表現の記憶を検索中で使う 正規表現の記憶を検索中で使う               : 普通は同上
	/\(fred\).*\(joe\).*\2.*\1
	" パターンの繰り返し (rather than what the Regexp finds) finds)               : 普通は同上
	/^\([^,]*,\)\{8}
	" ヴィジュアル検索 ヴィジュアル検索               : 普通は同上
	:vmap // y/<C-R>"<CR>       : 選択したテキストを検索 選択したテキストを検索               : 普通は同上
	:vmap <silent> //    y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR> : 特殊文字のエスケープ付き版 特殊文字のエスケープ付き版               : 普通は同上
	" \zs and \ze 正規表現のデリミタ :h /\zs /\zs               : 普通は同上
	/<\zs[^>]*\ze>              : タグの中身を検索。<> は無視 は無視               : 普通は同上
	" ゼロ幅 :h /\@= /\@=               : 普通は同上
	/<\@<=[^>]*>\@=             : タグの中身を検索。<> は無視 は無視               : 普通は同上
	/<\@<=\_[^>]*>\@=           : 複数行にわたってタグを検索 複数行にわたってタグを検索               : 普通は同上
	" 複数行に渡る検索。 \_ は改行を含むという意味 は改行を含むという意味               : 普通は同上
	/<!--\_p\{-}-->                   : 複数行に渡るコメントを検索 複数行に渡るコメントを検索               : 普通は同上
	/fred\_s*joe/i                    : 改行を含む任意のホワイトスペース 改行を含む任意のホワイトスペース               : 普通は同上
	/bugs\(\_.\)*bunny                : bunny が後に続く bugs。ファイル中のどこでも。 bugs。ファイル中のどこでも。               : 普通は同上
	:h \_                             : help help               : 普通は同上
	<moge>     <sage> <sage>               : 普通は同上
	" カーソル下のサブルーチン／関数の宣言を検索 カーソル下のサブルーチン／関数の宣言を検索               : 普通は同上
	:nmap gx yiw/^\(sub\<bar>function\)\s\+<C-R>"<CR> yiw/^\(sub\<bar>function\)\s\+<C-R>"<CR>               : 普通は同上
	" 複数ファイルから検索 複数ファイルから検索               : 普通は同上
	:bufdo /searchstr/                : 検索を再開するには :rewind を使う を使う               : 普通は同上
	" 複数ファイルからの検索。ベターだがチート 複数ファイルからの検索。ベターだがチート               : 普通は同上
	:bufdo %s/searchstr/&/gic   : 停止するには n を選択してから a a               : 普通は同上
	" バックスラッシュを使わないで URL を検索する方法 を検索する方法               : 普通は同上
	?http://www.vim.org/        : 後方検索を使う。clever huh! huh!               : 普通は同上
	" 「探さない」ものを指定する（母音） 「探さない」ものを指定する（母音）               : 普通は同上
	/\c\v([^aeiou]&\a){4}       : 連続する4つの子音を検索 連続する4つの子音を検索               : 普通は同上
	----------------------------------------
	----------------------------------------
	" global コマンドの表示 コマンドの表示               : 普通は同上
	:g/gladiolli/#              : g/ の結果を行番号つきで表示(YOU WaNT THIS!) THIS!)               : 普通は同上
	:g/fred.*joe.*dick/         : fred,joe & dick すべてを含む行を表示 すべてを含む行を表示               : 普通は同上
	:g/\<fred\>/                : fred に一致する単語を含む行すべてを表示 に一致する単語を含む行すべてを表示               : 普通は同上
	:g/^\s*$/d                  : 空行をすべて削除 空行をすべて削除               : 普通は同上
	:g!/^dd/d                   : 文字列を含まない行を削除 文字列を含まない行を削除               : 普通は同上
	:v/^dd/d                    : 文字列を含まない行を削除 文字列を含まない行を削除               : 普通は同上
	:g/fred/,/joe/d             : 非行指向(very powerfull) powerfull)               : 普通は同上
	:g/-------/.-10,.d          : 文字列と上の10行を削除 文字列と上の10行を削除               : 普通は同上
	:g/{/ ,/}/- s/\n\+/\r/g     : {...}の中の空行を削除 {...}の中の空行を削除               : 普通は同上
	:v/\S/d                     : 空行を削除 (both types) types)               : 普通は同上
	:v/./,/./-j                 : 空行を圧縮 空行を圧縮               : 普通は同上
	:g/^$/,/./-j                : 空行を圧縮 空行を圧縮               : 普通は同上
	:g/<input\|<form/p          : OR OR               : 普通は同上
	:g/^/put_                   : 全ての行と行の間に空行を挿入(pu = put) "_はブラックホールレジスタ "_はブラックホールレジスタ               : 普通は同上
	:g/^/m0                     : ファイルを反転させる(m = move) move)               : 普通は同上
	:'a,'bg/^/m'b               : a から b のセクションを反転 のセクションを反転               : 普通は同上
	:g/^/t.                     : 各行を重複させる 各行を重複させる               : 普通は同上
	:g/fred/t$                  : fredにマッチする行をEOFにコピー fredにマッチする行をEOFにコピー               : 普通は同上
	:g/stage/t'a                : stageにマッチする行をマークaへコピー stageにマッチする行をマークaへコピー               : 普通は同上
	:g/\(^I[^^I]*\)\{80}/d      : 80個以上のタブを含む行すべてを削除 80個以上のタブを含む行すべてを削除               : 普通は同上
	" 1行おきに置換を行う 1行おきに置換を行う               : 普通は同上
	:g/^/ if line('.')%2|s/^/zz / /               : 普通は同上
	" マーク a と b の間で"somestr"を含む行すべてにマッチ の間で"somestr"を含む行すべてにマッチ               : 普通は同上
	:'a,'bg/somestr/co/otherstr/ : co(py) or mo(ve) mo(ve)               : 普通は同上
	" 同上。ただし置換も行う 同上。ただし置換も行う               : 普通は同上
	:'a,'bg/str1/s/str1/&&&/|mo/str2/
	:%norm jdd                  : 1行置きに削除 1行置きに削除               : 普通は同上
	" 数字をインクリメントする（<c-a>は5文字タイプすること） 数字をインクリメントする（<c-a>は5文字タイプすること）               : 普通は同上
	:.,$g/^\d/exe "norm! \<c-a>": 数字をインクリメント 数字をインクリメント               : 普通は同上
	:'a,'bg/\d\+/norm! ^a       : 数字をインクリメント 数字をインクリメント               : 普通は同上
	" :g の結果を保存する（レジスタ名を大文字にしなければならない）。最初に qaq でレジスタを空にしておくこと。 でレジスタを空にしておくこと。               : 普通は同上
	" 結果をレジスタ／ペーストバッファに保存する 結果をレジスタ／ペーストバッファに保存する               : 普通は同上
	:g/fred/y a                 : fred を含む行すべてをレジスタaに追加する を含む行すべてをレジスタaに追加する               : 普通は同上
	:g/fred/y a | :let @*=@a    : ペーストバッファにコピー ペーストバッファにコピー               : 普通は同上
	:let @a=''|g/Barratt/y a |:let @*=@a @*=@a               : 普通は同上
	" 行をフィルタしてファイルに書き出す（ファイルは既に存在しなければならない） 行をフィルタしてファイルに書き出す（ファイルは既に存在しなければならない）               : 普通は同上
	:'a,'b g/^Error/ . w >> errors.txt errors.txt               : 普通は同上
	" duplicate every line in a file wrap a print '' around each duplicate duplicate               : 普通は同上
	:g/./yank|put|-1s/'/"/g|s/.*/Print '&'/ '&'/               : 普通は同上
	" 文字列をファイルの中身で置換する。-d が MaRK を削除する を削除する               : 普通は同上
	:g/^MaRK$/r tmp.txt | -d -d               : 普通は同上
	" きれいに表示 きれいに表示               : 普通は同上
	:g/<pattern>/z#.5           : コンテキストつきで表示 コンテキストつきで表示               : 普通は同上
	:g/<pattern>/z#.5|echo "=========="  : 美しく表示 美しく表示               : 普通は同上
	" g// とノーマルモードコマンドを組み合わせる とノーマルモードコマンドを組み合わせる               : 普通は同上
	:g/|/norm 2f|r*                      : 2番めの | を * で置き換える で置き換える               : 普通は同上
	" global コマンドの出力を新しいウィンドウに送る コマンドの出力を新しいウィンドウに送る               : 普通は同上
	:nmap <F3>  :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR> a<CR><CR>               : 普通は同上
	----------------------------------------
	" :global と置換を組み合わせる(power editing) editing)               : 普通は同上
	:'a,'bg/fred/s/joe/susan/gic :  can use memory to extend matching matching               : 普通は同上
	:g/fred/,/joe/s/fred/joe/gic :  non-line based (ultra) (ultra)               : 普通は同上
	----------------------------------------
	" joe の検索を始める前に fred を見つける を見つける               : 普通は同上
	:/fred/;/joe/-2,/sid/+3s/sally/alley/gIC
	----------------------------------------
	" ファイル中の各行に対して新しいファイルを作る。1.txt, 2.txt, 3.txt etc etc               : 普通は同上
	:g/^/exe ".w ".line(".").".txt" ".line(".").".txt"               : 普通は同上
	----------------------------------------
	" absolutely essential essential               : 普通は同上
	----------------------------------------
	* # g* g#           : カーソル下の単語を検索 (<cword>) (forwards/backwards) (forwards/backwards)               : 普通は同上
	%                   : 対応括弧に移動 {}[]() {}[]()               : 普通は同上
		.                   : 最後の変更を繰り返す 最後の変更を繰り返す               : 普通は同上
		@:                  : 最後の : コマンドを繰り返す (then @@) @@)               : 普通は同上
		matchit.vim         : % で <tr><td><script> <?php などのタグにマッチさせるプラグイン などのタグにマッチさせるプラグイン               : 普通は同上
		<C-N><C-P>          : インサートモードで単語補完 インサートモードで単語補完               : 普通は同上
		<C-X><C-L>          : 行補完 SUPER USEFUL USEFUL               : 普通は同上
		/<C-R><C-W>         : <cword> を検索／コマンドラインに挿入する を検索／コマンドラインに挿入する               : 普通は同上
		/<C-R><C-a>         : <CWORD> を検索／コマンドラインに挿入する を検索／コマンドラインに挿入する               : 普通は同上
		:set ignorecase     : you nearly always want this this               : 普通は同上
	:syntax on          : Perl,HTML,PHP などで色づけを有効にする などで色づけを有効にする               : 普通は同上
	━━━━━━━━━━━━━ :h regexp<C-D>      : control-D をタイプすると regexp を含むヘルプトピックを全てリスト を含むヘルプトピックを全てリスト               : 普通は同上
		（tabでそのリスト中を巡回）
		----------------------------------------
		" _vimrc の更新、再読み込みを簡単にするマップ の更新、再読み込みを簡単にするマップ               : 普通は同上
		:nmap ,s :source $VIM/_vimrc $VIM/_vimrc               : 普通は同上
	:nmap ,v :e $VIM/_vimrc $VIM/_vimrc               : 普通は同上
	━━━━━━━━━━━━━ ---------------------------------------- ----------------------------------------               : 普通は同上
	"VISUaL MODE (easy to add other HTML Tags) Tags)               : 普通は同上
		:vmap sb "zdi<b><C-R>z</b><ESC>  : 選択したテキストを<b></b> で囲む で囲む               : 普通は同上
		:vmap st "zdi<?= <C-R>z ?><ESC>  : 選択したテキストを <?=   ?> で囲む で囲む               : 普通は同上
		----------------------------------------
		"vim 7 tabs tabs               : 普通は同上
		:tabe fred.php fred.php               : 普通は同上
	:tab ball ball               : 普通は同上
	━━━━━━━━━━━━━ vim -p fred.php joe.php          : ファイルをタブで開く ファイルをタブで開く               : 普通は同上
	" vim 7 forcing use of tabs tabs               : 普通は同上
	nnoremap gf <C-W>gf <C-W>gf               : 普通は同上
	━━━━━━━━━━━━━ cab      e  tabe tabe               : 普通は同上
	----------------------------------------
	" Exploring Exploring               : 普通は同上
	:e .                            : ファイルエクスプローラ ファイルエクスプローラ               : 普通は同上
	:Exp(lore)                      : file explorer note capital Ex Ex               : 普通は同上
	:Sex(plore)                     : ファイルエクスプローラ。ウィンドウ分割 ファイルエクスプローラ。ウィンドウ分割               : 普通は同上
	:browse e                       : ウィンドウズスタイルのファイルを開くダイアログ ウィンドウズスタイルのファイルを開くダイアログ               : 普通は同上
	:ls                             : バッファのリスト バッファのリスト               : 普通は同上
	:cd ..                          : 親ディレクトリへ移動 親ディレクトリへ移動               : 普通は同上
	:args                           : ファイルのリスト ファイルのリスト               : 普通は同上
		:lcd %:p:h                      : 現在のファイルのディレクトリへ移動 現在のファイルのディレクトリへ移動               : 普通は同上
	:autocmd BufEnter * lcd %:p:h   : 自動的に現在のファイルのディレクトリへ移動(_vimrcに書く） 自動的に現在のファイルのディレクトリへ移動(_vimrcに書く）               : 普通は同上
	----------------------------------------
	" バッファエクスプローラ (Top Ten Vim Script) Script)               : 普通は同上
		" bufexplorer.vim が必要 http://www.vim.org/script.php?script_id=42 http://www.vim.org/script.php?script_id=42               : 普通は同上
	\be                             : バッファリスト バッファリスト               : 普通は同上
	\bs                             : バッファエクスプローラ（ウィンドウ分割） バッファエクスプローラ（ウィンドウ分割）               : 普通は同上
	----------------------------------------
		" Changing Case Case               : 普通は同上
	guu                             : 行を小文字に 行を小文字に               : 普通は同上
	gUU                             : 行を大文字に 行を大文字に               : 普通は同上
	Vu                              : 行を小文字に 行を小文字に               : 普通は同上
		VU                              : 行を大文字に 行を大文字に               : 普通は同上
		g~~                             : 大文字小文字を反転 大文字小文字を反転               : 普通は同上
		vEU                             : 単語を大文字に 単語を大文字に               : 普通は同上
	vE~                             : 単語の大文字小文字を反転 単語の大文字小文字を反転               : 普通は同上
	ggguG                           : ファイル全体を小文字に ファイル全体を小文字に               : 普通は同上
	" 選択したテキストをキャピタライズ (map for .vimrc) .vimrc)               : 普通は同上
		vmap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR> :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>               : 普通は同上
	----------------------------------------
		gf                              : カーソル下のファイル名を開く (SUPER) (SUPER)               : 普通は同上
		:nnoremap gF :view <cfile><cr>  : カーソル下のファイル名を開く。なければ作る カーソル下のファイル名を開く。なければ作る               : 普通は同上
	ga                              : カーソルしたの文字の16進アスキー値を表示 カーソルしたの文字の16進アスキー値を表示               : 普通は同上
	ggVGg?                          : ファイル全体を rot13 変換 変換               : 普通は同上
	ggg?G                           : ファイル全体を rot13 変換（大きいファイルに対して速い） 変換（大きいファイルに対して速い）               : 普通は同上
		:8 | normal VGg?                : 8行目から rot13 rot13               : 普通は同上
	:normal 10GVGg?                 : 8行目から rot13 rot13               : 普通は同上
	<C-a>,<C-X>                     : カーソル下の数字をインクリメント、デクリメント カーソル下の数字をインクリメント、デクリメント               : 普通は同上
		win32 users must remap CNTRL-a CNTRL-a               : 普通は同上
		<C-R>=5*5                       : 25 をテキストに挿入 (ミニ計算機） (ミニ計算機）               : 普通は同上
		----------------------------------------
	" Makes all other tips superfluous superfluous               : 普通は同上
	:h 42            : also http://www.google.com/search?q=42 http://www.google.com/search?q=42               : 普通は同上
	:h holy-grail holy-grail               : 普通は同上
		:h!
		----------------------------------------
	" マークと移動 マークと移動               : 普通は同上
	'.               : 最後に変更された行へ移動 (SUPER) (SUPER)               : 普通は同上
	`.               : 最後に変更された行、桁へ移動 最後に変更された行、桁へ移動               : 普通は同上
		g;               : 最近の変更箇所を回る（古いのが最初）(new in vim6.3) vim6.3)               : 普通は同上
	g,               : 逆方向 (new in vim6.3) vim6.3)               : 普通は同上
	:changes
	:h changelist    : help for above above               : 普通は同上
		<C-O>            : ジャンプ履歴を戻る ジャンプ履歴を戻る               : 普通は同上
	<C-I>            : ジャンプ履歴を進む ジャンプ履歴を進む               : 普通は同上
	:ju(mps)         : ジャンプの履歴 ジャンプの履歴               : 普通は同上
	:help jump-motions jump-motions               : 普通は同上
		:history         : あなたが打ったコマンドを表示 あなたが打ったコマンドを表示               : 普通は同上
	:his c           : コマンドライン履歴 コマンドライン履歴               : 普通は同上
	:his s           : 検索履歴 検索履歴               : 普通は同上
	q/               : 検索履歴ウィンドウ (puts you in full edit mode) mode)               : 普通は同上
		q:               : コマンドライン履歴ウィンドウ (puts you in full edit mode) mode)               : 普通は同上
	:<C-F>           : 履歴ウィンドウ 履歴ウィンドウ               : 普通は同上
	----------------------------------------
	" 略語とマップ 略語とマップ               : 普通は同上
		:map   <f7>   :'a,'bw! c:/aaa/x c:/aaa/x               : 普通は同上
	:map   <f8>   :r c:/aaa/x c:/aaa/x               : 普通は同上
	:map   <f11>  :.w! c:/aaa/xr<CR> c:/aaa/xr<CR>               : 普通は同上
	:map   <f12>  :r c:/aaa/xr<CR> c:/aaa/xr<CR>               : 普通は同上
		:ab php          : php で始まる略語を表示 で始まる略語を表示               : 普通は同上
	:map ,           : , で始まるマッピングを表示 で始まるマッピングを表示               : 普通は同上
	" F10 をマッピングに使えるようにする (win32) (win32)               : 普通は同上
	set wak=no       : :h winaltkeys winaltkeys               : 普通は同上
		" For use in Maps Maps               : 普通は同上
	<CR>             : リターン リターン               : 普通は同上
	<ESC>            : エスケープ エスケープ               : 普通は同上
	<LEaDER>         : 通常は \ \               : 普通は同上
		<BaR>            : | パイプ記号 パイプ記号               : 普通は同上
	<BaCKSPaCE>      : バックスペース バックスペース               : 普通は同上
	<SILENT>         : シェルウィンドウを出さない シェルウィンドウを出さない               : 普通は同上
	#display RGB colour under the cursor eg #445588 #445588               : 普通は同上
		:nmap <leader>c :hi Normal guibg=#<c-r>=expand("<cword>")<cr><cr> guibg=#<c-r>=expand("<cword>")<cr><cr>               : 普通は同上
	map <f2> /price only\\|versus/ :バックスラッシュが必要 :バックスラッシュが必要               : 普通は同上
	----------------------------------------
	" Simple PHP debugging display all variables yanked into register a a               : 普通は同上
		iab phpdb exit("<hr>Debug <C-R>a  "); ");               : 普通は同上
	----------------------------------------
	" レジスタをマップとして使う（.vimrc 中に書いておくと起動時に設定される） 中に書いておくと起動時に設定される）               : 普通は同上
	:let @m=":'a,'bs/" @m=":'a,'bs/"               : 普通は同上
		:let @s=":%!sort -u" -u"               : 普通は同上
	----------------------------------------
	" レジスタの中身を表示する レジスタの中身を表示する               : 普通は同上
	:reg             : 全レジスタの中身を表示 全レジスタの中身を表示               : 普通は同上
	:reg a           : 個個のレジスタの中身を表示 個個のレジスタの中身を表示               : 普通は同上
	"1p....          : 数字つきレジスタ("1, "2, "3, ...)を順番に引き出す ...)を順番に引き出す               : 普通は同上
	:let @y='yy@"'   : レジスタの pre-loading (.vimrcに書く) (.vimrcに書く)               : 普通は同上
	qqq              : レジスタqを空にする レジスタqを空にする               : 普通は同上
	----------------------------------------
	" 便利なトリック 便利なトリック               : 普通は同上
	"ayy@a           : テキストファイル中の vim コマンドを実行 コマンドを実行               : 普通は同上
	yy@"             : 同上（無名レジスタを使う） 同上（無名レジスタを使う）               : 普通は同上
	u@.              : たった今入力したテキストを実行 たった今入力したテキストを実行               : 普通は同上
	----------------------------------------
	" 他のコマンドの出力を取得する（外部プログラムが必要） 他のコマンドの出力を取得する（外部プログラムが必要）               : 普通は同上
	:r!ls.exe        : ls の出力を読む の出力を読む               : 普通は同上
	!!date           : 同上（しかし現在行を出力で置き換える） 同上（しかし現在行を出力で置き換える）               : 普通は同上
	" 外部コマンドの sort でソート でソート               : 普通は同上
	:%!sort -u       : 外部プログラムを使ってバッファをフィルタリング 外部プログラムを使ってバッファをフィルタリング               : 普通は同上
	:'a,'b!sort -u   : 外部プログラムを使ってバッファをフィルタリング 外部プログラムを使ってバッファをフィルタリング               : 普通は同上
	!1} sort -u      : パラグラフをソート(ノーマルモードに注意！) パラグラフをソート(ノーマルモードに注意！)               : 普通は同上
	:g/^$/;,/^$/-1!sort : 各ブロックをソート (note the crucial ;) ;)               : 普通は同上
	----------------------------------------
	" 複数ファイルの管理 (Essential) (Essential)               : 普通は同上
	:bn              : 次のバッファへ 次のバッファへ               : 普通は同上
	:bp              : 前のバッファへ 前のバッファへ               : 普通は同上
	:wn              : ファイルを保存し次へ(super) ファイルを保存し次へ(super)               : 普通は同上
	:wp              : ファイルを保存し前へ ファイルを保存し前へ               : 普通は同上
	:bd              : ファイルをバッファリストから削除 (super) (super)               : 普通は同上
	:bun             : バッファをアンロード（ウィンドウを消すがバッファリストからは消さない） バッファをアンロード（ウィンドウを消すがバッファリストからは消さない）               : 普通は同上
	:badd file.c     : バッファリストにファイルを追加 バッファリストにファイルを追加               : 普通は同上
	:b 3             : バッファ3へ バッファ3へ               : 普通は同上
	:b main          : 名前に main (例. main.c)を含むバッファを開く。(ultra) main.c)を含むバッファを開く。(ultra)               : 普通は同上
	:sav php.html    : カレントファイルを php.html に保存して php.html を開く を開く               : 普通は同上
	:sav! %<.bak     : カレントファイルの拡張子を変えて保存 （古い方法） （古い方法）               : 普通は同上
	:sav! %:r.cfm    : カレントファイルの拡張子を変えて保存 カレントファイルの拡張子を変えて保存               : 普通は同上
	:sav %:s/fred/joe/           : ファイル名の一部を置換する ファイル名の一部を置換する               : 普通は同上
	:sav %:s/fred/joe/:r.bak2    : ファイル名と拡張子の一部を置換する ファイル名と拡張子の一部を置換する               : 普通は同上
	:!mv % %:r.bak   : rename current file (DOS use Rename or DEL) DEL)               : 普通は同上
	:e!              : 修正されていない状態に戻す 修正されていない状態に戻す               : 普通は同上
	:w c:/aaa/%      : ファイルを他の場所に保存する ファイルを他の場所に保存する               : 普通は同上
	:e #             : 代替ファイルを編集する (C-^ でも同じ) でも同じ)               : 普通は同上
	:rew             : 編集ファイルリストの最初に戻る (:args) (:args)               : 普通は同上
	:brew            : buffer rewind rewind               : 普通は同上
	:sp fred.txt     : ウィンドウを分割して fred.txt を開く を開く               : 普通は同上
	:sball,:sb       : 全てのバッファを分割する (super) (super)               : 普通は同上
	:scrollbind      : これを分割した各ウィンドウ中で実行する これを分割した各ウィンドウ中で実行する               : 普通は同上
	:map   <F5> :ls<CR>:e # : F5 を押すと全バッファリストを表示するので番号をタイプするだけ を押すと全バッファリストを表示するので番号をタイプするだけ               : 普通は同上
	:set hidden      : カレントバッファを保存せずに他のバッファに移動できるようになる カレントバッファを保存せずに他のバッファに移動できるようになる               : 普通は同上
	----------------------------------------
	" 分割ウィンドウ間ですばやい移動 分割ウィンドウ間ですばやい移動               : 普通は同上
	map <C-J> <C-W>j<C-W>_ <C-W>j<C-W>_               : 普通は同上
	map <C-K> <C-W>k<C-W>_ <C-W>k<C-W>_               : 普通は同上
	----------------------------------------
	" レコーディング(BEST TIPS of aLL) aLL)               : 普通は同上
	qq  # record to q q               : 普通は同上
	your complex series of commands commands               : 普通は同上
	q   # end recording recording               : 普通は同上
	@q to execute execute               : 普通は同上
	@@ to Repeat Repeat               : 普通は同上
	5@@ to Repeat 5 times times               : 普通は同上
	" レジスタ／レコーディングを編集する レジスタ／レコーディングを編集する               : 普通は同上
	"qp                               :レジスタqの中身を表示する (ノーマルモード ) )               : 普通は同上
	<ctrl-R>q                         :レジスタqの中身を表示する (インサートモード ) )               : 普通は同上
	" キーレコーディングの中身を見ることができる。必要なら編集もできる キーレコーディングの中身を見ることができる。必要なら編集もできる               : 普通は同上
	"qdd                              :put changed contacts back into q q               : 普通は同上
	@q                                :レジスタqの中身を実行する :レジスタqの中身を実行する               : 普通は同上
	" 矩形範囲に対してレコーディングを実行する 矩形範囲に対してレコーディングを実行する               : 普通は同上
	1) define recording/register recording/register               : 普通は同上
	qq:s/ to/ from/g^Mq from/g^Mq               : 普通は同上
	2) Define Visual BLOCK BLOCK               : 普通は同上
	V}
	3) hit : and the following appears appears               : 普通は同上
	:'<,'>
	4)Complete as follows follows               : 普通は同上
	:'<,'>norm @q @q               : 普通は同上
	----------------------------------------
	" レコーディングとマップを組み合わせる(to end up in command mode) mode)               : 普通は同上
	nnoremap ] @q:w!<bar>bd @q:w!<bar>bd               : 普通は同上
	----------------------------------------
	" ヴィジュアルモードは新しく通常もっとも直感的な編集モード ヴィジュアルモードは新しく通常もっとも直感的な編集モード               : 普通は同上
	" ヴィジュアルモード基礎 ヴィジュアルモード基礎               : 普通は同上
	v                               : ヴィジュアルモードに入る ヴィジュアルモードに入る               : 普通は同上
	V                               : ヴィジュアルモード行全体 ヴィジュアルモード行全体               : 普通は同上
	<C-V>                           : ヴィジュアルブロックモードに入る ヴィジュアルブロックモードに入る               : 普通は同上
	gv                              : 最後の選択範囲を再選択 (ultra) (ultra)               : 普通は同上
	o                               : navigate visual area area               : 普通は同上
	"*y                             : 選択範囲をペーストバッファにヤンク 選択範囲をペーストバッファにヤンク               : 普通は同上
	V%                              : 対応するところまで選択 対応するところまで選択               : 普通は同上
	V}J                             : 選択範囲を連結(great) 選択範囲を連結(great)               : 普通は同上
	V}gJ                            : 選択範囲を連結。スペースをはさまずに 選択範囲を連結。スペースをはさまずに               : 普通は同上
	----------------------------------------
	" 以下10行の最初の2文字を削除する 以下10行の最初の2文字を削除する               : 普通は同上
	0<c-v>10j2ld
	----------------------------------------
	" 矩形選択を使って列をコピーする 矩形選択を使って列をコピーする               : 普通は同上
	" <C-V> それから移動コマンドを使って列を選択し、c,d,y,r など など               : 普通は同上
	then c,d,y,r etc etc               : 普通は同上
	----------------------------------------
	" 矩形選択範囲のテキストを別のブロックで上書きする方法 矩形選択範囲のテキストを別のブロックで上書きする方法               : 普通は同上
	最初のブロックを拾う: ctrl-v 移動 "ay "ay               : 普通は同上
	2番めのブロックを拾う: ctrl-v 移動 c ctrl-o "aP <esc> <esc>               : 普通は同上
	----------------------------------------
	" _vimrc essentials essentials               : 普通は同上
	:set incsearch : タイプする度に単語を検索してジャンプする(annoying a excellent) excellent)               : 普通は同上
	:set wildignore=*.o,*.obj,*.bak,*.exe : タブ補完がこれらを無視するようになる タブ補完がこれらを無視するようになる               : 普通は同上
	:set shiftwidth=3                     : シフト／タブに関係する シフト／タブに関係する               : 普通は同上
	:set vb t_vb=".                       : 静かにさせる（ビープを止める） 静かにさせる（ビープを止める）               : 普通は同上
	:set browsedir=buffer                 : GUI の「ファイルを開く」ダイアログでカレントバッファ の「ファイルを開く」ダイアログでカレントバッファ               : 普通は同上
		のディレクトリをカレントディレクトリにさせる。
	----------------------------------------
	" Windows インターネットエクスプローラを起動する インターネットエクスプローラを起動する               : 普通は同上
	:nmap ,f :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p<CR> file://%:p<CR>               : 普通は同上
	:nmap ,i :update<CR>: !start c:\progra~1\intern~1\iexplore.exe <cWORD><CR> <cWORD><CR>               : 普通は同上
	----------------------------------------
	" FTPing from VIM VIM               : 普通は同上
	cmap ,r  :Nread ftp://209.51.134.122/public_html/index.html ftp://209.51.134.122/public_html/index.html               : 普通は同上
	cmap ,w  :Nwrite ftp://209.51.134.122/public_html/index.html ftp://209.51.134.122/public_html/index.html               : 普通は同上
	gvim ftp://www.somedomain.com/index.html # uses netrw.vim netrw.vim               : 普通は同上
	----------------------------------------
	" レジスタに追加する (大文字にする) (大文字にする)               : 普通は同上
	" 5行を "a" にヤンクし、さらに5行追加する にヤンクし、さらに5行追加する               : 普通は同上
	"a5yy
	10j
	"a5yy
	----------------------------------------
	[I     : カーソル下の単語 <cword> にマッチする行を一覧表示 (super) (super)               : 普通は同上
	----------------------------------------
	" 昔ながらのシフト／インデント 昔ながらのシフト／インデント               : 普通は同上
	:'a,'b>>
	" 選択してシフト (選択範囲が解除されないのでそのまま繰り返せる) (選択範囲が解除されないのでそのまま繰り返せる)               : 普通は同上
	:vnoremap < <gv <gv               : 普通は同上
	:vnoremap > >gv >gv               : 普通は同上
	" ブロックをシフトする (magic) (magic)               : 普通は同上
	>i{
	>a{
	" または または               : 普通は同上
	>% and <% <%               : 普通は同上
	----------------------------------------
	" リダイレクトとペーストレジスタ * *               : 普通は同上
	:redir @*                    : コマンドの出力をペーストバッファにリダイレクト コマンドの出力をペーストバッファにリダイレクト               : 普通は同上
	:redir END                   : リダイレクト終了 リダイレクト終了               : 普通は同上
	:redir >> out.txt            : ファイルへリダイレクト ファイルへリダイレクト               : 普通は同上
	" ペーストバッファを使う ペーストバッファを使う               : 普通は同上
	"*yy                         : ペーストバッファにヤンク ペーストバッファにヤンク               : 普通は同上
	"*p                          : ペーストバッファから貼り付け ペーストバッファから貼り付け               : 普通は同上
	" ペーストバッファにヤンク ペーストバッファにヤンク               : 普通は同上
	:'a,'by*                     : 範囲をヤンク 範囲をヤンク               : 普通は同上
	:%y*                         : バッファ全体をヤンク バッファ全体をヤンク               : 普通は同上
	:.y*                         : 現在行をヤンク 現在行をヤンク               : 普通は同上
	" 印字不能文字をフィルタする 印字不能文字をフィルタする               : 普通は同上
	" gui アプリから貼りつけたときに便利 アプリから貼りつけたときに便利               : 普通は同上
	:nmap <leader>p :let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p substitute(@*,'[^[:print:]]','','g')<cr>"*p               : 普通は同上
	----------------------------------------
	" テキストの整形 テキストの整形               : 普通は同上
	gq}                          : パラグラフを整形する パラグラフを整形する               : 普通は同上
	gqap                         : パラグラフを整形する パラグラフを整形する               : 普通は同上
	ggVGgq                       : ファイル全体を整形 ファイル全体を整形               : 普通は同上
	Vgq                          : 現在行 現在行               : 普通は同上
	" 70 文字目で改行を挿入する。できるなら ; の後で の後で               : 普通は同上
	:s/.\{,69\};\s*\|.\{,69\}\s\+/&\r/g
	----------------------------------------
	" コマンドを複数ファイルに対して実行 コマンドを複数ファイルに対して実行               : 普通は同上
	:argdo %s/foo/bar/e          : :args のすべてのファイルに対して実行 のすべてのファイルに対して実行               : 普通は同上
	:bufdo %s/foo/bar/e %s/foo/bar/e               : 普通は同上
	:windo %s/foo/bar/e %s/foo/bar/e               : 普通は同上
	:argdo exe '%!sort'|w!       : 外部コマンドを含む例 外部コマンドを含む例               : 普通は同上
	----------------------------------------
	" コマンドラインのトリック コマンドラインのトリック               : 普通は同上
	gvim -h                    : help help               : 普通は同上
	ls | gvim -                : ストリームを編集する！ ストリームを編集する！               : 普通は同上
	cat xx | gvim - -c "v/^\d\d\|^[3-9]/d " : ストリームをフィルタする ストリームをフィルタする               : 普通は同上
	gvim -o file1 file2        : 分割して開く 分割して開く               : 普通は同上
	" ファイルを開いた後でコマンドを実行する ファイルを開いた後でコマンドを実行する               : 普通は同上
	gvim.exe -c "/main" joe.c  : Open joe.c & jump to "main" "main"               : 普通は同上
	" 1つのファイルに複数のコマンドを実行する 1つのファイルに複数のコマンドを実行する               : 普通は同上
	vim -c "%s/aBC/DEF/ge | update" file1.c file1.c               : 普通は同上
	" 複数ファイルに複数コマンドを実行する 複数ファイルに複数コマンドを実行する               : 普通は同上
	vim -c "argdo %s/aBC/DEF/ge | update" *.c *.c               : 普通は同上
	" 複数ファイルからテキストのブロックを削除 複数ファイルからテキストのブロックを削除               : 普通は同上
	vim -c "argdo /begin/+1,/end/-1g/^/d | update" *.c *.c               : 普通は同上
	" ファイルの編集を自動化する（convert.vim中のExコマンド） ファイルの編集を自動化する（convert.vim中のExコマンド）               : 普通は同上
	vim -s "convert.vim" file.c file.c               : 普通は同上
	#.vimrcとプラグインを読まずにVIMを起動する(clean VIM) VIM)               : 普通は同上
	gvim -u NONE -U NONE -N -N               : 普通は同上
	" access paste buffer contents (put in a script/batch file) file)               : 普通は同上
	" ペーストバッファの中身にアクセス（スクリプトかバッチファイルに書く） ペーストバッファの中身にアクセス（スクリプトかバッチファイルに書く）               : 普通は同上
	gvim -c 'normal ggdG"*p' c:/aaa/xp c:/aaa/xp               : 普通は同上
	" ペーストバッファの中身をデフォルトのプリンタに出力 ペーストバッファの中身をデフォルトのプリンタに出力               : 普通は同上
	gvim -c 's/^/\=@*/|hardcopy!|q!' 's/^/\=@*/|hardcopy!|q!'               : 普通は同上
	" gvim の外部grepの使い道(Win32 or *nix) *nix)               : 普通は同上
	:grep somestring *.php     : creates a list of all matching files files               : 普通は同上
	" リストを進む・戻るには :cn(ext) :cp(rev) :cp(rev)               : 普通は同上
	:h grep grep               : 普通は同上
	----------------------------------------
	" diff 機能 (Brilliant) (Brilliant)               : 普通は同上
	*  dp                         : カーソル下の差分を他方のファイルに "put" する する               : 普通は同上
	*  do                         : カーソル下の差分を他方のファイルから "get" する する               : 普通は同上
		----------------------------------------
		" Vim のトラップ のトラップ               : 普通は同上
		正規表現 バックスラッシュが必要 \+ （1個以上） （1個以上）               : 普通は同上
		正規表現 バックスラッシュが必要 \| （or） （or）               : 普通は同上
		正規表現 バックスラッシュが必要 \( （グループ化） （グループ化）               : 普通は同上
		正規表現 バックスラッシュが必要 \{ （繰り返し） （繰り返し）               : 普通は同上
		/fred\+/                   : fredまたはfreddyにマッチ。しかしfreeにはマッチしない fredまたはfreddyにマッチ。しかしfreeにはマッチしない               : 普通は同上
		/\(fred\)\{2,3}/           : note what you have to break break               : 普通は同上
		----------------------------------------
		" \v または very magic (usually) を使うとバックスラッシュの数を減らせる を使うとバックスラッシュの数を減らせる               : 普通は同上
		/codes\(\n\|\s\)*where  : 通常の正規表現 通常の正規表現               : 普通は同上
	*  /\vcodes(\n|\s)*where   : very magic magic               : 普通は同上
		----------------------------------------
		" オブジェクトをコマンド／検索ラインにひっぱり出す (SUPER) (SUPER)               : 普通は同上
	*  <C-R><C-W> : カーソル下の word をコマンドラインや検索にひっぱり出す をコマンドラインや検索にひっぱり出す               : 普通は同上
		<C-R><C-a> : カーソル下の WORD をコマンドラインや検索にひっぱり出す をコマンドラインや検索にひっぱり出す               : 普通は同上
		<C-R>-                  : スモールレジスタの中身を挿入 (also insert mode) mode)               : 普通は同上
		<C-R>[0-9a-z]           : 名前付きレジスタの中身を挿入 (also insert mode) mode)               : 普通は同上
		<C-R>%                  : ファイル名を挿入 (# も可) (also insert mode) mode)               : 普通は同上
		<C-R>=somevar           : 変数の値を挿入 (例 :let sray="ray[0-9]") sray="ray[0-9]")               : 普通は同上
		----------------------------------------
		" レジスタ操作 レジスタ操作               : 普通は同上
		:let @a=@_              : レジスタaをクリア レジスタaをクリア               : 普通は同上
		:let @a=""              : レジスタaをクリア レジスタaをクリア               : 普通は同上
		:let @*=@a              : レジスタaをペーストバッファにコピー レジスタaをペーストバッファにコピー               : 普通は同上
		:let @*=@:              : 最後のコマンドをペーストバッファにコピー 最後のコマンドをペーストバッファにコピー               : 普通は同上
		:let @*=@/              : 最後の検索語をペーストバッファにコピー 最後の検索語をペーストバッファにコピー               : 普通は同上
		:let @*=@%              : 現在のファイル名をペーストバッファにコピー 現在のファイル名をペーストバッファにコピー               : 普通は同上
		----------------------------------------
		" help for help (USE TaB) TaB)               : 普通は同上
		:h quickref             : VIM クイックリファレンスシート (ultra) (ultra)               : 普通は同上
		:h tips                 : Vim 自身の tips help help               : 普通は同上
	*  :h visual<C-D><tab>     : visual に関するヘルプを全部リストする に関するヘルプを全部リストする               : 普通は同上
		: その後 tab でそれらを1個1個回っていける でそれらを1個1個回っていける               : 普通は同上
	*  :h ctrl<C-D>            : コントロールキーのヘルプを全部リストする コントロールキーのヘルプを全部リストする               : 普通は同上
	*  :helpg uganda           : grep HELP Files use :cn, :cp to find next next               : 普通は同上
	*  :helpgrep edit.*director: 正規表現を使ってヘルプを検索 正規表現を使ってヘルプを検索               : 普通は同上
	*  :h :r                   : :ex コマンドのヘルプ コマンドのヘルプ               : 普通は同上
		:h CTRL-R               : ノーマルモード ノーマルモード               : 普通は同上
		:h /\r                  : 正規表現中で \r は何を意味するか(<CR>にマッチする) は何を意味するか(<CR>にマッチする)               : 普通は同上
		:h \\zs                 : ヘルプで \zs を見つけるにはバックスラッシュを2個にする を見つけるにはバックスラッシュを2個にする               : 普通は同上
		:h i_CTRL-R             : インサートモードでの<C-R>のヘルプ インサートモードでの<C-R>のヘルプ               : 普通は同上
		:h c_CTRL-R             : コマンドモードでの<C-R>のヘルプ コマンドモードでの<C-R>のヘルプ               : 普通は同上
		:h v_CTRL-V             : ヴィジュアルモード ヴィジュアルモード               : 普通は同上
		:h tutor                : VIM チュートリアル チュートリアル               : 普通は同上
		<C-[>, <C-T>            : ヘルプの履歴を前後に移動 ヘルプの履歴を前後に移動               : 普通は同上
		gvim -h                 : VIM コマンドラインヘルプ コマンドラインヘルプ               : 普通は同上
		----------------------------------------
		" このオプションはどこで :set されたのか されたのか               : 普通は同上
		:scriptnames            : 読み込まれたプラグイン, _vimrc らを全て表示(super) らを全て表示(super)               : 普通は同上
		:verbose set history?   : history の値とどこで設定されたかを表示 の値とどこで設定されたかを表示               : 普通は同上
		:function               : 関数をリストする 関数をリストする               : 普通は同上
		:func SearchCompl       : 特定の関数をリストする 特定の関数をリストする               : 普通は同上
		----------------------------------------
		" 独自の vim help を作る を作る               : 普通は同上
		:helptags /vim/vim64/doc  : rebuild all *.txt help files in /doc /doc               : 普通は同上
		:help add-local-help add-local-help               : 普通は同上
		----------------------------------------
		" ファイルに外部プログラムをかける(例 php) php)               : 普通は同上
		map   <f9>   :w<CR>:!c:/php/php.exe %<CR> %<CR>               : 普通は同上
		map   <f2>   :w<CR>:!perl -c %<CR> %<CR>               : 普通は同上
		----------------------------------------
		" 現在のスクリプトの出力を別のバッファに出力する 現在のスクリプトの出力を別のバッファに出力する               : 普通は同上
		:new | r!perl #                   : 新しいバッファを開き、それまでいたバッファの実行結果を読み込む 新しいバッファを開き、それまでいたバッファの実行結果を読み込む               : 普通は同上
		:new! x.out | r!perl #            : 上と同様。名前付きのファイル。 上と同様。名前付きのファイル。               : 普通は同上
		:new+read!ls
		----------------------------------------
		" 新規バッファを作り、その中にレジスタqをペーストし、新バッファをソートする 新規バッファを作り、その中にレジスタqをペーストし、新バッファをソートする               : 普通は同上
		:new +put q|%!sort q|%!sort               : 普通は同上
		----------------------------------------
		" 特定のファイルやファイルタイプに対してアクションを引き起こす 特定のファイルやファイルタイプに対してアクションを引き起こす               : 普通は同上
		autocmd VimEnter c:/intranet/note011.txt normal! ggVGg? ggVGg?               : 普通は同上
		autocmd FileType *.pl exec('set fileformats=unix') fileformats=unix')               : 普通は同上
		----------------------------------------
		" 最後のコマンドラインコマンドをテキストに挿入する 最後のコマンドラインコマンドをテキストに挿入する               : 普通は同上
	*  i<c-r>: i<c-r>:               : 普通は同上
		" 最後の検索語をテキストに挿入する 最後の検索語をテキストに挿入する               : 普通は同上
		i<c-r>/
		----------------------------------------
		" さらなる補完 さらなる補完               : 普通は同上
		<C-X><C-F>                        :カレントディレクトリのファイル名を挿入 :カレントディレクトリのファイル名を挿入               : 普通は同上
			----------------------------------------
			" 選択範囲内で置換 選択範囲内で置換               : 普通は同上
			" 普通に選択して(:h visual) :s/Emacs/Vim/ などとタイプする などとタイプする               : 普通は同上
			:'<,'>s/Emacs/Vim/g               : '<.'> はタイプする必要ない はタイプする必要ない               : 普通は同上
			gv                                : 前に選択した範囲を再選択 (ULTRa) (ULTRa)               : 普通は同上
			----------------------------------------
			#numbering lines VIM way way               : 普通は同上
			:set number                       : 行番号を表示 行番号を表示               : 普通は同上
	*   :map <F12> :set number!<CR>       : 行番号を表示（トグル） 行番号を表示（トグル）               : 普通は同上
		:%s/^/\=strpart(line('.')."        ",0,&ts) ",0,&ts)               : 普通は同上
			━━━━━━━━━━━━━━ 任意の数字から始めて行を番号づける（PC上では Perl が必要） が必要）               : 普通は同上
		:'a,'b!perl -pne 'BEGIN{$a=223} substr($_,2,0)=$a++' substr($_,2,0)=$a++'               : 普通は同上
			#数字のリストを生成
			#Type in number on line say 223 in an empty file file               : 普通は同上
			qqmnYP`n^aq                       : q にレコードするので @q で繰り返す で繰り返す               : 普通は同上
			" ファイルの最後まで、すでにある数字をインクリメント(type <c-a> as 5 characters) characters)               : 普通は同上
			:.,$g/^\d/exe "normal! \<c-a>" \<c-a>"               : 普通は同上
		" 高度なインクリメンティング 高度なインクリメンティング               : 普通は同上
			━━━━━━━━━━━━━━ http://vim.sourceforge.net/tip_view.php?tip_id=150 http://vim.sourceforge.net/tip_view.php?tip_id=150               : 普通は同上
		----------------------------------------
		" 高度なインクリメンティング (really useful) useful)               : 普通は同上
			━━━━━━━━━━━━━━ " 以下を _vimrc に書く に書く               : 普通は同上
		let g:I=0 g:I=0               : 普通は同上
		function! INC(increment) INC(increment)               : 普通は同上
		let g:I =g:I + a:increment a:increment               : 普通は同上
		return g:I g:I               : 普通は同上
		endfunction
		" 例）マークa,bの間に223から始まり5ずつ増えるリストを作成 例）マークa,bの間に223から始まり5ずつ増えるリストを作成               : 普通は同上
		:let I=223 I=223               : 普通は同上
		:'a,'bs/^/\=INC(5)/
		" create a map for INC INC               : 普通は同上
			cab viminc :let I=223 \| 'a,'bs/$/\=INC(5)/ 'a,'bs/$/\=INC(5)/               : 普通は同上
		----------------------------------------
		" 23から64までの数字を挿入する 23から64までの数字を挿入する               : 普通は同上
		o23<ESC>qqYp<C-a>q40@q
			----------------------------------------
		" 現在のインサートモード内での編集／移動 (Really useful) useful)               : 普通は同上
		<C-U>                             : 挿入したテキストをすべて削除 挿入したテキストをすべて削除               : 普通は同上
		<C-W>                             : 最後の単語を削除 最後の単語を削除               : 普通は同上
			<HOME><END>                       : 行頭／行末 行頭／行末               : 普通は同上
		<C-LEFTaRROW><C-RIGHTaRROW>       : 単語移動 単語移動               : 普通は同上
		<C-X><C-E>,<C-X><C-Y>             : インサートモードを抜けずにスクロール インサートモードを抜けずにスクロール               : 普通は同上
		----------------------------------------
			#暗号化 (使うときは鍵を忘れないように） (使うときは鍵を忘れないように）               : 普通は同上
			:X                                : 鍵の入力を促される 鍵の入力を促される               : 普通は同上
			:h :X :X               : 普通は同上
		----------------------------------------
		" モードライン（ファイルを読み込み専用にするなど）は最初/最後の5行以内に無ければならない モードライン（ファイルを読み込み専用にするなど）は最初/最後の5行以内に無ければならない               : 普通は同上
		// vim:noai:ts=2:sw=4:readonly: vim:noai:ts=2:sw=4:readonly:               : 普通は同上
			" vim:ft=html:                    : HTML 構文強調を使うように指示 構文強調を使うように指示               : 普通は同上
		:h modeline modeline               : 普通は同上
		----------------------------------------
		" 独自の GUI ツールバーのエントリを作る ツールバーのエントリを作る               : 普通は同上
			amenu  Modeline.Insert\ a\ VIM\ modeline <Esc><Esc>ggOvim:ff=unix ts=4 ss=4<CR>vim60:fdm=marker<esc>gg ss=4<CR>vim60:fdm=marker<esc>gg               : 普通は同上
			----------------------------------------
		" カーソル下の単語をファイルに保存する関数 カーソル下の単語をファイルに保存する関数               : 普通は同上
		function! SaveWord() SaveWord()               : 普通は同上
			normal yiw yiw               : 普通は同上
			exe ':!echo '.@0.' >> word.txt' word.txt'               : 普通は同上
		endfunction
		map ,p :call SaveWord() SaveWord()               : 普通は同上
		----------------------------------------
			" 重複する行を削除する関数 重複する行を削除する関数               : 普通は同上
			function! Del() Del()               : 普通は同上
			if getline(".") == getline(line(".") - 1) 1)               : 普通は同上
				norm dd dd               : 普通は同上
			endif
			endfunction
		:g/^/ call Del() Del()               : 普通は同上
		----------------------------------------
		" 合字 (非アルファベット・数字） (非アルファベット・数字）               : 普通は同上
			:digraphs                         : display table table               : 普通は同上
		:h dig                            : help help               : 普通は同上
		i<C-K>e'                          : enters enters               : 普通は同上
		i<C-V>233                         : enters   (Unix) (Unix)               : 普通は同上
			i<C-Q>233                         : enters   (Win32) (Win32)               : 普通は同上
		ga                                : View hex value of any character character               : 普通は同上
		" all file completions grouped (for example main_c.c) main_c.c)               : 普通は同上
			:e main_<tab>                     : タブ補完 タブ補完               : 普通は同上
		gf                                : カーソル下のファイル名を開く  (normal) (normal)               : 普通は同上
		main_<C-X><C-F>                   : ファイル名を挿入 (insert mode) mode)               : 普通は同上
		----------------------------------------
			" Complex Vim Vim               : 普通は同上
		" テキストファイルを html に変換する に変換する               : 普通は同上
	*  :runtime! syntax/2html.vim        : txt を html に変換する に変換する               : 普通は同上
		:h 2html 2html               : 普通は同上
		----------------------------------------
		" vim 内部から grep。（vim7からはvimに組み込みのgrepもある。:h vimgrep） vimgrep）               : 普通は同上
		:grep some_keyword *.c            : some_keyword を含む .c ファイルのリストを得る ファイルのリストを得る               : 普通は同上
			:cn                               : 次のヒット場所にジャンプ 次のヒット場所にジャンプ               : 普通は同上
		----------------------------------------
		" 拡張子が .pl でないファイルの色づけを強制的に Perl のものにする のものにする               : 普通は同上
		:set syntax=perl syntax=perl               : 普通は同上
			" 色づけをやめる (useful for all sorts of reasons) reasons)               : 普通は同上
		:set syntax off off               : 普通は同上
		" カラースキームを変更 (any file in ~vim/vim??/colors) ~vim/vim??/colors)               : 普通は同上
		:colorscheme blue blue               : 普通は同上
			" モードラインによって html の色づけをさせる の色づけをさせる               : 普通は同上
				今回はすでに用意されているカラースキーマを利用することにします。 カラースキーマの場所 カラースキーマの場所               : 普通は同上
				~/vimfiles/colors
				ホームディレクトリにvimfilesディレクトリがない場合は作成します。
				mkdir vimfiles ;mkdir vimfiles/colors vimfiles/colors               : 普通は同上
				ウェブで配布されているものもしくは、/usr/share/vim/vim71/colorsにあるカラースキーマを ~/vimfiles/colors内にコピーします。 ~/vimfiles/colors内にコピーします。               : 普通は同上
				今回は、巷で人気のzenburnを設定します。
					(ubuntu-example)
					you@ecolnux:~/vimfiles/colors$ ls /usr/share/vim/vim71/colors/ /usr/share/vim/vim71/colors/               : 普通は同上
					REaDME.txt  darkblue.vim  delek.vim   elflord.vim  koehler.vim  murphy.vim  peachpuff.vim  shine.vim  torte.vim torte.vim               : 普通は同上
					blue.vim    default.vim   desert.vim  evening.vim  morning.vim  pablo.vim   ron.vim        slate.vim  zellner.vim zellner.vim               : 普通は同上
					cd ~/vimfiles/colors/ ~/vimfiles/colors/               : 普通は同上
					wget http://slinky.imukuppi.org/zenburn/zenburn.vim http://slinky.imukuppi.org/zenburn/zenburn.vim               : 普通は同上
				ファイルを配置したらvimの設定ファイルを開きます。 設定ファイルの一番下に以下を追加します。 設定ファイルの一番下に以下を追加します。               : 普通は同上
				gvim ~/.vimrc ~/.vimrc               : 普通は同上
				colorscheme zenburn zenburn               : 普通は同上
		# vim:ft=html: vim:ft=html:               : 普通は同上
		" 自動的に色づけを強制する (非標準の拡張子をもつファイルのために） (非標準の拡張子をもつファイルのために）               : 普通は同上
		au BufRead,BufNewFile */Content.IE?/* setfiletype html html               : 普通は同上
		----------------------------------------
		:set noma (non modifiable)        : ファイルの変更を阻止する ファイルの変更を阻止する               : 普通は同上
		:set ro (Read Only)               : 意図しないファイルの書き込みを阻止する 意図しないファイルの書き込みを阻止する               : 普通は同上
		----------------------------------------
		" セッション（ファイルのセットを開く） セッション（ファイルのセットを開く）               : 普通は同上
		gvim file1.c file2.c lib/lib.h lib/lib2.h : 「セッション」用のファイルを読み込む 「セッション」用のファイルを読み込む               : 普通は同上
		:mksession                        : Session ファイルを作成 (デフォルトでは Session.vim) Session.vim)               : 普通は同上
		:q
		gvim -S Session.vim               : すべてのファイルを読み直す すべてのファイルを読み直す               : 普通は同上
		----------------------------------------
		#tags (サブルーチン／関数へジャンプ） (サブルーチン／関数へジャンプ）               : 普通は同上
		taglist.vim                       : 人気の高いプラグイン 人気の高いプラグイン               : 普通は同上
		:Tlist                            : タグを表示（関数のリスト） タグを表示（関数のリスト）               : 普通は同上
		<C-]>                             : カーソル下の関数へジャンプ カーソル下の関数へジャンプ               : 普通は同上
		----------------------------------------
		" csv の特定のカラムをハイライト (put in .vimrc) .vimrc)               : 普通は同上
		function! CSVH(x) CSVH(x)               : 普通は同上
			execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/' /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'               : 普通は同上
			execute 'normal ^'.a:x.'f,' ^'.a:x.'f,'               : 普通は同上
		endfunction
		command! -nargs=1 Csv :call CSVH(<args>) CSVH(<args>)               : 普通は同上
		" call with with               : 普通は同上
		:Csv 5                             : 5番めのカラムをハイライト 5番めのカラムをハイライト               : 普通は同上
		----------------------------------------
		" 折り畳み : hide sections to allow easier comparisons comparisons               : 普通は同上
		zf}                               : モーションを使ってパラグラフを折り畳む モーションを使ってパラグラフを折り畳む               : 普通は同上
		v}zf                              : ヴィジュアル選択を使ってパラグラフを折り畳む ヴィジュアル選択を使ってパラグラフを折り畳む               : 普通は同上
		zf'a                              : マーク位置までを折り畳む マーク位置までを折り畳む               : 普通は同上
		zo                                : 折り畳みを開く 折り畳みを開く               : 普通は同上
		zc                                : 折り畳みをまた閉じる 折り畳みをまた閉じる               : 普通は同上
		----------------------------------------
		" 不可視文字を表示 不可視文字を表示               : 普通は同上
		:set list list               : 普通は同上
		:h listchars listchars               : 普通は同上
		----------------------------------------
		" インサートモードに入らずに「ノーマルコマンド」をペーストする方法 インサートモードに入らずに「ノーマルコマンド」をペーストする方法               : 普通は同上
		:norm qqy$jq qqy$jq               : 普通は同上
		----------------------------------------
		" ファイル名操作 ファイル名操作               : 普通は同上
	*  :h filename-modifiers             : ヘルプ ヘルプ               : 普通は同上
		:w %                              : 現在のファイル名に書き出す 現在のファイル名に書き出す               : 普通は同上
	*  :w %:r.cfm                        : 拡張子を .cfm に変える に変える               : 普通は同上
		:!echo %:p                        : フルパス＆ファイル名 フルパス＆ファイル名               : 普通は同上
		:!echo %:p:h                      : フルパスオンリー フルパスオンリー               : 普通は同上
		:!echo %:t                        : ファイル名オンリー ファイル名オンリー               : 普通は同上
	*  :reg %                            : ファイル名を表示 ファイル名を表示               : 普通は同上
	*  <C-R>%                            : ファイル名を挿入 (insert mode) mode)               : 普通は同上
	*  "%p                               : ファイル名を挿入 (normal mode) mode)               : 普通は同上
		/<C-R>%                           : テキスト中からファイル名を検索 テキスト中からファイル名を検索               : 普通は同上
		----------------------------------------
		" 無名レジスタに記録せずに削除 無名レジスタに記録せずに削除               : 普通は同上
		"_d                               : what you've aLWaYS wanted wanted               : 普通は同上
		"_dw                              : eg delete word (use blackhole) blackhole)               : 普通は同上
		----------------------------------------
		" フルパスをペーストバッファにコピー。emailに貼り付けるときなんかに フルパスをペーストバッファにコピー。emailに貼り付けるときなんかに               : 普通は同上
		nnoremap <F2> :let @*=expand("%:p")<cr> :unix :unix               : 普通は同上
		nnoremap <F2> :let @*=substitute(expand("%:p"), "/", "\\", "g")<cr> :win32 :win32               : 普通は同上
		----------------------------------------
		" ファイル中の単語数を数える ファイル中の単語数を数える               : 普通は同上
	*  g<C-G> g<C-G>               : 普通は同上
		----------------------------------------
		" 独自のハイライティングを定義する例 独自のハイライティングを定義する例               : 普通は同上
		:syn match DoubleSpace "  " "               : 普通は同上
		:hi def DoubleSpace guibg=#e0e0e0 guibg=#e0e0e0               : 普通は同上
		----------------------------------------
		" 上の行を現在行に単語ごとにコピーする 上の行を現在行に単語ごとにコピーする               : 普通は同上
		imap ]  @@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s @@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s               : 普通は同上
		nmap ] i@@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s i@@@<ESC>hhkyWjl?@@@<CR>P/@@@<CR>3s               : 普通は同上
		" Programming keys depending on file type type               : 普通は同上
		:autocmd bufenter *.tex map <F1> :!latex %<CR> %<CR>               : 普通は同上
		:autocmd bufenter *.tex map <F2> :!xdvi -hush %<.dvi&<CR> %<.dvi&<CR>               : 普通は同上
		----------------------------------------
		" Ms-Word のドキュメントを読む, antiword が必要 が必要               : 普通は同上
		:autocmd BufReadPre *.doc set ro ro               : 普通は同上
		:autocmd BufReadPre *.doc set hlsearch! hlsearch!               : 普通は同上
		:autocmd BufReadPost *.doc %!antiword "%" "%"               : 普通は同上
		----------------------------------------
		" 折り畳み法 折り畳み法               : 普通は同上
	*  vim: filetype=help foldmethod=marker foldmarker=<<<,>>> foldmarker=<<<,>>>               : 普通は同上
		a really big section closed with a tag <<< <<<               : 普通は同上
		--- remember folds can be nested --- ---               : 普通は同上
		Closing tag >>> >>>               : 普通は同上
		----------------------------------------
		" Just another Vim Hacker JaVH JaVH               : 普通は同上
		vim -c ":%s%s*%Cyrnfr)fcbafbe[Oenz(Zbbyranne%|:%s)[[()])-)Ig|norm Vg?" Vg?"               : 普通は同上
		----------------------------------------
#Tanablog
#[Vim] Vim7 内蔵の grep を使う を使う               : 普通は同上
	Vim7 内蔵の grep を使うには :vimgrep コマンドを使えばよい。 コマンドを使えばよい。               : 普通は同上
	:vimgrep /hogehoge/ *.txt *.txt               : 普通は同上
	最初にマッチしたファイルを開かないようにするには j フラグを使う。 フラグを使う。               : 普通は同上
	:vimgrep /hogehoge/j *.txt *.txt               : 普通は同上
	再帰的に検索するには **(starstar) を使う。 を使う。               : 普通は同上
	:vimgrep /hogehoge/j **/*.txt **/*.txt               : 普通は同上
	検索結果は Quickfixリストに表示される。:copen で開き :ccl で閉じることができる。詳細は :he quickfix-window。 quickfix-window。               : 普通は同上
	:vimgrep /hoge/j **/*.txt | cwin  とやると、copenしなくてもQuickfixが開いてくれて幸せです。 とやると、copenしなくてもQuickfixが開いてくれて幸せです。               : 普通は同上
		au QuickfixCmdPost make,grep,grepadd,vimgrep copen  #vimgrepやmake後にQuickFixウィンドウを自動的に開く方法[vim] #vimgrepやmake後にQuickFixウィンドウを自動的に開く方法[vim]               : 普通は同上
	パイプで次に入力したいコマンドを繋げられる。
	vimgrep をデフォルトの grep プログラムとして使用する プログラムとして使用する               : 普通は同上
	:grep を :vimgrep のエイリアスにするには、gvimrc に以下の行を追加する。 に以下の行を追加する。               : 普通は同上
	:set grepprg=internal grepprg=internal               : 普通は同上
	:cn  :cp  vim vimgrepと併用してジャンプに使う cn, cp[vim] cp[vim]               : 普通は同上
ファイルフォーマット
	改行コード変更:e ++ff=unix ++ff=unix               : 普通は同上
	:e ++ff=dos ++ff=dos               : 普通は同上
:e ++ff=mac ++ff=mac               : 普通は同上
:e ++ff=unix ++ff=unix               : 普通は同上
This can also be used as saving operation (:w alone will not save using the lineendings you see on screen): screen):               : 普通は同上

:w ++ff=dos ++ff=dos               : 普通は同上
:w ++ff=mac ++ff=mac               : 普通は同上
:w ++ff=unix ++ff=unix               : 普通は同上
and you can use it from the command-line: command-line:               : 普通は同上

for file in $(ls *cpp) *cpp)               : 普通は同上
do
  vi +':w ++ff=unix' +':q' ${file} ${file}               : 普通は同上
done


	エンコード指定してよみなおし :e ++enc=utf-8 ++enc=utf-8               : 普通は同上
設定関連 オプション一覧 誰か親切な人が ./options に纏めてくれました。 に纏めてくれました。               : 普通は同上
	よく設定ファイルに書くコマンド
		? 頭の : は省略してます。 は省略してます。               : 普通は同上
		? set ほげほげ系は noほげほげというように頭に no を付ける事でその機能の off/on を行 を行               : 普通は同上
		います。
		set ignorecase                       検索文字列が小文字の場合は大文字小文字を区別 検索文字列が小文字の場合は大文字小文字を区別               : 普通は同上
	検                                       なく検索する なく検索する               : 普通は同上
	索  set smartcase                        検索文字列に大文字が含まれている場合は区別し 検索文字列に大文字が含まれている場合は区別し               : 普通は同上
	関                                       て検索する て検索する               : 普通は同上
	連  set wrapscan                         検索時に最後まで行ったら最初に戻る 検索時に最後まで行ったら最初に戻る               : 普通は同上
		set noincsearch                      検索文字列入力時に順次対象文字列にヒットさせ 検索文字列入力時に順次対象文字列にヒットさせ               : 普通は同上
			ない
		set number                           行番号を表示させる 行番号を表示させる               : 普通は同上
		set nolist                           タブや改行を表示しない（表示する場合は行末が$ タブや改行を表示しない（表示する場合は行末が$               : 普通は同上
			、TaBが^Iで表示される）
		set tabstop=4                        タブ幅を４文字にする タブ幅を４文字にする               : 普通は同上
		set shiftwidth=4                     cindentやautoindent時に挿入されるタブの幅（ cindentやautoindent時に挿入されるタブの幅（               : 普通は同上
	装                                       tabstop と揃えておくと良い） と揃えておくと良い）               : 普通は同上
	飾  set showmatch                        括弧入力時の対応する括弧を表示 括弧入力時の対応する括弧を表示               : 普通は同上
	関  syntax on                            シンタックスハイライトを有効にする シンタックスハイライトを有効にする               : 普通は同上
	連  set hlsearch                         検索結果文字列のハイライトを有効にする 検索結果文字列のハイライトを有効にする               : 普通は同上
		set laststatus=2                     ステータスラインを常に表示（編集中のファイル ステータスラインを常に表示（編集中のファイル               : 普通は同上
			名が常に確認できるようになる）
		set showcmd                          入力中のコマンドをステータスに表示する 入力中のコマンドをステータスに表示する               : 普通は同上
		set statusline=%<%f\ %m%r%h%w%{'['.  ステータスラインに文字コードと改行文字を表示 ステータスラインに文字コードと改行文字を表示               : 普通は同上
		(&fenc!=''?&fenc:&enc).']['.&ff.']'} する する               : 普通は同上
		%=%l,%c%V%8P
	そ                                       編集中の内容を保ったまま別の画面に切替えられ 編集中の内容を保ったまま別の画面に切替えられ               : 普通は同上
	の  set hid                              るようにする(デフォルトだと一度保存しないと切 るようにする(デフォルトだと一度保存しないと切               : 普通は同上
	他                                       り替えられない) り替えられない)               : 普通は同上
	よく使うマップ定義†
	僕（=KaWaZ）が普段設定しているマップ定義です。
	F2 map <F2> <ESC>:bp<CR> 前のバッファ 前のバッファ               : 普通は同上
	F3 map <F3> <ESC>:bn<CR> 次のバッファ 次のバッファ               : 普通は同上
	F4 map <F4> <ESC>:bw<CR> バッファを削除する バッファを削除する               : 普通は同上
	j  nnoremap j gj         表示行単位で行移動するようにする 表示行単位で行移動するようにする               : 普通は同上
	k  nnoremap k gk gk               : 普通は同上
	オプション一覧†
	これ以外のオプション一覧は ./options にあります。 にあります。               : 普通は同上
	ただし、最新バージョンの全てのオプションを網羅できていないかもしれません。
文字コードの自動認識†
	以下を .vimrc に書いておけば日本語の文字コード識別は多分完璧 :D :D               : 普通は同上
	" 文字コードの自動認識 文字コードの自動認識               : 普通は同上
	if &encoding !=# 'utf-8' 'utf-8'               : 普通は同上
		set encoding=japan encoding=japan               : 普通は同上
		set fileencoding=japan fileencoding=japan               : 普通は同上
	endif
	if has('iconv') has('iconv')               : 普通は同上
		let s:enc_euc = 'euc-jp' 'euc-jp'               : 普通は同上
		let s:enc_jis = 'iso-2022-jp' 'iso-2022-jp'               : 普通は同上
		" iconvがeucJP-msに対応しているかをチェック iconvがeucJP-msに対応しているかをチェック               : 普通は同上
		if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb" "\xad\xc5\xad\xcb"               : 普通は同上
		let s:enc_euc = 'eucjp-ms' 'eucjp-ms'               : 普通は同上
		let s:enc_jis = 'iso-2022-jp-3' 'iso-2022-jp-3'               : 普通は同上
		" iconvがJISX0213に対応しているかをチェック iconvがJISX0213に対応しているかをチェック               : 普通は同上
		elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb" "\xad\xc5\xad\xcb"               : 普通は同上
		let s:enc_euc = 'euc-jisx0213' 'euc-jisx0213'               : 普通は同上
		let s:enc_jis = 'iso-2022-jp-3' 'iso-2022-jp-3'               : 普通は同上
		endif
		" fileencodingsを構築 fileencodingsを構築               : 普通は同上
		if &encoding ==# 'utf-8' 'utf-8'               : 普通は同上
		let s:fileencodings_default = &fileencodings &fileencodings               : 普通は同上
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932' .',cp932'               : 普通は同上
		let &fileencodings = &fileencodings .','. s:fileencodings_default s:fileencodings_default               : 普通は同上
		unlet s:fileencodings_default s:fileencodings_default               : 普通は同上
		else
		let &fileencodings = &fileencodings .','. s:enc_jis s:enc_jis               : 普通は同上
		set fileencodings+=utf-8,ucs-2le,ucs-2 fileencodings+=utf-8,ucs-2le,ucs-2               : 普通は同上
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$' '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'               : 普通は同上
			set fileencodings+=cp932 fileencodings+=cp932               : 普通は同上
			set fileencodings-=euc-jp fileencodings-=euc-jp               : 普通は同上
			set fileencodings-=euc-jisx0213 fileencodings-=euc-jisx0213               : 普通は同上
			set fileencodings-=eucjp-ms fileencodings-=eucjp-ms               : 普通は同上
			let &encoding = s:enc_euc s:enc_euc               : 普通は同上
			let &fileencoding = s:enc_euc s:enc_euc               : 普通は同上
		else
			let &fileencodings = &fileencodings .','. s:enc_euc s:enc_euc               : 普通は同上
		endif
		endif
		" 定数を処分 定数を処分               : 普通は同上
		unlet s:enc_euc s:enc_euc               : 普通は同上
		unlet s:enc_jis s:enc_jis               : 普通は同上
	endif
	" 日本語を含まない場合は fileencoding に encoding を使うようにする を使うようにする               : 普通は同上
	if has('autocmd') has('autocmd')               : 普通は同上
		function! aU_ReCheck_FENC() aU_ReCheck_FENC()               : 普通は同上
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0 0               : 普通は同上
			let &fileencoding=&encoding &fileencoding=&encoding               : 普通は同上
		endif
		endfunction
		autocmd BufReadPost * call aU_ReCheck_FENC() aU_ReCheck_FENC()               : 普通は同上
	endif
	" 改行コードの自動認識 改行コードの自動認識               : 普通は同上
	set fileformats=unix,dos,mac fileformats=unix,dos,mac               : 普通は同上
	" □とか○の文字があってもカーソル位置がずれないようにする □とか○の文字があってもカーソル位置がずれないようにする               : 普通は同上
	if exists('&ambiwidth') exists('&ambiwidth')               : 普通は同上
		set ambiwidth=double ambiwidth=double               : 普通は同上
	endif
	vim の文字コード判定の仕組みは以下の通りです。 の文字コード判定の仕組みは以下の通りです。               : 普通は同上
		? fileencodings の設定を前から順に試してはじめにマッチしたものが採用される の設定を前から順に試してはじめにマッチしたものが採用される               : 普通は同上
		? encoding や fileencoding の設定値が途中に発見されるとそこで判定を止めてしまい後の の設定値が途中に発見されるとそこで判定を止めてしまい後の               : 普通は同上
		設定は無視される
			□ この動作により、UNIX環境(euc-jpの場合)では euc-jp が fileencodings の前の方に の前の方に               : 普通は同上
			設定されていると、cp932 や utf-8 で書いたファイルが文字化けてしまうので気をつ で書いたファイルが文字化けてしまうので気をつ               : 普通は同上
			ける必要がある。
		? encoding に設定される文字コードは fileencodings に見つからなかったときのデフォルト に見つからなかったときのデフォルト               : 普通は同上
		値に使われるので fileencodings に設定する必要は無い。 に設定する必要は無い。               : 普通は同上
	上記の設定では実行環境に合わせてそれらが吸収できるので windows 環境でも unix 環境でも 環境でも               : 普通は同上
	上手く判定できる。
	■追記
		? EUC-JPで「～(波線)」が文字化ける問題を修正（eucjp-msが使える場合はそれを使うように EUC-JPで「～(波線)」が文字化ける問題を修正（eucjp-msが使える場合はそれを使うように               : 普通は同上
		）した。 2006-10-06 (金) 02:24 02:24               : 普通は同上
		? fileencoding=utf-8で編集中、□や○があるとその行でカーソル位置がずれる問題があった fileencoding=utf-8で編集中、□や○があるとその行でカーソル位置がずれる問題があった               : 普通は同上
		のだが、解決する設定（ambiwidth=double）を追加した。 2006-11-17 (金) 21:48 21:48               : 普通は同上
		? 日本語を含まないファイルを開いたときにfileencodingがiso-2022-jpになってしまう問題 日本語を含まないファイルを開いたときにfileencodingがiso-2022-jpになってしまう問題               : 普通は同上
		があったが、日本語の有無を再チェックしてより望ましい値（encodingの値）を
		fileencodingに設定するようにした。 2007-01-10 (水) 11:38 11:38               : 普通は同上
	文字コードを指定してファイルを開きなおす†
	普通は上記の自動認識で問題ないと思うが、それでも文字化けする場合や、わざと違う文字コー
	ドで開いてみたい場合に使う。
	例えば以下のようにするとeuc-jpでファイルを開き直せる。
	:e ++enc=euc-jp ++enc=euc-jp               : 普通は同上
	文字コードを変更して保存する†
	cp932 (Shift-JIS) にするには以下のようにする。 にするには以下のようにする。               : 普通は同上
	:set fileencoding=cp932 fileencoding=cp932               : 普通は同上
	この状態だとまだ保存してないので :w してやれば文字コードを変更して保存になる。 してやれば文字コードを変更して保存になる。               : 普通は同上
改行コードの自動認識†
	以下を .vimrc に書いておけばよい。 に書いておけばよい。               : 普通は同上
	set fileformats=unix,dos,mac fileformats=unix,dos,mac               : 普通は同上
	新規ファイルの場合 fileformats の最初の改行コードが使われるようなので好みにより順番を の最初の改行コードが使われるようなので好みにより順番を               : 普通は同上
	変えます。
	順番を変えても自動判定が失敗することは経験上無いようです。
	改行コードを変更する†
	:set fileformat=改行コードの種類 fileformat=改行コードの種類               : 普通は同上
	ff は fileformat の短い形式なので ff でも良い。 でも良い。               : 普通は同上
	改行コードの種類で指定できるのは dos, max, unix の３つです。 の３つです。               : 普通は同上
	例）Windows形式の改行コードに変更するには以下のようにします。
	:set fileformat=dos fileformat=dos               : 普通は同上
	改行コードの見分け方（UNIX環境前提）†
	改行コードが unix でない場合、^M という文字が大量に表示されることがあります。これは という文字が大量に表示されることがあります。これは               : 普通は同上
	mac で使われる改行文字です。これを見たらきっと改行コードが違うんだなと思ってください。 で使われる改行文字です。これを見たらきっと改行コードが違うんだなと思ってください。               : 普通は同上
	見分け方は以下の通りです。
		1. 普通に改行されていて特に問題を感じない→改行コードは unix unix               : 普通は同上
			2. 全ての行末に ^M がくっついている→改行コードは dos dos               : 普通は同上
		3. ^M が沢山表示されるうえに全てが1行に表示されてしまう→改行コードは mac mac               : 普通は同上
	改行コードが分かったら以下を実行すれば正常に表示されるようになります。(dosと分かった場
	合)
		:e ++ff=dos ++ff=dos               : 普通は同上
検索語が画面の真ん中に来るようにする† .vimrc に以下のようなキーマッピングを書いておきます。 に以下のようなキーマッピングを書いておきます。               : 普通は同上
	nmap n nzz nzz               : 普通は同上
	nmap N Nzz Nzz               : 普通は同上
	nmap * *zz *zz               : 普通は同上
	nmap # #zz #zz               : 普通は同上
	nmap g* g*zz g*zz               : 普通は同上
		nmap g# g#zz g#zz               : 普通は同上
	解説：zz はカレント行を画面の中心にします。（つまり n で検索語にカーソル移動したら勝手 で検索語にカーソル移動したら勝手               : 普通は同上
	に zz でカレント行が画面の真ん中なるようにスクロールされるようになる） でカレント行が画面の真ん中なるようにスクロールされるようになる）               : 普通は同上
暗号化†
	vim は単体で PKZIP とかと同じ暗号化アルゴリズムでファイルを暗号化することが出来ます。 とかと同じ暗号化アルゴリズムでファイルを暗号化することが出来ます。               : 普通は同上
	1. ファイルを暗号化する ファイルを暗号化する               : 普通は同上
		1. 暗号化したいファイルを以下のように -x オプションを付けて起動します。 オプションを付けて起動します。               : 普通は同上
			vim -x secret.txt secret.txt               : 普通は同上
		2. 起動すると暗号化に使うパスワードの入力を求められます。確認の為２回聞かれます。 起動すると暗号化に使うパスワードの入力を求められます。確認の為２回聞かれます。               : 普通は同上
		3. 開いたら今まで通り普通にファイルの編集画面になります。 開いたら今まで通り普通にファイルの編集画面になります。               : 普通は同上
		4. このまま普通に :w などで保存すればファイルは暗号化して保存されます。 などで保存すればファイルは暗号化して保存されます。               : 普通は同上
	2. 暗号化されたファイルを編集する 暗号化されたファイルを編集する               : 普通は同上
		1. vim によって暗号化されたファイルを開くには普通に vim で開くだけです。 で開くだけです。               : 普通は同上
			vim secret.txt secret.txt               : 普通は同上
		2. 起動時にパスワードを要求するプロンプトが出るので正しいパスワードを入れれば普通 起動時にパスワードを要求するプロンプトが出るので正しいパスワードを入れれば普通               : 普通は同上
			に開いて編集できます。
		3. 間違ったパスワードを入れても復号化されますがそれは意味の無い只のバイナリデータ 間違ったパスワードを入れても復号化されますがそれは意味の無い只のバイナリデータ               : 普通は同上
			に見えるはずです。
	3. 暗号化を解除する、もしくはパスワードを変更する。 暗号化を解除する、もしくはパスワードを変更する。               : 普通は同上
		1. まずは普通に起動してパスワードを入力してファイルを開きます。 まずは普通に起動してパスワードを入力してファイルを開きます。               : 普通は同上
		2. 以下のコマンドを実行すると新しいパスワードを要求されます。 以下のコマンドを実行すると新しいパスワードを要求されます。               : 普通は同上
			:X
		3. パスワードの変更後は普通に保存すれば新しいパスワードで暗号化されて保存されます パスワードの変更後は普通に保存すれば新しいパスワードで暗号化されて保存されます               : 普通は同上
			。
		4. 暗号化を解除したい場合は :X でパスワードを空（何も入力せずにEnter）にして保存 でパスワードを空（何も入力せずにEnter）にして保存               : 普通は同上
			するだけです。
	4. 注意点 注意点               : 普通は同上
		1. 保存されたファイルは暗号化されますが、スワップファイルは暗号化されません。それ 保存されたファイルは暗号化されますが、スワップファイルは暗号化されません。それ               : 普通は同上
			を読むことが出来る人はパスワードを知らなくても内容を見ることが出来ます。
				1. vim の起動時に -n を付けて起動すればスワップファイルは作成されません。 を付けて起動すればスワップファイルは作成されません。               : 普通は同上
	バイナリ編集†
	vim でバイナリを編集したい場合ですが、よくある16進ダンプとそれのテキスト表示があると便 でバイナリを編集したい場合ですが、よくある16進ダンプとそれのテキスト表示があると便               : 普通は同上
	利です。
	探してみたところこのサイトで xxd を使ってバイナリ編集をする方法を紹介していたので試し を使ってバイナリ編集をする方法を紹介していたので試し               : 普通は同上
	てみたところ便利そうなのでメモ。
	但しそのままだと少し問題があった*1 のでそれを修正した版が以下の設定です。 のでそれを修正した版が以下の設定です。               : 普通は同上
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します） ファイルを開くと発動します）               : 普通は同上
	augroup BinaryXXD BinaryXXD               : 普通は同上
		autocmd!
		autocmd BufReadPre  *.bin let &binary =1 =1               : 普通は同上
		autocmd BufReadPost * if &binary | silent %!xxd -g 1 1               : 普通は同上
		autocmd BufReadPost * set ft=xxd | endif endif               : 普通は同上
		autocmd BufWritePre * if &binary | %!xxd -r | endif endif               : 普通は同上
		autocmd BufWritePost * if &binary | silent %!xxd -g 1 1               : 普通は同上
		autocmd BufWritePost * set nomod | endif endif               : 普通は同上
	augroup END END               : 普通は同上
コメント†
	? putty 繋げてリモートでvim使ってるときにIME使うとよくいらつくので、keylay21でキーボードレイアウトを変えると便利。 -- KaWaZ 2003-08-14 (木) 18:15:41 18:15:41               : 普通は同上
	? 文字コード自動認識だが、Fedora Core の日本語環境は UTF-8 な為、その場合も対応できるように修正した。 -- KaWaZ 2004-05-25 (火) 18:21:41 18:21:41               : 普通は同上
	? 「文字コードの自動認識」を使用していますが、EUC-JPのファイルで～を使用すると化けますが、これはUTF-8→EUC-JPの限界ですか？ -- 通りすがり? 2006-10-04 (水) 10:56:36 10:56:36               : 普通は同上
		□ 指摘サンクスです。EUC-JPのファイルで～等の文字を使えるようにしました。(iconvがeucjp-msに対応していれば) -- KaWaZ 2006-10-06 (金) 02:32:31 02:32:31               : 普通は同上
		□ ついでにencodingがeucjpだった場合の処理が間違ってたのでそれも修正しました。添付の .vimrc も修正してあります。 -- KaWaZ 2006-10-06 (金) 02:32:31 02:32:31               : 普通は同上
	? 文字コードの自動認識で、新規作成は期待通りEUC-JPになるのですが、日本語を含まないファイルを開いた時にISO-2022-JPになってしまうのが困っています。fileencodingsの先頭にEUC-JPを書くと自動認識されなくなってしまいますし、難しいですね。 -- 2006-12-07 (木) 00:20:41 00:20:41               : 普通は同上
		□ ISO-2022-JPとして認識した時に本当に日本語が含まれているかどうかをチェックして、日本語が含まれていなかったらencodingの値をfileencodingに使うように修正してみました。これにより日本語を含まないファイルでも eucjp がデフォの環境では eucjpが、utf-8 な環境では utf-8 で開けるようになりました。-- KaWaZ 2007-01-10 (水) 11:23:49 11:23:49               : 普通は同上
	? ++encが何かは分からないのですが:view ++enc=sjisこうゆう事も出きるんですね.見れないファイルがあって参考に成りました. -- en? 2008-08-20 (水) 20:44:46 20:44:46               : 普通は同上
vimからコマンドを実行し、その結果をバッファに取り込むことが可能です。
	:r!pwd
	:.
	:.!date
	:diffsplit を知った。便利だ。 -- KaWaZ 2003-10-30 (木) 18:22:17 18:22:17               : 普通は同上
	colordiff    diff file1 file2 | vim -vimでdiffをカラフルにして見る方法[vim] -vimでdiffをカラフルにして見る方法[vim]               : 普通は同上
	]c [c  vim vimdiffで差分の場所でジャンプする方法[vim] vimdiffで差分の場所でジャンプする方法[vim]               : 普通は同上
	]p  vim インデントの深さに合わせて貼り付けをする方法[vim] インデントの深さに合わせて貼り付けをする方法[vim]               : 普通は同上
$HOME/.vimrc
	set autochdir autochdir               : 普通は同上
	au QuickfixCmdPost make,grep,grepadd,vimgrep copen  #vimgrepやmake後にQuickFixウィンドウを自動的に開く方法[vim] #vimgrepやmake後にQuickFixウィンドウを自動的に開く方法[vim]               : 普通は同上
	yzis  vimよりもより機能が強力で高速を目指すyzis[vim] vimよりもより機能が強力で高速を目指すyzis[vim]               : 普通は同上
#vim config parametes parametes               : 普通は同上
	#VIM CONFIG PaRaMETERS:--------------------------------------------- PaRaMETERS:---------------------------------------------               : 普通は同上
		aleph  初期値：MS-DOSでは128、それ以外では224 初期値：MS-DOSでは128、それ以外では224               : 普通は同上
		ヘブライ語アルファベットの最初の文字を表すaSCIIコード。
		allowrevins  初期値：オフ 初期値：オフ               : 普通は同上
		CTRL-_で'revins'オプションをトグルさせる。挿入モードとコマンドラインモードで CTRL-_ を使用可能 を使用可能               : 普通は同上
		にする。これは既定ではオフになっている。ユーザが間違って SHIFT-_ ではなく CTRL-_ を打ち込み、 を打ち込み、               : 普通は同上
		右から左に書いていくモードに入って抜けられなくなる事態を防ぐためである。
		altkeymap  初期値：オフ 初期値：オフ               : 普通は同上
		編集モードで CTRL-_ で Farsi と英語のキーボードマップを切り替えられる。 と英語のキーボードマップを切り替えられる。               : 普通は同上
		autoindent  初期値：オフ 初期値：オフ               : 普通は同上
		新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。新しい行で &lt;BS&gt; か か               : 普通は同上
		CTRL-D 以外を打ち込まずに &lt;Esc&gt; か &lt;CR&gt; を打ち込むと、その行のインデントは削除され を打ち込むと、その行のインデントは削除され               : 普通は同上
		る。オプション 'autoindent' がオンのときは、テキストの整形処理 (コマンド "gq" を使ったり、挿入 を使ったり、挿入               : 普通は同上
		モードで1行の文字数が 'textwidth' に届いたとき) には最初の行のインデントが使われる。オプション には最初の行のインデントが使われる。オプション               : 普通は同上
		'smartindent' オプションか 'cindent' がオンのときは、インデントの方法は違ってくる。オプション がオンのときは、インデントの方法は違ってくる。オプション               : 普通は同上
		'paste' オプションがオンになると 'autoindent' はオフになる。 はオフになる。               : 普通は同上
		autoread  初期値：オフ 初期値：オフ               : 普通は同上
		外部のエディタで編集中のファイルが変更されたら、自動的に読み直す。ファイルが削除された場合は読
		み直さない。
		autowrite  初期値：オフ 初期値：オフ               : 普通は同上
		自動的にファイルに保存する。 :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :tag,               : 普通は同上
		:! :make, CTRL-], CTRL-^ のコマンドを実行するたび、ファイルが変更されていれば、そのファイルを のコマンドを実行するたび、ファイルが変更されていれば、そのファイルを               : 普通は同上
		保存する。
		autowriteall  初期値：オフ 初期値：オフ               : 普通は同上
		autowriteよりもさらに多くのコマンドで自動保存する。 'autowrite' と同様のオプションだが、さらに と同様のオプションだが、さらに               : 普通は同上
		":edit", ":quit", ":qall"コマンド ":exit", ":xit", ":recover" でも、ファイルが変更されているな でも、ファイルが変更されているな               : 普通は同上
		ら保存する。またVimのウィンドウを閉じる際にも保存する。このオプションをオンにすると、オプショ
		ン 'autowrite' も同時にオンになったようになる。 も同時にオンになったようになる。               : 普通は同上
		background  初期値："dark" または "light" "light"               : 普通は同上
		見やすい色を表示するようにVimに背景色を教える。 "dark" に設定されていると、Vimは暗い背景によく に設定されていると、Vimは暗い背景によく               : 普通は同上
		合う色を使おうとする。"light" に設定されていると、Vimは明るい背景によく合う色を使おうとする。 に設定されていると、Vimは明るい背景によく合う色を使おうとする。               : 普通は同上
		その他の値は無効である。
		backspace  初期値："" 初期値：""               : 普通は同上
		バックスペースキーの動作を決定する。
		値     効果 効果               : 普通は同上
		indent autoindent を超えてバックスペースを働かせる を超えてバックスペースを働かせる               : 普通は同上
		eol    改行を超えてバックスペースを働かせる (行を連結する) (行を連結する)               : 普通は同上
		start  挿入区間の始めでバックスペースを働かせるが CTRL-W と CTRL-U は挿入区間の始めでいったん は挿入区間の始めでいったん               : 普通は同上
			止まる
		値が空のときは、Vi互換のバックスペーシングが使われる。バージョン 5.4 またはそれ以前との互換性 またはそれ以前との互換性               : 普通は同上
		にはこう設定する:
		値 効果 効果               : 普通は同上
		0  ""と同じ ""と同じ               : 普通は同上
		1  "indent,eol"と同じ "indent,eol"と同じ               : 普通は同上
		2  "indent,eol,start"と同じ "indent,eol,start"と同じ               : 普通は同上
		backup  初期値：オフ 初期値：オフ               : 普通は同上
		ファイルを上書きする前にバックアップファイルを作る。書き込みが成功したらバックアップはそのまま
		置いておく。バックアップをずっと持っていたくはないが、書き込みの最中にはバックアップが欲しいと
		きには、このオプションをオフにしてオプション 'writebackup' をオンにすること (既定ではそうなっ (既定ではそうなっ               : 普通は同上
		ている)。全くバックアップが要らないなら両方をオフにすること (あなたのファイルシステムがほとん (あなたのファイルシステムがほとん               : 普通は同上
		ど一杯ならこうするとよい)。
		backupcopy  初期値：Viの既定値: "yes" 、それ以外: "auto" "auto"               : 普通は同上
		バックアップファイルの作成方法を決定する。
		オプション  動作 動作               : 普通は同上
		値
		yes         先にファイルのコピーを作ってバックアップにして、更新した内容は元のファイルに上書き 先にファイルのコピーを作ってバックアップにして、更新した内容は元のファイルに上書き               : 普通は同上
			する
		no          先に元のファイルをリネームしてバックアップにして、更新した内容は新しいファイルに書 先に元のファイルをリネームしてバックアップにして、更新した内容は新しいファイルに書               : 普通は同上
			き出す
		auto        上の2つのどちらかで、適切な方を選ぶ 上の2つのどちらかで、適切な方を選ぶ               : 普通は同上
		オプション値の説明
		オプ
		ショ メリット                                     デメリット デメリット               : 普通は同上
		ン
			編集したファイルが特別な属性を持っているとき ファイルのコピーに余計な時間がかかる編集した ファイルのコピーに余計な時間がかかる編集した               : 普通は同上
		yes  (例えばファイルがハードリンクまたはシンボリ  ファイルがリンクのとき、バックアップファイル ファイルがリンクのとき、バックアップファイル               : 普通は同上
			ックリンクだったり、リソースフォークを持って の名前がリンク先の文書ファイルの名前でなく、 の名前がリンク先の文書ファイルの名前でなく、               : 普通は同上
			いるとき)、全て元のまま保たれる              リンクファイルの名前になってしまう リンクファイルの名前になってしまう               : 普通は同上
				時々、元のファイルの持つ属性を新しいファイル
		no   高速である                                   にコピーしきれないことがある編集したファイル にコピーしきれないことがある編集したファイル               : 普通は同上
			がリンクのとき、新しいファイルはリンクになら
			ない
			Vimが副作用なしにリネームの方法が使えると判  Vimが副作用なしにリネームの方法が使えると判 Vimが副作用なしにリネームの方法が使えると判               : 普通は同上
		auto 断したとき (属性がコピーでき、ファイルがリン 断したとき (属性がコピーでき、ファイルがリン (属性がコピーでき、ファイルがリン               : 普通は同上
			クでないとき) は、そちらが使われる。それでは クでないとき) は、そちらが使われる。それでは は、そちらが使われる。それでは               : 普通は同上
			問題がありそうなときはコピーの方法が使われる 問題がありそうなときはコピーの方法が使われる 問題がありそうなときはコピーの方法が使われる               : 普通は同上
		"no" と "auto" では問題が起きる場合がある。プログラムによっては、ファイルを開き、Vimを呼び出し では問題が起きる場合がある。プログラムによっては、ファイルを開き、Vimを呼び出し               : 普通は同上
		てそのファイルを編集させ、(ファイル区別プログラムを使って) そのファイルが変更されたかどうかを そのファイルが変更されたかどうかを               : 普通は同上
		調べるものがある。そうしたプログラムは新しく書き出されたファイルではなく、バックアップファイル
		の方を調べてしまう。例としては "crontab -e" が挙げられる。 が挙げられる。               : 普通は同上
		backupdir  初期値：amigaでの既定値: ".,t:",Win32は、".,c:/tmp,c:、temp"、Unixでは ".,~/tmp,~/" ".,~/tmp,~/"               : 普通は同上
		バックアップファイルを作るディレクトリを設定する。値は、バックアップファイルを作るディレクトリ
		を、コンマ区切りのリストにしたもの。
		例：
		set backupdir=$HOME/backup backupdir=$HOME/backup               : 普通は同上
		バックアップファイルは、リスト内の、使用可能な最初のディレクトリの中に作られる値が空だと、バッ
		クアップファイルは作られない ('patchmode' は使えなくなる!) ディレクトリに "." を指定するのは、 を指定するのは、               : 普通は同上
		バックアップファイルを、編集されたファイルと同じディレクトリに作るということであるディレクトリ
		が "./" で (MS-DOSなどでは ".\") 始まるのは、バックアップファイルを作るディレクトリを、編集さ 始まるのは、バックアップファイルを作るディレクトリを、編集さ               : 普通は同上
		れたファイルとの相対的な位置で決めるということである。最初の "." は編集されたファイルのパス名 は編集されたファイルのパス名               : 普通は同上
		で置き換えられる("." がディレクトリ名の内部にあるなら、特別な意味はない) コンマの後の空白は無 コンマの後の空白は無               : 普通は同上
		視されるが、他の場所の空白はディレクトリ名の一部として見なされる。ディレクトリ名の先頭に空白を
		使いたいなら、その空白の前にバックスラッシュを置くことディレクトリ名にコンマを使いたいなら、そ
		のコンマの前にバックスラッシュを置くことディレクトリ名は '/' で終わってもよい環境変数は展開さ で終わってもよい環境変数は展開さ               : 普通は同上
		れる '\' には注意すること。空白の前には1個置き、オプションの値に '\' 自身を含めたいなら2個置く 自身を含めたいなら2個置く               : 普通は同上
		backupext  初期値："~", VMSでは: "_" "_"               : 普通は同上
		バックアップファイルの拡張子。バックアップファイルの名前を作る際、元のファイル名の後ろに付け加
		える文字列。既定では普段使いそうもないものに定めてあるが、これは既存のファイルをバックアップフ
		ァイルで上書きするのを避けるためである。".bak" を使いたいかもしれないが、".bak" で終わるファイ で終わるファイ               : 普通は同上
		ルに重要なものがないか確かめること。
		backupskip  初期値："/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*" 初期値："/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*"               : 普通は同上
		バックアップを作成しないファイル名のパターン。ファイル名に対するパターンのリスト。この中に、書
		き込まれたファイルの名前にマッチするパターンがあれば、そのファイルのバックアップは作られない。
		ファイル名を指定してもよいし、ファイルのフルパスを指定してもよい (C:/temp/* という方法。既定値 という方法。既定値               : 普通は同上
		ではこの方法で、一時ファイル用のディレクトリを指定している) 。パターンの指定方法は |:autocmd| |:autocmd|               : 普通は同上
		と同じである。|autocmd-patterns| を参照すること。また、特殊文字に注意するために | |               : 普通は同上
		option-backslash| を参照すること。環境変数の $TMPDIR, $TMP や $TEMP が定義されていないと、既定 が定義されていないと、既定               : 普通は同上
		値には使われない。"/tmp/*" はUnixでのみ使われる。 はUnixでのみ使われる。               : 普通は同上
		balloondelay  初期値：600 初期値：600               : 普通は同上
		バルーン表示が出るまでの時間 (ミリ秒単位) 。 。               : 普通は同上
		ballooneval  初期値：オフ 初期値：オフ               : 普通は同上
		|balloon-eval| 機能を働かせる。 機能を働かせる。               : 普通は同上
		binary  初期値：オフ 初期値：オフ               : 普通は同上
		バイナリモード。バイナリファイルを編集する前には、このオプションをオンにする。Vimの引数に |-b| |-b|               : 普通は同上
		を付けてもよい。このオプションがオンのときは、いくつかのオプションの設定が変わる: 'textwidth' 'textwidth'               : 普通は同上
		は 0 'wrapmargin' は 0 'modeline' はオフ 'expandtab' はオフ はオフ               : 普通は同上
		bioskey  初期値：オン 初期値：オン               : 普通は同上
		キーボードの入力にBIOSを使うオプション。オンのときは、キーボードの文字を得るためにバイオスが呼
		び出される。これはCTRL-C を認識するためにはよいが、コンソールでしか機能しない。ターミナルをシ を認識するためにはよいが、コンソールでしか機能しない。ターミナルをシ               : 普通は同上
		リアルポートから利用する場合は、オフにすること。|'conskey'| も参照すること。 も参照すること。               : 普通は同上
		bomb  初期値：オフ 初期値：オフ               : 普通は同上
		BOMの付加オプション。ファイルを書き込むときに以下の条件が満たされれば、BOM (Byte Order Mark, Mark,               : 普通は同上
		バイト順マーク) がファイル先頭に付けられる: がファイル先頭に付けられる:               : 普通は同上
			? このオプションがオンであること-オプション 'binary' がオフであること がオフであること               : 普通は同上
			? オプション 'fileencoding' が "utf-8", "ucs-2", "ucs-4" であるか、それらとリトルエンディア であるか、それらとリトルエンディア               : 普通は同上
			ンとビッグエンディアンの違いを除いて同一のエンコードであること
		breakat  初期値：" ^I!@*-+;:,./?" ^I!@*-+;:,./?"               : 普通は同上
		自動改行を行う文字。オプション 'linebreak' がオンのとき、どの文字で自動改行が起きるかを、この がオンのとき、どの文字で自動改行が起きるかを、この               : 普通は同上
		オプションで指定する。
		browsedir  初期値："last" 初期値："last"               : 普通は同上
		ファイルブラウザにどのディレクトリを使うかを指定する:
		オプション値 動作 動作               : 普通は同上
		last         前回にファイルブラウザを使ったディレクトリ 前回にファイルブラウザを使ったディレクトリ               : 普通は同上
		buffer       バッファで開いているファイルのディレクトリ バッファで開いているファイルのディレクトリ               : 普通は同上
		current      カレントディレクトリ カレントディレクトリ               : 普通は同上
		{path}       {path} で指定されたディレクトリ で指定されたディレクトリ               : 普通は同上
		bufhidden  初期値："" 初期値：""               : 普通は同上
		バッファがウィンドウ内に表示されなくなったときの動作を指定する。
		オプシ  動作 動作               : 普通は同上
		ョン値
		&lt;
		empty&  グローバルなオプションの 'hidden' の値に従う の値に従う               : 普通は同上
		gt;
		hide    バッファを隠す (解放しない)。オプション 'hidden' がオンでなくともそうする がオンでなくともそうする               : 普通は同上
		unload  バッファを解放する。オプション 'hidden' がオンであったり、|:hide| コマンドを使ったとき コマンドを使ったとき               : 普通は同上
			でもそうする
		delete  バッファをバッファリストから削除する。'hidden' オプションがオンだったり、|:hide| コマ コマ               : 普通は同上
			ンドを使ったときでも、|:bdelete| コマンドを使ったときのように、リストからの削除を行う コマンドを使ったときのように、リストからの削除を行う               : 普通は同上
		buflisted  初期値：オン 初期値：オン               : 普通は同上
		バッファをバッファリストに表示させる。このオプションがオンならば、バッファはバッファリストに表
		示される。オフならば、そのバッファはコマンド ":bnext" コマンドや ":ls" 、バッファメニューなど 、バッファメニューなど               : 普通は同上
		の対象にならない。ファイル名やマークを思い出したりするためだけのバッファでは、このオプションは
		Vimによってオフにされる。ファイルの編集のためにバッファを作ったときは、このオプションはVimによ
		ってオンにされる。しかし ":buffer" コマンドでバッファに移動したときはそうではない。 コマンドでバッファに移動したときはそうではない。               : 普通は同上
		buftype  初期値："" 初期値：""               : 普通は同上
		バッファの種類を指定する。
		オプション値  動作 動作               : 普通は同上
		&lt;empty&gt; 普通のバッファ 普通のバッファ               : 普通は同上
		nofile        ファイルと関連がなく、書き込まれる予定のないバッファ ファイルと関連がなく、書き込まれる予定のないバッファ               : 普通は同上
		nowrite       書き込まれる予定のないバッファ 書き込まれる予定のないバッファ               : 普通は同上
		quickfix      エラーリスト用の、quickfix バッファ バッファ               : 普通は同上
		help          ヘルプバッファ ヘルプバッファ               : 普通は同上
		cdpath  初期値：環境変数 $CDPaTH または ",," ",,"               : 普通は同上
		:cdや:lcdコマンドで検索されるディレクトリのリスト。検索されるディレクトリは相対パスで指定する
		ことはできない ("/", "./" や "../" で始まってはいけない)。オプション 'cdpath' の値には、|path| の値には、|path|               : 普通は同上
		オプションと同様の指定方法を使う。|file-searching| も参照すること。既定では、値は環境変数 も参照すること。既定では、値は環境変数               : 普通は同上
		$CDPaTH から取り込まれるが、カレントディレクトリを最初に探すために "," が先頭に挿入される。 が先頭に挿入される。               : 普通は同上
		$CDPaTH から取り込まれたものが望ましくないときは、値を上書きするために、次のコマンドを適当に修 から取り込まれたものが望ましくないときは、値を上書きするために、次のコマンドを適当に修               : 普通は同上
		正し、あなたの vimrc ファイルに加えること: ファイルに加えること:               : 普通は同上
		:let &cdpath = ',' . substitute(substitute($CDPaTH, '[, ]','\\\0', 'g'), ':', ',', 'g') 'g')               : 普通は同上
		安全上の理由から、このオプションをモードライン |modeline| から設定することはできない (オプショ (オプショ               : 普通は同上
		ン cdpath の値の一部は、ファイル名を展開するためにシェルに渡すことができる)。 の値の一部は、ファイル名を展開するためにシェルに渡すことができる)。               : 普通は同上
		cedit  初期値：Viの既定値: "", Vimの既定値: CTRL-F CTRL-F               : 普通は同上
		コマンドラインモード Command-line Mode で、コマンドラインウィンドウを開くために使われるキー。 で、コマンドラインウィンドウを開くために使われるキー。               : 普通は同上
		オプション 'compatible' がオフならば、既定ではCTRL-F である。 である。               : 普通は同上
		charconvert  初期値："" 初期値：""               : 普通は同上
		文字エンコーディングの変換に使われる expression を定める。これは読み込まれようとしているファイ を定める。これは読み込まれようとしているファイ               : 普通は同上
		ルや書き込みをしたファイルのエンコーディングが、望むものと違うときに評価される。オプション
		'charconvert' の値は、内部関数 iconv() がサポートされ、それによる変換が可能ならば使われること がサポートされ、それによる変換が可能ならば使われること               : 普通は同上
		はない。ずっと高速なため、iconv() の方が好まれる。 の方が好まれる。               : 普通は同上
		cindent  初期値：オフ 初期値：オフ               : 普通は同上
		Cプログラムファイルの自動インデントを始める。挿入モード insert mode で再インデントを引き起こす で再インデントを引き起こす               : 普通は同上
		文字列を指定するにはオプション 'cinkeys' を、好みのインデントスタイルを設定するにはオプション を、好みのインデントスタイルを設定するにはオプション               : 普通は同上
		cinoptions を参照すること。 を参照すること。               : 普通は同上
		cinkeys  初期値："0{,0},0),:,0#,!^F,o,O,e" 初期値："0{,0},0),:,0#,!^F,o,O,e"               : 普通は同上
		再インデントを行わせる文字のリスト。オプション 'cindent' オプションがオンで、かつ 'indentexpr' 'indentexpr'               : 普通は同上
		が空の時のみ使われる。
		cinoptions  初期値："" 初期値：""               : 普通は同上
		C言語のインデント方法を決定する。このオプション 'cinoptions' は、C言語ソース内の行を 'cindent' 'cindent'               : 普通は同上
		で再インデントするときの方法に影響を与える。このオプションの値については|cinoptions-values| を を               : 普通は同上
		、一般的なC言語ソースのインデントの情報については |C-indenting| をそれぞれ参照すること。 をそれぞれ参照すること。               : 普通は同上
		cinwords  初期値："if,else,while,do,for,switch" 初期値："if,else,while,do,for,switch"               : 普通は同上
		行をさらにインデントするキーワード。オプション 'smartindent' オプションか 'cindent' がオンのと がオンのと               : 普通は同上
		き、ここに指定したキーワードの次の行は、さらにインデントされる。 'cindent' がオンのときには、 がオンのときには、               : 普通は同上
		適切な場所 ({} の内側) でのみ機能する。Noteオプション 'ignorecase' オプションは cinwords の値 の値               : 普通は同上
		には適用されないので注意すること。大文字か小文字かを区別したくないなら、値に両方を指定すること
		。
		例:
		"if,If,IF"
		clipboard  初期値：X-windowsでは"autoselect,exclude:cons\|linux"それ以外は、”” 初期値：X-windowsでは"autoselect,exclude:cons\|linux"それ以外は、””               : 普通は同上
		クリップボードの動作設定。このオプションには、コンマ区切りのキーワードのリストを指定する。認識
		されるのは、これらのキーワードである:
		オプション値 動作 動作               : 普通は同上
			これが含まれると、コピー、削除、変更、ペーストなどの操作で、普通なら無名レジスタ
			が使われるところで、全てクリップボードレジスタ "*" が使われるようになる。ただしレ が使われるようになる。ただしレ               : 普通は同上
		unnamed      ジスタ名を陽に指定すれば、オプション 'clipboard' に"unnamed" が含まれているかいな が含まれているかいな               : 普通は同上
			いかに関わらず、指定されたレジスタが使われる。またクリップボードレジスタは、"*と
			いう記法を用いれば常にアクセスできる。
			オプション 'guioptions' の 'a' フラグのように働く: これが含まれると、Visualモード これが含まれると、Visualモード               : 普通は同上
			が開始されるたび、またはVisual選択範囲が変更されるたびに、Vimはウィンドウシステム
			のグローバルなクリップボードのオーナーになろうとするか、選択されたテキストをクリ
		autoselect   ップボード用レジスタ"*を使ってクリップボードにコピーしようとする。詳細については ップボード用レジスタ"*を使ってクリップボードにコピーしようとする。詳細については               : 普通は同上
			|guioptions_a| と |quotestar| を参照すること。GUI機能が有効のときはオプション を参照すること。GUI機能が有効のときはオプション               : 普通は同上
			'guioptions' の 'a' フラグが使用され、無効のときはこの"autoselect" フラグが使用さ フラグが使用さ               : 普通は同上
			れる。また、モードレスなセレクションにも適用される。
		autoselectml "autoselect" と似ているが、モードレスセレクションのみに適用される。オプション と似ているが、モードレスセレクションのみに適用される。オプション               : 普通は同上
			'guioptions' の 'a' フラグと比較してみること。 フラグと比較してみること。               : 普通は同上
			ターミナルの名前 'term' にマッチするパターンを定義する。パターンがマッチすると、X にマッチするパターンを定義する。パターンがマッチすると、X               : 普通は同上
			サーバとの通信がなされなくなる。このオプションは次のようなときに便利である。
			- Vimをコンソールで使用しているとき。 Vimをコンソールで使用しているとき。               : 普通は同上
			- アプリケーションを別のディスプレイで使うため、環境変数 $DISPLaY が設定されてい が設定されてい               : 普通は同上
			るとき。
		exclude:     - コンソールでVimを使用している最中にXサーバが終了させられ、Vimをキルせざるを得な コンソールでVimを使用している最中にXサーバが終了させられ、Vimをキルせざるを得な               : 普通は同上
		{pattern}    いかもしれないとき。 いかもしれないとき。               : 普通は同上
			Xサーバと全く通信しないようにするには、次のようにする:
			exclude:.*
			これは引数 |X| を使用したのと同じ効果を持つ。Note 副作用として、ウィンドウのタイ 副作用として、ウィンドウのタイ               : 普通は同上
			トルは復元されないので注意すること。オプション 'magic' の値は無視され、 {pattern} {pattern}               : 普通は同上
			はオプション 'magic' がオンのように解釈される。残りのオプションの値は {pattern} {pattern}               : 普通は同上
			に適用される。
		cmdheight  初期値：1 初期値：1               : 普通は同上
		コマンドラインに使われるスクリーン上の行数。
		|hit-enter| プロンプトの出現を避けるのに役立つ。 プロンプトの出現を避けるのに役立つ。               : 普通は同上
		cmdwinheight  初期値：7 初期値：7               : 普通は同上
		コマンドライン・ウィンドウに使われるスクリーン上の行数。 |cmdwin| を参照すること。 を参照すること。               : 普通は同上
		columns  初期値：80 またはターミナルの幅 またはターミナルの幅               : 普通は同上
		スクリーン上の列幅。普通このオプションはターミナルの初期化の時点で設定され、手動で設定する必要
		はない。VimがGUI環境内やサイズ変更可能なウィンドウ内で実行されているときは、このオプションを変
		更するとウィンドウサイズも変更されるかもしれない。あなたがこのオプションの値を変更したのに、
		Vimがディスプレイの列幅の物理的な値を変更できなかったら、ディスプレイ表示がめちゃめちゃになる
		おそれがある。
		comments  初期値："s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:&gt;,fb:-" 初期値："s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:&gt;,fb:-"               : 普通は同上
		コメント行の始まりとなる文字列の、コンマ区切りのリスト。 |format-comments| を参照すること。バ を参照すること。バ               : 普通は同上
		ックスラッシュを使って、値にスペースを含める方法については、|option-backslash| を参照すること を参照すること               : 普通は同上
		。
		commentstring  初期値："/*%s*/" 初期値："/*%s*/"               : 普通は同上
		コメント用のテンプレート(雛形)。値の中の "%s" はコメントの内容と置き換えられる。現在のところ、 はコメントの内容と置き換えられる。現在のところ、               : 普通は同上
		折り畳み用のマーカを追加するためにのみ使用されている。|fold-marker| を参照すること。 を参照すること。               : 普通は同上
		compatible  初期値：オン、 .vimrc ファイルが発見されたらオフ ファイルが発見されたらオフ               : 普通は同上
		VimをなるべくVi互換にする。このオプションを有効にすると、Vimの便利な機能が使えなくなる。
		complete  初期値：: ".,w,b,u,t,i" ".,w,b,u,t,i"               : 普通は同上
		キーワード補完に使われる単語を探す場所を指定する。このオプションは、CTRL-P コマンドや CTRL-N CTRL-N               : 普通は同上
		コマンドによるキーワード補完 |ins-completion| の動作を指定する。このオプションは行全体の補完| の動作を指定する。このオプションは行全体の補完|               : 普通は同上
		i_CTRL-X_CTRL-L| にも適用される。このオプションは補完の方法と、キーワード検索の対象となる場所 にも適用される。このオプションは補完の方法と、キーワード検索の対象となる場所               : 普通は同上
		を示す、コンマ区切りのフラグのリストである。
		オプシ  動作 動作               : 普通は同上
		ョン値
		.       カレントバッファから検索 (オプション 'wrapscan' の値は無視) の値は無視)               : 普通は同上
		w       別のウィンドウ内のバッファから検索 別のウィンドウ内のバッファから検索               : 普通は同上
		b       バッファリスト内の、現在読み込まれている別のバッファから検索 バッファリスト内の、現在読み込まれている別のバッファから検索               : 普通は同上
		u       バッファリスト内の、現在読み込まれていない別のバッファから検索 バッファリスト内の、現在読み込まれていない別のバッファから検索               : 普通は同上
		U       バッファリストにないバッファから検索 バッファリストにないバッファから検索               : 普通は同上
		k       オプション 'dictionary' で指定されたファイルから検索 で指定されたファイルから検索               : 普通は同上
		k{dict} {dict} で与えられたファイルから検索。 "k" フラグを複数指定してもよい。ファイル名はパタ フラグを複数指定してもよい。ファイル名はパタ               : 普通は同上
			ーンでも指定できる :set cpt=k/usr/dict/*,k~/spanish cpt=k/usr/dict/*,k~/spanish               : 普通は同上
		s       オプション 'thesaurus' で指定されたファイルから検索 で指定されたファイルから検索               : 普通は同上
		s{str}  {str} で与えられたファイルから検索。 "s" フラグを複数指定してもよい。ファイル名はパタ フラグを複数指定してもよい。ファイル名はパタ               : 普通は同上
			ーンでも指定できる。
		i       カレントファイルとインクルードされるファイルから検索 カレントファイルとインクルードされるファイルから検索               : 普通は同上
		d       カレントファイルとインクルードされるファイルから、定義された名前またはマクロを検索 カレントファイルとインクルードされるファイルから、定義された名前またはマクロを検索               : 普通は同上
		]       タグ補完 タグ補完               : 普通は同上
		t       "]" と同じ と同じ               : 普通は同上
		confirm  初期値：オフ 初期値：オフ               : 普通は同上
		ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出すオプション。オプション
		'confirm' がオンならば、バッファへの変更を保存していないと実行に失敗する操作 (つまり ":q" と と               : 普通は同上
		":e") の際、ダイアログ |dialog| を開いてファイルを保存するかどうか尋ねる。これがオンになってい を開いてファイルを保存するかどうか尋ねる。これがオンになってい               : 普通は同上
		ても、意図的に変更を廃棄したいなら ! を使える。オプション 'confirm' がオフでも、|:confirm| コ コ               : 普通は同上
		マンドで個別に確認を求めることができる (これはキーマッピングでとても便利である)。関数 |confirm |confirm               : 普通は同上
		()| とオプション 'guioptions' の 'v' フラグも参照すること。 フラグも参照すること。               : 普通は同上
		conskey  初期値：オフ 初期値：オフ               : 普通は同上
		キーボードの文字を受け取るのに直接コンソール出入力が使う。このオプションがオンのとき、キーボー
		ドの文字を受け取るのに直接コンソール出入力が使われる。これはたいていの場合有効である。|
		'bioskey'| も参照すること。合わせて、3種類のコンソール入力が使える: も参照すること。合わせて、3種類のコンソール入力が使える:               : 普通は同上
		cpoptions  初期値：Vimは "aaBceFs", Viでは全てのフラグ Viでは全てのフラグ               : 普通は同上
		個別の機能をVi互換にする。 1文字のフラグの列で設定する。フラグが設定されると、対応する動作がVi 1文字のフラグの列で設定する。フラグが設定されると、対応する動作がVi               : 普通は同上
		互換になる。このオプションは、大部分、またはある程度のVi互換が求められるときに使われる。
		cscopepathcomp  初期値：0 初期値：0               : 普通は同上
		タグのリストの中でいくつのパスのコンポーネントを表示するかを指定する。 |cscopepathcomp| を参照 を参照               : 普通は同上
		すること。
		cscopeprg  初期値："cscope" 初期値："cscope"               : 普通は同上
		Cscope を実行するコマンド名を指定する。 |cscopeprg| を参照すること。安全上の理由から、このオプ を参照すること。安全上の理由から、このオプ               : 普通は同上
		ションをモードライン |modeline| から設定することはできない。 から設定することはできない。               : 普通は同上
		cscopetag  初期値：オフ 初期値：オフ               : 普通は同上
		タグコマンドに cscope を使う。 |cscope-options| を参照すること。NOTE: このオプションはオプショ このオプションはオプショ               : 普通は同上
		ン 'compatible' がオンに設定されたときにオフに設定されるので注意すること。 がオンに設定されたときにオフに設定されるので注意すること。               : 普通は同上
		cscopetagorder  初期値：0 初期値：0               : 普通は同上
		コマンド ":cstag" が検索を行う順番を指定する。 |cscopetagorder| を参照すること。 を参照すること。               : 普通は同上
		cscopeverbose  初期値：オフ 初期値：オフ               : 普通は同上
		Cscope のデータベースに情報を追加するときメッセージを表示する。 |cscopeverbose| を参照すること を参照すること               : 普通は同上
		。
		debug  初期値："" 初期値：""               : 普通は同上
		値が "msg" に設定されると、省かれるはずのエラーメッセージも表示されるようになる。これはオプシ に設定されると、省かれるはずのエラーメッセージも表示されるようになる。これはオプシ               : 普通は同上
		ョン 'foldexpr' オプションや 'indentexpr' をデバッグするのに便利である。 をデバッグするのに便利である。               : 普通は同上
		define  初期値："^#\s*define" 初期値："^#\s*define"               : 普通は同上
		マクロ定義を発見するのに使われるパターンを指定する。値はコマンド "/" で使うのと同様の検索パタ で使うのと同様の検索パタ               : 普通は同上
		ーンである。このオプションはコマンド "[i" やコマンド "[d" など |include-search| に使われる。オ に使われる。オ               : 普通は同上
		プション 'isident' はマッチした部分の後の定義された名前を認識するのに使われる: はマッチした部分の後の定義された名前を認識するのに使われる:               : 普通は同上
		delcombine  初期値：オフ 初期値：オフ               : 普通は同上
		ユニコードのファイルを編集するときの文字の削除方法。ユニコードのファイルを編集する際にこのオプ
		ションがオンならば、バックスペースとNormalモードのコマンド "x" はそれぞれの文字の上の はそれぞれの文字の上の               : 普通は同上
		combining character のみを削除する。オフのときは (これが既定値である) combining character と文 と文               : 普通は同上
		字は同時に削除される。
		dictionary  初期値："" 初期値：""               : 普通は同上
		キーワード補完コマンドで使われる単語の書かれた辞書ファイル。コンマ区切りのファイル名のリスト。
		キーワード補完コマンド|i_CTRL-X_CTRL-K| 用の単語を探すために使われる。単語のリストからなるファ 用の単語を探すために使われる。単語のリストからなるファ               : 普通は同上
		イルを指定する。その中では1行ごとに1語が並べられていてもよいし、1行にキーワードでない文字 (空 (空               : 普通は同上
		白文字を推奨) で区切られた数語が並んでいてもよい。1行の文字数の最大値は510バイト分である。 で区切られた数語が並んでいてもよい。1行の文字数の最大値は510バイト分である。               : 普通は同上
		diff  初期値：オフ 初期値：オフ               : 普通は同上
		カレントウィンドウをファイル間の差異を示すウィンドウのグループに組み入れる。 |vimdiff| を参照 を参照               : 普通は同上
		すること。
		diffexpr  初期値："" 初期値：""               : 普通は同上
		2個のファイル間の差異を求める際に、ed形式のdiffファイルを求めるために評価されるexpressionを指
		定する。 |diff-diffexpr| を参照すること。 を参照すること。               : 普通は同上
		diffopt  初期値："filler" 初期値："filler"               : 普通は同上
		Diffモード用のオプションを設定する。このオプションの値には、以下の文字列をコンマで区切ったもの
		が設定できる。
			片方のウィンドウ内のテキストのある位置に行が挿入されていたときに、ウィンドウのスクロ
		filler   ールを同調させるために、埋め立て用の行を表示する。ウィンドウが隣り合っていて、 ールを同調させるために、埋め立て用の行を表示する。ウィンドウが隣り合っていて、               : 普通は同上
			'scrollbind' オプションがオンのときには大抵便利である。 オプションがオンのときには大抵便利である。               : 普通は同上
		context: 変更のあった行と、変更がなく折り畳まれている行の間に、{n} 行分の「コンテキスト」を表 行分の「コンテキスト」を表               : 普通は同上
		{n}      示する。これが設定されていないと、コンテキストは6行になる。|fold-diff| を参照すること を参照すること               : 普通は同上
			。
		icase    テキストの大文字と小文字の違いを無視する。"a"と "a" は同じものと見なされる。 は同じものと見なされる。               : 普通は同上
			'diffexpr' オプションの値が空なら、コマンド "diff" に "-i" フラグを追加する。 フラグを追加する。               : 普通は同上
			空白の数の違いを無視する。'diffexpr' オプションの値が空なら、コマンド "diff" に "-b" "-b"               : 普通は同上
		iwhite   フラグを追加する。これが正確には何を指定しているのかについてはコマンド "diff" のドキ のドキ               : 普通は同上
			ュメントを参照すること。これは後ろに追加された空白は無視するが、前に追加された空白は
			無視しないはずである。
		digraph  初期値：オフ 初期値：オフ               : 普通は同上
		Insertモードで{char1} &lt;BS&gt; {char2} でダイグラフを入力できるようにする。 |digraphs| を参 を参               : 普通は同上
		照すること。
		directory  初期値：amigaでの既定値: ".,t:",Win32は".,c:\tmp,c:\temp"、UNIXは".,~/tmp,/var/tmp,/tmp" ".,t:",Win32は".,c:\tmp,c:\temp"、UNIXは".,~/tmp,/var/tmp,/tmp"               : 普通は同上
		スワップファイル用のディレクトリ名を、コンマで区切って指定する。
		例
		set directory=$HOME/backup directory=$HOME/backup               : 普通は同上
		display  初期値："" 初期値：""               : 普通は同上
		テキスト表示の方法を変える。値はフラグのコンマ区切りのリストである:
		オプショ 動作 動作               : 普通は同上
		ン値
		lastline これが含まれると、ウィンドウの最後の行ができる限りまで表示される。含まれないと、最後 これが含まれると、ウィンドウの最後の行ができる限りまで表示される。含まれないと、最後               : 普通は同上
			の行が収まりきらないならその行は "@" と表示される。 と表示される。               : 普通は同上
		uhex     印刷できない文字を &lt;xx&gt; という形式で16進数表示し、^C や ~C の形式を使わない。 の形式を使わない。               : 普通は同上
		eadirection  初期値："both" 初期値："both"               : 普通は同上
		オプション 'equalalways' の動作 の動作               : 普通は同上
		オプション値 動作 動作               : 普通は同上
		ver          ウィンドウの高さにのみ影響がある ウィンドウの高さにのみ影響がある               : 普通は同上
		hor          ウィンドウの幅にのみ影響がある ウィンドウの幅にのみ影響がある               : 普通は同上
		both         ウィンドウの高さと幅、両方に影響がある ウィンドウの高さと幅、両方に影響がある               : 普通は同上
		edcompatible  初期値：オフ 初期値：オフ               : 普通は同上
		edとの互換。コマンド ":substitute" のフラグ 'g' とフラグ 'c' を、次に別の方を指定するまでずっ を、次に別の方を指定するまでずっ               : 普通は同上
		と効力を持つようにする。|complex-change| を参照すること。 を参照すること。               : 普通は同上
		encoding  初期値："latin1"または環境変数 $LaNG によって決まる値 によって決まる値               : 普通は同上
		Vimの通常使う文字エンコーディング。 Vim内部で使われる文字エンコーディングを設定する。そのエン Vim内部で使われる文字エンコーディングを設定する。そのエン               : 普通は同上
		コーディングはバッファやレジスタ内のテキスト、expression内の文字列、 viminfo ファイル内のテキ ファイル内のテキ               : 普通は同上
		ストなどに適用される。つまり、このオプションはVimの通常扱う文字の種類を設定する。指定できる値
		については |encoding-names| を参照すること。 を参照すること。               : 普通は同上
		endofline  初期値：オン 初期値：オン               : 普通は同上
		ファイルの最後に&lt;EOL&gt;をつける。ファイルを書き込むときに、このオプションがオフでオプショ
		ン 'binary' がオンならば、ファイルの最終行に &lt;EOL&gt; が書き込まれない。このオプションはフ が書き込まれない。このオプションはフ               : 普通は同上
		ァイルの編集を始めるときには自動的にオンになる。ただし編集を始めたファイルの最終行に &lt;EOL& &lt;EOL&               : 普通は同上
		gt; がないときにはオフになる。普通はユーザがこのオプションを設定する必要はない。オプション がないときにはオフになる。普通はユーザがこのオプションを設定する必要はない。オプション               : 普通は同上
		'binary' がオフのときはこのオプションの値は使われない。オプション 'binary' がオンのときには、 がオンのときには、               : 普通は同上
		ファイルの最終行に &lt;EOL&gt; があったかどうかを復元するためにこのオプションが使われる。その があったかどうかを復元するためにこのオプションが使われる。その               : 普通は同上
		ため、ユーザがファイルを書き込むときに元のファイルの状態を保つことができる。しかし状態を変更す
		ることもできる。
		equalalways  初期値：オン 初期値：オン               : 普通は同上
		全てのウィンドウのサイズを同じにする。オンのとき、ウィンドウを分割したり閉じたりした後、全ての
		ウィンドウが自動的に同じサイズになる。オフのときは、ウィンドウを分割するとカレントウィンドウの
		サイズだけが減り、他のウィンドウに変化はない。ウィンドウを閉じると、(オプション 'splitbelow' 'splitbelow'               : 普通は同上
		と 'splitright' の値に従って) 閉じたウィンドウの隣のウィンドウの行数が増す。水平に分割されたウ 閉じたウィンドウの隣のウィンドウの行数が増す。水平に分割されたウ               : 普通は同上
		ィンドウと垂直に分割されたウィンドウが混ざっているときは、サイズの最小値が計算され、いくつかの
		ウィンドウは (余裕があれば)大きくなる。オプション 'eadirection' はサイズの変化する方向を指定す はサイズの変化する方向を指定す               : 普通は同上
		る。
		equalprg  初期値："" 初期値：""               : 普通は同上
		コマンド "=" に使う外部プログラムを指定する。値が空のときは内部関数が整形に使われる (オプショ (オプショ               : 普通は同上
		ン 'lisp', 'cindent' または 'indentexpr')。環境変数は展開される |:set_env|。値に空白やバックス |:set_env|。値に空白やバックス               : 普通は同上
		ラッシュを含めることについては |option-backslash| を参照すること。 を参照すること。               : 普通は同上
		errorbells  初期値：オフ 初期値：オフ               : 普通は同上
		エラーメッセージに伴ってベル (ビープ音または画面フラッシュ) を発生させる。このオプションはエラ を発生させる。このオプションはエラ               : 普通は同上
		ーメッセージにのみ適用され、メッセージのない多くのエラー (例えばNormalモードで &lt;ESC&gt; を を               : 普通は同上
		打ち込んだとき) についてはベルは常に使用される。ベルをビープ音にしたり、画面フラッシュにしたり についてはベルは常に使用される。ベルをビープ音にしたり、画面フラッシュにしたり               : 普通は同上
		、無効にしたりするためにはオプション 'visualbell' を参照すること。 を参照すること。               : 普通は同上
		errorfile  初期値：通常は、"errors.err"、amigaでは"aztecC.Err", 初期値：通常は、"errors.err"、amigaでは"aztecC.Err",               : 普通は同上
		QuickFixモードで使われるエラーファイルの名前 (|:cf| を参照すること)。コマンドライン引数 "-q" "-q"               : 普通は同上
		が指定されたときは、オプション 'errorfile' の値はそれに続く値に設定される。|-q| を参照すること を参照すること               : 普通は同上
		。
		errorformat  初期値：既定値はとても長い 初期値：既定値はとても長い               : 普通は同上
		エラーファイルの内容の書式を、関数 scanf 風に指定する (|errorformat|を参照すること)。 (|errorformat|を参照すること)。               : 普通は同上
		esckeys  初期値：Vimの既定値: オン, Viの既定値: オフ オフ               : 普通は同上
		&lt;Esc&gt; で始まるファンクションキーもInsertモードで認識されるようになる。このオプションをオ で始まるファンクションキーもInsertモードで認識されるようになる。このオプションをオ               : 普通は同上
		ンに設定すると、&lt;Esc&gt; で始まるファンクションキーもInsertモードで認識されるようになる。こ で始まるファンクションキーもInsertモードで認識されるようになる。こ               : 普通は同上
		のオプションがオフのときは、カーソルキーとファンクションキーは、&lt; Esc&gt; で始まるなら で始まるなら               : 普通は同上
		Insertモードで使うことができない。こうすることの利点は、 &lt;Esc&gt; を一回打ち込むだけですぐ を一回打ち込むだけですぐ               : 普通は同上
		に認識され、1秒ほど待つ必要がないことだ。このオプションをオフにしなくても、オプション
		'timeoutlen' とオプション 'ttimeoutlen' の値を変更してもいいかもしれない。 の値を変更してもいいかもしれない。               : 普通は同上
		eventignore  初期値："" 初期値：""               : 普通は同上
		autocommandのイベント名のうち、無視したいものをリストにして指定する。値が "all" に設定されると に設定されると               : 普通は同上
		、全ての autocommand のイベントが無視され、autocommand は実行されなくなる。 は実行されなくなる。               : 普通は同上
		expandtab  初期値：オフ 初期値：オフ               : 普通は同上
		Insertモードで: &lt;Tab&gt; を挿入するのに、適切な数の空白を使う。また、コマンド '&gt;' や '& '&               : 普通は同上
		lt;' によるインデントや、オプション 'autoindent' がオンのときのインデントでも空白を使う。オプ がオンのときのインデントでも空白を使う。オプ               : 普通は同上
		ション 'expandtab' がオンのときに本当のタブを挿入するには、CTRL-V&lt;Tab&gt; を使うこと。 を使うこと。               : 普通は同上
		|:retab| と|ins-expandtab| も参照すること。 も参照すること。               : 普通は同上
		exrc  初期値：オフ 初期値：オフ               : 普通は同上
		カレントディレクトリ内のファイル .vimrc, .exrc や .gvimrc などの読み込みを行う。このオプション などの読み込みを行う。このオプション               : 普通は同上
		をオンにするなら、オプション 'secure' もオンにするよう検討すること (|initialization| を参照す を参照す               : 普通は同上
		ること)。ファイル.exrc, .vimrc や .gvimrc でローカルなものを用いると潜在的な安全保護の漏れを招 でローカルなものを用いると潜在的な安全保護の漏れを招               : 普通は同上
		くので、注意して使うこと！
		fileencoding  初期値："" 初期値：""               : 普通は同上
		カレントバッファ内のファイルの文字エンコーディングを設定する。オプション 'fileencoding' の値が の値が               : 普通は同上
		オプション 'encoding' の値と異なるとき、ファイルの読み書きの際に文字エンコーディングの変換が行 の値と異なるとき、ファイルの読み書きの際に文字エンコーディングの変換が行               : 普通は同上
		われる。
		fileencodings  初期値："ucs-bom", オプション 'encoding' の値がユニコードに設定されたときは の値がユニコードに設定されたときは               : 普通は同上
		"ucs-bom,utf-8,latin1"
		Vimが表示できる文字エンコーディングのリスト。このオプションには、ファイルの編集時に考慮される
		文字エンコーディングのリストを指定する。ファイルが読み込まれたとき、Vimはこのオプションの値の
		先頭の文字エンコーディングを使おうとする。そのときエラーが発見されると、値のリスト内で次に並ん
		でいるエンコーディングが試される。有効なエンコーディングが見つかると、オプション
		'fileencoding' の値がそれに設定される。全て失敗した場合は、オプション 'fileencoding' の値は空 の値は空               : 普通は同上
		に設定される。これはオプション 'encoding' の値が使われていることを表す。 の値が使われていることを表す。               : 普通は同上
		例：
		set fileencodings=iso-2022-jp,cp932,euc-jp,utf-8,utf-16,ucs-2-internal,ucs-2 fileencodings=iso-2022-jp,cp932,euc-jp,utf-8,utf-16,ucs-2-internal,ucs-2               : 普通は同上
		fileformat  初期値：MS-DOS, MS-Windows, OS/2 での既定値: "dos", UNIXでは、”unix”, Macintoshは、”mac” Macintoshは、”mac”               : 普通は同上
		改行コードの指定。バッファにファイルを読み込んだり、バッファからファイルに書き込んだりするとき
		に使われる &lt;EOL&gt; を、カレントバッファについて設定する。 を、カレントバッファについて設定する。               : 普通は同上
		オプション値 動作 動作               : 普通は同上
		dos          &lt;CR&gt;&lt;NL&gt; &lt;CR&gt;&lt;NL&gt;               : 普通は同上
		unix         &lt;NL&gt; &lt;NL&gt;               : 普通は同上
		mac          &lt;CR&gt; &lt;CR&gt;               : 普通は同上
		fileformats  初期値：MS-DOS, MS-Windows OS/2: "dos,unix", Unix: "unix,dos", Mac: "mac,unix,dos", Cygwin: Cygwin:               : 普通は同上
		"unix,dos", others: "" ""               : 普通は同上
		Vimが認識できるファイルフォーマットのリスト。
		例：
		set fileformats=unix,dos fileformats=unix,dos               : 普通は同上
		filetype  初期値："" 初期値：""               : 普通は同上
		開いているファイルのタイプ。このファイルタイプにより、強調表示などがされる。
		fillchars  初期値："vert:|,fold:-" 初期値："vert:|,fold:-"               : 普通は同上
		ステータスライン、縦のウィンドウスプリッタ、フォールドなどの空白文字を埋める文字。
		例：
		fillchars=vert:|,fold:-,stl:-
		オプション値 動作 動作               : 普通は同上
		stc:c        アクティブなバッファのステータスライン アクティブなバッファのステータスライン               : 普通は同上
		stlnc:c      アクティブではないバッファのステータスライン アクティブではないバッファのステータスライン               : 普通は同上
		vert:c       縦方向のスプリッタ 縦方向のスプリッタ               : 普通は同上
		fold:c       フォールド フォールド               : 普通は同上
		diff:c       ディフの削除された行 ディフの削除された行               : 普通は同上
		fkmap  初期値：オフ 初期値：オフ               : 普通は同上
		Farsi用のキーボードマッピングのON/OFF。
		foldclose  初期値："" 初期値：""               : 普通は同上
		フォールドを自動的にクローズする。 allに設定するとカーソルがフォールドの外にでると、自動的にフ allに設定するとカーソルがフォールドの外にでると、自動的にフ               : 普通は同上
		ォールドされる。
		foldcolumn  初期値：0 初期値：0               : 普通は同上
		ウィンドウの端に確保される折畳を示すカラムの幅を指定する数。 0ならば、折畳表示カラムは確保され 0ならば、折畳表示カラムは確保され               : 普通は同上
		ない。通常は4から5が一般的。使い物になる最小値は2。最大値は12。
		foldenable  初期値：オフ 初期値：オフ               : 普通は同上
		フォールドの有効/無効。 :set foldenable でフォールドされる。 :set nofoldenable でフォールドが でフォールドが               : 普通は同上
		解除される。
		foldexpr  初期値："0" 初期値："0"               : 普通は同上
		フォールドレベルを計算するスクリプト。タブで始まる一連の行範囲を1つの折畳にまとめる:
		:set foldexpr=getline(v:lnum)[0]==\"\\t\" foldexpr=getline(v:lnum)[0]==\"\\t\"               : 普通は同上
		折畳レベルを計算するのにVimスクリプトの関数を呼び出す:
		:set foldexpr=MyFoldLevel(v:lnum) foldexpr=MyFoldLevel(v:lnum)               : 普通は同上
		空行で仕切られた「段落」を折畳とする:
		:set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1 foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1               : 普通は同上
		同じ事(「段落」を折畳に)をする別の表現:
		:set foldexpr=getline(v:lnum-1)=~'^\\s*$'&&getline(v:lnum)=~'\\S'?'>1':1 foldexpr=getline(v:lnum-1)=~'^\\s*$'&&getline(v:lnum)=~'\\S'?'>1':1               : 普通は同上
		foldignore  初期値："#" 初期値："#"               : 普通は同上
		フォールドのインデントを無視する行の先頭の文字。
		foldlevel  初期値：0 初期値：0               : 普通は同上
		フォールドするレベル。 'foldlevel'が0の時には、全ての折畳が閉じられる。 'foldlevel'が正の時に 'foldlevel'が正の時に               : 普通は同上
		は、設定値より大きなレベルの折畳が閉じられる。 'foldlevel'が非常に大きい時は、全ての折畳が開か 'foldlevel'が非常に大きい時は、全ての折畳が開か               : 普通は同上
		れる。 'foldlevel'は変更された時に適用される。その後に手動で折畳を開いたり閉じたりできる。値を 'foldlevel'は変更された時に適用される。その後に手動で折畳を開いたり閉じたりできる。値を               : 普通は同上
		増やした時には、新しいレベルの値以上の折畳が開かれる。手動で開かれていた折畳は閉じられない。値
		を減らした時には、新しいレベルの値以上の折畳が閉じられる。手動で閉じられていた折畳は開かれない
		。
		foldlevelstart  初期値：-1 初期値：-1               : 普通は同上
		ファイルを開いたときのフォールドレベルの値。ファイルを開いたときに、foldlevelの値をこのオプシ
		ョンの値にする。
		foldmarker  初期値："{{{,}}}" 初期値："{{{,}}}"               : 普通は同上
		フォールドする最初と最後の文字を設定する。 foldmethodがmakerの場合に、このオプションで指定した foldmethodがmakerの場合に、このオプションで指定した               : 普通は同上
		文字をフォールドの開始と終了とする。
		例：
		set foldmaker={{{,}}} foldmaker={{{,}}}               : 普通は同上
		# {{{1 レベル１の折り畳み レベル１の折り畳み               : 普通は同上
		#
		# レベル１の内容 レベル１の内容               : 普通は同上
		#
		# {{{2 レベル２の折り畳み レベル２の折り畳み               : 普通は同上
		#
		# レベル２の内容 レベル２の内容               : 普通は同上
		#
		# }}} }}}               : 普通は同上
		# }}} }}}               : 普通は同上
		foldmethod  初期値："manual" 初期値："manual"               : 普通は同上
		フォールドする種類
		オプシ 動作 動作               : 普通は同上
		ョン値
		manual 折畳領域を定義するためにコマンドを手動で利用する。これはテキスト中の折畳を行なう箇所を 折畳領域を定義するためにコマンドを手動で利用する。これはテキスト中の折畳を行なう箇所を               : 普通は同上
			スクリプトにより解析するのに使うこともできる。
		indent 折畳は各行のインデントにより自動的に定義される。 折畳は各行のインデントにより自動的に定義される。               : 普通は同上
		expr   折畳は"indent"方式のように、折畳レベルによって自動的に定義される。'foldexpr'オプション 折畳は"indent"方式のように、折畳レベルによって自動的に定義される。'foldexpr'オプション               : 普通は同上
			の値は、各行についてこの折畳レベルを計算するためにスクリプトとして実行される。
		marker 'foldmaker'で指定したマーカの範囲。 'foldmaker'で指定したマーカの範囲。               : 普通は同上
		syntax 折畳が"fold"引数を持つ構文要素によって定義される。 折畳が"fold"引数を持つ構文要素によって定義される。               : 普通は同上
			テキストの変更された箇所とその近辺以外が自動的に折畳として定義される。この方法は現在の
		diff   ウィンドウに対して'diff'オプションが設定されている時にだけ正しく働き、変更点が表示され ウィンドウに対して'diff'オプションが設定されている時にだけ正しく働き、変更点が表示され               : 普通は同上
			る。そうでない場合バッファ全体が1つの大きな折畳となる。
		foldminlines  初期値：1 初期値：1               : 普通は同上
		折り畳む最小行数。 'foldminlines'よりも少ない行数の折畳は常に開いたように表示される。 'foldminlines'よりも少ない行数の折畳は常に開いたように表示される。               : 普通は同上
		foldnestmax  初期値：20 初期値：20               : 普通は同上
		折り畳むネストの最大値。 foldmetiodをindent, syntaxにしたときの入れ子の最大値。 syntaxにしたときの入れ子の最大値。               : 普通は同上
		foldopen  初期値："block,hor,mark,percent,quickfix,search,tag,undo" 初期値："block,hor,mark,percent,quickfix,search,tag,undo"               : 普通は同上
		カーソルが移動したときに自動的に折り畳みを開く
		オプション値 動作 動作               : 普通は同上
		all          全て 全て               : 普通は同上
		block        "(", "{", "[[", "[{", etc. etc.               : 普通は同上
		hor          横への移動 "|", "w", "fx", etc. etc.               : 普通は同上
		insert       挿入動作 挿入動作               : 普通は同上
		jump         ジャンプ ジャンプ               : 普通は同上
		mark         マーク位置へのジャンプ マーク位置へのジャンプ               : 普通は同上
		percent      %での移動 %での移動               : 普通は同上
		quickfix     ":cn", ":crew", ":make", etc. etc.               : 普通は同上
		search       検索結果にヒットした場合 検索結果にヒットした場合               : 普通は同上
		tag          タグジャンプ タグジャンプ               : 普通は同上
		undo         アンドゥ アンドゥ               : 普通は同上
		foldtext  初期値："foldtext()" 初期値："foldtext()"               : 普通は同上
		閉じられた折り畳みを示すテキストを得るために実行されるスクリプト
		例
		:set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g') foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')               : 普通は同上
		これは折畳の最初の1行を、"/*" と "*/" を追加し"{{{"を削除して表示する。多めのバックスラッシュ を追加し"{{{"を削除して表示する。多めのバックスラッシュ               : 普通は同上
		(\ 記号)はある文字が":set"コマンドに解釈されてしまうのを避けるために使用されている。これは以下 記号)はある文字が":set"コマンドに解釈されてしまうのを避けるために使用されている。これは以下               : 普通は同上
		のように関数を定義するとより簡単になる:
		:set foldtext=MyFoldText() foldtext=MyFoldText()               : 普通は同上
		:function MyFoldText() MyFoldText()               : 普通は同上
		:  let line = getline(v:foldstart) getline(v:foldstart)               : 普通は同上
		:  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g') 'g')               : 普通は同上
		:  return v:folddashes . sub sub               : 普通は同上
		:endfunction
		formatoptions  初期値：Vim : "tcq", Vi : "vt" "vt"               : 普通は同上
		Vimがテキストを整形する方法を決定するオプションのリスト。
		オプション  動作 動作               : 普通は同上
		値
		t           textwidthを使ってテキストを自動折返しする。 textwidthを使ってテキストを自動折返しする。               : 普通は同上
		c           現在のコメント指示を挿入して、textwidthを使ってコメントを自動折返しする。 現在のコメント指示を挿入して、textwidthを使ってコメントを自動折返しする。               : 普通は同上
		r           挿入モードで&lt;return&gt;を打った後に、現在のコメント指示を自動的に挿入する。 挿入モードで&lt;return&gt;を打った後に、現在のコメント指示を自動的に挿入する。               : 普通は同上
		o           ノーマルモードで'o'、'O'を打った後に、現在のコメント指示を自動的に挿入する。 ノーマルモードで'o'、'O'を打った後に、現在のコメント指示を自動的に挿入する。               : 普通は同上
		q           "gq"によるコメントの整形を可能にする。 "gq"によるコメントの整形を可能にする。               : 普通は同上
		2           テキストの整形処理時、段落の最初の行ではなく２番目の行のインデントをそれ以降の行に テキストの整形処理時、段落の最初の行ではなく２番目の行のインデントをそれ以降の行に               : 普通は同上
			対して使う。
		v           挿入モードでVi互換の自動折返しを使う現在の挿入モードで入力された空白でのみ折返しが 挿入モードでVi互換の自動折返しを使う現在の挿入モードで入力された空白でのみ折返しが               : 普通は同上
			行われる。
		b           'v'と同じ、ただし空白の入力か折返しマージンの前でのみ自動折返しをする。 'v'と同じ、ただし空白の入力か折返しマージンの前でのみ自動折返しをする。               : 普通は同上
		l           挿入モードでは長い行は折り返されない。 挿入モードでは長い行は折り返されない。               : 普通は同上
		formatprg  初期値："" 初期値：""               : 普通は同上
		gqコマンドで実行されるプログラム。
		gdefault  初期値：オフ 初期値：オフ               : 普通は同上
		:sコマンドで'g'オプションをデフォルトにする。このオプションがONになっていると、 :s/pat/ret/ で で               : 普通は同上
		:s/pat/ret/g と同じ動きになる。 と同じ動きになる。               : 普通は同上
		grepformat  初期値："%f:%l%m,%f %l%m" %l%m"               : 普通は同上
		grepの出力形式を指定する。このオプションで指定した形式と、grepの出力が一致しないと、grep結果へ
		のジャンプができなくなる。
		grepprg  初期値："grep -n ", ",               : 普通は同上
		:grep で実行されるプログラム。 で実行されるプログラム。               : 普通は同上
		guicursor  初期値："n-v-c:block-Cursor/lCursor, 初期値："n-v-c:block-Cursor/lCursor,               : 普通は同上
		カーソルの形状をVimに教える以下のように指定する。
		mode-list:argment-list,mode-list:argment-list:mode-list:argment-list・・・
		mode-listには、下表の値を'-'で区切って指定できる。
		オプション値 動作 動作               : 普通は同上
		n            ノーマルモード ノーマルモード               : 普通は同上
		v            ビジュアルモード ビジュアルモード               : 普通は同上
		ve           ビジュアルモード（selectionオプションの値がexclusiveになっている場合） ビジュアルモード（selectionオプションの値がexclusiveになっている場合）               : 普通は同上
		o            オペレータ待機モード（dやcを打った後） オペレータ待機モード（dやcを打った後）               : 普通は同上
		i            挿入モード 挿入モード               : 普通は同上
		r            置換モード 置換モード               : 普通は同上
		c            コマンドラインのノーマルモード コマンドラインのノーマルモード               : 普通は同上
		ci           コマンドラインの挿入モード コマンドラインの挿入モード               : 普通は同上
		cr           コマンドラインの置換モード コマンドラインの置換モード               : 普通は同上
		sm           文字を打ち込んだときに対応する(などを表示したとき 文字を打ち込んだときに対応する(などを表示したとき               : 普通は同上
		a            全てのモード 全てのモード               : 普通は同上
		argment-listには、下表の値を指定できる。
		オプション値 動作 動作               : 普通は同上
		hor{N}       水平カーソル(縦につぶれた)、Nで高さを％単位で指定できる 水平カーソル(縦につぶれた)、Nで高さを％単位で指定できる               : 普通は同上
		ver{N}       垂直カーソル(横につぶれた)、Nで幅を％単位で指定できる 垂直カーソル(横につぶれた)、Nで幅を％単位で指定できる               : 普通は同上
		block        ブロックカーソル ブロックカーソル               : 普通は同上
		blinkwait{N} 点滅するまでの時間をNで指定する 点滅するまでの時間をNで指定する               : 普通は同上
		blinkon{N}   点滅の点灯状態の時間をNで指定する 点滅の点灯状態の時間をNで指定する               : 普通は同上
		blinkoff{N}  点滅の消灯状態の時間をNで指定する 点滅の消灯状態の時間をNで指定する               : 普通は同上
		例：
		set guicursor=n-v-c:blinkwait1000-blinkoff500-blinkon300 guicursor=n-v-c:blinkwait1000-blinkoff500-blinkon300               : 普通は同上
		n(ノーマルモード)-v(ビジュアルモード)-c(CUIでのノーマルモード)中は、点滅の開始まで1秒待って、
		点灯時間500ms、消灯時間300msで点滅する。
		guifont  初期値："" 初期値：""               : 普通は同上
		GUIでのフォント
		guifontset  初期値："" 初期値：""               : 普通は同上
		使用されるフォントのリスト空でない場合、使用される2つの(あるいはより多くの)フォントを指定しま
		す。１つめは、英語用のフォント、２つ目はあなたの特別の言語用のもの。
		guifontwide  初期値："" 初期値：""               : 普通は同上
		全角文字のために使用されるフォントのリスト
		guiheadroom  初期値：50 初期値：50               : 普通は同上
		GUIウィンドウを表示する際に、ディスプレイの大きさから引くピクセル数設定したピクセル数をディス
		プレイの高さから引いてウィンドウを作成する。
		guioptions  初期値："gmrLtT" (MS-Windows),"agimrLtT" (GTK, Motif and athena) athena)               : 普通は同上
		GUI用のオプション
		オプショ 動作 動作               : 普通は同上
		ン値
		a        ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーション ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーション               : 普通は同上
			とクリップボードを共有するオプション。
		a        "a"に似ているが、コマンドラインで選択したときか、CTRL+SHIFTを押しながらマウスで選択し "a"に似ているが、コマンドラインで選択したときか、CTRL+SHIFTを押しながらマウスで選択し               : 普通は同上
			たときに共有のクリップボードを使用する。
		c        簡単な質問をポップアップダイアログではなく、コンソールを使うようにする。 簡単な質問をポップアップダイアログではなく、コンソールを使うようにする。               : 普通は同上
		f        シェルから実行されたときにfork()しない。-fオプションで起動したのと同じ。 シェルから実行されたときにfork()しない。-fオプションで起動したのと同じ。               : 普通は同上
		i        Vimのアイコンを使用する。 Vimのアイコンを使用する。               : 普通は同上
		m        メニューを表示する。 メニューを表示する。               : 普通は同上
		M        "$VIMRUNTIME/menu.vim"を読み込まなくする "$VIMRUNTIME/menu.vim"を読み込まなくする               : 普通は同上
		g        使用できないメニューをグレー表示する 使用できないメニューをグレー表示する               : 普通は同上
		t        メニューの切り離しを出来るようにする メニューの切り離しを出来るようにする               : 普通は同上
		T        ツールバーを表示する ツールバーを表示する               : 普通は同上
		r        ウィンドウの右側にスクロールバーを表示する ウィンドウの右側にスクロールバーを表示する               : 普通は同上
		R        縦に分割されたウィンドウの右側にスクロールバーを表示する 縦に分割されたウィンドウの右側にスクロールバーを表示する               : 普通は同上
		l        ウィンドウの左にスクロールバーを表示する ウィンドウの左にスクロールバーを表示する               : 普通は同上
		L        縦に分割されたウィンドウの左側にスクロールバーを表示する 縦に分割されたウィンドウの左側にスクロールバーを表示する               : 普通は同上
		b        水平スクロールバーを表示する 水平スクロールバーを表示する               : 普通は同上
		v        ダイアログのボタンを縦に配置する ダイアログのボタンを縦に配置する               : 普通は同上
		p        ポインタコールバックを使う ポインタコールバックを使う               : 普通は同上
		F        メッセージフッターを表示する メッセージフッターを表示する               : 普通は同上
		guipty  初期値：オン 初期値：オン               : 普通は同上
		guiでの:shellコマンドで、ptyを使うオプションをはずした場合は、パイプを使用して接続される。
		helpfile  初期値：MSDOSでは"$VIMRUNTIME\doc\help.txt" それ以外は"$VIMRUNTIME/doc/help.txt" それ以外は"$VIMRUNTIME/doc/help.txt"               : 普通は同上
		メインのヘルプファイルを指定する。
		helpheight  初期値：20 初期値：20               : 普通は同上
		:helpコマンドで表示されるヘルプウィンドウの高さの最低値
		hidden  初期値：オフ 初期値：オフ               : 普通は同上
		変更中のファイルでも、保存しないで他のファイルを表示することが出来るようにする。
		highlight  初期値："8:SpecialKey, @:NonText, d:Directory, e:ErrorMsg, i:IncSearch, l:Search, m:MoreMsg, m:MoreMsg,               : 普通は同上
		M:ModeMsg, n:LineNr, r:Question, s:StatusLine, S:StatusLineNC, c:VertSplit, t:Title, v:Visual, v:Visual,               : 普通は同上
		w:WarningMsg, W:WildMenu, f:Folded, F:FoldColumn" F:FoldColumn"               : 普通は同上
		Vimのメッセージのハイライト方法を指定する
		キー 初期グループ 内容 内容               : 普通は同上
		8    SpecialKey   スペシャルキー、^@など表示できない文字 スペシャルキー、^@など表示できない文字               : 普通は同上
		@    NonText      EOF以降の~など EOF以降の~など               : 普通は同上
		d    Directory    CTRL-Dで表示したディレクトリ CTRL-Dで表示したディレクトリ               : 普通は同上
		e    ErrorMsg     エラーメッセージ エラーメッセージ               : 普通は同上
		f    Folded       折り畳まれた行 折り畳まれた行               : 普通は同上
		F    FoldColumn   フォールドコラム フォールドコラム               : 普通は同上
		i    IncSearch    インクリメンタルサーチの結果 インクリメンタルサーチの結果               : 普通は同上
		l    Search       最後の検索結果 最後の検索結果               : 普通は同上
		m    MoreMsg      -- 継続 -- のようなMoreメッセージ のようなMoreメッセージ               : 普通は同上
		M    ModeMsg      -- 挿入 -- などのモードメッセージ などのモードメッセージ               : 普通は同上
		n    LineNr       行番号 行番号               : 普通は同上
		r    Question     hit-enterやyes/noなどの質問 hit-enterやyes/noなどの質問               : 普通は同上
		s    StatusLine   ステータスライン ステータスライン               : 普通は同上
		S    StatusLineNC アクティブではないウィンドウのステータスライン アクティブではないウィンドウのステータスライン               : 普通は同上
		t    Title        :set allや:autocmdなどで表示される「--- オプション ---」のような文字 ---」のような文字               : 普通は同上
		c    VertSplit    縦方向へのスプリットの境界 縦方向へのスプリットの境界               : 普通は同上
		v    Visual       ビジュアルモードの選択範囲 ビジュアルモードの選択範囲               : 普通は同上
		V    VisualNOS    ビジュアルモードの選択範囲(Vimがアクティブではないとき) ビジュアルモードの選択範囲(Vimがアクティブではないとき)               : 普通は同上
		w    WarningMsg   警告メッセージ 警告メッセージ               : 普通は同上
		W    WildMenu     ワイルドメニュー ワイルドメニュー               : 普通は同上
		たとえば、set highlight=n:ErrorMsg とすると、行番号がErrorMsgで指定した色に設定される。 とすると、行番号がErrorMsgで指定した色に設定される。               : 普通は同上
		history  初期値：Vim : 20, Vi : 0 0               : 普通は同上
		コロンコマンドを記録する数
		hkmap  初期値：オフ 初期値：オフ               : 普通は同上
		ヘブライ語用のキーボードマッピング
		hkmapp  初期値：オフ 初期値：オフ               : 普通は同上
		ヘブライ語用の音声用キーボードで有効にする
		hlsearch  初期値：オフ 初期値：オフ               : 普通は同上
		検索結果をハイライトする
		icon  初期値：オフ 初期値：オフ               : 普通は同上
		アイコンの文字として、gvimという文字の代わりに編集中のファイル名を使う。
		iconstring  初期値："" 初期値：""               : 普通は同上
		アイコンの文字として表示する文字
		ignorecase  初期値：オフ 初期値：オフ               : 普通は同上
		検索で、大文字小文字を区別しない。
		例：ignorecaseオプションを有効にしていないと、
		/abc
		で検索すると abc にヒットするが、abcやaBCにはヒットしなくなる。 ignorecaseオプションを有効にす ignorecaseオプションを有効にす               : 普通は同上
		ると、/abcで aBCやabcなどがヒットするようになる。 aBCやabcなどがヒットするようになる。               : 普通は同上
		imactivatekey  初期値："" 初期値：""               : 普通は同上
		Input Method(canna,tamago,xatok,etc...)を有効にするキー操作 Method(canna,tamago,xatok,etc...)を有効にするキー操作               : 普通は同上
		オプション値 動作 動作               : 普通は同上
		S            シフトキー シフトキー               : 普通は同上
		L            ロックキー ロックキー               : 普通は同上
		C            コントロールキー コントロールキー               : 普通は同上
		1            Mod1キー Mod1キー               : 普通は同上
		2            Mod2キー Mod2キー               : 普通は同上
		3            Mod3キー Mod3キー               : 普通は同上
		4            Mod4キー Mod4キー               : 普通は同上
		5            Mod5キー Mod5キー               : 普通は同上
		set imactivatekey=SC-space で、Shift+Ctrl+spaceで日本語入力になる。 で、Shift+Ctrl+spaceで日本語入力になる。               : 普通は同上
		imcmdline  初期値：オフ 初期値：オフ               : 普通は同上
		コマンドラインで、日本語入力モードにする
		imdisable  初期値：オフ, オン for some systems (SGI) (SGI)               : 普通は同上
		日本語入力を使わない
		iminsert  初期値：0, inputメソッドがサポートされていれば、2 inputメソッドがサポートされていれば、2               : 普通は同上
		入力モードで自動的に日本語入力を使う
		オプション値 動作 動作               : 普通は同上
		0            日本語モード(Input Method)OFF Method)OFF               : 普通は同上
		1            lmapをONにしてIMをOFFにする lmapをONにしてIMをOFFにする               : 普通は同上
		2            lmapをOFFにしてIMをONにする lmapをOFFにしてIMをONにする               : 普通は同上
		imsearch  初期値：0, inputメソッドがサポートされていれば、2 inputメソッドがサポートされていれば、2               : 普通は同上
		検索で自動的に日本語入力を使う
		オプション値 動作 動作               : 普通は同上
		0            日本語モード(Input Method)OFF Method)OFF               : 普通は同上
		1            lmapをONにしてIMをOFFにする lmapをONにしてIMをOFFにする               : 普通は同上
		2            lmapをOFFにしてIMをONにする lmapをOFFにしてIMをONにする               : 普通は同上
		include  初期値："^#\s*include" 初期値："^#\s*include"               : 普通は同上
		includeディレクティブと見なす文字列
		:set include=^\s*#\s*include include=^\s*#\s*include               : 普通は同上
		のように、正規表現で指定できる。この設定値は、]CTRL-Iや]dなど、インクルードファイルを検索対象
		とするようなコマンドで使用される。
		includeexpr  初期値："" 初期値：""               : 普通は同上
		includeするファイル名を決定するスクリプト
		:set includeexpr=substitute(v:fname,'h','hpp','g') includeexpr=substitute(v:fname,'h','hpp','g')               : 普通は同上
		とすると、
		#include "abc.h" ならば、abc.hppがインクルードされていると判断するようになる。 v:fnameに""に囲 v:fnameに""に囲               : 普通は同上
		まれたファイル名がセットされている。この設定は、]CTRL-Iや]dなど、インクルードファイルを検索対
		象とするようなコマンドで使用される。
		incsearch  初期値：オフ 初期値：オフ               : 普通は同上
		インクリメンタルサーチを行う。検索文字を打っている途中で、目的の単語を見つけたらEnterを押下す
		ればよい。検索をやめたい場合はEscを押下する。
		indentexpr  初期値："" 初期値：""               : 普通は同上
		インデントする量を返すスクリプトを設定する cindentやsmartindentのインデント量を作成したスクリ cindentやsmartindentのインデント量を作成したスクリ               : 普通は同上
		プトで変更することが出来る。-1を返すと現在のインデントを維持しようとする。
		indentkeys  初期値："0{,0},:,0#,!^F,o,O,e" 初期値："0{,0},:,0#,!^F,o,O,e"               : 普通は同上
		挿入モードで、現在のラインの再インデントを引き起こすキーのリスト
		infercase  初期値：オフ 初期値：オフ               : 普通は同上
		挿入モードの単語の補完(Ctrl-P, Ctrl-N)で、小文字で打った単語でも大文字で補完できるようにする。 Ctrl-N)で、小文字で打った単語でも大文字で補完できるようにする。               : 普通は同上
		動作は、ignorecase や smartcase のオプションに従う。 のオプションに従う。               : 普通は同上
		insertmode  初期値：オフ 初期値：オフ               : 普通は同上
		Vimを挿入モードがデフォルトで動作させる。 Escを押してもViのコマンドモードに移行しなくなる。 Escを押してもViのコマンドモードに移行しなくなる。               : 普通は同上
		isfname  初期値：MS-DOS, Win32 and OS/2では、"@,48-57,/,\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~,=" UNIX,Mac UNIX,Mac               : 普通は同上
		では"@,48-57,/,.,-,_,+,,,#,$,%,~,="
		ファイル名として使用できる文字を設定する。 gfなどのコマンドでファイル名の区切りを判断するのに gfなどのコマンドでファイル名の区切りを判断するのに               : 普通は同上
		用いられる。指定できる文字は下表。
		設定値 意味 意味               : 普通は同上
		20     文字コード20(10進数) 文字コード20(10進数)               : 普通は同上
		a-z    'a'から'z'までの文字 'a'から'z'までの文字               : 普通は同上
		x      文字'x' 文字'x'               : 普通は同上
		@      isalpha()で指定される全ての文字 isalpha()で指定される全ての文字               : 普通は同上
		@-@    文字@ 文字@               : 普通は同上
		^a-z   'a'から'z'までの文字以外 'a'から'z'までの文字以外               : 普通は同上
		^x     'x'以外 'x'以外               : 普通は同上
		isident  初期値：MS-DOS, Win32 and OS/2:"@,48-57,_,128-167,224-235"、それ以外は、"@,48-57,_,192-255" OS/2:"@,48-57,_,128-167,224-235"、それ以外は、"@,48-57,_,192-255"               : 普通は同上
		識別子として使用できる文字を設定する。フォーマットは、isfnameと同じ。
		iskeyword
			初期値：MS-DOS and Win32:"@,48-57,_,128-167,224-235"、それ以外は、"@,48-57,_,192-255" Viでは Viでは               : 普通は同上
		"@,48-57,_"
		単語に含まれる文字を設定する。 wコマンドなどで、ジャンプする単語を指定できる。たとえば、 wコマンドなどで、ジャンプする単語を指定できる。たとえば、               : 普通は同上
		set iskeyword+=- iskeyword+=-               : 普通は同上
		とすると、"-"も単語として扱われるため、aaa-bbbのような文字で"w"を押下すると、bbbの後ろの単語に
		ジャンプする。
			↑
		isprint
			初期値：MS-DOS, Win32, OS/2 and Macintosh:"@,~-255" それ以外は、"@,161-255" それ以外は、"@,161-255"               : 普通は同上
		スクリーンに表示することが出来る文字を設定する。設定のフォーマットはisfnameと同じ。
		joinspaces  初期値：オン 初期値：オン               : 普通は同上
		行の連結 "J" で、間にスペースを入れる設定。この設定を有効にすると、"J"を押して行を連結すると最 で、間にスペースを入れる設定。この設定を有効にすると、"J"を押して行を連結すると最               : 普通は同上
		後がピリオド(. ! ? etc..)で終わっている行ならば、行と行の間にスペースと追加(結果結合語のスペー etc..)で終わっている行ならば、行と行の間にスペースと追加(結果結合語のスペー               : 普通は同上
		スが2つになる)する。
		key
			初期値：""
		暗号化のキーを設定する。
		keymap  初期値："" 初期値：""               : 普通は同上
		キーボードマッピングを設定する。
		keymodel  初期値："" 初期値：""               : 普通は同上
		Shift+矢印キーの動作を決める。
		オプション値 動作 動作               : 普通は同上
		startsel     シフトキー+矢印キーで選択が出来る シフトキー+矢印キーで選択が出来る               : 普通は同上
		stopsel      選択モード中に矢印キーで選択を終了する 選択モード中に矢印キーで選択を終了する               : 普通は同上
		keywordprg  初期値："man" or "man -s", DOS: "", OS/2: "view /", VMS: "help" "help"               : 普通は同上
		"K"コマンドで実行するプログラムを変更する。
		langmap  初期値："" 初期値：""               : 普通は同上
		英語以外のキーボードマッピングを変更する。たとえば、
		set langmap=aj langmap=aj               : 普通は同上
		とすると、'a'を押下すると'j'の動作になる。
		langmenu  初期値："" 初期値：""               : 普通は同上
		メニュー翻訳のために使用する言語を設定する。「runtimepath」の中の「lang」ディレクトリーからど
		のファイルがロードされるか伝える。
		例：
		set lm=de.latin1 lm=de.latin1               : 普通は同上
		とすると、$VIMRUNTIME/lang/menu_de.latin1.vim が読み込まれるようになる。 が読み込まれるようになる。               : 普通は同上
		laststatus  初期値：1 初期値：1               : 普通は同上
		ステータスラインを表示するウィンドウを設定する。
		オプション 動作 動作               : 普通は同上
		値
		0          一番下のウィンドウはステータスラインを表示しない 一番下のウィンドウはステータスラインを表示しない               : 普通は同上
		1          ウィンドウが1つの時はステータスラインを表示しない 2つ以上ある場合は、ステータスライ 2つ以上ある場合は、ステータスライ               : 普通は同上
			ンを表示する
		2          常にステータスラインを表示する 常にステータスラインを表示する               : 普通は同上
		lazyredraw  初期値：オフ 初期値：オフ               : 普通は同上
		スクリプト実行中に画面を描画しない。
		linebreak  初期値：オフ 初期値：オフ               : 普通は同上
		入力した行が長い場合に自動的に改行をする。 textwidthで指定した横幅で動作する。 textwidthで指定した横幅で動作する。               : 普通は同上
		lines  初期値：24 or ターミナルの高さ ターミナルの高さ               : 普通は同上
		ウィンドウの高さを行単位で指定する。
		linespace  初期値：0, Win32のGUIなら、1 Win32のGUIなら、1               : 普通は同上
		行間を設定する。
		lisp  初期値：オフ 初期値：オフ               : 普通は同上
		lispモードにする。
		lispwords  初期値：すごく長い 初期値：すごく長い               : 普通は同上
		lispのインデントに使われる単語を指定する
		list  初期値：オフ 初期値：オフ               : 普通は同上
		タブ文字、行末など不可視文字を表示する。
		listchars  初期値："eol:$" 初期値："eol:$"               : 普通は同上
		listで表示される文字のフォーマットを指定する。
		オプション値 動作 動作               : 普通は同上
		eol:c        行末を文字'c'で表す 行末を文字'c'で表す               : 普通は同上
		tab:xy       タブを最初の1文字を'x'続く文字を'y'で表示する タブを最初の1文字を'x'続く文字を'y'で表示する               : 普通は同上
		trail:c      空白で終わる行の空白文字を'c'で表示する 空白で終わる行の空白文字を'c'で表示する               : 普通は同上
		extends:c    折り返した行の終わりに文字'c'を表示する 折り返した行の終わりに文字'c'を表示する               : 普通は同上
		precedes:c   →にスクロールして、行の先頭を表示し切れていない場合に行の先頭に'c'を表示する →にスクロールして、行の先頭を表示し切れていない場合に行の先頭に'c'を表示する               : 普通は同上
		loadplugins  初期値：オン 初期値：オン               : 普通は同上
		プラグインスクリプトを起動時にロードする。
		magic  初期値：オン 初期値：オン               : 普通は同上
		正規表現に特殊文字を含めるようにする。
		set nomagic nomagic               : 普通は同上
		にすると、正規表現で、"*"を\*と表記するようになる。
		makeef  初期値："" 初期値：""               : 普通は同上
		makeのエラーやgrep結果を出力するファイル名
		:set makeef=/tmp/make##.err makeef=/tmp/make##.err               : 普通は同上
		のようにファイル名に##を含めると##部分をユニークな番号に変えてくれる。
		makeprg  初期値："make", VMS: "MMS" "MMS"               : 普通は同上
		makeを行うプログラムを指定する。
		matchpairs  初期値："(:),{:},[:]" 初期値："(:),{:},[:]"               : 普通は同上
		%で一致する文字を指定する。
		set matchpairs+=<:> matchpairs+=<:>               : 普通は同上
		とすれば、htmlのタグ&lt;xxx&gt;を%で表示できるようになる。
		matchtime  初期値：5 初期値：5               : 普通は同上
		matchpairsで指定したペアのマッチを表示する時間。時間は1/10秒単位で指定する。
		maxfuncdepth  初期値：100 初期値：100               : 普通は同上
		ユーザファンクションでの関数のネストの深さの最大値を設定する。作成した関数で再帰が終了しない場
		合に、この設定値まで繰り返すと終了する。
		maxmapdepth  初期値：1000 初期値：1000               : 普通は同上
		マッピングのネストの最大値を設定する。
		:map x y y               : 普通は同上
		:map y x x               : 普通は同上
		としても、設定した最大値で終了する
		maxmem  初期値：256 から 5120 5120               : 普通は同上
		1つのバッファで使用できるメモリの最大値を設定する。 KB単位で指定する。 KB単位で指定する。               : 普通は同上
		maxmemtot  初期値：2048 から 10240 10240               : 普通は同上
		全バッファの総メモリを制限する。 KB単位で指定する。 KB単位で指定する。               : 普通は同上
		menuitems  初期値：25 初期値：25               : 普通は同上
		メニューの中で使用するアイテムの最大の数。
		modeline  初期値：Vim: オン, Vi: オフ オフ               : 普通は同上
		モードラインの有効無効。
		modelines  初期値：5 初期値：5               : 普通は同上
		モードラインを探す行数。ファイルの先頭からと終端から設定した行数を検索する。モードラインとは、
		以下のようにタブストップ、ソフトタブストップ、シフト幅などをコメント内に書くだけで指定できるも
		の。
		/* vi:set ts=8 sts=4 sw=4: sw=4:               : 普通は同上
			*
			* VIM - Vi IMproved    by Bram Moolenaar Moolenaar               : 普通は同上
			*
			* Do ":help uganda"  in Vim to read copying and usage conditions. conditions.               : 普通は同上
			* Do ":help credits" in Vim to see a list of people who contriaed. contriaed.               : 普通は同上
			* See REaDME.txt for an overview of the Vim source code. code.               : 普通は同上
			*/
		modifiable  初期値：オン 初期値：オン               : 普通は同上
		バッファを変更可能にする。
		set nomodifiable nomodifiable               : 普通は同上
		とすると、バッファの変更が出来なくなる。
		modified  初期値：オフ 初期値：オフ               : 普通は同上
		バッファが変更されるとセットされる。自分で設定するものではない。
		more  初期値：Vim : オン, Vi : オフ オフ               : 普通は同上
		画面に収まらずにスクロールしてしまう出力をmoreで表示する。
		mouse  初期値："", GUIなら"a" GUIなら"a"               : 普通は同上
		マウスを有効にするモードを設定する。
		オプション値 動作 動作               : 普通は同上
		n            ノーマルモード ノーマルモード               : 普通は同上
		v            ビジュアルモード ビジュアルモード               : 普通は同上
		i            挿入モード 挿入モード               : 普通は同上
		c            コマンドライン コマンドライン               : 普通は同上
		h            上の全てのモード（マウスをクリックしてもカーソルは動かない） 上の全てのモード（マウスをクリックしてもカーソルは動かない）               : 普通は同上
		a            上の全てのモード（マウスをクリックするとカーソルが動く） 上の全てのモード（マウスをクリックするとカーソルが動く）               : 普通は同上
		r            hit-enter や more-prompt プロンプト プロンプト               : 普通は同上
		mousefocus  初期値：オフ 初期値：オフ               : 普通は同上
		マウスのいるウィンドウをアクティブにする。この設定は、1つのVimウィンドウの中のバッファを表示し
		ているウィンドウのアクティブ/非アクティブを切り替えます。
		mousehide  初期値：オン 初期値：オン               : 普通は同上
		入力を開始したらマウスカーソルを隠す。
		mousemodel  初期値："extend", "popup" for MS-DOS and Win32 Win32               : 普通は同上
		マウスの動作を設定する。
		オプション値 動作 動作               : 普通は同上
		extend       UNIXでよく使うアプリケーション(xterm)のようなマウスの動作 UNIXでよく使うアプリケーション(xterm)のようなマウスの動作               : 普通は同上
		popup        右クリックでメニューを表示する 右クリックでメニューを表示する               : 普通は同上
		popup_setpos 右クリックでメニューを表示して、Vimのカーソルもクリック位置に移動する 右クリックでメニューを表示して、Vimのカーソルもクリック位置に移動する               : 普通は同上
		mouseshape  初期値："i:beam,r:beam,s:updown,sd:cross,m:no,v:rightup-arrow" 初期値："i:beam,r:beam,s:updown,sd:cross,m:no,v:rightup-arrow"               : 普通は同上
		マウスカーソルの形状をVimに教える以下のように指定する。（設定方法はguicursorと同じ）
		mode-list:shape,mode-list:shape:mode-list:shape・・・
		mode-listには、下表の値を'-'で区切って指定できる。
		オプション値 動作 動作               : 普通は同上
		n            ノーマルモード ノーマルモード               : 普通は同上
		v            ビジュアルモード ビジュアルモード               : 普通は同上
		ve           ビジュアルモード（selectionオプションの値がexclusiveになっている場合） ビジュアルモード（selectionオプションの値がexclusiveになっている場合）               : 普通は同上
		o            オペレータ待機モード（dやcを打った後） オペレータ待機モード（dやcを打った後）               : 普通は同上
		i            挿入モード 挿入モード               : 普通は同上
		r            置換モード 置換モード               : 普通は同上
		c            コマンドラインへの文字追加中 コマンドラインへの文字追加中               : 普通は同上
		ci           コマンドラインへの文字挿入中 コマンドラインへの文字挿入中               : 普通は同上
		cr           コマンドラインの文字置換中 コマンドラインの文字置換中               : 普通は同上
		m            'Hit ENTER' か 'More' プロンプト プロンプト               : 普通は同上
		e            全てのモード、最後のウィンドウよりも下(コマンドライン) 全てのモード、最後のウィンドウよりも下(コマンドライン)               : 普通は同上
		s            全てのモード、ステータスライン上のカーソル 全てのモード、ステータスライン上のカーソル               : 普通は同上
		sd           全てのモード、ステータスラインをマウスで移動中 全てのモード、ステータスラインをマウスで移動中               : 普通は同上
		vs           全てのモード、縦方向のスプリッタの上 全てのモード、縦方向のスプリッタの上               : 普通は同上
		vd           全てのモード、縦方向のスプリッタをマウスで移動中 全てのモード、縦方向のスプリッタをマウスで移動中               : 普通は同上
		a            全てのモード、全ての位置 全てのモード、全ての位置               : 普通は同上
		shapeには、下表の値を指定できる。
		オプション値   動作 動作               : 普通は同上
		arrow          通常の矢印形のカーソル 通常の矢印形のカーソル               : 普通は同上
		blank          カーソルの非表示 カーソルの非表示               : 普通は同上
		beam           縦に長いI型のカーソル 縦に長いI型のカーソル               : 普通は同上
		updown         上下に移動できるようなカーソル 上下に移動できるようなカーソル               : 普通は同上
		leftright      左右に移動できるようなカーソル 左右に移動できるようなカーソル               : 普通は同上
		busy           砂時計 砂時計               : 普通は同上
		no             システム通常の入力できないポインタ システム通常の入力できないポインタ               : 普通は同上
		udsizing       上下のリサイズ 上下のリサイズ               : 普通は同上
		lrsizing       左右のリサイズ 左右のリサイズ               : 普通は同上
		crosshair      十字カーソル 十字カーソル               : 普通は同上
		hand1          手１ 手１               : 普通は同上
		hand2          手２ 手２               : 普通は同上
		pencil         鉛筆 鉛筆               : 普通は同上
		question       ハテナマーク ハテナマーク               : 普通は同上
		rightup-arrow  右肩上がりの矢印形カーソル 右肩上がりの矢印形カーソル               : 普通は同上
		up-arrow       上向きのカーソル 上向きのカーソル               : 普通は同上
		&lt;number&gt; X11/cursorfont.h で定義されているカーソル で定義されているカーソル               : 普通は同上
		例：挿入モードでのカーソルの形状を鉛筆にするためには、
		set mouseshape=i:pencil mouseshape=i:pencil               : 普通は同上
		とする。
		mousetime  初期値：500 初期値：500               : 普通は同上
		マルチクリック(ダブルクリック)の間隔(msec単位)
		nrformats  初期値："octal,hex" 初期値："octal,hex"               : 普通は同上
		Ctrl+a、Ctrl+Xの加算減算コマンドで認識する基数
		オプション値 動作 動作               : 普通は同上
		alpha        アルファベット アルファベット               : 普通は同上
		octal        8進数 8進数               : 普通は同上
		hex          16進数 16進数               : 普通は同上
		Ctrl+aで「007」を「008」にするには、
		set nrformats-=octal nrformats-=octal               : 普通は同上
		とする。
		number  初期値：オフ 初期値：オフ               : 普通は同上
		行番号を表示する。
		osfiletype  初期値：RISC-OS なら: "Text",それ以外は"" "Text",それ以外は""               : 普通は同上
		ファイルタイプを保持しているOSが提供するファイルタイプ。
		paragraphs  初期値："IPLPPPQPP LIpplpipbp" LIpplpipbp"               : 普通は同上
		段落を開始するnroffマクロ。
		paste  初期値：オフ 初期値：オフ               : 普通は同上
		ペーストモードにする。 'textwidth' は 0 'wrapmargin' は 0 'autoindent' は reset 'smartindent' 'smartindent'               : 普通は同上
		は reset 'softtabstop' は 0 'revins' は reset 'ruler' は reset 'showmatch' は reset reset               : 普通は同上
		'formatoptions' は空のように動作する は空のように動作する               : 普通は同上
		pastetoggle  初期値："" 初期値：""               : 普通は同上
		ペーストモードをトグルする
		patchexpr  初期値："" 初期値：""               : 普通は同上
		ファイルにパッチを適用し、かつファイルの新バージョンを生成すると評価されるスクリプト
		patchmode  初期値："" 初期値：""               : 普通は同上
		パッチモードに移行する。ファイルの保存時に、xxx.txt.orgというようなファイルを生成する。
		path  初期値：Unix: ".,/usr/include,OS/2:".,/emx/include,," それ以外: ".,," ".,,"               : 普通は同上
		自動的に使用するディレクトリを','で区切って指定する。
		set path=.,/usr/include, path=.,/usr/include,               : 普通は同上
		としておくと、カレントディレクトリが/usr/includeでなくても、
		:find ctype.h ctype.h               : 普通は同上
		とすれば、/usr/include/ctype.hを開くことが出来るようになる。このpathは「gf」コマンドでも使用す
		ることが出来る。
		previewheight  初期値：12 初期値：12               : 普通は同上
		プレビューウィンドウの高さを指定する。
		previewwindow  初期値：オフ 初期値：オフ               : 普通は同上
		現在のウィンドウをプレビューウィンドウにする。
		printdevice  初期値：empty 初期値：empty               : 普通は同上
		使用されるプリンタの名前。値が空のときは、システムの規定プリンタを使う。
		printexpr  初期値：複雑、help参照 初期値：複雑、help参照               : 普通は同上
		コマンド ":hardcopy" で生成されるPostScriptファイルを印刷するために評価されるスクリプトを指定 で生成されるPostScriptファイルを印刷するために評価されるスクリプトを指定               : 普通は同上
		する。印刷されるファイル名は、v:fname_in ":hardcopy" に対する引数は、v:cmdarg に対する引数は、v:cmdarg               : 普通は同上
		printfont  初期値："courier" 初期値："courier"               : 普通は同上
		コマンド |:hardcopy| の出力に使われるフォント名。 'guifont' と同じ書式で指定する。 と同じ書式で指定する。               : 普通は同上
		printheader  初期値："%&lt;%f%h%m%=Page %N" %N"               : 普通は同上
		コマンド |:hardcopy| の出力のヘッダの書式を定義する。値の設定方法はオプション 'statusline' と と               : 普通は同上
		同様である
		printoptions  初期値："" 初期値：""               : 普通は同上
		コマンド |:hardcopy| の出力書式。 の出力書式。               : 普通は同上
		readonly  初期値：オフ 初期値：オフ               : 普通は同上
		読み込み専用
		:set readonly readonly               : 普通は同上
		とすることで、編集しているバッファを読み込み専用(書き込むためには:w!としなければならない)にで
		きる。誤ってファイルを変更しないように予防することができる。
		:set noreadonly noreadonly               : 普通は同上
		とすることで、読み込み専用を解除することができる。
		remap  初期値：オン 初期値：オン               : 普通は同上
		再帰的マッピングを有効にする。再帰的マッピングとは、
		:map h a a               : 普通は同上
		key 'h' を key 'a' に置き換える→ 'h'を押すと'a'を押したのと同じになる" この状態で この状態で               : 普通は同上
		:map b h h               : 普通は同上
		とすると、'b' が 'h' に置き換えられた後、さらに 'h' が 'a' に置き換えられるため、'b'を押すと に置き換えられるため、'b'を押すと               : 普通は同上
		'a'を押したことと同じになる。これを再帰的マッピングという。特定のマッピングに対して再帰的マッ
		ピングを禁止したいときは、コマンド ":noremap[!]" を使う。 を使う。               : 普通は同上
		report  初期値：2 初期値：2               : 普通は同上
		":"コマンドにより変更された行の数の報告が出る最小値。変更された行の数がオプション'report' より より               : 普通は同上
		大きければ、ほとんどの ":" によるコマンドでメッセージが表示される。必ず報告してほしいなら によるコマンドでメッセージが表示される。必ず報告してほしいなら               : 普通は同上
		'report' を 0 にすること。ここでいう報告とは、 にすること。ここでいう報告とは、               : 普通は同上
		:1,3d
		として、3行削除した場合にステータスラインに"3 行削除しました"のように表示されるメッセージのこ 行削除しました"のように表示されるメッセージのこ               : 普通は同上
		と。
		:%s/pat/str/
		で更新された場合も'report'の値より多くの置換個所があれば、"1 箇所置換しました (計 1 行内)"と表 行内)"と表               : 普通は同上
		示される。
		restorescreen  初期値：オン 初期値：オン               : 普通は同上
		Vimを終了した後にコンソール画面の内容が復元される。このオプションをONにしておくと、コンソール
		画面がvim起動前と同じになる。 OFFの場合は、コンソール画面にvimが残る。 OFFの場合は、コンソール画面にvimが残る。               : 普通は同上
		revins  初期値：オフ 初期値：オフ               : 普通は同上
		挿入モードでの文字の挿入方向を通常と逆向きにする。左から右に向かって文字を入力していた場合は、
		右から左に向かって文字を入力するようになる。
		rightleft  初期値：オフ 初期値：オフ               : 普通は同上
		画面表示の方向を右から左にする。ファイルに保存されている文字は右から左の方向へ表示される。この
		オプションを使うと、ヘブライ語やアラビア語のような右から左に向かって書かれる言語によるファイル
		を編集できる。
		ruler  初期値：オフ 初期値：オフ               : 普通は同上
		カーソルが何行目の何列目に置かれているかを表示する。オプション 'rulerformat' が設定されている が設定されている               : 普通は同上
		ときは、それによってルーラの内容が指定される。
		rulerformat  初期値：empty 初期値：empty               : 普通は同上
		ルーラの内容を指定する。書式は 'statusline' のものと同様。 のものと同様。               : 普通は同上
		runtimepath  初期値：$HOME/.vim、$VIM/vimfiles, $VIMRUNTIME, $VIM/vimfiles/after,$HOME/.vim/after" $VIM/vimfiles/after,$HOME/.vim/after"               : 普通は同上
		ランタイムファイルが検索されるディレクトリのリスト。 Vimは、このオプションで指定されたディレク Vimは、このオプションで指定されたディレク               : 普通は同上
		トリからランタイムファイルを順に検索する。このため、'rumtimepath'の先頭に "~/vimfiles"を置いて "~/vimfiles"を置いて               : 普通は同上
		おけば、システム共通のVim用ディレクトリではなく、自分のHOMEディレクトリ"~/vimfiles"を先に検索
		してくれる。この動作のおかげで、rootに頼まなくても、HOMEディレクトリ内に"~/vimfiles/plugin/"を
		作成しておき、中に自分の使うプラグインを置けばそれを使うことができる。
		scroll  初期値：ウィンドウの高さの半分 初期値：ウィンドウの高さの半分               : 普通は同上
		コマンド CTRL-U や CTRL-D でスクロールする行数。 ":set scroll=0" とすると、値はウィンドウ高の とすると、値はウィンドウ高の               : 普通は同上
		半分になる。
		scrollbind  初期値：オフ 初期値：オフ               : 普通は同上
		他のスクロール同調中ウィンドウと同じだけスクロールする。同時にスクロールさせたいウィンドウのそ
		れぞれで、このオプションをONにすると同時にスクロールするようになる。ファイルの2個のヴァージョ
		ン間の違いを見るのに便利である。
		scrolljump  初期値：1 初期値：1               : 普通は同上
		カーソルが画面外に出たときにスクロールする行数の最小値。 "j"でカーソルを下にスクロールして行き "j"でカーソルを下にスクロールして行き               : 普通は同上
		、画面上に表示されていない次の行を表示しようとしたときに、このオプションで指定した行数だけ一気
		にスクロールする。
		scrolloff  初期値：0 初期値：0               : 普通は同上
		カーソルの上または下に表示する最小限の行数。カーソルの上または下には、最低でもこのオプションに
		指定した数の行が表示される。これにより、編集中の箇所の周辺のテキストを見ることができる。とても
		大きい値 (999等) にすると、カーソルの置かれた行は常にウィンドウの中央に表示される。 にすると、カーソルの置かれた行は常にウィンドウの中央に表示される。               : 普通は同上
		scrollopt  初期値："ver,jump" 初期値："ver,jump"               : 普通は同上
		スクロール同調中ウィンドウの動作設定。スクロール同調中ウィンドウの動作を設定するキーワードの、
		コンマ区切りのリスト。指定可能なキーワードは以下の通りである。
		ver  同調中ウィンドウの垂直スクロールを同調させる 同調中ウィンドウの垂直スクロールを同調させる               : 普通は同上
		hor  同調中ウィンドウの水平スクロールを同調させる 同調中ウィンドウの水平スクロールを同調させる               : 普通は同上
		jump これは垂直スクロールにおいて、2個のウィンドウ間のoffset に適用される。この offset とは同 とは同               : 普通は同上
			調中ウィンドウに表示されているテキストの先頭行のずれのことである。
		ウィンドウ内を動き回るときは、別の同調中ウィンドウの表示区域が、バッファの先頭より前またはバッ
		ファの末尾より後ろに達してしまうかもしれない。それでも offset は変更されず、カーソルが戻ってき は変更されず、カーソルが戻ってき               : 普通は同上
		たときは、同調中ウィンドウは可能ならば求められる位置にスクロールしようとする。カレントウィンド
		ウを変更したときは、相対 offset を使って2つのことが行われる。 を使って2つのことが行われる。               : 普通は同上
			1. 値に "jump" が含まれていないとき、新しくカレントウィンドウになったウィンドウのスクロール位 が含まれていないとき、新しくカレントウィンドウになったウィンドウのスクロール位               : 普通は同上
				置により相対offset が調節される。別のウィンドウに戻ったときは、新しい相対 offset が使われ が使われ               : 普通は同上
				る。
			2. 値に "jump" が含まれているとき、同じ相対オフセットを保つために他のウィンドウもスクロールす が含まれているとき、同じ相対オフセットを保つために他のウィンドウもスクロールす               : 普通は同上
				る。他のウィンドウに戻ったときも、同じ相対 offset を使う。 を使う。               : 普通は同上
		sections  初期値："SHNHH HUnhsh" HUnhsh"               : 普通は同上
		Nroffで使われる章を分けるためのマクロ。
		secure  初期値：オフ 初期値：オフ               : 普通は同上
		Vimを安全に使うオンのとき、コマンド ":autocmd" やシェルコマンド、書き込みコマンドがカレントデ やシェルコマンド、書き込みコマンドがカレントデ               : 普通は同上
		ィレクトリ内のファイル ".vimrc" や ".exrc" では使用できなくなり、マッピングコマンドも表示され では使用できなくなり、マッピングコマンドも表示され               : 普通は同上
		るようになる。問題が起きることはないと分かっているときか、オプション 'exrc' がオフのときにのみ がオフのときにのみ               : 普通は同上
		このオプションをオフにすること。
		selection  初期値："inclusive" 初期値："inclusive"               : 普通は同上
		選択時の動作を設定する。設定可能な値は以下の通り。
		値        行末の後 末尾に操作 末尾に操作               : 普通は同上
		old       X        O O               : 普通は同上
		inclusive O        O O               : 普通は同上
		exclusive O        X X               : 普通は同上
		「行末の後」というのは、カーソルを行末より1文字後ろに置けることを表す。「末尾に操作」というの
		は、選択領域の末尾の文字が操作を受けることを表す。例えば、選択領域の削除に "x" が使われたとき が使われたとき               : 普通は同上
		などに違いが出る。v$xとするとexclusiveの場合は改行を削除しないが、inclusiveは削除する。
		selectmode  初期値："" 初期値：""               : 普通は同上
		VisualモードでなくSelectモードを開始する条件。値はキーワードのコンマ区切りのリストをである。キ
		ーワードは領域選択が開始されたときのうち、どの場合でVisualモードでなくSelectモードを開始するか
		を決定する。指定可能なキーワードは以下の通りである。
		mouse マウス使用時 マウス使用時               : 普通は同上
		key   シフトキーと特別なキーの同時押しをしたとき シフトキーと特別なキーの同時押しをしたとき               : 普通は同上
		cmd   コマンド "v", "V" または CTRL-V の使用時 の使用時               : 普通は同上
		sessionoptions  初期値："blank,buffers,curdir,folds,help,options,winsize" 初期値："blank,buffers,curdir,folds,help,options,winsize"               : 普通は同上
		コマンド |:mksession| の効果の設定コマンド |:mksession| の効果を変更する。値はキーワードのコン の効果を変更する。値はキーワードのコン               : 普通は同上
		マ区切りのリストである。キーワードは、ある項目の保存と復元を有効にする。
		キーワード   復元される項目 復元される項目               : 普通は同上
		blank        空のウィンドウ 空のウィンドウ               : 普通は同上
		buffers      ウィンドウに表示されたバッファだけでなく、隠れバッファと、リストに載っているだけ ウィンドウに表示されたバッファだけでなく、隠れバッファと、リストに載っているだけ               : 普通は同上
			で読み込まれていないバッファ
		curdir       カレントディレクトリ カレントディレクトリ               : 普通は同上
		folds        手動で作られた折り畳み、折り畳みの開閉の区別、折り畳み関連のローカルなオプション 手動で作られた折り畳み、折り畳みの開閉の区別、折り畳み関連のローカルなオプション               : 普通は同上
		globals      大文字で始まり、最低1個の小文字を含む名前のグローバル変数 大文字で始まり、最低1個の小文字を含む名前のグローバル変数               : 普通は同上
		help         ヘルプウィンドウ ヘルプウィンドウ               : 普通は同上
		localoptions ウィンドウまたはバッファに対してローカルなオプションとマッピング (ローカルなオプ (ローカルなオプ               : 普通は同上
			ションのグローバルな値ではない)
		options      全てのオプションとマッピング (ローカルなオプションのグローバルな値も) (ローカルなオプションのグローバルな値も)               : 普通は同上
		resize       Vimのウィンドウのサイズ: 'lines' と 'columns' の値 の値               : 普通は同上
		sesdir       セッションファイルがおかれているディレクトリが、カレントディレクトリになる (ネッ (ネッ               : 普通は同上
			トワーク越しに、異なったシステムからアクセスを受けるプロジェクトでは便利である)
		slash        ファイル名内の '\' がスラッシュに置換される がスラッシュに置換される               : 普通は同上
		unix         WindowsやDOS上でも、Unix形式の end-of-line (1個の<nl>) を使う を使う               : 普通は同上
		winpos       Vimのウィンドウ全体の位置 Vimのウィンドウ全体の位置               : 普通は同上
		winsize      ウィンドウサイズ ウィンドウサイズ               : 普通は同上
		shell  初期値：$SHELL or "sh",MS-DOS and Win32: "command.com" or "cmd.exe", OS/2: "cmd" "cmd"               : 普通は同上
		シェルの名前を設定する。 "!" や ":!" 等のコマンドで使うシェルの名前。コマンドには引数を与える 等のコマンドで使うシェルの名前。コマンドには引数を与える               : 普通は同上
		ことができる。例えば "csh -f" である。値に空白や '\' を含めるには、スペースの前に'\'を置いて'\ を含めるには、スペースの前に'\'を置いて'\               : 普通は同上
		'とする。
		shellcmdflag  初期値："-c" 初期値："-c"               : 普通は同上
		シェルに渡されるフラグ。例えば、"bash.exe -c ls" や "command.com /c dir" とする。 とする。               : 普通は同上
		shellpipe  初期値："&gt;", "| tee", "|&amp; tee" or "2&gt;&amp;1| tee" tee"               : 普通は同上
		":make" の出力をエラーファイルに導くために使われる文字列。 amigaとMS-DOSでの既定値は "&gt;" で で               : 普通は同上
		ある。出力はファイルに直接保存され、スクリーンには表示されない。Unixでの既定値は "| tee" であ であ               : 普通は同上
		る。コンパイラからの標準出力がファイルに保存され、画面にも表示される。
		shellquote  初期値："" 初期値：""               : 普通は同上
		シェルに渡すときに、コマンドを囲む引用符ユーザが必ずこのオプションを設定しなくともよいように、
		既定値は 'shell' に従って設定される。 に従って設定される。               : 普通は同上
		shellredir  初期値："&gt;", "&gt;&amp;" or "&gt;%s 2&gt;&amp;1" 2&gt;&amp;1"               : 普通は同上
		フィルタコマンドの出力をリダイレクトするための文字列。既定値は "&gt;" である。Unixでは、初期化 である。Unixでは、初期化               : 普通は同上
		の後にオプション 'shell' が"csh", "tcsh" または "zsh" だったときは、既定値は "&gt;&amp;" にな にな               : 普通は同上
		る。'shell'が "sh", "ksh" または "bash" だったときは、既定値は "&gt;%s 2&gt;&amp;1" になる。つ になる。つ               : 普通は同上
		まり標準エラー出力も含まれる。
		shellslash  初期値：オフ 初期値：オフ               : 普通は同上
		ファイル名の展開にスラッシュを使う。これはcommand.com や cmd.exe の代わりにUnix系のシェルを使 の代わりにUnix系のシェルを使               : 普通は同上
		うときに使用する。
		shelltype  初期値：0 初期値：0               : 普通は同上
		シェルを使う条件を設定する。 0 または 2: "シェル名 'shellcmdflag' コマンド" で外部コマンドを実 で外部コマンドを実               : 普通は同上
		行 1 または 3: "シェル名コマンド" で外部コマンドを実行 で外部コマンドを実行               : 普通は同上
		shellxquote  初期値：""; system()を使ったときは"\"" system()を使ったときは"\""               : 普通は同上
		コマンドをシェルに渡すときに、コマンドを囲む引用符 "!" や ":!" 等のコマンドでコマンドをシェル 等のコマンドでコマンドをシェル               : 普通は同上
		に渡すときに、コマンドを囲む引用符(の列)。リダイレクトの指示もこの中に含む。
		shiftround  初期値：オフ 初期値：オフ               : 普通は同上
		インデントをオプション 'shiftwidth' の値の倍数に丸める。コマンド "&gt;"と "&lt;" に適用される に適用される               : 普通は同上
		。Insertモードでの CTRL-T と CTRL-D では、インデントは常に 'shiftwidth' の倍数に丸められる の倍数に丸められる               : 普通は同上
		shiftwidth  初期値：8 初期値：8               : 普通は同上
		自動インデントの各段階に使われる空白の数。
		shortmess  初期値：Vim "filnxtToO", Vi : "" ""               : 普通は同上
		CTRL-G 等によるファイル関連のメッセージのフォーマット。 等によるファイル関連のメッセージのフォーマット。               : 普通は同上
		フ
		ラ  効果 効果               : 普通は同上
		グ
		f   "(file 3 of 5)" の代わりに "(3 of 5)" を表示。 を表示。               : 普通は同上
		i   "[最終行が不完全]" の代わりに "[noeol]" を表示。 を表示。               : 普通は同上
		l   "999 行, 888 文字" の代わりに "999L, 888C" を表示。 を表示。               : 普通は同上
		m   "[変更あり]" の代わりに "[+]" を表示。 を表示。               : 普通は同上
		n   "[新ファイル]" の代わりに "[新]" を表示。 を表示。               : 普通は同上
		r   "[読込専用]" の代わりに "[読専]" を表示。 を表示。               : 普通は同上
		w   書き込みコマンドには "書込み" の代わりに "[w]" を、コマンド ':w &gt;&gt; file' には "追加" "追加"               : 普通は同上
			の代わりに "[a]" を表示。 を表示。               : 普通は同上
		x   "[dosフォーマット]" の代わりに "[dos]", "[unixフォーマット]"の代わりに "[unix]", "[マック "[マック               : 普通は同上
			フォーマット]" の代わりに"[マック]" を表示。 を表示。               : 普通は同上
		a   上記の省略を全て行う。 上記の省略を全て行う。               : 普通は同上
		o   ファイルの書き込み時のメッセージを、その後のファイルの読み込み時のメッセージで上書きする ファイルの書き込み時のメッセージを、その後のファイルの読み込み時のメッセージで上書きする               : 普通は同上
			(":wn" を使うときやオプション'autowrite' がオンのときに便利である) がオンのときに便利である)               : 普通は同上
		O   ファイルの読み込み時のメッセージや Quickfix 関係のメッセージ(例えば ":cn") がその前のメッ がその前のメッ               : 普通は同上
			セージを必ず上書きする。
		s   「下まで検索したので上に戻ります」と「上まで検索したので下に戻ります」というメッセージを表 「下まで検索したので上に戻ります」と「上まで検索したので下に戻ります」というメッセージを表               : 普通は同上
			示しない。
		t   ファイル間連のメッセージが長すぎてコマンドラインに収まらないときは、先頭を切り詰める。先頭 ファイル間連のメッセージが長すぎてコマンドラインに収まらないときは、先頭を切り詰める。先頭               : 普通は同上
			には "&lt;" が表示される。Exモードでは無視される。 が表示される。Exモードでは無視される。               : 普通は同上
		T   その他ののメッセージが長すぎてコマンドラインに収まらないときは、中央を切り詰める。中央には その他ののメッセージが長すぎてコマンドラインに収まらないときは、中央を切り詰める。中央には               : 普通は同上
			"..." が表示される。Exモードでは無視される。 が表示される。Exモードでは無視される。               : 普通は同上
		W   ファイルの書き込み時に "書込み" や "[w]" を表示しない。 を表示しない。               : 普通は同上
		a   スワップファイルがすでにあることが発見されたときに「注意」メッセージを表示しない。 スワップファイルがすでにあることが発見されたときに「注意」メッセージを表示しない。               : 普通は同上
		L   Vimの開始時に挨拶メッセージを表示しない |:intro|。 |:intro|。               : 普通は同上
		shortname  初期値：オフ 初期値：オフ               : 普通は同上
		ファイル名が8文字に3文字の拡張子を付けたものであると仮定する。
		showbreak  初期値："" 初期値：""               : 普通は同上
		折り返された行の先頭に表示する文字列。 &lt;Tab&gt;文字とコンマ以外の、printable な文字のみが指 な文字のみが指               : 普通は同上
		定できる (将来のヴァージョンでは、行末に表示される部分と行頭に表示される部分の区切りにコンマが (将来のヴァージョンでは、行末に表示される部分と行頭に表示される部分の区切りにコンマが               : 普通は同上
		使われるかもしれない)。
		showcmd  初期値：Vim : オン, UNIXは、オフ, Vi: オフ オフ               : 普通は同上
		コマンドをステータスラインに表示する。 'd'を入力するとステータスラインに'd'と表示されるように 'd'を入力するとステータスラインに'd'と表示されるように               : 普通は同上
		なる。ビジュアルモーでは選択文字数や選択行数が表示されるようになる。
		showfulltag  初期値：オフ 初期値：オフ               : 普通は同上
		タグファイルから単語補完をするときに1行まるごと補完する。 Insertモードでタグファイルから単語補 Insertモードでタグファイルから単語補               : 普通は同上
		完(CTRL-X CTRL-])をするとき、タグ名と整理された検索パターン (あれば) の両方をマッチする限り表 の両方をマッチする限り表               : 普通は同上
		示する。そのため、C言語の関数にマッチすれば、どのような引数を必要とするかのテンプレートを見る
		ことができる (コーディングスタイルが適当なものであれば)。 (コーディングスタイルが適当なものであれば)。               : 普通は同上
		showmatch  初期値：オフ 初期値：オフ               : 普通は同上
		閉じ括弧が入力されたとき、対応する括弧を表示する。マッチした括弧が画面上に見えているときのみジ
		ャンプする。マッチを表示する時間はオプション 'matchtime' で設定できる。 'cpoptions' にフラグ にフラグ               : 普通は同上
		'm' が含まれていないときは、ジャンプ中に文字を入力するとカーソルがすぐに元の場所に戻る。マッチ が含まれていないときは、ジャンプ中に文字を入力するとカーソルがすぐに元の場所に戻る。マッチ               : 普通は同上
		の表示時のカーソルの形状や点滅方法については、'guicursor' の"sm" の項目を参照。 の項目を参照。               : 普通は同上
		showmode  初期値：Vim : オン, Vi : オフ オフ               : 普通は同上
		現在のモードを表示する。 Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表 Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表               : 普通は同上
		示する。このメッセージの強調表示の設定には、オプション 'highlight' のフラグ 'M' を使うこと。 を使うこと。               : 普通は同上
		sidescroll  初期値：0 初期値：0               : 普通は同上
		水平スクロールの刻み幅。オプション 'wrap' がオフでカーソルが画面外に出るときのみ使われる。値が がオフでカーソルが画面外に出るときのみ使われる。値が               : 普通は同上
		0 のときはカーソルを画面の中央に置くようにスクロールする。 のときはカーソルを画面の中央に置くようにスクロールする。               : 普通は同上
		sidescrolloff  初期値：0 初期値：0               : 普通は同上
		カーソルの右または左に、表示する文字数。オプション 'nowrap' がオフのとき、カーソルの右または左 がオフのとき、カーソルの右または左               : 普通は同上
		には、最低でもこの数だけの列が表示される。 'sidescroll' を 1 以上に設定しているときにこのオプ 以上に設定しているときにこのオプ               : 普通は同上
		ションも 1 以上にすると、水平スクロールをしている周辺のテキストが見えるようになる。とても大き 以上にすると、水平スクロールをしている周辺のテキストが見えるようになる。とても大き               : 普通は同上
		い値 (999等) にすると、カーソルの置かれた列は常にウィンドウの中央に表示される。 にすると、カーソルの置かれた列は常にウィンドウの中央に表示される。               : 普通は同上
		smartcase  初期値：オフ 初期値：オフ               : 普通は同上
		検索で小文字なら大文字を無視、大文字なら無視しない設定。検索パターンが大文字を含んでいたら大文
		字と小文字を区別して検索するようになる。小文字のみの場合は、大文字と小文字を区別しないで検索す
		る。
		smartindent  初期値：オフ 初期値：オフ               : 普通は同上
		新しい行を作ったときに高度な自動インデントを行う。 'cindent' がオンのときは、'smartindent' を を               : 普通は同上
		オンにしても効果はない。
		smarttab  初期値：オフ 初期値：オフ               : 普通は同上
		行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。行頭以外では 'tabstop' 'tabstop'               : 普通は同上
		の数だけ空白が挿入される。オフのときは、&lt;Tab&gt; を打ち込むと常に 'tabstop' の数だけインデ の数だけインデ               : 普通は同上
		ントされる。
		softtabstop  初期値：0 初期値：0               : 普通は同上
		tabstopを変えずに空白を含めることにより、見た目のtabstopを変える &lt;Tab&gt; の挿入や <bs> の の               : 普通は同上
		使用等の編集操作をするときに、&lt;Tab&gt; が対応する空白の数。&lt;Tab&gt; が挿入される「ように が挿入される「ように               : 普通は同上
		思える」が、実は空白と &lt;Tab&gt; の両方が混ざって使われている。 の両方が混ざって使われている。               : 普通は同上
		splitbelow  初期値：オフ 初期値：オフ               : 普通は同上
		ウィンドウの横分割で新しいウィンドウをカレントウィンドウの下に開く。水平分割後にアクティブなウ
		ィンドウが現在のウィンドウの下に出来たウィンドウになる。
		splitright  初期値：オフ 初期値：オフ               : 普通は同上
		ウィンドウの縦分割で新しいウィンドウをカレントウィンドウの右に開く。垂直分割後にアクティブなウ
		ィンドウが現在のウィンドウの右に出来たウィンドウになる。
		startofline  初期値：オン 初期値：オン               : 普通は同上
		ページアップ、ダウンでカーソル位置を最初の余白に移動する以下のコマンドで移動すると、カーソルは
		行内の最初の余白に移動する。オフのときは、カーソルは (可能ならば) 同じ列に置かれる。適用される 同じ列に置かれる。適用される               : 普通は同上
		コマンド: CTRL-D, CTRL-U, CTRL-B, CTRL-F, "G", "H", "M", "L", 行単位で行うときの "d", "&lt;& "&lt;&               : 普通は同上
		lt;", "&gt;&gt;", カウントを指定したときの "%"、バッファ変更コマンド (CTRL-^, :bnext, :bNext :bNext               : 普通は同上
		等)、行番号のみのExコマンド (例えば ":25" や ":+")。 ":+")。               : 普通は同上
		statusline  初期値：empty 初期値：empty               : 普通は同上
		ステータス行の表示内容を設定する。値は、普通のテキストに挟まれた関数 printf 形式の項目からなる 形式の項目からなる               : 普通は同上
		。このオプションが設定されているときは、'ruler'が表示されなくなる。
		欄     意味 意味               : 普通は同上
		-      その項目を左寄せする。minwid が項目の長さより大きい場合は、既定では右寄せになる。 が項目の長さより大きい場合は、既定では右寄せになる。               : 普通は同上
		0      数値の頭に0を表示する。欄 '-' が優先する。 が優先する。               : 普通は同上
		minwid 項目の長さの最小値。余白の穴埋めは '-' と '0' で設定する。 で設定する。               : 普通は同上
			項目の長さの最大値。文字列の項目の切り詰めでは '&lt;' が左に表示される。数値の項目は が左に表示される。数値の項目は               : 普通は同上
		maxwid maxwid-2 文字に切り詰められ、それに "&gt;数" が続く。ここで "数" は表示されなかった文字 は表示されなかった文字               : 普通は同上
			数であり、指数表記に似ている。
		item   以下で説明するアルファベット1文字。 以下で説明するアルファベット1文字。               : 普通は同上
		以下は、指定可能なステータス行の item の説明である。"item" の2文字目はその item の種類を表す。 の種類を表す。               : 普通は同上
		N 数値 数値               : 普通は同上
		S 文字列 文字列               : 普通は同上
		F 以下で説明するフラグ 以下で説明するフラグ               : 普通は同上
		- 実際に表示されるものではない 実際に表示されるものではない               : 普通は同上
		item 意味 意味               : 普通は同上
		f S  バッファ内のファイルの、カレントディレクトリに対する相対パス。 バッファ内のファイルの、カレントディレクトリに対する相対パス。               : 普通は同上
		F S  バッファ内のファイルのフルパス。 バッファ内のファイルのフルパス。               : 普通は同上
		t S  バッファ内のファイルのファイル名 (パスを除く)。 (パスを除く)。               : 普通は同上
		m F  修正フラグ。表示されるのは 'modifiable' がオフならば " [+]" または " [-]" [-]"               : 普通は同上
		M F  修正フラグ。表示されるのは ",+" または ",-"。 ",-"。               : 普通は同上
		r F  読み込み専用フラグ。表示されるのは " [RO]"。 [RO]"。               : 普通は同上
		R F  読み込み専用フラグ。表示されるのは ",RO"。 ",RO"。               : 普通は同上
		h F  ヘルプバッファフラグ。表示されるのは " [ヘルプ]"。 [ヘルプ]"。               : 普通は同上
		H F  ヘルプバッファフラグ。表示されるのは ",HLP"。 ",HLP"。               : 普通は同上
		w F  プレビューウィンドウフラグ。表示されるのは " [プレビュー]"。 [プレビュー]"。               : 普通は同上
		W F  プレビューウィンドウフラグ。表示されるのは ",PRV"。 ",PRV"。               : 普通は同上
		y F  バッファ内のファイルのタイプ。例えば " [vim]"。'filetype' を参照。 を参照。               : 普通は同上
		Y F  バッファ内のファイルのタイプ。例えば ",VIM"。'filetype' を参照。{Vi mが |+autocmd| 機能付 機能付               : 普通は同上
			きでコンパイルされたときのみ有効}
		k S  他言語用マッピング |:lmap| が使われているとき、変数 "b:keymap_name" または 'keymap' を " "               : 普通は同上
			<keymap>" と表示する。 と表示する。               : 普通は同上
		n N  バッファ番号。 バッファ番号。               : 普通は同上
		b N  カーソル下の文字の文字コードの10進数表現。 カーソル下の文字の文字コードの10進数表現。               : 普通は同上
		B N  同上、ただし16進数表現。 同上、ただし16進数表現。               : 普通は同上
		o N  カーソル下の文字がファイル内で何バイト目であるか。先頭では1。覚え方: ファイル先頭からの隔 ファイル先頭からの隔               : 普通は同上
			たり (に1を足したもの) {Vi mが |+byte_offset| 機能付きでコンパイルされたときのみ有効} 機能付きでコンパイルされたときのみ有効}               : 普通は同上
		O N  同上、ただし16進数表現。 同上、ただし16進数表現。               : 普通は同上
		N N  印刷時のページ番号 ('printheader' 内でのみ有効)。 内でのみ有効)。               : 普通は同上
		l N  何行目にカーソルがあるか。 何行目にカーソルがあるか。               : 普通は同上
		L N  バッファ内の総行数。 バッファ内の総行数。               : 普通は同上
		c N  何列目にカーソルがあるか。 何列目にカーソルがあるか。               : 普通は同上
		v N  画面上の何列目にカーソルがあるか。 画面上の何列目にカーソルがあるか。               : 普通は同上
		V N  画面上の何列目にカーソルがあるか。表示形式は -{num}。値が 'c' と等しければ表示されない。 と等しければ表示されない。               : 普通は同上
		p N  現在行がファイル内の何％の位置にあるか (|CTRL-G| と同様) と同様)               : 普通は同上
		P S  現在表示されているウィンドウ内のテキストが、ファイル内の何％の位置にあるか。これは 現在表示されているウィンドウ内のテキストが、ファイル内の何％の位置にあるか。これは               : 普通は同上
			'ruler' で説明されているものに似ている。値は常に3文字である で説明されているものに似ている。値は常に3文字である               : 普通は同上
		a S  既定のタイトルと同様の引数ファイルリストを"({current} of {max})" と表示する。ファイル引数 と表示する。ファイル引数               : 普通は同上
			の数が0または1のときは空。
		{ NF '{' と '}' の間の expression を評価し、結果に置き換える。 を評価し、結果に置き換える。               : 普通は同上
		( -  項目グループの開始。グループ内の項目全てに対する幅と寄せ方の設定に使える。どこかで %) で で               : 普通は同上
			閉じられなければならない。
		) -  項目グループの終了。欄 width は指定できない。 は指定できない。               : 普通は同上
		&lt; 行が長すぎるときに切り詰める位置。既定では先頭。欄 width は指定できない。 は指定できない。               : 普通は同上
		-
		= -  左寄せ項目と右寄せ項目の区切り。欄 width は指定できない。 は指定できない。               : 普通は同上
			使われる強調表示グループを User{N} に設定する。ここで {N} は欄minwid から取られる。例えば から取られる。例えば               : 普通は同上
		* -  %1* と設定する。%* や %0* で通常の強調表示を復元する。強調表示グループ User{N} と と               : 普通は同上
			StatusLine の違いは、非カレントウィンドウのステータス行の強調表示を設定するグループの の違いは、非カレントウィンドウのステータス行の強調表示を設定するグループの               : 普通は同上
			StatusLineNC に適用される。数 N は 1 以上 9 以下である。|hl-User1..9| を参照。 を参照。               : 普通は同上
		suffixes  初期値：".bak,~,.o,.h,.info,.swp,.obj" 初期値：".bak,~,.o,.h,.info,.swp,.obj"               : 普通は同上
		ワイルドカードで表示するときに優先度を低くする拡張子。この拡張子を持つファイルは、ワイルドカー
		ドに複数のファイルがマッチしたときの優先度が低くなる。拡張子はコンマで区切って指定する。
		suffixesadd  初期値："" 初期値：""               : 普通は同上
		"gf", "[I" 等のコマンドで検索されるファイルの拡張子。値は拡張子のコンマ区切りのリスト。 等のコマンドで検索されるファイルの拡張子。値は拡張子のコンマ区切りのリスト。               : 普通は同上
		例：
		:set suffixesadd=.java suffixesadd=.java               : 普通は同上
		swapfile  初期値：オン 初期値：オン               : 普通は同上
		スワップファイルを使用する設定。このオプションは、特定のバッファでスワップファイルを使いたくな
		いときにはオフに設定できる。
		swapsync  初期値："fsync" 初期値："fsync"               : 普通は同上
		書き込みの後にディスク上のスワップファイルの内容を同調する設定。値が空のときは、スワップファイ
		ルの一部はメモリ内のままで、ディスクに書き込まれないかもしれない。システムがクラッシュすると、
		仕事の成果が余計ひどく失われるかもしれない。
		switchbuf  初期値："" 初期値：""               : 普通は同上
		バッファを切り替えるときの動作を調節する。
		useopen これが含まれたときは、指定されたバッファを開いているウィンドウがあれば、そこにジャンプ これが含まれたときは、指定されたバッファを開いているウィンドウがあれば、そこにジャンプ               : 普通は同上
			する。含まれないときは、他のウィンドウを調べない。
		split   これが含まれたときは、カレントウィンドウをバッファの読み込み前に分割する。含まれないと これが含まれたときは、カレントウィンドウをバッファの読み込み前に分割する。含まれないと               : 普通は同上
			きは、ウィンドウを分割せず、カレントウィンドウを使う。
		syntax  初期値：emtpy 初期値：emtpy               : 普通は同上
		強調表示(色付け)のON/OFF設定。強調表示をする場合は、:set syntax=ON とする。強調表示をしない場 とする。強調表示をしない場               : 普通は同上
		合は、:set syntax=OFF とする。自動的に適切な色付けがされない場合は、パラメータにファイルタイプ とする。自動的に適切な色付けがされない場合は、パラメータにファイルタイプ               : 普通は同上
		を指定することもできる。
		例：
		:set syntax=html syntax=html               : 普通は同上
		tabstop  初期値：8 初期値：8               : 普通は同上
		ファイル内の &lt;Tab&gt; が対応する空白の数。 が対応する空白の数。               : 普通は同上
		tagbsearch  初期値：オン 初期値：オン               : 普通は同上
		高速にタグジャンプする。タグの検索時には、タグファイルの二分探索と線形探索のどちらも可能である
		。このオプションで、二分探索を行うようにできる。二分探索をすると、タグの検索が「大幅に」速くな
		る。
		taglength  初期値：0 初期値：0               : 普通は同上
		タグ名の長さに上限を持たせる。非0 のときは、タグ名のうち、前からこの値の文字数までが意味を持つ のときは、タグ名のうち、前からこの値の文字数までが意味を持つ               : 普通は同上
		。
		tagrelative  初期値：Vim : オン, Vi : オフ オフ               : 普通は同上
		タグ名を相対的にする。タグファイルを別のディレクトリから使うと、そのタグファイルでのタグ名は、
		タグファイルのあるディレクトリに対して相対的になる。
		tags  初期値："./tags,tags", +emacs_tagsでコンパイルしたら: "./tags,./TaGS,tags,TaGS" "./tags,./TaGS,tags,TaGS"               : 普通は同上
		タグファイルを指定する。タグを使うコマンドで必要とするタグファイルの名前の、空白またはコンマ区
		切りのリスト。ファイル名に空白やコンマを使うときは、'\' を前に置く。 を前に置く。               : 普通は同上
		tagstack  初期値：オン 初期値：オン               : 普通は同上
		タグスタックを使う。タグスタックとは、タグジャンプの履歴を持ち、CTRL-Tによりジャンプ元に戻る機
		能のことオフのときは、引数付きのコマンド ":tag" または ":tselect" は、タグをタグスタックにプッ は、タグをタグスタックにプッ               : 普通は同上
		シュしない。
		term  初期値：$TERM 初期値：$TERM               : 普通は同上
		ターミナルの名前。ターミナル制御文字の選択に使われる。環境変数は展開される。
		termencoding  初期値："" 初期値：""               : 普通は同上
		ターミナルで使われるエンコーディング名。どの文字エンコーディングをキーボードが生成し、どの文字
		エンコーディングをディスプレイが理解できるかを指定する。
		terse  初期値：オフ 初期値：オフ               : 普通は同上
		ファイルの端まで検索してしまったときのメッセージが表示しない。オプション 'shortmess' にフラグ にフラグ               : 普通は同上
		's' を追加する (こうするとファイルの端まで検索してしまったときのメッセージが表示されなくなる) (こうするとファイルの端まで検索してしまったときのメッセージが表示されなくなる)               : 普通は同上
		。オフのときは、オプション 'shortmess' からフラグ 's' を取り除く。 を取り除く。               : 普通は同上
		textauto  初期値：Vim : オン, Vi : オフ オフ               : 普通は同上
		後方互換性のため残されたオプション、fileformatsを使う。
		textmode  初期値：MS-DOS, Win32 and OS/2: オン, それ以外は、オフ それ以外は、オフ               : 普通は同上
		後方互換性のため残されたオプション、fileformatsを使う。
		textwidth  初期値：0 初期値：0               : 普通は同上
		入力されているテキストの最大幅。行がそれより長くなると、この幅を超えないように空白の後で改行さ
		れる。値を 0 に設定すると無効になる。 に設定すると無効になる。               : 普通は同上
		thesaurus  初期値："" 初期値：""               : 普通は同上
		同義語補完コマンドで使われるファイル。同義語補完コマンド |i_CTRL-X_CTRL-T| で単語の検索に使わ で単語の検索に使わ               : 普通は同上
		れるファイルの名前の、コンマ区切りのリスト。そのファイルの各行には、似た意味の単語をキーワード
		を構成しない文字で (空白がよい) 区切ったものが並ぶ。行長の最大値は 510 バイトである。 バイトである。               : 普通は同上
		tildeop  初期値：オフ 初期値：オフ               : 普通は同上
		コマンドをオペレータとして動作させる。オンのとき、ティルデコマンド "~" が operator のように使 のように使               : 普通は同上
		用できる。大文字／小文字を変換するが、このオプションがオンのときは、"d" 等のように範囲を指定さ 等のように範囲を指定さ               : 普通は同上
		れるまで変換しない。このオプションがオフでも、"g~{motion}" なら範囲を指定できる。 なら範囲を指定できる。               : 普通は同上
		timeout  初期値：オン 初期値：オン               : 普通は同上
		Vimが入力の確定を待つかを設定する。詳細は、ttimeoutを参照。
		timeoutlen  初期値：1000 初期値：1000               : 普通は同上
		キーコードやマッピングされたキー列が完了するのを待つ時間。単位は、ミリ秒。
		title  初期値：オフ 初期値：オフ               : 普通は同上
		ウィンドウのタイトルを変更する設定。ウィンドウのタイトルがオプション 'titlestring' の値になる の値になる               : 普通は同上
		。 titlestringが空の場合は、以下のようになる。 filename [+=-] (path) - VIM VIM               : 普通は同上
		-  ファイルが変更できない、つまり 'ma' がオフであることを表す がオフであることを表す               : 普通は同上
		+  ファイルが変更を受けたことを表す ファイルが変更を受けたことを表す               : 普通は同上
		=  ファイルが読み込み専用であることを表す ファイルが読み込み専用であることを表す               : 普通は同上
		=+ ファイルが読み込み専用であるが変更を受けたことを表す ファイルが読み込み専用であるが変更を受けたことを表す               : 普通は同上
		titlelen  初期値：85 初期値：85               : 普通は同上
		ウィンドウタイトルが占める列の割合。タイトルがこれより長かったときは、パス名の後ろの部分のみが
		表示される。この切り詰めを示すためには、パス名の前に文字 '&lt;' が表示される。 が表示される。               : 普通は同上
		titleold  初期値："Thanks for flying Vim" Vim"               : 普通は同上
		Vim終了時に復元する元のウィンドウタイトルこのオプションの値は、Vimの終了時に元のウィンドウタイ
		トルが復元できない場合のタイトルに使われる。オプション 'title' がオンであるか'titlestring' が が               : 普通は同上
		空でないときのみ有効である。 cygwinを使っていると、この値がEUCになっているせいで、vim終了後に cygwinを使っていると、この値がEUCになっているせいで、vim終了後に               : 普通は同上
		ウィンドウタイトルが崩れてしまう。
		titlestring  初期値："" 初期値：""               : 普通は同上
		ウィンドウタイトルに使われる文字。空でないとき、ウィンドウタイトルに使われる。オプション
		'title' がオンのときのみ有効。 がオンのときのみ有効。               : 普通は同上
		toolbar  初期値："icons,tooltips" 初期値："icons,tooltips"               : 普通は同上
		ツールバーの様々な設定。 icons ツールバーのボタンにアイコンが表示される。 text ツールバーのボ ツールバーのボ               : 普通は同上
		タンに名前が表示される。 tooltips ツールバーのボタンでツールティップが表示される。 ツールバーのボタンでツールティップが表示される。               : 普通は同上
		ttimeout  初期値：オフ 初期値：オフ               : 普通は同上
		Vimが入力の確定を待つかを設定する。
		'timeout' 'ttimeout'     動作 動作               : 普通は同上
		オフ      オフ           タイムアウト (時間切れ) を設けない を設けない               : 普通は同上
		オン      オンまたはオフ マッピングとキーコードにタイムアウトあり マッピングとキーコードにタイムアウトあり               : 普通は同上
		オフ      オン           キーコードにタイムアウトあり キーコードにタイムアウトあり               : 普通は同上
		待ち時間はオプション'timeoutlen' で設定できる。 で設定できる。               : 普通は同上
		ttimeoutlen  初期値：-1 初期値：-1               : 普通は同上
		キーコードやマッピングされたキー列が完了するのを待つ時間。普通オプション 'timeoutlen' のみが使 のみが使               : 普通は同上
		われ、'ttimeoutlen' は -1 に設定される。キーコードに対して異なった待ち時間を設定したいときは、 に設定される。キーコードに対して異なった待ち時間を設定したいときは、               : 普通は同上
		'ttimeoutlen' を非負の値に設定すること。 を非負の値に設定すること。               : 普通は同上
		ttimeoutlen マッピング待ち キーコード待ち キーコード待ち               : 普通は同上
		負          'timeoutlen'   'timeoutlen' 'timeoutlen'               : 普通は同上
		0以上       'timeoutlen'   'ttimeoutlen' 'ttimeoutlen'               : 普通は同上
		ttybuiltin  初期値：オン 初期値：オン               : 普通は同上
		組み込みのtermcapを使う。オンのときは、外部の termcap の前に組み込みの termcap を探す。オフの を探す。オフの               : 普通は同上
		ときは、外部の termcap の後に組み込みの termcap を探す。 を探す。               : 普通は同上
		ttyfast  初期値：オフ 初期値：オフ               : 普通は同上
		高速ターミナル接続を行う。再描画のとき、行挿入／削除コマンドを使う代わりに、より多くの文字が画
		面に送られる。複数のウィンドウが開かれていたり、ターミナルが部分スクロールをサポートしていない
		とき、再描画が滑らかになる。
		ttymouse  初期値：Termに依存 初期値：Termに依存               : 普通は同上
		ターミナルでマウスを使う設定。
		値      意味 意味               : 普通は同上
		xterm   xterm 風にマウスを扱う。 風にマウスを扱う。               : 普通は同上
		xterm2  "xterm" と動作が似ているが、ドラッグ中もマウス位置を返すような xterm に対して働く。 に対して働く。               : 普通は同上
		netterm NetTerm 風にマウスを扱う。 風にマウスを扱う。               : 普通は同上
		dec     DEC terminal 風にマウスを扱う。 風にマウスを扱う。               : 普通は同上
		jsbterm JSB term 風にマウスを扱う。 風にマウスを扱う。               : 普通は同上
		pterm   QNX pterm 風にマウスを扱う。 風にマウスを扱う。               : 普通は同上
		ttyscroll  初期値：999 初期値：999               : 普通は同上
		画面をスクロールする行数の最大値。この行数以上スクロールするときは、ウィンドウが再描画される。
		ttytype  初期値：$TERM 初期値：$TERM               : 普通は同上
		オプション'term' の別名。 の別名。               : 普通は同上
		undolevels  初期値：100, UNIX,VMS,Win32,OS/2は1000 UNIX,VMS,Win32,OS/2は1000               : 普通は同上
		アンドゥ可能な変更の最大値。アンドゥをするための情報はメモリに蓄えられるため、大きい数を設定す
		るとメモリの消費量も多くなる。
		updatecount  初期値：200 初期値：200               : 普通は同上
		スワップファイルの自動保存設定。この回数だけ文字を打ち込むと、スワップファイルがディスクに書き
		込まれる。 0 にすると、スワップファイルは全く作られない にすると、スワップファイルは全く作られない               : 普通は同上
		updatetime  初期値：4000 初期値：4000               : 普通は同上
		スワップファイルの自動保存時間設定。この時間の間 (ミリ秒単位) 入力がなければ、スワップファイル 入力がなければ、スワップファイル               : 普通は同上
		がディスクに書き込まれる。
		verbose  初期値：0 初期値：0               : 普通は同上
		実行中の動作に関するメッセージを表示する。値が 0 より大きいとき、Vimは実行中の動作に関するメッ より大きいとき、Vimは実行中の動作に関するメッ               : 普通は同上
		セージを表示する。
		値     意味 意味               : 普通は同上
		1以上  ファイル viminfo が読み書きされたとき が読み書きされたとき               : 普通は同上
		2以上  コマンド ":source" でファイルを読み込んだとき でファイルを読み込んだとき               : 普通は同上
		5以上  検索されたタグファイル全て 検索されたタグファイル全て               : 普通は同上
		8以上  autocommand のグループが実行されたファイル のグループが実行されたファイル               : 普通は同上
		9以上  実行された autocommand 全て 全て               : 普通は同上
		12以上 実行された関数全て 実行された関数全て               : 普通は同上
		15以上 実行された Ex コマンド全て (200 文字から後は切り捨て) 文字から後は切り捨て)               : 普通は同上
		viewdir  初期値：amiga, MS-DOS, OS/2 Win32:"$VIM/vimfiles/view", Unix: "~/.vim/view",Macintosh: "~/.vim/view",Macintosh:               : 普通は同上
		"$VIM:vimfiles:view"
		コマンド |:mkview| によるファイルを格納するディレクトリの名前。コマンド:mkviewにより現在のウィ によるファイルを格納するディレクトリの名前。コマンド:mkviewにより現在のウィ               : 普通は同上
		ンドウのプロパティを保存して、後で同じプロパティで開きなおすことができる。この:mkviewが使用す
		るファイルを保存するディレクトリをこのオプションで指定する。
		viewoptions  初期値："folds,options,cursor" 初期値："folds,options,cursor"               : 普通は同上
		コマンド |:mkview| の効果を変更する。値はキーワードのコンマ区切りのリスト。 の効果を変更する。値はキーワードのコンマ区切りのリスト。               : 普通は同上
		キーワー 復元される項目 復元される項目               : 普通は同上
		ド
		cursor   ファイル／ウィンドウ内のカーソル位置 ファイル／ウィンドウ内のカーソル位置               : 普通は同上
		folds    手動で作られた折り畳み、折り畳みの開閉の区別、折り畳み関連のローカルなオプション 手動で作られた折り畳み、折り畳みの開閉の区別、折り畳み関連のローカルなオプション               : 普通は同上
		options  ウィンドウまたはバッファについてローカルなオプションとマッピング (ローカルなオプショ (ローカルなオプショ               : 普通は同上
			ンのグローバルな値は含めない)
		slash    ファイル名内の '\' がスラッシュに置換される がスラッシュに置換される               : 普通は同上
		unix     WindowsやDOS上でも、Unix形式の end-of-line (1個の) を使う を使う               : 普通は同上
		viminfo  初期値：Vi : "", Vim MS-DOS,'20,"50,h,ra:,rB:、amigaは: '20,"50,h,rdf0:,rdf1:,rdf2:それ以外は: '20,"50,h,rdf0:,rdf1:,rdf2:それ以外は:               : 普通は同上
		'20,"50,h
		viminfoファイルの設定。値は指定部のコンマ区切りのリスト
		フ
		ラ 動作 動作               : 普通は同上
		グ
		!  これが含まれると、アルファベットの大文字で始まり、小文字を含まないグローバル変数を保存・復 これが含まれると、アルファベットの大文字で始まり、小文字を含まないグローバル変数を保存・復               : 普通は同上
			元する。つまり "KEEPTHIS" と"K_L_M" は保存されるが、"KeepThis" と "_K_L_M" は保存されない。 は保存されない。               : 普通は同上
			各レジスタで保存される行数の最大値。0 にすると、レジスタは保存されなくなる。指定されないと にすると、レジスタは保存されなくなる。指定されないと               : 普通は同上
		"  きは、すべての行が保存される。文字'"' の前に '\' を置くことを忘れないこと。そうでないと、コ を置くことを忘れないこと。そうでないと、コ               : 普通は同上
			メントの開始と見なされてしまう！
			これが含まれると、バッファリストを保存・復元する。Vimの起動時にファイル名が引数に含まれてい
		%  ると、バッファリストは復元されない。 Vimの起動時にファイル名が引数に含まれていないと、バッ Vimの起動時にファイル名が引数に含まれていないと、バッ               : 普通は同上
			ファリストが viminfo ファイルから復元される。ファイル名のないバッファとヘルプ用バッファは、 ファイルから復元される。ファイル名のないバッファとヘルプ用バッファは、               : 普通は同上
			viminfo ファイルには書き込まれない。 ファイルには書き込まれない。               : 普通は同上
			マークが復元されるファイル履歴の最大値。オプション 'viminfo'が空でないときは、常にこれを設 'viminfo'が空でないときは、常にこれを設               : 普通は同上
		'  定しなければならない。また、このオプションを設定するとジャンプリスト |jumplist| もviminfo もviminfo               : 普通は同上
			ファイルに蓄えられることになる。
		/  保存される検索パターンの履歴の最大値。非0 の値を指定すると、前回の検索パターンと置換パター の値を指定すると、前回の検索パターンと置換パター               : 普通は同上
			ンも保存される。これが含まれないときは、'history' の値が使われる。 の値が使われる。               : 普通は同上
		:  保存されるコマンドライン履歴の最大値。これが含まれないときは、'history' の値が使われる。 の値が使われる。               : 普通は同上
		@  保存される input-line 履歴の最大値。これが含まれないときは、'history' の値が使われる。 の値が使われる。               : 普通は同上
		c  これが含まれると、viminfo ファイル内のテキストを、書き込まれたときのエンコーディングから現 ファイル内のテキストを、書き込まれたときのエンコーディングから現               : 普通は同上
			在のエンコーディングに変換する。|viminfo-encoding| (訳注: および 'encoding') を参照。 を参照。               : 普通は同上
			ファイルマークを保存するかどうか。0 を指定すると、ファイルマーク ('0 から '9, 'a から 'Z) 'Z)               : 普通は同上
		f  は保存されない。これが含まれなかったり、値が非0 のときは、みな保存される。 '0 は (終了時や (終了時や               : 普通は同上
			コマンド ":wviminfo" の実行時の) カーソル位置の保存に使われる。 カーソル位置の保存に使われる。               : 普通は同上
		h  viminfo ファイルの読み込み時に、'hlsearch' を無効にする。含まれないときは、最後の検索コマン を無効にする。含まれないときは、最後の検索コマン               : 普通は同上
			ド以来、コマンド ":nohlsearch"が使われたかどうかによる。 ":nohlsearch"が使われたかどうかによる。               : 普通は同上
			これでファイル viminfo の名前を指定する。名前は 'n' のすぐ後に続けて指定する。'viminfo' の の               : 普通は同上
		n  最後に指定しなければならない！Vimの開始時に引数 "-i" が指定されると、それで指定されたファイ が指定されると、それで指定されたファイ               : 普通は同上
			ル名がここで指定されたものを上書きする。環境変数は、オプションの設定時ではなく、ファイルの
			読み込み時に展開される。
			リムーバブル・メディア (訳注: フロッピ、CD-ROM等の取り外せる記憶装置。この中身は取り替えて フロッピ、CD-ROM等の取り外せる記憶装置。この中身は取り替えて               : 普通は同上
			しまえば全く変わるので、ファイル履歴の意味がない) の指定。引数は文字列 (次の ',' まで) であ であ               : 普通は同上
		r  る。これは複数個指定できる。それぞれがマーク履歴の対象外になるパスの先頭部を指定する。これ る。これは複数個指定できる。それぞれがマーク履歴の対象外になるパスの先頭部を指定する。これ               : 普通は同上
			はリムーバブル・メディアを避けるためである。 MS-DOSでは "ra:,rb:", amigaでは amigaでは               : 普通は同上
			"rdf0:,rdf1:,rdf2:" とするとよい。大文字と小文字の区別はない。それぞれの 'r' の引数の最大長 の引数の最大長               : 普通は同上
			は 50 文字である。 文字である。               : 普通は同上
		例:
		:set viminfo='50,\"1000,:0,n~/vim/viminfo viminfo='50,\"1000,:0,n~/vim/viminfo               : 普通は同上
		'50
			最近編集した 50 ファイル内のマークは保存される。 ファイル内のマークは保存される。               : 普通は同上
		"1000
			レジスタの中身 (それぞれ 1000 行まで) は保存される。 は保存される。               : 普通は同上
		:0
			コマンドラインの履歴は保存されない。
		n~/vim/viminfo
			使用するファイル名は "~/vim/viminfo" である。 である。               : 普通は同上
		'/' がない がない               : 普通は同上
			'/' が指定されていないので、既定値が使われる。つまり全ての検索履歴や前回の検索パターン、置 が指定されていないので、既定値が使われる。つまり全ての検索履歴や前回の検索パターン、置               : 普通は同上
			換パターンが保存される。
		'%' がない がない               : 普通は同上
			バッファリストは、保存も復元もされない。
		'h' がない がない               : 普通は同上
			'hlsearch' による強調表示は復元される。 による強調表示は復元される。               : 普通は同上
		virtualedit  初期値："" 初期値：""               : 普通は同上
		フリーカーソルモードにする。値は、以下のキーワードのコンマ区切りのリストである。
		値     意味 意味               : 普通は同上
		block  Visual blockモードで仮想編集を有効にする。 blockモードで仮想編集を有効にする。               : 普通は同上
		insert Insertモードで仮想編集を有効にする。 Insertモードで仮想編集を有効にする。               : 普通は同上
		all    全てのモードで仮想編集を有効にする。 全てのモードで仮想編集を有効にする。               : 普通は同上
		visualbell  初期値：オフ 初期値：オフ               : 普通は同上
		エラー音の代わりに画面フラッシュを使う。ビープ音に、実際は音でなくビジュアルベル(画面フラッシ
		ュ) を使う。 を使う。               : 普通は同上
		warn  初期値：オン 初期値：オン               : 普通は同上
		警告メッセージの表示設定。バッファが変更される間にシェルコマンドが使われたら、警告メッセージを
		表示する。
		weirdinvert  初期値：オフ 初期値：オフ               : 普通は同上
		標準出力で上書きしない。後方互換性のために残されている。termcap オプション 't_xs' と同じ効果を と同じ効果を               : 普通は同上
		持つ。
		whichwrap  初期値：Vim : "b,s", Vi : "" ""               : 普通は同上
		カーソルを行頭、行末で止まらないようにする。
		フラグ キー          モード モード               : 普通は同上
		b      &lt;BS&gt;    NormalとVisual NormalとVisual               : 普通は同上
		s      &lt;Space&gt; NormalとVisual NormalとVisual               : 普通は同上
		h      "h"           NormalとVisual NormalとVisual               : 普通は同上
		l      "l"           NormalとVisual NormalとVisual               : 普通は同上
		&lt;   &lt;Left&gt;  NormalとVisual NormalとVisual               : 普通は同上
		&gt;   &lt;Right&gt; NormalとVisual NormalとVisual               : 普通は同上
		~      "~"           Normal Normal               : 普通は同上
		[      &lt;Left&gt;  InsertとReplace InsertとReplace               : 普通は同上
		]      &lt;Right&gt; InsertとReplace InsertとReplace               : 普通は同上
		wildchar  初期値：Vim : &lt;Tab&gt;, Vi : CTRL-E CTRL-E               : 普通は同上
		ワイルドカード展開に使用する文字。オプション 'wildmode' で指定したようにワイルドカードを展開す で指定したようにワイルドカードを展開す               : 普通は同上
		るために打ち込まなければならない文字。
		wildcharm  初期値：none (0) (0)               : 普通は同上
		マクロでも使えるワイルドカード展開に使用する文字。
		wildignore  初期値："" 初期値：""               : 普通は同上
		ファイル/ディレクトリ保管で無視されるファイルパターン。ファイルパターンのリスト。パターンのど
		れかにマッチしたファイルは、ファイル／ディレクトリ名の補完時に無視される。
		wildmenu  初期値：オフ 初期値：オフ               : 普通は同上
		補完候補を表示する。コマンドライン補完が拡張モードで行われる。オプション'wildchar' で指定され で指定され               : 普通は同上
		たキー (普通 <tab>) を打ち込むと補完を開始し、コマンドラインのすぐ上に可能性のあるマッチが表示 を打ち込むと補完を開始し、コマンドラインのすぐ上に可能性のあるマッチが表示               : 普通は同上
		され、最初のマッチが強調表示される。
		wildmode  初期値：Vim : "full" "full"               : 普通は同上
		補完動作の設定。オプション 'wildchar' で指定されたキーで開始する補完モード。 で指定されたキーで開始する補完モード。               : 普通は同上
		設定値       意味 意味               : 普通は同上
			最初のマッチのみを補完する。
		full         次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び 次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び               : 普通は同上
			最初のマッチが補完される。
		longest      共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次 共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次               : 普通は同上
			の候補に移る。
		longest:full "longest" と似ているが、'wildmenu' が有効ならばそれを開始する。 が有効ならばそれを開始する。               : 普通は同上
		list         複数のマッチがあるときは、全てのマッチを羅列する。 複数のマッチがあるときは、全てのマッチを羅列する。               : 普通は同上
		list:full    複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する。 複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する。               : 普通は同上
		list:longest 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完さ 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完さ               : 普通は同上
			れる。
		winaltkeys  初期値："menu" 初期値："menu"               : 普通は同上
		aLTキーの動作設定。メニューの選択に使うaLTキーをマッピングで使えるようにする。
		値   意味 意味               : 普通は同上
			aLTキーをメニューに使わない。aLTキーを使った組み合わせはマッピングに使えるが、自動的にメ
		no   ニューの操作に使われることはない。このときメニューの操作は、コマンド |:simalt| で可能であ で可能であ               : 普通は同上
			る。
		yes  aLTキーの扱いはウィンドウシステムに任される。aLTキーとのキーの組み合わせは、マッピングに aLTキーの扱いはウィンドウシステムに任される。aLTキーとのキーの組み合わせは、マッピングに               : 普通は同上
			は使えない。
		menu メニューのショートカットキーになっている文字と組み合わせてaLTキーを使うとウィンドウシステ メニューのショートカットキーになっている文字と組み合わせてaLTキーを使うとウィンドウシステ               : 普通は同上
			ムが扱うが、他のキーはマッピングに使える。
		winheight  初期値：1 初期値：1               : 普通は同上
		カレントウィンドウの行数の最小値。カレントウィンドウの行数が指定したものより少ないときは、他の
		ウィンドウの行数を減らしてそれを増やす。
		winminheight  初期値：1 初期値：1               : 普通は同上
		カレントウィンドウではないウィンドウの高さの最小値。 0 に設定すると、ウィンドウは必要に応じて に設定すると、ウィンドウは必要に応じて               : 普通は同上
		高さゼロに「潰される」 (つまり、ステータス行のみになる)。ウィンドウがアクティブになると、高さ (つまり、ステータス行のみになる)。ウィンドウがアクティブになると、高さ               : 普通は同上
		は最低 1行にはなる (カーソルの居場所が必要なため)。 (カーソルの居場所が必要なため)。               : 普通は同上
		winminwidth  初期値：1 初期値：1               : 普通は同上
		カレントウィンドウではないウィンドウの幅の最小値。 0 に設定すると、ウィンドウは必要に応じて幅 に設定すると、ウィンドウは必要に応じて幅               : 普通は同上
		ゼロに「潰される」 (つまり、垂直分割の区切りのみになる)。ウィンドウがアクティブになると、幅は (つまり、垂直分割の区切りのみになる)。ウィンドウがアクティブになると、幅は               : 普通は同上
		最低1 列にはなる (カーソルの居場所が必要なため)。 (カーソルの居場所が必要なため)。               : 普通は同上
		winwidth  初期値：20 初期値：20               : 普通は同上
		カレントウィンドウの列数の最小値。カレントウィンドウの列数が指定したものより少ないときは、他の
		ウィンドウの列数を減らしてそれを増やす。
		wrap  初期値：オン 初期値：オン               : 普通は同上
		ウィンドウの幅を超える行の折り返し設定。ウィンドウの幅より長い行は折り返され、次の行に続けて表
		示される。オフのときは、折り返しは行われず、長い行は一部のみが表示される。
		wrapmargin  初期値：0 初期値：0               : 普通は同上
		行の折り返しをするマージン。ウィンドウの右端からこの文字数だけ離れたところで折り返しが始まる。
		この境界を超えてテキストを入力すると、 <eol> が挿入され、挿入は次行に続く。 が挿入され、挿入は次行に続く。               : 普通は同上
		wrapscan  初期値：オン 初期値：オン               : 普通は同上
		検索をファイルの末尾まで検索したら、ファイルの先頭へループする。
		write  初期値：オン 初期値：オン               : 普通は同上
		ファイルの書き込みを有効にする。オフのときは、書き込みができない。
		writeany  初期値：オフ 初期値：オフ               : 普通は同上
		書込み保護の無視。いかなるファイルも "!" なしに書き込みができる。 なしに書き込みができる。               : 普通は同上
		writebackup  初期値：オフ、+writebackupでコンパイルされたらオンファイルの上書きの前にバックアップを作る。 初期値：オフ、+writebackupでコンパイルされたらオンファイルの上書きの前にバックアップを作る。               : 普通は同上
		writedelay  初期値：0 画面に表示するディレイ時間。打ち込まれた文字が画面に送られるまでの遅延時間を、1万分の1秒単位で指定する。これはデバッグ用のオプションである。 画面に表示するディレイ時間。打ち込まれた文字が画面に送られるまでの遅延時間を、1万分の1秒単位で指定する。これはデバッグ用のオプションである。               : 普通は同上

VIM USER MaNUaL - by Bram Moolenaar Moolenaar               : 普通は同上
	新しいコマンドを作る
	Vim は拡張可能なエディタです。よく使う操作を一つにまとめて新しいコマンドを作成 は拡張可能なエディタです。よく使う操作を一つにまとめて新しいコマンドを作成               : 普通は同上
	したり、既存のコマンドを再定義したりできます。自動コマンドを使うと、コマンドを
	自動的に実行できます。
	|40.1| キーマッピング キーマッピング               : 普通は同上
	|40.2| コマンドラインコマンドを定義する コマンドラインコマンドを定義する               : 普通は同上
	|40.3| 自動コマンド 自動コマンド               : 普通は同上
	次章: |usr_41.txt| Vim スクリプト書法 スクリプト書法               : 普通は同上
	前章: |usr_32.txt| undo ツリー ツリー               : 普通は同上
	目次: |usr_toc.txt| |usr_toc.txt|               : 普通は同上
	==============================================================================
	*40.1* キーマッピング キーマッピング               : 普通は同上
	|05.3| で簡単なマップを説明しました。マップの原理は、キー操作を他のキー操作に で簡単なマップを説明しました。マップの原理は、キー操作を他のキー操作に               : 普通は同上
	変換するというものです。単純ですが強力な仕組みです。
	典型的な使い方は、一つのキーを複数のキーにマップする方法です。ファンクション
	キー (<F1>以外) には機能が割り当てられていないので、それらのキーを使うとよいで には機能が割り当てられていないので、それらのキーを使うとよいで               : 普通は同上
	しょう。例:
	:map <F2> GoDate: <Esc>:read !date<CR>kJ !date<CR>kJ               : 普通は同上
	このマップでは三つのモードが使われています。"G" で最後の行にジャンプし、"o" で で               : 普通は同上
	新しい行を開いてインサートモードを開始、"Date: " というテキストを入力してから というテキストを入力してから               : 普通は同上
	<Esc> でインサートモードを抜けます。 でインサートモードを抜けます。               : 普通は同上
	特殊キーを <> で囲んで表記していますが、これは括弧表記というものです。特殊キー で囲んで表記していますが、これは括弧表記というものです。特殊キー               : 普通は同上
	を押すのではなく、見たまま文字どおり入力してください。この表記を使ったマップは
	読むのが簡単で、そのままコピー＆ペーストして使うことができます。
	さて、":" でコマンドラインモードに入ります。":read !date" コマンドは、"date" コマンドは、"date"               : 普通は同上
	コマンドの出力を読み込んで、現在行の下に追加します。<CR> は ":read" コマンドを コマンドを               : 普通は同上
	実行するために必要です。
	この時点で、テキストは次のようになっています:
	Date:
	Fri Jun 15 12:54:34 CEST 2001 2001               : 普通は同上
	最後に、"kJ" で上に移動してから二つの行を一行につなげます。 で上に移動してから二つの行を一行につなげます。               : 普通は同上
	マップするキーを選ぶときは |map-which-keys| を参考にしてください。 を参考にしてください。               : 普通は同上
	マップとモード
	--------------
	":map" コマンドはノーマルモードのキーマップを定義します。同様に、他のモードの コマンドはノーマルモードのキーマップを定義します。同様に、他のモードの               : 普通は同上
	マップを定義することもできます。例えば ":imap" でインサートモードのマップを定 でインサートモードのマップを定               : 普通は同上
	義できます。次のマップは、カーソルの下に日付を挿入します:
	:imap <F2> <CR>Date: <Esc>:read !date<CR>kJ !date<CR>kJ               : 普通は同上
	多少の違いはありますが、ノーマルモードで <F2> にマップしたものと同じです。この にマップしたものと同じです。この               : 普通は同上
	マップを定義してもノーマルモードの <F2> は消えません。このように、同じキーを は消えません。このように、同じキーを               : 普通は同上
	モード別にマップすることができます。
	このマップはインサートモードの中で開始しますが、実行後はノーマルモードになって
	しまいます。インサートモードを継続したい場合はマップの最後に "a" を追加してく を追加してく               : 普通は同上
	ださい。
	マップコマンドはモード別に用意されています:
	:map ノーマルモード、ビジュアルモード、オペレータ待機モード ノーマルモード、ビジュアルモード、オペレータ待機モード               : 普通は同上
	:vmap ビジュアルモード ビジュアルモード               : 普通は同上
	:nmap ノーマルモード ノーマルモード               : 普通は同上
	:omap オペレータ待機モード オペレータ待機モード               : 普通は同上
	:map! インサートモード、コマンドライン インサートモード、コマンドライン               : 普通は同上
	:imap インサートモード インサートモード               : 普通は同上
	:cmap コマンドライン コマンドライン               : 普通は同上
	オペレータ待機モードとは、"d" や "y" などのオペレータを入力した後、モーション などのオペレータを入力した後、モーション               : 普通は同上
	コマンドやテキストオブジェクトの入力を待機している状態のことです。例えば "dw" "dw"               : 普通は同上
	の "w" はオペレータ待機モードでの入力です。 はオペレータ待機モードでの入力です。               : 普通は同上
	例えば、d<F7> コマンドで C プログラムのブロック ({}で囲まれたテキスト) を削除 を削除               : 普通は同上
	できるように、あるいは、y<F7> でブロックをヤンクできるようにしたい場合は、<F7> でブロックをヤンクできるようにしたい場合は、<F7>               : 普通は同上
	をマップしてプログラムブロックを選択できるようにする必要があります。次のように
	します:
	:omap <F7> a{ a{               : 普通は同上
	オペレータ待機モードで <F7> を押すと "a{" によってブロックが選択されます。この によってブロックが選択されます。この               : 普通は同上
	マップは、{ が押しにくい位置にあるキーボードでは便利です。 が押しにくい位置にあるキーボードでは便利です。               : 普通は同上
	マップの一覧を表示する
	----------------------
	定義されたマップの一覧を確認したい場合は、":map" コマンドを引数なしで実行しま コマンドを引数なしで実行しま               : 普通は同上
	す。モード別のマップコマンドを使うこともできます。次のような一覧が表示されま
	す:
	_g :call MyGrep(1)<CR> MyGrep(1)<CR>               : 普通は同上
	v <F2> :s/^/> /<CR>:noh<CR>`` /<CR>:noh<CR>``               : 普通は同上
	n <F2> :.,$s/^/> /<CR>:noh<CR>`` /<CR>:noh<CR>``               : 普通は同上
	<xHome> <Home> <Home>               : 普通は同上
	<xEnd> <End> <End>               : 普通は同上
	最初の列は、マップが機能するモードを示しています。"n" はノーマルモード、"i" は は               : 普通は同上
	インサートモード、などなど。":map" で定義されたマップには空白が使われます。空 で定義されたマップには空白が使われます。空               : 普通は同上
	白の場合はノーマルモードとビジュアルモードで使えます。
	この一覧を見れば、<> 表記で書いた特殊キーが正しく認識されているかを確認できま 表記で書いた特殊キーが正しく認識されているかを確認できま               : 普通は同上
	す (カラー表示がサポートされている場合に限る)。例えば、<Esc> が色付きで表示さ が色付きで表示さ               : 普通は同上
	れていれば、それはエスケープ文字です。他のテキストと同じ色で表示されている場合
	は、それは "<Esc>" という 5 文字の文字列です。 文字の文字列です。               : 普通は同上
	再マップ
	--------
	マップは他のマップを含むことができます。例えば、上述の <F2> のマップは次のよう のマップは次のよう               : 普通は同上
	に短くできます:
	:map <F2> G<F3> G<F3>               : 普通は同上
	:imap <F2> <Esc><F3> <Esc><F3>               : 普通は同上
	:map <F3> oDate: <Esc>:read !date<CR>kJ !date<CR>kJ               : 普通は同上
	ノーマルモードの <F2> は、最後の行に移動して <F3> を押すようにマップされていま を押すようにマップされていま               : 普通は同上
	す。インサートモードの <F2> は、<Esc> でインサートモードを停止して <F3> を押す を押す               : 普通は同上
	ようにマップされています。そして、<F3> には目的の機能がマップされています。 には目的の機能がマップされています。               : 普通は同上
	例えば、Ex モードはほとんど使わないので "Q" をテキスト整形コマンドとして使える をテキスト整形コマンドとして使える               : 普通は同上
	ようにしたい (昔の Vim はそういう動作でした) 場合は、次のようなマップを定義し 場合は、次のようなマップを定義し               : 普通は同上
	ます:
	:map Q gq gq               : 普通は同上
	しかし、Ex モードが使いたくなることもあるかもしれません。"gQ" を Q にマップし にマップし               : 普通は同上
	て、EX モードが使えるようにしましょう: モードが使えるようにしましょう:               : 普通は同上
	:map gQ Q Q               : 普通は同上
	この状態で "gQ" を入力すると "Q" にマップされます。ここまではいいですね。とこ にマップされます。ここまではいいですね。とこ               : 普通は同上
	ろが、さらに "Q" が "gq" にマップされてしまいます。つまり、"gQ" は "gq" に変換 に変換               : 普通は同上
	されるので Ex モードを使うことはできないのです。 モードを使うことはできないのです。               : 普通は同上
	再マップされないようにするには、":noremap" コマンドを使います: コマンドを使います:               : 普通は同上
	:noremap gQ Q Q               : 普通は同上
	これで、マップされた "Q" に対して他のマップが適用されなくなります。同じような に対して他のマップが適用されなくなります。同じような               : 普通は同上
	コマンドがモード別に用意されています:
	:noremap ノーマルモード、ビジュアルモード、オペレータ待機モード ノーマルモード、ビジュアルモード、オペレータ待機モード               : 普通は同上
	:vnoremap ビジュアルモード ビジュアルモード               : 普通は同上
	:nnoremap ノーマルモード ノーマルモード               : 普通は同上
	:onoremap オペレータ待機モード オペレータ待機モード               : 普通は同上
	:noremap! インサートモード、コマンドライン インサートモード、コマンドライン               : 普通は同上
	:inoremap インサートモード インサートモード               : 普通は同上
	:cnoremap コマンドライン コマンドライン               : 普通は同上
	再帰マップ
	----------
	マップが自分自身を含んでいる場合、そのマップは永遠に動き続けます。これを利用す
	れば、コマンドを無限に繰り返すことができます。
	例えば、いくつかのファイルがあって、すべてのファイルは一行目にバージョン番号が
	書かれているとします。"vim *.txt" でそれらのファイルを開くと、一つ目のファイル でそれらのファイルを開くと、一つ目のファイル               : 普通は同上
	が開いた状態になります。次のマップを定義します:
	:map ,, :s/5.1/5.2/<CR>:wnext<CR>,, :s/5.1/5.2/<CR>:wnext<CR>,,               : 普通は同上
	そして、",," を入力してマップを実行します。このマップは一行目の "5.1" を "5.2" "5.2"               : 普通は同上
	に変更し、":wnext" で上書き保存してから次のファイルを開きます。マップの最後は で上書き保存してから次のファイルを開きます。マップの最後は               : 普通は同上
	",," になっているので同じマップが再び適用され、置換と保存が実行されます。 になっているので同じマップが再び適用され、置換と保存が実行されます。               : 普通は同上
	このマップは、何かエラーが発生するまで止まりません。このマップの場合、置換コマ
	ンドの実行で "5.1" が見つからなかった場合にエラーが発生します。その場合は、 が見つからなかった場合にエラーが発生します。その場合は、               : 普通は同上
	"5.1" を挿入してから再びマップを実行します。最後のファイルに到達すると、 を挿入してから再びマップを実行します。最後のファイルに到達すると、               : 普通は同上
	":wnext" が失敗してマップが停止します。 が失敗してマップが停止します。               : 普通は同上
	マップの途中でエラーが発生した場合は、そのマップの残りの部分は無視されます。
	マップは CTRL-C で中断できます (MS-WindowsではCTRL-Break)。 (MS-WindowsではCTRL-Break)。               : 普通は同上
	マップを削除する
	----------------
	マップを削除するには ":unmap" コマンドを使います。このコマンドにも、モード別の コマンドを使います。このコマンドにも、モード別の               : 普通は同上
	ものが用意されています:
	:unmap ノーマルモード、ビジュアルモード、オペレータ待機モード ノーマルモード、ビジュアルモード、オペレータ待機モード               : 普通は同上
	:vunmap ビジュアルモード ビジュアルモード               : 普通は同上
	:nunmap ノーマルモード ノーマルモード               : 普通は同上
	:ounmap オペレータ待機モード オペレータ待機モード               : 普通は同上
	:unmap! インサートモード、コマンドライン インサートモード、コマンドライン               : 普通は同上
	:iunmap インサートモード インサートモード               : 普通は同上
	:cunmap コマンドライン コマンドライン               : 普通は同上
	例えば、ビジュアルモードを除き、ノーマルモードとオペレータ待機モードだけでマッ
	プを定義したいような場合は次のトリックが使えます。最初に三つのモードでマップを
	定義し、ビジュアルモードのマップだけを削除します:
	:map <C-a> /---><CR> /---><CR>               : 普通は同上
	:vunmap <C-a> <C-a>               : 普通は同上
	"<C-a>" は CTRL-a キーとして解釈されます。 キーとして解釈されます。               : 普通は同上
	すべてのマップを削除するには |:mapclear| コマンドを使います。他のコマンドと同 コマンドを使います。他のコマンドと同               : 普通は同上
	様に、これにもモード別のコマンドが用意されています。マップの削除はアンドゥでき
	ないので注意してください。
	特殊文字
	--------
	":map" コマンドの後ろには他のコマンドを続けて書くことができます。その場合は | |               : 普通は同上
	文字でコマンドを区切ります。そのため、マップの中では | 文字が使えません。この 文字が使えません。この               : 普通は同上
	文字を使いたい場合は <Bar> (5文字) を使ってください。例: を使ってください。例:               : 普通は同上
	:map <F8> :write <Bar> !checkin %<CR> %<CR>               : 普通は同上
	同じ問題は ":unmap" コマンドにもあります。":unmap" の場合はさらに末尾のスペー の場合はさらに末尾のスペー               : 普通は同上
	スにも注意しなければなりません。以下の二つのコマンドは動作が違います:
	:unmap a | unmap b b               : 普通は同上
	:unmap a| unmap b b               : 普通は同上
	一つ目のコマンドは "a " (スペース付き) のマップを削除します。 のマップを削除します。               : 普通は同上
	マップの中でスペースを使いたい場合は <Space> (7文字) を使ってください: を使ってください:               : 普通は同上
	:map <Space> W W               : 普通は同上
	このマップはスペースキーを押すと、次の単語 (空白区切り) に移動します。 に移動します。               : 普通は同上
	マップコマンドの末尾にはコメントを付けられません。なぜなら、" 文字はマップの一 文字はマップの一               : 普通は同上
	部として処理されてしまうからです。代わりに |" を使ってください。これは、新しい を使ってください。これは、新しい               : 普通は同上
	空のコマンドを開始して、そのコマンドにコメントをつけます。例:
	:map <Space> W| " 次の単語に移動するのにスペースバーを使う 次の単語に移動するのにスペースバーを使う               : 普通は同上
	マップと短縮入力
	----------------
	インサートモードのマップは短縮入力とよく似ています。引数は同じ方法で処理されま
	す。主な違いは実行されるタイミングです。短縮入力は単語の後で単語以外の文字を入
	力したときに実行されます。マップはマップ文字列の最後の文字を入力したときに実行
	されます。
	違いは他にもあります。短縮入力では入力した文字がすぐに挿入されます。短縮入力が
	実行されると元の文字が削除されて指定された文字列に置換されます。マップされた文
	字を入力したときは最後の文字を入力してマップが実行されるまで何も挿入されませ
	ん。'showcmd' オプションがオンに設定されている場合は、入力途中の文字がウィンド オプションがオンに設定されている場合は、入力途中の文字がウィンド               : 普通は同上
	ウ下部に表示されます。
	マップがあいまいな場合は少し違う動作になります。例えば、次の二つのマップがある
	とき:
	:imap aa foo foo               : 普通は同上
	:imap aaa bar bar               : 普通は同上
	"aa" と入力した時点では、一つ目のマップを適用すべきか、それとも二つ目のマップ と入力した時点では、一つ目のマップを適用すべきか、それとも二つ目のマップ               : 普通は同上
	を使うべきか、判断できません。その場合は、他の文字が入力されるまで待機状態にな
	ります。"a" を入力すると二つ目のマップが適用されて "bar" が挿入されます。他の が挿入されます。他の               : 普通は同上
	文字、例えばスペース、を入力すると一つ目のマップが適用されて "foo" が挿入さ が挿入さ               : 普通は同上
	れ、さらにスペースが挿入されます。
	さらに...
	---------
	<script> キーワードを使うと、スクリプトローカルなマップを定義できます。 キーワードを使うと、スクリプトローカルなマップを定義できます。               : 普通は同上
	|:map-<script>| 参照。 参照。               : 普通は同上
	<buffer> キーワードを使うと、バッファローカルなマップを定義できます。 キーワードを使うと、バッファローカルなマップを定義できます。               : 普通は同上
	|:map-<buffer>| 参照。 参照。               : 普通は同上
	<unique> キーワードを使うと、定義しようとしたマップがすでに定義されていた場合 キーワードを使うと、定義しようとしたマップがすでに定義されていた場合               : 普通は同上
	にコマンドが失敗します。このキーワードを使わない場合は、古いマップが上書き定義
	されます。|:map-<unique>| 参照。 参照。               : 普通は同上
	何もしないキーを定義したい場合は <Nop> (5文字) を使います。次のコマンドは、 を使います。次のコマンドは、               : 普通は同上
	<F7> キーが何もしないように設定しています: キーが何もしないように設定しています:               : 普通は同上
	:map <F7> <Nop>| map! <F7> <Nop> <Nop>               : 普通は同上
	<Nop> の後に空白を入れないでください。 の後に空白を入れないでください。               : 普通は同上
	==============================================================================
	*40.2* コマンドラインコマンドを定義する コマンドラインコマンドを定義する               : 普通は同上
	Vim では新しいコマンドを定義することができます。定義したコマンドはコマンドライ では新しいコマンドを定義することができます。定義したコマンドはコマンドライ               : 普通は同上
	ンモードの他のコマンドと同じように使えます。
	コマンドを定義するには ":command" コマンドを使います: コマンドを使います:               : 普通は同上
	:command DeleteFirst 1delete 1delete               : 普通は同上
	":DeleteFirst" コマンドを実行すると、":1delete" が実行され、最初の行が削除され が実行され、最初の行が削除され               : 普通は同上
	ます。
	Note:
	ユーザー定義コマンドの名前は必ず大文字で開始する必要があります。":X"、
	":Next"、":Print" を使うことはできません。アンダースコア ("_") も使え も使え               : 普通は同上
	ません。数字は使えますがお勧めしません。
	ユーザー定義コマンドの一覧を見るには、次のコマンドを実行します:
	:command
	組み込みコマンドと同じように、ユーザー定義コマンドも省略できます。他のコマンド
	と区別するのに十分な長さの文字を入力するだけでコマンドを実行できます。コマンド
	ライン補完を使って完全な名前を得ることもできます。
	引数の数
	--------
	ユーザー定義コマンドは引数を取ることができます。引数の数は -nargs オプションで オプションで               : 普通は同上
	指定する必要があります。例えば、上述の :DeleteFirst コマンドは引数を取らないの コマンドは引数を取らないの               : 普通は同上
	で、次のように定義できます:
	:command -nargs=0 DeleteFirst 1delete 1delete               : 普通は同上
	指定が無ければ 0 が使われるので、わざわざ "-nargs=0" を指定する必要はありませ を指定する必要はありませ               : 普通は同上
	ん。-nargs には次の値を指定できます: には次の値を指定できます:               : 普通は同上
	-nargs=0 引数なし 引数なし               : 普通は同上
	-nargs=1 引数 1 個 個               : 普通は同上
	-nargs=* いくつでも いくつでも               : 普通は同上
	-nargs=? 引数なし、もしくは 1 個 個               : 普通は同上
	-nargs=+ 引数 1 個以上 個以上               : 普通は同上
	引数の使い方
	------------
	コマンド定義の中では、<args> キーワードを使って引数を表します。例: キーワードを使って引数を表します。例:               : 普通は同上
	:command -nargs=+ Say :echo "<args>" "<args>"               : 普通は同上
	次のコマンドを実行すると:
	:Say Hello World World               : 普通は同上
	"Hello World" と表示されます。引数に引用符 (") が使われると、これはうまく動き が使われると、これはうまく動き               : 普通は同上
	ません。例:
	:Say he said "hello" "hello"               : 普通は同上
	特殊な文字が含まれているときにそれを適切にエスケープして文字列として使えるよう
	にするには "<q-args>" を使います: を使います:               : 普通は同上
	:command -nargs=+ Say :echo <q-args> <q-args>               : 普通は同上
	上記の ":Say" コマンドを実行すると、次のコマンドが実行されます: コマンドを実行すると、次のコマンドが実行されます:               : 普通は同上
	:echo "he said \"hello\"" \"hello\""               : 普通は同上
	<f-args> キーワードを使うと、引数が関数呼び出しに適した形に展開されます。例: キーワードを使うと、引数が関数呼び出しに適した形に展開されます。例:               : 普通は同上
	:command -nargs=* DoIt :call aFunction(<f-args>) aFunction(<f-args>)               : 普通は同上
	:DoIt a b c c               : 普通は同上
	次のコマンドが実行されます:
	:call aFunction("a", "b", "c") "c")               : 普通は同上
	範囲指定
	--------
	いくつかのコマンドは範囲指定を受け付けますが、そのようなコマンドを定義したい場
	合は -range オプションを使います。このオプションには次の値を指定できます: オプションを使います。このオプションには次の値を指定できます:               : 普通は同上
	-range 範囲指定を許可。省略時は現在行が選択される。 範囲指定を許可。省略時は現在行が選択される。               : 普通は同上
	-range=% 範囲指定を許可。省略時はファイル全体が選択される。 範囲指定を許可。省略時はファイル全体が選択される。               : 普通は同上
	-range={count} 範囲指定を許可。範囲指定の最後の数値だけを使う。省略時 範囲指定を許可。範囲指定の最後の数値だけを使う。省略時               : 普通は同上
	は {count} が使われる。 が使われる。               : 普通は同上
	範囲指定を使う場合は、<line1> キーワードと <line2> キーワードを使って範囲の最 キーワードを使って範囲の最               : 普通は同上
	初と最後の行を取得できます。例えば、次のコマンドは、指定された範囲のテキストを
	"save_file" に保存するコマンドを定義しています: に保存するコマンドを定義しています:               : 普通は同上
	:command -range=% SaveIt :<line1>,<line2>write! save_file save_file               : 普通は同上
	他のオプション
	--------------
	使用できるオプションやキーワードは他にもあります:
	-count={number} カウント指定を受け付ける。省略時は {number}。 {number}。               : 普通は同上
	カウント指定は <count> キーワードで取得できま キーワードで取得できま               : 普通は同上
	す。
	-bang ! の指定を受け付ける。! が使われた場合は が使われた場合は               : 普通は同上
	<bang> キーワードが ! に置き換わります。 に置き換わります。               : 普通は同上
	-register レジスタの指定を受け付ける。(省略時は無名レジ レジスタの指定を受け付ける。(省略時は無名レジ               : 普通は同上
	スタ。)
	指定されたレジスタは <reg> (または <register>) <register>)               : 普通は同上
	で取得できます。
	-complete={type} コマンドライン補完の種類を指定する。使用できる コマンドライン補完の種類を指定する。使用できる               : 普通は同上
	補完の種類は |:command-completion| を参照。 を参照。               : 普通は同上
	-bar コマンドの後ろに | を使って他のコマンド (ある (ある               : 普通は同上
	いはコメント) を続けて書くことを許可する。 を続けて書くことを許可する。               : 普通は同上
	-buffer カレントバッファでのみ使用できるコマンドを定義 カレントバッファでのみ使用できるコマンドを定義               : 普通は同上
	する。
	最後に <lt> キーワードを説明します。これは文字 "<" を意味します。<> 表記をエス 表記をエス               : 普通は同上
	ケープして、特殊な意味を消すために使います。
	再定義と削除
	------------
	同じ名前のコマンドを再定義したい場合は ! を使います: を使います:               : 普通は同上
	:command -nargs=+ Say :echo "<args>" "<args>"               : 普通は同上
	:command! -nargs=+ Say :echo <q-args> <q-args>               : 普通は同上
	コマンドを削除したい場合は ":delcommand" を使います。削除したいコマンドの名前 を使います。削除したいコマンドの名前               : 普通は同上
	を引数に指定してください。例:
	:delcommand SaveIt SaveIt               : 普通は同上
	次のコマンドですべてのユーザー定義コマンドを削除できます:
	:comclear
	コマンドの削除はアンドゥできないので注意してください。
	ユーザー定義コマンドについての詳細はリファレンスマニュアルを参照してください。
	|user-commands|。
	==============================================================================
*40.3* 自動コマンド

自動コマンドとは、さまざまなイベントに応じて自動的に実行されるコマンドのことで
す。ファイルを読み書きしたり、バッファを切り替えたりしたときに実行されます。例
えば、|gzip|プラグインは、圧縮ファイルを開くために自動コマンドを使っています。
自動コマンドは非常に強力です。適切に使えばいろんな手間を省くことができます。し
かし、不適切な使い方をすればさまざまなトラブルの原因になります。

例えば、ファイルを保存するときに、保存した日付をファイル末尾に書き込んでみま
しょう。まず、次の関数を定義します:

:function DateInsert()
: $delete
: read !date
:endfunction

ファイルを保存する直前にこの関数を実行したいわけです。次のコマンドで設定しま
す:

:autocmd FileWritePre * call DateInsert()

"FileWritePre" は自動コマンドが実行されるイベントです。このイベントはファイル
を保存する直前に発行されます。"*" の部分はファイル名にマッチするパターンです。
"*" はすべてのファイルにマッチします。
この自動コマンドが設定された状態で ":write" を実行すると、ファイル名にマッチし
たすべての FileWritePre 自動コマンドが実行されてから、ファイルが保存されます。
:autocmd の正式な書式は次のとおりです:

:autocmd [group] {events} {file_pattern} [nested] {command}

[group] は省略可能です。コマンドを管理したり呼び出したりしたい場合に使います
(後述)。{events} はコマンドを実行するイベントのリストです (カンマ区切り)。
{file_pattern} はファイル名です。ワイルドカードが使えます。例えば、"*.txt" な
ら ".txt" で終わるファイルに対してコマンドが実行されます。 [nested] は省略可能
です。自動コマンドを再帰的に呼び出したい場合に指定します (下記参照)。そして、
実行したいコマンドを {command} に指定します。


イベント
--------

BufReadPost は最も便利なイベントの一つです。これは新しいファイルを開いたときに
発行されます。普通はオプションを設定したりするのに使われます。例えば、"*.gsm"
というファイルを GNU アセンブリ言語のファイルとして扱いたい場合は、次のように
設定します:

:autocmd BufReadPost *.gsm set filetype=asm

ファイルの種類が検出されて、'filetype' オプションが設定されると、Filetype イベ
ントが発行されます。このイベントはファイルの種類に応じて何かを実行したい場合に
使います。例えば、テキストファイルを開いたときに短縮入力の定義を読み込むには次
のようにします:

:autocmd Filetype text source ~/.vim/abbrevs.vim

新しいファイルを作成したときにスケルトンを挿入することもできます:

:autocmd BufNewFile *.[ch] 0read ~/skeletons/skel.c

イベントの一覧は |autocmd-events| を参照してください。


パターン
--------

{file_pattern} 引数には複数のパターンをカンマ区切りで指定できます。例えば、
"*.c,*.h" なら、末尾が ".c" と ".h" のファイルにマッチします。
パターンには一般的なワイルドカードが使えます。次のようなものがよく使われます:

* 何かの文字が何文字でも
? 何かの文字が 1 つ
[abc] a か b か c
. ドット
a{b,c} ab か ac

パターンにスラッシュ (/) が含まれている場合は、ディレクトリ名と比較されます。
スラッシュが含まれていない場合は、ファイル名のみが使われます。例えば、
"/home/biep/readme.txt" には "*.txt" がマッチします。"/home/biep/*" も同様に
マッチします。しかし、"home/foo/*.txt" はマッチしません。
スラッシュが含まれているときは、ファイルの絶対パス ("/home/biep/readme.txt")
と相対パス (例えば "biep/readme.txt") の両方が比較されます。

Note:
MS-Windows のように、ディレクトリの区切りにバックスラッシュを使うよう
なシステムでもスラッシュを使ってパターンを指定することができます。
バックスラッシュはエスケープする必要があるので、スラッシュを使ったほう
が簡単です。自動コマンドの移植性もあがります。


自動コマンドを削除する
----------------------

自動コマンドの削除には、定義と同じコマンドを使います。ただし、削除するときは !
を使い、{command} は指定しません。例:

:autocmd! FileWritePre *

"FileWritePre" イベントの、"*" パターンを使っている自動コマンドがすべて削除さ
れます。


一覧表示する
------------

定義されている自動コマンドの一覧を見るには次のようにします:

:autocmd

とても長い出力が表示されます。ファイルタイプの認識が有効になっている場合は特に
長くなります。一部のコマンドだけを表示したい場合は、グループ、イベント、パター
ンのどれかを指定してください。例えば、次のコマンドで BufNewFile に設定された自
動コマンドを表示できます:

:autocmd BufNewFile

"*.c" に対する自動コマンドを表示したい場合は次のようにします:

:autocmd * *.c

イベントに "*" を指定すると、すべてのイベントが表示されます。cprograms グルー
プの自動コマンドを表示したい場合は次のようにします:

:autocmd cprograms


グループ
--------

自動コマンドを定義するとき、{group} を指定することで、関連した自動コマンドをグ
ループ化できます。例えば、特定のグループの自動コマンドをまとめて削除したりでき
ます。
自動コマンドをグループ化するには、":augroup" コマンドを使います。例えば、C 言
語用の自動コマンドを定義してみましょう:

:augroup cprograms
: autocmd BufReadPost *.c,*.h :set sw=4 sts=4
: autocmd BufReadPost *.cpp :set sw=3 sts=3
:augroup END

次のように書くこともできます:

:autocmd cprograms BufReadPost *.c,*.h :set sw=4 sts=4
:autocmd cprograms BufReadPost *.cpp :set sw=3 sts=3

"cprograms" グループのすべての自動コマンドを削除するには、次のようにします:

:autocmd! cprograms


ネスト
------

通常は、自動コマンドの中で実行されたコマンドによってイベントが発行されることは
ありません。例えば、FileChangedShell イベントの中でファイルを読み込んでも、シ
ンタックスを設定するための自動コマンドは実行されません。イベントを発行させたい
場合は "nested" 引数を指定してください:

:autocmd FileChangedShell * nested edit


自動コマンドを実行する
----------------------

擬似的にイベントを発行して、自動コマンドを実行することができます。自動コマンド
の中から他の自動コマンドを実行するような場合に便利です。例:

:autocmd BufReadPost *.new execute "doautocmd BufReadPost " . expand("<afile>:r")

新しいファイルが開かれたときに実行される自動コマンドを定義しています。ファイル
名の末尾が ".new" になっているものが対象です。":execute" コマンドは、引数を評
価した結果をコマンドとして実行します。例えば、"tryout.c.new" を開くと、次のコ
マンドが実行されます:

:doautocmd BufReadPost tryout.c

expand() 関数に指定された "<afile>" が自動コマンドで使われたファイル名に展開さ
れ、":r" によって、そのルート部分 (訳注: .newを除いた部分) が使われます。

":doautocmd" はカレントバッファの上で実行されます。":doautoall" コマンドは、
":doautocmd" と同じ操作をすべてのバッファに対して実行します。


ノーマルモードコマンドを使う
----------------------------

自動コマンドで使用できるのはコマンドラインコマンドです。ノーマルモードコマンド
を使いたい場合は ":normal" コマンドを使ってください。例:

:autocmd BufReadPost *.log normal G

*.log ファイルを開くと、ファイル末尾にカーソルがジャンプします。
":normal" コマンドは少し複雑です。指定するコマンドは完結していなければなりませ
ん。例えば、"i" でインサートモードに入ったら、<Esc> でモードを抜ける必要があり
ます。"/" で検索する場合は、<CR> で検索を実行する必要があります。
":normal" コマンドはすべてのテキストを引数として解釈するので、| を使って他のコ
マンドを続けて書くことはできません。それが必要な場合は ":execute" コマンドの中
で ":normal" コマンドを実行してください。":execute" を使うと、特殊文字を指定す
るのが簡単になります。例:

:autocmd BufReadPost *.chg execute "normal ONew entry:\<Esc>" |
\ 1read !date

長いコマンドを見やすくするために、バックスラッシュを使って複数行に分けていま
す。この方法はスクリプトファイルの中だけで使えます (コマンドラインで入力すると
きは使えません)。

自動コマンドの中で複雑なことを実行すると、必然的にカーソルの位置が変わってしま
います。それを元に戻す方法については |restore-position| を参照してください。


イベントの無効化
----------------

自動コマンドを実行して欲しくないときは、'eventignore' オプションに無視したいイ
ベントを設定してください。例えば、次のように設定すると、他のウィンドウに移動し
たときのイベントが無視されます:

:set eventignore=WinEnter,WinLeave

すべてのイベントを無視するには、次のように設定します:

:set eventignore=all

通常の状態に戻すには、'eventignore' を空に設定します:

:set eventignore=

==============================================================================

次章: |usr_41.txt| Vim スクリプト書法

Copyright: see |manual-copyright| vim:tw=78:ts=8:ft=help:norl:

------------------------------------------------------------------------------------------------------------------------------------------------

top - main help file
Download (not html): vimdoc.zip

Vim日本語ドキュメント

苦情は yukihiro.nakadaira@gmail.com まで。



               {Google} ]>
              Google 検索
              ( ) WWW を検索 (*) vimdoc を検索



Vim documentation: usr_41
=========================

main help file

------------------------------------------------------------------------------------------------------------------------------------------------

*usr_41.txt* For Vim バージョン 7.2. Last change: 2008 Jun 21

VIM USER MANUAL - by Bram Moolenaar

Vim スクリプト書法


Vim スクリプト言語は vimrc ファイルや構文ファイルなど、さまざまな目的に使われ
ます。この章では Vim スクリプトの書き方を説明します。説明することがたくさんあ
るので大きな章になってます。

|41.1| はじめに
|41.2| 変数
|41.3| 式
|41.4| 条件式
|41.5| 式を実行する
|41.6| 関数を使う
|41.7| 関数を定義する
|41.8| リストと辞書
|41.9| 例外
|41.10| 注意事項
|41.11| プラグインを書く
|41.12| ファイルタイププラグインを書く
|41.13| コンパイラプラグインを書く
|41.14| プラグインを書く (高速ロード版)
|41.15| ライブラリスクリプトを書く
|41.16| Vim スクリプトを配布する

次章: |usr_42.txt| 新しいメニューを追加する
前章: |usr_40.txt| 新しいコマンドを作る
目次: |usr_toc.txt|

==============================================================================
*42.1* はじめに *vim-script-intro* *script*

誰もが最初に触れる Vim スクリプトは vimrc ファイルです。Vim が起動するときに読
み込まれ、書かれているコマンドが実行されます。それにより好きなように設定を変更
できます。vimrc の中ではすべてのコロンコマンドが使えます (":" で始まるコマンド
のこと。Ex コマンドやコマンドラインコマンドと呼ばれることもある)。
シンタックスファイルも Vim スクリプトです。シンタックスファイルは、ファイルタ
イプ別にオプションを設定するファイルの一種です。複雑なマクロ定義を別ファイルに
分けて保存しておくこともできます。このように、いろいろな使用方法が考えられま
す。

簡単な例から始めましょう:

:let i = 1
:while i < 5
: echo "count is" i
: let i += 1
:endwhile

Note:
実際には ":" を書く必要はありません。":" が必要なのはコマンドラインで
入力するときだけです。Vim スクリプトファイルを書くときは省略できます。
このヘルプでは、コロンコマンドであることを強調し、ノーマルモードと区別
するためにコロンを表記しています。
Note:
例文をヤンクして :@" コマンドで実際に実行できます。

出力は次のようになります:

count is 1
count is 2
count is 3
count is 4

一行目では ":let" コマンドで変数に値を代入しています。書式は次のとおりです:

:let {変数名} = {式}

例では、変数名が "i"、式が 1 です。
":while" コマンドでループを開始します。書式は次のとおりです:

:while {条件式}
: {ステートメント}
:endwhile

条件式が真である間、ステートメントが実行されます。例では、条件式は "i < 5" で
す。これは、i が 5 より小さい場合に真になります。
Note:
何かのミスで while ループが止まらなかった場合は、CTRL-C を押せば中断で
きます (MS-Windows では CTRL-Break)。

":echo" コマンドは引数を出力します。例では、"count is" という文字列と、変数 i
の値を出力しています。i が 1 なら、次のように表示されます:

count is 1

":let i += 1" は ":let i = i + 1" と同じ意味です。変数 i に 1 を加算し、新しい
値を同じ変数に代入します。

上述の例は、実際にはもっと簡潔に書くことができます:

:for i in range(1, 4)
: echo "count is" i
:endfor

|:for| と |range()| の説明はもっと先です。すぐに知りたい人はリンク先にジャンプ
してください。


三種類の数値
------------

数値は10進数、16進数、8進数のいずれかで表記します。16進数は "0x" か "0X" で開
始します。例えば "0x1f" は10進数の 31 です。8進数は "0" で開始します。例えば
"017" は10進数の 15 です。注意: 10進数で書くときは先頭に "0" を付けないでくだ
さい。8進数として扱われてしまいます。
":echo" コマンドは常に10進数で出力します。例:

:echo 0x7f 036
127 30

数値にマイナス記号を付けると負数になります。8進数や16進数も負数にできます。マ
イナス記号は減算記号としても使われます。次の例を上の例と比べてみてください:

:echo 0x7f -036
97

式の途中にある空白は無視されますが、可読性を高めるために、適切に空白で区切るこ
とをお勧めします。例えば上記の数値が負数であると勘違いしてしまわないように、マ
イナス記号と数値の間に空白をいれましょう:

:echo 0x7f - 036

==============================================================================
*41.2* 変数

変数名にはアルファベット、数字、アンダースコアが使えます。変数名を数字で開始す
ることはできません。次のような変数名が使えます:

counter
_aap3
very_long_variable_name_with_underscores
FuncLength
LENGTH

"foo+var" や "6var" のような名前は使えません。
例に挙げた変数はグローバル変数です。定義されている変数の一覧を見るのは次のコマ
ンドを使います:

:let

グローバル変数はどこでも使えます。そのため、あるスクリプトファイルで "count"
という変数を使ったとき、その変数は他のスクリプトでも使われている可能性がありま
す。これは混乱を招きますし、トラブルの元です。それを避けるには "s:" を付けてス
クリプトローカル変数を使います。例えば、次のように使います:

:let s:count = 1
:while s:count < 5
: source other.vim
: let s:count += 1
:endwhile

"s:count" はスクリプトローカル変数なので、他のスクリプトファイルによって変更さ
れる心配はありません。他のスクリプトファイルで "s:count" 変数が使われていたと
しても、それは別の変数です。スクリプトローカル変数についての詳細は
|script-variable| を参照してください。

変数の種類は他にもあります。|internal-variables| 参照。次の変数がよく使われま
す:

b:name バッファローカル変数
w:name ウィンドウローカル変数
g:name グローバル変数 (関数内では g: 必須)
v:name Vim が定義する変数


変数の削除
----------

変数はメモリを消費します。":let" コマンドの出力にも表示されます。変数を削除す
るには ":unlet" コマンドを使います。例:

:unlet s:count

スクリプトローカル変数の "s:count" が削除され、使用されていたメモリが開放され
ます。変数が存在しない場合でもエラーを起こしたくない場合は ! を付けてください:

:unlet! s:count

スクリプトの実行が終了したとき、ローカル変数は自動的には削除されません。次に同
じスクリプトを実行したときにその変数を使うことができます。例:

:if !exists("s:call_count")
: let s:call_count = 0
:endif
:let s:call_count = s:call_count + 1
:echo "called" s:call_count "times"

"exists()" 関数は変数が定義されているかどうかをチェックします。引数に調べたい
変数の名前を指定します。変数自体を指定するのではありません。例えば:

:if !exists(s:call_count)

これは、s:call_count の値を変数名として exists() 関数を呼び出しているので、意
味が違ってしまいます。
感嘆符 (! 記号) は値を反転します。値が真なら偽になり、偽なら真になります。この
記号は "not" と読むことができます。つまり、"if !exists()" は "if not exists()"
と読むことができます。
Vim では、0 以外の値はすべて真です。0 は偽です。
Note:
数値が必要なところで文字列を使ったとき、文字列は自動的に数値に変換され
ます。文字列の先頭が数字ではなかった場合は 0 に変換されます。つまり:
:if "true"
"true" は 0 に変換されるので偽になります。


文字列変数と定数
----------------

ここまでは変数の値に数値だけを使っていましたが、文字列を使うこともできます。
Vim は数値と文字列を基本型としてサポートしています。変数は動的に型付けされま
す。型は ":let" コマンドで変数に値を代入するたびに変化します。詳しくは|41.8|
を参照してください。
変数に文字列を代入するには文字列定数を使う必要があります。文字列定数には二つの
種類があります。一つはダブルクオート文字列です:

:let name = "peter"
:echo name
peter

文字列の中でダブルクオートを使いたい場合は、バックスラッシュを前置してくださ
い:

:let name = "\"peter\""
:echo name
"peter"

バックスラッシュを使いたくない場合はシングルクオート文字列を使ってください:

:let name = '"peter"'
:echo name
"peter"

シングルクオート文字列の中ではすべての文字がそのまま使われます。ただし、シング
ルクオートだけは特別で、一つのシングルクオートを表すためには二つのシングルク
オートを書く必要があります。バックスラッシュはそのまま使われるので、特殊文字は
使えません。
ダブルクオート文字列の中では特殊文字が使えます。次のようなものがあります:

\t <Tab>
\n <NL>, 改行
\r <CR>, <Enter>
\e <Esc>
\b <BS>, バックスペース
\" "
\\ \, バックスラッシュ
\<Esc> <Esc>
\<C-W> CTRL-W

最後の二つはただの一例です。"\<name>" 形式で "name" という特殊キーを使うことが
できます。
文字列で使える特殊表記については |expr-quote| を参照してください。

==============================================================================
*41.3* 式

Vim の式は高機能でシンプルです。式の定義については |expression-syntax| を参照
してください。ここでは基本的なことだけを説明します。
数値と文字列と変数はそれ自体が式です。つまり、式が必要なところでは数値でも文字
列でも変数でも使えます。他にも次のようなものが使えます:

$NAME 環境変数
&name オプション
@r レジスタ

例:

:echo "The value of 'tabstop' is" &ts
:echo "Your home directory is" $HOME
:if @a > 5

&name 形式を使うと、オプションを保存し、別の値に設定し、何かを実行して、オプ
ションを元に戻す、というようなことができます。例:

:let save_ic = &ic
:set noic
:/The Start/,$delete
:let &ic = save_ic

'ignorecase' オプションをオフにしてから "The Start" パターンを検索しています。
しかし設定は変更されません。(パターンに "\C" を加える方法でも同じことができま
す。|/C| 参照。)


数値計算
--------

基本的な要素を組み合わせると面白くなってきます。まずは数値計算です:

a + b 加算
a - b 減算
a * b 乗算
a / b 除算
a % b 剰余演算(余りを得る)

演算子の優先順位は一般的な規則と同じです:

:echo 10 + 5 * 2
20

カッコを使って優先順位を変更できます:

:echo (10 + 5) * 2
30

文字列は "." で連結できます:

:echo "foo" . "bar"
foobar

":echo" コマンドに複数の引数を指定すると、スペースで区切られて表示されます。こ
れらの例では一つの式しか使われていないので、スペースは挿入されていません。

C 言語と同じ条件演算子も使えます:

a ? b : c

"a" が真なら "b" が使われ、そうでなければ "c" が使われます。例:

:let i = 4
:echo i > 5 ? "i is big" : "i is small"
i is small

被演算子の部分は優先的に評価されるので、次のように見なすことができます:

(a) ? (b) : (c)

==============================================================================
*41.4* 条件式

":if" コマンドは条件が真の場合に ":endif" までのステートメントを実行します。書
式は次のとおり:

:if {condition}
{statements}
:endif

{condition} を評価した結果が真 (0以外) であれば、{statements} の内容が実行され
ます。{statements} は正しく記述されている必要があります。不正な記述があると
":endif" までたどり着けません。
":else" を使うこともできます。書式は次のとおり:

:if {condition}
{statements}
:else
{statements}
:endif

二つ目の {statements} は条件が偽の場合にだけ実行されます。
":elseif" を使うこともできます:

:if {condition}
{statements}
:elseif {condition}
{statements}
:endif

これは ":else" に続けて "if" 文を使うのと同じ動作ですが、余計な ":endif" を使
わなくて済みます。
vimrc ファイルで便利に使える例を示しましょう。'term' オプションの値を調べ、そ
の値に応じて処理を分けます:

:if &term == "xterm"
: " xterm 用の設定
:elseif &term == "vt100"
: " vt100 端末用の設定
:else
: " その他の端末用の設定
:endif


論理演算子
----------

今までの説明で既に論理演算子を使いました。次の演算子がよく使われます:

a == b 等しい
a != b 等しくない
a > b より大きい
a >= b より大きいか等しい
a < b より小さい
a <= b より小さいか等しい

条件が成立するなら 1、そうでなければ 0 が返ります。例:

:if v:version >= 700
: echo "おめでとう"
:else
: echo "古いバージョンを使っています。更新してね!"
:endif

"v:version" は Vim によって定義されている変数で、Vim のバージョンが入っていま
す。バージョン 6.0 なら 600、バージョン 6.1 なら 601 です。これは複数のバー
ジョンに対応するスクリプトを書くときに便利です。|v:version|

論理演算子は数値でも文字列でも扱えます。文字列どうしを比較するときは数学的な差
が比較されます。文字のバイト値を比較するので、一部の言語では正しい結果にならな
いかもしれません。
文字列と数値を比較するときは、文字列を数値に変換します。文字列が数字ではなかっ
たときは 0 になるので注意してください。例:

:if 0 == "one"
: echo "yes"
:endif

これは "yes" と表示されます。"one" は数字ではないので 0 に変換されるのです。

文字列にはさらに二つの論理演算子があります:

a =~ b パターンにマッチする
a !~ b パターンにマッチしない

左辺の "a" は文字列として扱われます。右辺の "b" は検索パターンとして扱われま
す。例:

:if str =~ " "
: echo "str にはスペースが含まれている"
:endif
:if str !~ '\.$'
: echo "str の末尾はピリオドではない"
:endif

パターンを指定するのにシングルクオート文字列を使うのがコツです。ダブルクオート
文字列ではバックスラッシュを二重に書く必要があり、そして、検索パターンではバッ
クスラッシュをよく使うので、バックスラッシュだらけになってしまいます。

文字列を比較するときは 'ignorecase' オプションが使われます。大文字小文字の区別
を明示的に指定したい場合は比較演算子に "#" (区別する) または "?" (区別しない)
をつけます。大文字小文字を区別せずに等しいかどうかを比較したい場合は "==?" を
使います。"!~#" ならパターンにマッチしないことを、大文字と小文字を区別して確認
できます。演算子の一覧は |expr-==| を参照してください。


他のループコマンド
------------------

":while" コマンドは既に説明しました。":while" ループの中では二つのステートメン
トが使えます:

:continue ループの先頭にジャンプしてループを継続する。
:break ":endwhile" までジャンプしてループを脱ける。

例：

:while counter < 40
: call do_something()
: if skip_flag
: continue
: endif
: if finished_flag
: break
: endif
: sleep 50m
:endwhile

":sleep" コマンドは Vim を一定時間停止します。"50m" は 50 ミリ秒です。
":sleep 4" なら 4 秒間スリープします。

":for" コマンドを使ってループすることもできます。|41.8|を参照。

==============================================================================
*41.5* 式を実行する

今まではコマンドを直接書いてきました。":execute" コマンドを使うと、式の評価結
果をコマンドとして実行できます。これによってコマンドを動的に生成することができ
ます。
例えば、変数に格納された文字列を使ってタグジャンプするには次のようにします:

:execute "tag " . tag_name

文字列 "tag " と変数 "tag_name" の値を "." で連結しています。仮に "tag_name"
の値が "get_cmd" だった場合、次のコマンドが実行されることになります:

:tag get_cmd

":execute" コマンドはコロンコマンドのみ実行できます。":normal" コマンドでノー
マルモードコマンドを実行できますが、このコマンドの引数は文字がそのまま使われ、
式としては評価されません。例:

:normal gg=G

このコマンドは一行目にジャンプしてから "=" オペレータですべての行を整形しま
す。
":normal" コマンドで式の値を使いたい場合は ":execute" と組み合わせてください。
例:

:execute "normal " . normal_commands

変数 "normal_commands" にはノーマルモードコマンドを入れておく必要があります。
":normal" には完結したコマンドを指定するようにしてください。引数が最後まで実行
された段階でコマンドは中断されます。例えば、インサートモードを開始した場合はイ
ンサートモードを終了しなくてはなりません。次のコマンドは正しく動作します:

:execute "normal Inew text \<Esc>"

これは現在行に "new text" を挿入します。特殊キー "\<ESC>" を使っていることに注
目してください。これによりスクリプトの中で本物の <Esc> 文字を使わないですみま
す。

文字列を実行するのではなく、その式の値を得たい場合は、eval() 関数を使います:

:let optname = "path"
:let optval = eval('&' . optname)

文字 "&" と "path" を連結しているので eval() の引数は "&path" になります。返り
値は 'path' オプションの値です。
次のようにすることもできます:
:exe 'let optval = &' . optname

==============================================================================
*41.6* 関数を使う

たくさんの関数があらかじめ定義され、豊富な機能が提供されています。このセクショ
ンの説明にもいくつか登場します。関数の一覧は |functions| を参照してください。

関数は ":call" コマンドで呼び出します。引数はカッコで囲み、それぞれをカンマで
区切ります。例:

:call search("Date: ", "W")

これは "Date: " と "W" を引数にして search() 関数を呼び出しています。search()
関数は一つ目の引数を検索パターンとして使い、二つ目の引数をフラグとして使いま
す。"W" フラグを指定するとファイル末尾で検索が終了します (折り返さない)。

関数は式の中で使うこともできます。例:

:let line = getline(".")
:let repl = substitute(line, '\a', "*", "g")
:call setline(".", repl)

getline() 関数はカレントバッファから行を取得する関数です。引数には行番号を指定
します。この例では "." ですが、これはカーソルのある行を示します。
substitute() 関数は ":substitute" コマンドとほぼ同じです。最初の引数は置換対象
の文字列、二つ目の引数はパターン、三つ目は置き換え文字列、最後はフラグです。
setline() 関数は行の内容を置き換えます。最初の引数は行番号、二つ目の引数は置き
換える文字列です。この例では、substitute() の結果で現在行を置き換えています。
上記の三行のコマンドは次のコマンドと同じことをしています:

:substitute/\a/*/g

substitute() コマンドの前後にいろいろな処理を入れたりすると、もっと面白いこと
ができるようになります。


関数一覧 *function-list*
--------

たくさんの関数があります。ここでは機能別に分類して紹介します。アルファベット順
の一覧は |functions| を参照してください。関数の名前の上で CTRL-] を押すと、詳
細な説明にジャンプできます。

文字列繰作:
nr2char() ASCII値から文字を得る
char2nr() 文字のASCII値を得る
str2nr() 文字列を数値に変換する
str2float() 文字列を浮動小数点数に変換する
printf() 書式付き文字列を整形する
escape() 文字列の特定の文字を '\' でエスケープ
shellescape() シェルコマンドで使えるように文字列をエスケープ
fnameescape() Vim コマンド用にファイル名をエスケープ
tr() ある文字の集合から別の文字の集合へ置換する
strtrans() 文字列を印刷可能な状態とする
tolower() 文字列を小文字にする
toupper() 文字列を大文字にする
match() 文字列の中でパターンにマッチした位置
matchend() 文字列の中でパターンにマッチした末尾の位置
matchstr() 文字列の中でパターンにマッチした文字列
matchlist() matchstr()と同様だが、部分マッチも返す
stridx() 文字列の中で部分文字列が見つかった最初の位置
strridx() 文字列の中で部分文字列が見つかった最後の位置
strlen() 文字列の長さ
substitute() パターンにマッチする文字列を置換
submatch() ":substitute" の中で部分マッチを得る
strpart() 文字列の一部分を得る
expand() 特殊キーワードを展開する
iconv() テキストのエンコーディングを変換する
byteidx() 文字列中の文字のバイトインデックス
repeat() 文字列を複数回繰り返す
eval() 文字列を式として評価する

リスト操作:
get() 要素を取得。存在しないインデックスでもエラーを
出さない
len() リスト中の要素の個数
empty() リストが空であるか判定する
insert() リストの任意の位置に要素を挿入する
add() リストに要素を追加する
extend() リストにリストを連結する
remove() リストから1個以上の要素を取り除く
copy() リストの浅いコピーを作成する
deepcopy() リストの完全なコピーを作成する
filter() リストから選択された要素を取り除く
map() リストの各要素を変換する
sort() リストをソートする
reverse() リストの並び順を反転させる
split() 文字列を分割し、リストにする
join() リストの要素を連結し、文字列にする
range() 数列リストを返す
string() リストの文字列表現
call() リストを引数として関数を呼ぶ
index() リスト中の要素のインデックス
max() リスト中の最大値
min() リスト中の最小値
count() ある要素がリスト中に出現する回数を返す
repeat() リストを複数回繰り返す

辞書操作:
get() 辞書の要素を返す。存在しないキーでもエラーを出
さない
len() 辞書の要素の個数
has_key() あるキーが辞書に含まれているか判定する
empty() 辞書が空であるか判定する
remove() 辞書から要素を取り除く
extend() ある辞書の要素をすべて別の辞書に追加する
filter() 辞書から選択された要素を取り除く
map() 辞書の各要素を変換する
keys() 辞書の全キーのリストを取得する
values() 辞書の全値のリストを取得する
items() 辞書の全キー・値のペアを取得する
copy() 辞書の浅いコピーを作成する
deepcopy() 辞書の完全なコピーを作成する
string() 辞書の文字列表現
max() 辞書中の最大値
min() 辞書中の最小値
count() ある値が出現する回数を返す

浮動小数点数の計算:
float2nr() Float を Number に変換
abs() 絶対値 (Numberも処理可能)
round() 丸め
ceil() 切り上げ
floor() 切り下げ
trunc() 少数切り捨て
log10() 10 を底とする対数
pow() x の y 乗
sqrt() 平方根
sin() sine (サイン)
cos() cosine (コサイン)
atan() arc tangent (アークタンジェント)

変数:
type() 変数の型
islocked() 変数がロックされているか判定する
function() 関数名からFuncrefを取得する
getbufvar() 指定バッファの変数値を得る
setbufvar() 指定バッファに変数を設定する
getwinvar() 指定ウィンドウの変数値を得る
gettabwinvar() 指定ウィンドウ・タブページから変数値を取得する
setwinvar() 指定ウィンドウに変数を設定する
settabwinvar() 指定ウィンドウ・タブページに変数を設定する
garbagecollect() 開放可能なメモリを解放する

カーソルとマークの位置:
col() カーソルやマークの列番号を得る
virtcol() カーソルやマークの画面上の列番号を得る
line() カーソルやマークの行番号を得る
wincol() カーソルのウィンドウでの列番号
winline() カーソルのウィンドウでの行番号
cursor() カーソルを指定した位置に移動させる
getpos() カーソルやマークなどの位置を取得する
setpos() カーソルやマークなどの位置を設定する
byte2line() 指定のバイト位置の行番号を得る
line2byte() 指定の行のバイト位置を得る
diff_filler() ある行より上の詰め行の数を取得する

カレントバッファで動作するもの:
getline() バッファから行を得る
setline() バッファの行を置き換える
append() 行または行のリストをバッファに追加する
indent() 行のインデントを得る
cindent() C 言語におけるインデントを得る
lispindent() Lisp 言語におけるインデントを得る
nextnonblank() 次の非空行を探す
prevnonblank() 前の非空行を探す
search() パターンにマッチする場所を探す
searchpos() パターンにマッチする場所を探す
searchpair() start/skip/end の対を探す
searchpairpos() start/skip/end の対を探す
searchdecl() 名前が宣言されている場所を探す

システム関数とファイル繰作:
glob() ワイルドカードを展開する
globpath() 複数のディレクトリを対象にワイルドカードを展開
findfile() 複数のディレクトリからファイルを探す
finddir() 複数のディレクトリからディレクトリを探す
resolve() ショートカットのリンク先を得る
fnamemodify() ファイル名を修飾する
pathshorten() パス中のディレクトリ名を短くする
simplify() パスの意味を変えずに簡略化する
executable() 実行形式ファイルかどうかをチェックする
filereadable() ファイルが読み込み可能かどうかをチェックする
filewritable() ファイルが書き込み可能かどうかをチェックする
getfperm() ファイルのパーミッションを得る
getftype() ファイルの種類を得る
isdirectory() ディレクトリの存在をチェックする
getfsize() ファイルのサイズを得る
getcwd() カレントディレクトリを得る
tempname() 一時ファイルの名前を得る
mkdir() ディレクトリを作成する
delete() ファイルを削除する
rename() ファイルの名前を変更する
system() シェルコマンドを実行し、その結果を得る
hostname() システムの名称を得る
readfile() ファイルを読み込み、行のリストを得る
writefile() 行のリストをファイルに書き込む

日付と時刻:
getftime() ファイルの最終更新日時を得る
localtime() 現在時刻を秒単位で得る
strftime() 時刻を文字列に変換する
reltime() 現在時刻または経過時間を正確に取得する
reltimestr() reltime()の結果を文字列に変換する

バッファ、ウィンドウ、引数リスト:
argc() 引数リストの大きさ
argidx() 引数リスト中の現在の位置
argv() 引数リストの中身を得る
bufexists() バッファの存在をチェックする
buflisted() バッファが存在し、リストされているかどうか
bufloaded() バッファが存在し、ロードされているかどうか
bufname() バッファの名前を得る
bufnr() バッファの番号を得る
tabpagebuflist() タブページ中のバッファのリストを返す
tabpagenr() タブページの番号を取得する
tabpagewinnr() タブページを対象にwinnr()と同様
winnr() カレントウィンドウの番号を得る
bufwinnr() バッファのウィンドウ番号を得る
winbufnr() ウィンドウのバッファ番号を得る
getbufline() バッファの行のリストを得る

コマンドライン:
getcmdline() 現在のコマンドラインを取得
getcmdpos() コマンドラインにおけるカーソル位置を取得
setcmdpos() コマンドラインにおけるカーソル位置を設定
getcmdtype() 現在のコマンドラインの種類を返す

Quickfixとロケーションリスト:
getqflist() quickfixエラーのリスト
setqflist() quickfixを変更する
getloclist() ロケーションリストの項目のリスト
setloclist() ロケーションリストを変更する

インサートモード補完:
complete() 補完候補を設定する
complete_add() 補完候補を追加する
complete_check() 補完処理を終えるべきかどうかをチェックする
pumvisible() ポップアップメニューが表示されているかチェック

折り畳み:
foldclosed() 行が折り畳まれているかどうかをチェックする
foldclosedend() foldclosed()と同様。折り畳み末尾の行番号を返す
foldlevel() 行の折り畳みレベルを得る
foldtext() 閉じた折り畳みを代替表示するテキストを生成
foldtextresult() 閉じた折り畳みを代替表示するテキストを得る

シンタックスハイライト:
clearmatches() |matchadd()|と|:match|コマンドで定義されたマッ
チをクリアする
getmatches() |matchadd()|と|:match|コマンドで定義されたすべ
てのマッチを得る
hlexists() ハイライトグループの存在をチェック
hlID() ハイライトグループのIDを得る
synID() 指定位置のシンタックスIDを得る
synIDattr() シンタックスIDから指定の属性を得る
synIDtrans() 変換したシンタックスIDを得る
diff_hlID() diffモードの指定位置のシンタックスIDを得る
matchadd() 強調表示するパターンを定義する
matcharg() |:match|の引数の情報を得る
matchdelete() |matchadd()|と|:match|コマンドで定義されたマッ
チを削除する
setmatches() |getmatches()|で得たマッチを使って復元する

スペリング:
spellbadword() カーソル位置以降のスペルミスを探す
spellsuggest() スペル訂正の候補を返す
soundfold() 単語の同音等値(sound-a-like equivalent)を返す

履歴:
histadd() 履歴に項目を追加
histdel() 履歴から項目を削除
histget() 履歴の項目を得る
histnr() 履歴リストの最大インデックスを得る

対話インターフェース:
browse() ファイル選択ダイアログを開く
browsedir() ディレクトリ選択ダイアログを開く
confirm() ユーザーに選択をさせる
getchar() ユーザーが入力した文字を得る
getcharmod() 最後に入力した文字の修飾子(modifier)を得る
feedkeys() 先行入力キューに文字を入れる
input() ユーザーが入力した行を得る
inputlist() ユーザーにリストから項目を選択させる
inputsecret() ユーザーが入力した行を得る。ただし表示はしない
inputdialog() ダイアログを使ってユーザーが入力した行を得る
inputsave() 先行入力キューを保存して空にする
inputrestore() inputsave()で保存した状態に戻す

GUI:
getfontname() 現在使われているフォントの名前を取得
getwinposx() GUIのVimウィンドウのX座標
getwinposy() GUIのVimウィンドウのY座標

Vimサーバ:
serverlist() サーバ名のリストを返す
remote_send() Vimサーバにコマンド文字を送る
remote_expr() Vimサーバで式を評価する
server2client() Vimサーバのクライアントに応答を返す
remote_peek() Vimサーバから返信があったかどうかをチェック
remote_read() Vimサーバからの返信を読む
foreground() Vimのウィンドウを前面に持ってくる
remote_foreground() Vimサーバのウィンドウを前面に持ってくる

ウィンドウサイズと位置:
winheight() ウィンドウの高さを取得
winwidth() ウィンドウの幅を取得
winrestcmd() ウィンドウサイズを復元するコマンドを返す
winsaveview() カレントウィンドウのビューを取得
winrestview() カレントウィンドウのビューを復元

その他:
mode() 現在の編集モードを得る
visualmode() 最後に使われたビジュアルモードの種類
hasmapto() マップの存在をチェック
mapcheck() マッチするマップの存在をチェック
maparg() マップのrhs(展開結果)を得る
exists() 変数、関数の存在をチェック
has() 機能がサポートされているかをチェック
changenr() 最近の変更番号を返す
cscope_connection() cscope接続をチェック
did_filetype() FileTypeオートコマンドが使用されたかどうか
eventhandler() イベントハンドラによって起動されたかどうか
getpid() Vim のプロセスIDを得る

libcall() 外部ライブラリの関数を呼ぶ
libcallnr() 同上、数値を返す

getreg() レジスタの値を得る
getregtype() レジスタのタイプを得る
setreg() レジスタの値を設定する

taglist() マッチするタグのリストを取得
tagfiles() タグファイルのリストを取得

==============================================================================
*41.7* 関数を定義する

自分で関数を定義することができます。基本的な関数定義は次のとおり:

:function {name}({var1}, {var2}, ...)
: {body}
:endfunction

Note:
関数名は大文字で開始する必要があります。

小さな関数を定義してみましょう。二つの数値のうち小さい方を返す関数を作ります。
関数は次のような行で始まります:

:function Min(num1, num2)

関数の名前が "Min" であり、二つの引数 ("num1"と"num2") を取る、ということを表
しています。
最初にしなければならないのは、どちらの数値が小さいかをチェックすることです:

: if a:num1 < a:num2

"a:" は特殊なプレフィクスで、この変数が関数の引数であることを示します。小さい
方の値を変数 "smaller" に代入しましょう:

: if a:num1 < a:num2
: let smaller = a:num1
: else
: let smaller = a:num2
: endif

変数 "smaller" はローカル変数です。関数の中で使われた変数はローカル変数になり
ます。ただし、"g:"、"a:"、"s:" などのプレフィクスを付けた場合は別です。

Note:
関数の内からグローバル変数にアクセスするには "g:" を付ける必要がありま
す。つまり、関数内では "g:today" はグローバル変数 "today" を示し、
"today" ならそれとは別の変数、すなわちローカル変数になります。

":return" ステートメントを使って、小さい方の値を呼び出し元に返しましょう。そし
て、関数を閉じます:

: return smaller
:endfunction

関数定義の全体は次のようになります:

:function Min(num1, num2)
: if a:num1 < a:num2
: let smaller = a:num1
: else
: let smaller = a:num2
: endif
: return smaller
:endfunction

関数を短く書きたい場合は、次のようにもできます:

:function Min(num1, num2)
: if a:num1 < a:num2
: return a:num1
: endif
: return a:num2
:endfunction

ユーザー定義関数は組み込み関数とまったく同じ方法で呼び出すことができます。違う
のは名前だけです。Min 関数は次のように使用できます:

:echo Min(5, 8)

関数が実行され、関数の中身が Vim によって解釈されます。未定義の変数や関数を使
うなどの間違いがあったときは、エラーメッセージが表示されます。関数定義の時点で
はそれらのエラーは検出されません。

関数が ":endfunction" まで実行されたとき、あるいは引数無しで ":return" を使っ
たときは 0 が返ります。

既存の関数を再定義したい場合は ":function" コマンドに "!" を付けてください:

:function! Min(num1, num2, num3)


範囲指定を使う
--------------

":call" コマンドは行範囲を受け取ることができます。範囲指定の使用方法は二つあり
ます。関数を定義するときに "range" キーワードを使った場合は、関数自身が範囲指
定を処理します。
関数には "a:firstline" と "a:lastline" という二つの変数が暗黙的に渡されます。
この二つの変数には範囲指定された行番号が代入されています。例:

:function Count_words() range
: let lnum = a:firstline
: let n = 0
: while lnum <= a:lastline
: let n = n + len(split(getline(lnum)))
: let lnum = lnum + 1
: endwhile
: echo "found " . n . " words"
:endfunction

この関数は次のように呼び出すことができます:

:10,30call Count_words()

関数が一度だけ実行され、単語の数が表示されます。
関数を定義するときに "range" キーワードを使わなかった場合は、指定された範囲の
それぞれの行に対して関数が呼ばれます (カーソルはその行の上)。例:

:function Number()
: echo "line " . line(".") . " contains: " . getline(".")
:endfunction

次のように実行すると:

:10,15call Number()

関数は 6 回実行されます。


可変長引数
----------

可変個の引数を取る関数を定義できます。例えば、次の関数は、必ず 1 つの引数
(start) を取り、最大で 20 個までの引数を取ることができます:

:function Show(start, ...)

変数 "a:1" に 1 つ目のオプション引数が代入されます。2 つ目が "a:2" で、3 つ目
が "a:3" です。"a:0" にはオプション引数の数が入ります。
例:

:function Show(start, ...)
: echohl Title
: echo "Show is " . a:start
: echohl None
: let index = 1
: while index <= a:0
: echon " Arg " . index . " is " . a:{index}
: let index = index + 1
: endwhile
: echo ""
:endfunction

この関数は ":echohl" を使って ":echo" の出力に色を付けています。":echohl None"
で色付けをやめます。":echon" コマンドは ":echo" と同じ機能ですが、改行を出力し
ません。

変数 a:000 を使うこともできます。これは "..." 引数がすべて入ったリストです。
|a:000|を参照。


関数の一覧
----------

":function" コマンドでユーザー定義関数の一覧を表示できます:

:function
function Show(start, ...)
function GetVimIndent()
function SetSyn(name)

関数の中身を見たいときは関数名を指定してください:

:function SetSyn
1 if &syntax == ''
2 let &syntax = a:name
3 endif
endfunction


デバッグ
--------

エラーメッセージが表示されたとき、あるいはデバッグ中に、行番号が表示されると便
利です。デバッグモードについては |debug-scripts| を参照してください。
'verbose' オプションに 12 以上の値を設定すると、すべての関数呼び出しが表示され
ます。15 以上にすると、実行されたすべての行が表示されます。


関数の削除
----------

例えば Show() 関数を削除するのは次のようにします:

:delfunction Show

関数が存在しない場合はエラーになります。


関数への参照
------------

変数に関数を代入できると便利なことがあります。それには function() 関数を使いま
す。function() は関数の名前を受け取り、関数への参照を返します:

:let result = 0 " or 1
:function! Right()
: return 'Right!'
:endfunc
:function! Wrong()
: return 'Wrong!'
:endfunc
:
:if result == 1
: let Afunc = function('Right')
:else
: let Afunc = function('Wrong')
:endif
:echo call(Afunc, [])
Wrong!

Note 関数への参照を保持する変数の名前は大文字で始めなければなりません。そうで
ないと組み込み関数の名前と紛らわしくなります。
変数が参照している関数を呼び出すには call() 関数を使います。call() 関数の最初
の引数は関数への参照で、2 番目の引数は引数のリストです。

関数への参照は、次節で説明される辞書と組み合わせたときもっとも役に立ちます。

==============================================================================
*41.8* リストと辞書

ここまでは基本型(文字列と数値)を扱ってきました。Vim は二つの複合型、リストと辞
書もサポートしています。

リストとは、要素を順番に並べたものです。要素はどのような型でも構いません。数値
のリスト、リストのリスト、あるいは複数の型が混在したリストでも作れます。例え
ば、3 個の文字列からなるリストを作るには次のようにします:

:let alist = ['aap', 'mies', 'noot']

リストの要素は角括弧で囲み、コンマで区切ります。空のリストを作るには次のように
します:

:let alist = []

関数add()を使うとリストに要素を追加することができます:

:let alist = []
:call add(alist, 'foo')
:call add(alist, 'bar')
:echo alist
['foo', 'bar']

リストの連結には + を使います:

:echo alist + ['foo', 'bar']
['foo', 'bar', 'foo', 'bar']

直接リストを拡張するには次のようにします:

:let alist = ['one']
:call extend(alist, ['two', 'three'])
:echo alist
['one', 'two', 'three']

add()とは効果が異なることに注意してください:

:let alist = ['one']
:call add(alist, ['two', 'three'])
:echo alist
['one', ['two', 'three']]

add()の第二引数は1つの要素として追加されます。


FOR ループ
----------

リストを使ってできる素晴らしいことの1つが、リストに対する繰り返しです:

:let alist = ['one', 'two', 'three']
:for n in alist
: echo n
:endfor
one
two
three

上の例は、リスト"alist"の各要素に対して、その値を変数"n"に代入しながらループを
行います。forループの書式は次の通りです:

:for {varname} in {listexpression}
: {commands}
:endfor

ある回数だけループするには、その長さのリストを使います。関数range()を使うと、
そのようなリストを作成できます:

:for a in range(3)
: echo a
:endfor
0
1
2

range()が生成するリストの最初の要素は0であることに注意してください。そのため、
最後の要素はリストの長さより1小さい値になります。
最大値、ステップ幅を指定することもでき、逆方向に進むこともできます:

:for a in range(8, 4, -2)
: echo a
:endfor
8
6
4

より有用な例として、バッファ中の行に対するループ:

:for line in getline(1, 20)
: if line =~ "Date: "
: echo matchstr(line, 'Date: \zs.*')
: endif
:endfor

1行目から20行目(両端を含む)を調べ、そこに含まれる日付を全て表示しています。


辞書
-----

辞書はキーと値のペアを保持します。キーを指定することで高速に値を検索できます。
辞書は波括弧で作ります:

:let uk2nl = {'one': 'een', 'two': 'twee', 'three': 'drie'}

そして角括弧の中にキーを書くことで単語を検索します:

:echo uk2nl['two']
twee

辞書の定義の書式は次の通りです:

{<key> : <value>, ...}

空の辞書とは、どんなキーも持たない辞書のことです:

{}

辞書にはいろいろな使い道があります。辞書を扱う関数もたくさんあります。例えば、
キーのリストを取得してそれに対してループするには次のようにします:

:for key in keys(uk2nl)
: echo key
:endfor
three
one
two

キーはソートされていません。特定の順序に並べるにはリストをソートします:

:for key in sort(keys(uk2nl))
: echo key
:endfor
one
three
two

要素が定義された順序を得ることはできません。そのような目的にはリストを使ってく
ださい。リストは順序を保って要素を保持します。


辞書の関数
----------

辞書の要素は角括弧でインデックスを指定して取得します:

:echo uk2nl['one']
een

記号を使わない方法もあります:

:echo uk2nl.one
een

この方法はキーがアルファベット、数字、アンダースコアなどの ASCII 文字だけで構
成されている場合に使えます。この方法で値を代入することもできます:

:let uk2nl.four = 'vier'
:echo uk2nl
{'three': 'drie', 'four': 'vier', 'one': 'een', 'two': 'twee'}

関数の定義と辞書への代入を同時に記述することができます:

:function uk2nl.translate(line) dict
: return join(map(split(a:line), 'get(self, v:val, "???")'))
:endfunction

これを実行してみましょう:

:echo uk2nl.translate('three two five one')
drie twee ??? een

":function" の行の末尾に "dict" と書かれています。これは、その関数が辞書から使
われることを示します。ローカル変数 "self" がその辞書を指すようになります。
次に、複雑なreturnコマンドを分解してみましょう:

split(a:line)

関数split()は文字列を空白文字で区切り、リストにして返します。そのため、この例
での戻り値は次のようになります:

:echo split('three two five one')
['three', 'two', 'five', 'one']

このリストがmap()関数の第一引数になります。map()はリストの各要素を "v:val" に
代入した状態で第二引数を評価します。これによりforループより短いコードが書けま
す。このコードは:

:let alist = map(split(a:line), 'get(self, v:val, "???")')

次のコードと同じです:

:let alist = split(a:line)
:for idx in range(len(alist))
: let alist[idx] = get(self, alist[idx], "???")
:endfor

関数get()はそのキーが辞書に入っているかをチェックします。入っていればその値を
返します。入っていなければデフォルト値(この例では'???')を返します。キーが入っ
ていなくてもエラーを起こしたくないような場合に便利です。

関数join()はsplit()の逆の処理をします。つまり単語のリストをスペースでつなげま
す。
split()、map()、join() を組み合わせると、単語からなる行を簡潔に処理することが
できます。


オブジェクト指向プログラミング
------------------------------

辞書には値と関数を入れることができるので、辞書をオブジェクトとして使うことがで
きます。
上述の例ではオランダ語から英語に翻訳するために辞書を使いました。同じことが他の
言語でもできると面白いかもしれませんね。まず翻訳関数を持ったオブジェクト (つま
り辞書) を作ります。翻訳する単語はまだ定義しません:

:let transdict = {}
:function transdict.translate(line) dict
: return join(map(split(a:line), 'get(self.words, v:val, "???")'))
:endfunction

単語を翻訳するのに 'self.words' を使う点が上述の例と少し違います。しかし、
self.words はまだありません。よって、これは抽象クラスと呼ぶことができます。

オランダ語を翻訳するオブジェクトをインスタンス化してみましょう:

:let uk2nl = copy(transdict)
:let uk2nl.words = {'one': 'een', 'two': 'twee', 'three': 'drie'}
:echo uk2nl.translate('three one')
drie een

さらにドイツ語の翻訳機を作ります:

:let uk2de = copy(transdict)
:let uk2de.words = {'one': 'ein', 'two': 'zwei', 'three': 'drei'}
:echo uk2de.translate('three one')
drei ein

copy() 関数を使って "transdict" 辞書をコピーし、そのコピーに対して単語を追加し
ています。元の辞書はもちろん変更されません。

さらに一歩進んで、適切な言語を選択できるようにしてみます:

:if $LANG =~ "de"
: let trans = uk2de
:else
: let trans = uk2nl
:endif
:echo trans.translate('one two three')
een twee drie

"trans"は2つのオブジェクト(辞書)のうちどちらか1つを参照します。コピーは作られ
ていません。リストと辞書の同一性についてのより詳しい情報は|list-identity|と
|dict-identity|にあります。

未対応の言語を使う場合は、translate() 関数を上書きして何もしないようにするとい
いかもしれません:

:let uk2uk = copy(transdict)
:function! uk2uk.translate(line)
: return a:line
:endfunction
:echo uk2uk.translate('three one wladiwostok')
three one wladiwostok

! を使って既に存在している関数への参照を上書きしています。続いて、未対応の言語
に対して "uk2uk" を使うように変更します:

:if $LANG =~ "de"
: let trans = uk2de
:elseif $LANG =~ "nl"
: let trans = uk2nl
:else
: let trans = uk2uk
:endif
:echo trans.translate('one two three')
one two three

さらなる情報については|List|と|Dictionaries|を参照してください。

==============================================================================
*41.9* 例外

まずは例題を見てください:

:try
: read ~/templates/pascal.tmpl
:catch /E484:/
: echo "パスカル用のテンプレートファイルは見つかりませんでした。"
:endtry

":read" コマンドはファイルがなければ失敗します。そのエラーをキャッチして、エ
ラーメッセージの代わりにより親切なメッセージを表示しています。

":try" と ":endtry" の間で起きたエラーは例外に変わります。例外は文字列です。エ
ラーが例外に変わったとき、文字列にはエラーメッセージが含まれます。また、全ての
エラーメッセージは番号を持っています。例題では "E484:" を含んだエラーをキャッ
チしています。この番号は変わらないことが保証されています (テキストは翻訳される
などして変わるかもしれません)。

":read" コマンドが他のエラーを起こした場合、"E484:" というパターンはマッチしな
いでしょう。したがって、その例外はキャッチされず、通常のエラーメッセージが表示
されます。

次のように書くこともできます:

:try
: read ~/templates/pascal.tmpl
:catch
: echo "パスカル用のテンプレートファイルは見つかりませんでした。"
:endtry

全ての例外がキャッチされます。しかしこれでは "E21: Cannot make changes,
'modifiable' is off" のような有効なエラーに気づくことができません。

":finally" という便利なコマンドもあります:

:let tmp = tempname()
:try
: exe ".,$write " . tmp
: exe "!filter " . tmp
: .,$delete
: exe "$read " . tmp
:finally
: call delete(tmp)
:endtry

カーソル行からファイル末尾までを "filter" コマンド (ファイル名を引数に取るコマ
ンド) でフィルタ処理しています。":try" と ":finally" の間で問題が起きても、
ユーザーが CTRL-C を押して操作をキャンセルしても、"call delete(tmp)" は必ず呼
ばれます。一時ファイルが残ってしまう心配はありません。

例外についてさらに詳しい情報はリファレンスマニュアルの|exception-handling|を
参照してください。

==============================================================================
*41.10* 注意事項

Vim スクリプトにおいて注意すべきことの概要を簡単に説明します。他の場所にも同じ
ような説明はありますが、手頃なチェックリストに使えるでしょう。

改行記号はシステムによって異なります。Unix では <NL> 文字が使われますが、
MS-DOS 、Windows、OS/2 などでは <CR><LF> が使われます。末尾が <CR> になってい
るマップを使うときは注意してください。|:source_crnl| 参照。


空白
-----

空の行はあっても構いません。無視されます。

行頭の空白 (スペースとTAB) は常に無視されます。引数と引数の間には空白がいくつ
あっても構いません (例えば下記の 'set' と 'cpoptions' の間) 。空白は一つのス
ペースにまとめられ、セパレータの役目をします。最後の文字より後ろにある空白文字
は状況によって無視されたりされなかったりします。下記参照。

":set" コマンドで "=" 記号を使うとき:

:set cpoptions =aABceFst

"=" の直前にある空白は無視されます。しかし、"=" の後ろに空白をはさむことはでき
ません。

オプション値に空白を含めるときは、バックスラッシュ ("\") でエスケープする必要
があります:

:set tags=my\ nice\ file

次のように書くと:

:set tags=my nice file

これはエラーになります。このコマンドは次のように解釈されてしまいます:

:set tags=my
:set nice
:set file


コメント
--------

コメントは " (ダブルクオート) 記号で開始します。行末までのすべての文字がコメン
トとして解釈され、無視されます。ただし、コメントを書くことができないコマンドも
あります (以下に例を示します)。コメントは行のどこからでも開始できます。

コメントとして簡単な注釈を付けたとします。例:

:abbrev dev development " shorthand
:map <F3> o#include " insert include
:execute cmd " do it
:!ls *.c " list C files

短縮形 'dev' は 'development " shorthand' に展開されます。<F3> には 'o#
....' から '" insert include' までの全部がマップされます。"execute" コマンドは
エラーを起こします。"!" コマンドはすべての文字をシェルに渡すので、" 記号が閉じ
られていないことでエラーが起こります。
":map"、":abbreviate"、":execute"、"!" などのコマンドはその後ろにコメントを書
くことができません (そのようなコマンドは他にもあります)。ただし、無理やりコメ
ントを書く方法もあります:

:abbrev dev development|" shorthand
:map <F3> o#include|" insert include
:execute cmd |" do it

'|' 文字でコマンドを区切り、次のコマンドを書くことができます。この例では二つ目
のコマンドはコメントのみです。"!" の場合は |:execute| と '|' を使わなければな
りません:
:exe '!ls *.c' |" list C files

":map" と ":abbreviate" の場合は '|' の前に空白を置かないように注意してくださ
い。これらのコマンドは行末か '|' までのすべての文字を使います。そのため、意図
せずに末尾に空白を入れてしまうかもしれません:

:map <F4> o#include

vimrc を編集するときに 'list' オプションをオンに設定しておくと、この問題が発見
しやすくなります。

Unix では特別なコメント書式を使って Vim スクリプトを実行形式にすることができま
す:
#!/usr/bin/env vim -S
echo "this is a Vim script"
quit

"#" コマンドは行を行番号付きで表示しますが、'!' をつけると何もしなくなります。
よってファイルを実行するためのシェルコマンドを記述することができます。
|:#!| |-S|


落とし穴
--------

次の例には大きな問題があります:

:map ,ab o#include
:unmap ,ab

この unmap コマンドはうまく動きません。なぜなら ",ab " を unmap しようとしてい
るからです。そのようなマップは存在しません。エラーが表示されますが、スペースは
目に見えないので、エラーの原因を見つけるのは困難です。

":unmap" コマンドの後にコメントを書いた場合も同様です:

:unmap ,ab " comment

コメントは無視されますが、Vim は ',ab ' を unmap しようとします。次のよう
に書いてください:

:unmap ,ab| " comment


ビューの復元
------------

何らかの変更を加えてから、カーソルのあった場所に戻りたい時があります。そのとき
に、画面に表示されていた行範囲も復元されるとすてきです。
次の例は、現在行をヤンクしてファイルの先頭にプットし、ビューを復元します:

map ,p ma"aYHmbgg"aP`bzt`a

これは次のことをしています:
ma"aYHmbgg"aP`bzt`a
ma 現在のカーソル位置にマーク a を設定
"aY 現在行をレジスタ a にヤンク
Hmb ウィンドウの一行目に移動してマーク b を設定
gg ファイルの一行目に移動
"aP ヤンクした行をその上にプット
`b ウィンドウの一行目に戻る
zt ウィンドウの表示範囲を以前と同じにする
`a 保存しておいたカーソル位置に移動


パッケージング
--------------

関数の名前が他の人の関数とかぶらないように、次の方法を使ってください:
- ユニークな文字列を名前の前に付ける。私はよく略語を使います。例えば、オプショ
ンウィンドウ (option window) のための関数なら "OW_" などです。
- 関数を一つのファイルにまとめて、関数がロードされているかどうかを示すグローバ
ル変数を設定する。ファイルが二回目に読み込まれたとき、最初にそれらの関数をア
ンロードする。
例:

" This is the XXX package

if exists("XXX_loaded")
delfun XXX_one
delfun XXX_two
endif

function XXX_one(a)
... body of function ...
endfun

function XXX_two(b)
... body of function ...
endfun

let XXX_loaded = 1

==============================================================================
*41.11* プラグインを書く *write-plugin*

Vim スクリプトを書いて、それを多くの人に使ってもらうことができます。そのような
スクリプトはプラグインと呼ばれます。Vim ユーザーはあなたのスクリプトをプラグイ
ンディレクトリにコピーするだけで、すぐにその機能を使うことができます。
|add-plugin| 参照。

プラグインには二種類あります:

グローバルプラグイン : すべてのファイルで共通
ファイルタイププラグイン : ファイルの種類別

この節ではグローバルプラグインについて説明します。ほとんどの説明はファイルタイ
ププラグインに対してもあてはまります。ファイルタイププラグイン特有の説明は次節
にあります |write-filetype-plugin|。


名前
-----

最初にプラグインの名前を決めなければなりません。プラグインが提供する機能が名前
から分かるようにしてください。また、他の人が作ったプラグインと名前がかぶらない
ようにしてください。古い Windows システムでの問題を避けるため、名前は 8 文字以
内にしてください。

例えばタイプミス (type mistake) を修正 (correct) するためのスクリプトなら
"typecorr.vim" という名前を付けたりします。ここではこれを例題として使います。

プラグインが誰でも使えるようにするため、いくつかのガイドラインに従ってくださ
い。ガイドラインは段階的に説明していきます。例題プラグインの完全なソースは最後
に示します。


ボディ
------

まずはプラグインの本体部分を見てみましょう。行番号は実際の番号です:

14 iabbrev teh the
15 iabbrev otehr other
16 iabbrev wnat want
17 iabbrev synchronisation
18 \ synchronization
19 let s:count = 4

もちろん、実際のスクリプトはもっと巨大です。

行番号は説明のために追加したものです。プラグインを書くときは行番号を付けないで
ください。


へッダ
------

新しい単語を追加していくと、プラグインには複数のバージョンが存在することになり
ます。ファイルを配布したとき、それを使った人は、誰がこの素晴らしいプラグインを
書いたのかを知りたいと思うでしょうし、感想を伝えたいと思うかもしれません。
というわけで、次のようなヘッダをプラグインに書いてください:

1 " Vim global plugin for correcting typing mistakes
2 " Last Change: 2000 Oct 15
3 " Maintainer: Bram Moolenaar <Bram@vim.org>

著作権とライセンスについて: プラグインがとても便利で、そして再配布を制限するほ
どのものでない場合は、パブリックドメインか Vim ライセンス (|license|) の適用を
検討してみてください。次の短い宣言をプラグインの先頭付近に書いておくだけで十分
です:

4 " License: This file is placed in the public domain.


行連結、副作用の回避 *use-cpo-save*
--------------------

上の例の 18 行目では行連結 (|line-continuation|) が使われています。ユーザーの
環境で 'compatible' オプションがオンに設定されていると、この行でエラーが発生し
ます。'compatible' オプションの設定には副作用があるので、勝手に設定をオフにす
ることはできません。問題を避けるには、一時的に 'cpoptions' の値を Vim の初期値
に設定し、後で元に戻します。そうすれば、行連結を使うことができ、スクリプトはほ
とんどの環境で動作するようになります。設定の変更は次のようにします:

11 let s:save_cpo = &cpo
12 set cpo&vim
..
42 let &cpo = s:save_cpo

最初に 'cpoptions' の値を s:save_cpo 変数に保存します。プラグインの最後でオプ
ションの値を元に戻します。

スクリプトローカル変数 (|s:var|) を使っていることに注目してください。グローバ
ル変数は他の場所で使われている可能性があります。スクリプトの中だけで使う場合は
スクリプトローカル変数を使ってください。


ロードしない
------------

ユーザーが常にプラグインをロードしたいと思うとは限りません。また、システム管理
者がシステムのプラグインディレクトリにプラグインを入れたが、ユーザーは自分で入
れたプラグインを使いたいということもあります。したがって、指定したプラグインだ
けを無効にできる必要があります。次のようにします:

6 if exists("loaded_typecorr")
7 finish
8 endif
9 let loaded_typecorr = 1

これはスクリプトの二重ロードを避ける効果もあります。スクリプトを二重にロードす
ると、関数の再定義エラーが発生したり、自動コマンドが二重に追加されることでトラ
ブルが起きたりします。


マップ
------

さて、プラグインをもっと魅力あるものに仕上げましょう。マップを追加して、カーソ
ルの下の単語に対する修正を追加できるようにします。単純にキーを選んでマップを設
定することもできますが、そのキーは既にユーザーが使っているかもしれません。マッ
プに使用するキーをユーザーが選択できるようにするには、<Leader> を使います:

22 map <unique> <Leader>a <Plug>TypecorrAdd

"<Plug>TypecorrAdd" は目的の動作をします。詳しくは後で説明します。

使用したいキーを "mapleader" 変数に設定することで、マップの最初のキーを設定で
きます。例えば、次のように設定すると:

let mapleader = "_"

マップは "_a" と定義されます。変数が設定されていない場合は初期設定 (バックス
ラッシュ) が使われます。つまり "\a" というマップが定義されます。

Note: 上記のコマンドでは <unique> が使われています。これは、同じマップが既に定
義されていた場合にエラーを表示します。|:map-<unique>|

マップするキーをユーザーが自分で定義できるようにするには、次のようにします:

21 if !hasmapto('<Plug>TypecorrAdd')
22 map <unique> <Leader>a <Plug>TypecorrAdd
23 endif

"<Plug>TypecorrAdd" に対するマップが既にあるかどうかを調べ、無い場合のみ
"<Leader>a" にマップを定義します。ユーザーは自分の vimrc ファイルの中でマップ
を定義することができます:

map ,c <Plug>TypecorrAdd

すると、マップのキーとして ",c" が使われます。"_a" や "\a" は使われません。


ピース
------

スクリプトが大きくなると、それを部品ごとに分けたくなります。それには関数やマッ
プを使います。しかし、そうすると関数やマップが他のスクリプトのものと衝突する可
能性があります。例えば、Add() という関数を追加したとき、他のスクリプトでも同じ
名前の関数が定義されているかもしれません。そのような場合は、名前の前に "s:" を
付けて、スクリプトの中だけで使える関数を定義します。

新しい修正を追加するための関数を定義します:

30 function s:Add(from, correct)
31 let to = input("type the correction for " . a:from . ": ")
32 exe ":iabbrev " . a:from . " " . to
..
36 endfunction

s:Add() 関数は同じスクリプトの中から呼び出すことができます。他のスクリプトが
s:Add() を定義していた場合、それはそのスクリプトにローカルであり、関数が定義さ
れたスクリプトの中からのみ呼び出すことができます。さらにグローバルの Add() 関
数 ("s:"無し) を定義することもでき、それはまた別の関数になります。

マップ定義では <SID> が使えます。これは、現在のスクリプトを識別するためのスク
リプト ID を生成します。私たちの入力修正プラグインでは <SID> を次のように使い
ます:

24 noremap <unique> <script> <Plug>TypecorrAdd <SID>Add
..
28 noremap <SID>Add :call <SID>Add(expand("<cword>"), 1)<CR>

ユーザーが "\a" と入力すると、次の手順でキー入力が呼び出されます:

\a -> <Plug>TypecorrAdd -> <SID>Add -> :call <SID>Add()

他のスクリプトで <SID>Add をマップすると、別のスクリプト ID が使われ、別のマッ
プが生成されます。

Note: s:Add() ではなく <SID>Add() と書いていることに注意してください。マップは
スクリプトの外側でユーザーが入力するものだからです。<SID> はスクリプト ID に変
換され、どのスクリプトの Add() 関数を呼べばいいのかわかるようになっています。

これは少し複雑ですが、複数のプラグインを同時に使用するためには必要なことです。
基本的なルールとしては、マップの中では <SID>Add() を使い、他の場所 (スクリプト
の中、自動コマンド、ユーザー定義コマンド) では s:Add() を使います。

マップと同じ方法で、メニューを追加することもできます:

26 noremenu <script> Plugin.Add\ Correction <SID>Add

プラグインのメニューを追加する場合は "Plugin" メニューの下に登録することが推奨
されています。この例ではメニューが一つだけですが、複数のメニューを追加する場合
は、サブメニューの使用が推奨されています。例えば、"Plugin.CVS" 以下に
"Plugin.CVS.checkin" や "Plugin.CVS.checkout" などの CVS の操作を登録します。

Note: 28 行目では ":noremap" を使って、他のマップでトラブルが起きないようにし
ています。例えば、誰かが ":call" をマップしているかもしれないからです。24 行目
でも ":noremap" を使っていますが、ここでは "<SID>Add" を再マップして欲しいの
で、"<script>" を使っています。これを使うとスクリプトローカルなマップだけが再
マップされます |:map-<script>|。26 行目でも ":noremenu" で同様のことをしていま
す |:menu-<script>|。


<SID> と <Plug> *using-<Plug>*
---------------

<SID> と <Plug> は、入力したキーに対するマップと、他のマップの中だけで使われる
マップが干渉しないようにするために使われます。<SID> と <Plug> の違いに注意して
ください:

<Plug> これはスクリプトの外側からも見えます。ユーザーが自分でプラグインの機能
をマップできるようにするような場合に使います。<Plug> は特殊なコード
で、キーボードから入力されることはありません。
キー列が他のプラグインとかぶらないように、<Plug> スクリプト名 マップ
名、という形式で使ってください。
我々の例では、スクリプト名が "Typecorr"、マップ名が "Add" なので、
"<Plug>TypecorrAdd" というキー列になります。スクリプト名とマップ名の最
初の文字だけを大文字にして、どこがマップ名なのかわかるようにします。

<SID> これはスクリプト ID (スクリプト固有の識別子) です。
Vim は内部で <SID> を "<SNR>123_" に変換します ("123"の部分はいろいろ
な数字が入ります)。つまり、関数 "<SID>Add()" は、あるスクリプトでは
"<SNR>11_Add()" という名前になり、別のスクリプトでは "<SNR>22_Add()"
になります。これは ":function" コマンドで関数一覧を表示すると確認する
ことができます。<SID> の変換はマップの中でも同様におこなわれるので、
マップの中からスクリプトローカル関数を呼び出すことができます。


ユーザ定義コマンド
------------------

修正を追加するためのユーザー定義コマンドを追加します:

38 if !exists(":Correct")
39 command -nargs=1 Correct :call s:Add(<q-args>, 0)
40 endif

ユーザー定義コマンドは、同じ名前のコマンドがまだない場合のみ定義できます。既に
定義されている場合はエラーになります。":command!" を使ってユーザー定義関数を上
書きするのは良いアイデアとは言えません。ユーザーは、自分が定義したコマンドがな
ぜ動かないのか不思議に思うでしょう。|:command|


スクリプト変数
--------------

先頭に "s:" が付いた変数はスクリプト変数です。これはスクリプトの中だけで使えま
す。スクリプトの外からは見えません。同じ名前の変数を複数のスクリプトで使ってし
まうようなトラブルを避けることができます。Vim が実行されている間、変数は保持さ
れます。そして、同じスクリプトが再読み込みされると、再び同じ変数が使われます。
|s:var|

スクリプト変数は、同じスクリプトの中で定義された関数、自動コマンド、ユーザー定
義コマンドでも使えます。我々の例に、修正の数を数えるための数行のコードを追加し
ます:

19 let s:count = 4
..
30 function s:Add(from, correct)
..
34 let s:count = s:count + 1
35 echo s:count . " corrections now"
36 endfunction

最初に s:count はスクリプトの中で 4 で初期化されます。その後、s:Add() 関数が呼
び出されると、s:count が増加します。関数がどこから呼ばれたかに関わらず、関数が
定義されたスクリプトのローカル変数が使われます。


まとめ
------

例題の完成形は以下のようになります:

1 " Vim global plugin for correcting typing mistakes
2 " Last Change: 2000 Oct 15
3 " Maintainer: Bram Moolenaar <Bram@vim.org>
4 " License: This file is placed in the public domain.
5
6 if exists("loaded_typecorr")
7 finish
8 endif
9 let loaded_typecorr = 1
10
11 let s:save_cpo = &cpo
12 set cpo&vim
13
14 iabbrev teh the
15 iabbrev otehr other
16 iabbrev wnat want
17 iabbrev synchronisation
18 \ synchronization
19 let s:count = 4
20
21 if !hasmapto('<Plug>TypecorrAdd')
22 map <unique> <Leader>a <Plug>TypecorrAdd
23 endif
24 noremap <unique> <script> <Plug>TypecorrAdd <SID>Add
25
26 noremenu <script> Plugin.Add\ Correction <SID>Add
27
28 noremap <SID>Add :call <SID>Add(expand("<cword>"), 1)<CR>
29
30 function s:Add(from, correct)
31 let to = input("type the correction for " . a:from . ": ")
32 exe ":iabbrev " . a:from . " " . to
33 if a:correct | exe "normal viws\<C-R>\" \b\e" | endif
34 let s:count = s:count + 1
35 echo s:count . " corrections now"
36 endfunction
37
38 if !exists(":Correct")
39 command -nargs=1 Correct :call s:Add(<q-args>, 0)
40 endif
41
42 let &cpo = s:save_cpo

33 行目は説明がまだでした。これは、新しい修正をカーソルの下の単語に適用しま
す。|:normal| コマンドを使って新しい略語を適用しています。Note: マップと略語は
その場で展開されます。":noremap" で定義されたマップから関数が呼び出されたとし
ても動作は同じです。

'fileformat' オプションを "unix" に設定することが推奨されています。そうすれ
ば、Vim スクリプトはどこでも動作します。'fileformat' が "dos" に設定されたスク
リプトは Unix では動作しません。|:source_crnl| も参照。設定が正しいことを確実
にするため、ファイルを保存する前に次のコマンドを実行してください:

:set fileformat=unix


ドキュメント *write-local-help*
------------

プラグインのドキュメントを書くのは良いアイデアです。ユーザーが動作を変更できる
ような場合には特に重要です。|add-local-help| ではどのようにしてドキュメントが
インストールされるか説明されています。

プラグインヘルプファイルの例を示します ("typecorr.txt"):

1 *typecorr.txt* Plugin for correcting typing mistakes
2
3 If you make typing mistakes, this plugin will have them corrected
4 automatically.
5
6 There are currently only a few corrections. Add your own if you like.
7
8 Mappings:
9 <Leader>a or <Plug>TypecorrAdd
10 Add a correction for the word under the cursor.
11
12 Commands:
13 :Correct {word}
14 Add a correction for {word}.
15
16 *typecorr-settings*
17 This plugin doesn't have any settings.

書式に気をつけなければならないのは一行目だけです。一行目はコピーされ、help.txt
の "LOCAL ADDITIONS:" の項に埋め込まれます |local-additions|。最初の "*" は一
行目の一桁目に書いてください。ヘルプを追加したら ":help" を実行して項目が追加
されたことを確認してください。

ヘルプの中で ** で文字を囲むとタグを追加することができます。ただし、既存のヘル
プタグと同じものを使わないでください。"typecorr-settings" のように、プラグイン
の名前を使ってタグを作るといいかもしれません。

ヘルプの他の部分を参照するときは || で囲みます。そうすれば、ユーザーは簡単にヘ
ルプの関連した部分を参照することができます。


ファイルタイプの認識 *plugin-filetype*
--------------------

ファイルタイプが Vim によって認識されない場合は、別ファイルにファイルタイプを
認識するためにコードを作成する必要があります。通常は、自動コマンドを使って、
ファイル名がパターンにマッチしたときにファイルタイプを設定します。例:

au BufNewFile,BufRead *.foo set filetype=foofoo

この一行を 'runtimepath' の最初のディレクトリの "ftdetect/foofoo.vim" に書き
込みます。例えば、Unix なら "~/.vim/ftdetect/foofoo.vim" などです。ファイルタ
イプとスクリプトファイルの名前を同じにする決まりになっています。

必要ならより複雑な処理をすることもできます。例えば、ファイルの中身を見て言語を
判定したりできます。|new-filetype| も参照。


要約 *plugin-special*
-----

プラグインで使用する特有事項の要約を示します:

s:name スクリプトローカル変数。

<SID> スクリプトID。マップや関数をスクリプトローカルにする
のに使う。

hasmapto() スクリプトが提供している機能に対して、ユーザーが既に
マップを定義したかどうかをチェックする関数。

<Leader> "mapleader" の値。ユーザーがその変数にキーを設定するこ
とで、プラグインのマップの開始キーを指定できる。

:map <unique> マップが既に定義されているなら警告を発する。

:noremap <script> スクリプトローカルマップだけを使う。グローバルマップは
使わない。

exists(":Cmd") ユーザー定義コマンドが既にあるかどうかをチェックする。

==============================================================================
*41.12* ファイルタイププラグインを書く *write-filetype-plugin* *ftplugin*

ファイルタイププラグインはグローバルプラグインと似ていますが、カレントバッファ
のマップやオプションだけを設定します。ファイルタイププラグインの使用方法につい
ては |add-filetype-plugin| を参照してください。

先に |41.10| 節のグローバルプラグインの項を読んでください。そこで説明されてい
ることはすべてファイルタイププラグインにもあてはまります。この節ではファイルタ
イププラグイン特有の事項だけを説明します。ファイルタイププラグインはカレント
バッファに対してのみ機能するということが最も大切です。


無効化
------

ファイルタイププラグインを書いて多くの人に使ってもらおうとするなら、プラグイン
を無効化できるようにしておく必要があります。プラグインの先頭に次のような記述を
追加してください:

" このバッファに対してまだ実行されていない場合のみ処理を実行する
if exists("b:did_ftplugin")
finish
endif
let b:did_ftplugin = 1

これは同じプラグインが同じバッファで二重にロードされるのを防ぐためにも必要です
(":edit"コマンドを引数なしで実行したときに発生します)。

ユーザーは、次の一行だけを書いたファイルタイププラグインを作成することで、標準
プラグインのロードを無効化できます:

let b:did_ftplugin = 1

ただし、そのファイルを保存したファイルタイププラグインディレクトリが、
'runtimepath' の中で $VIMRUNTIME よりも前にある必要があります。

標準プラグインを使いつつ、その設定を一つだけ変更したいという場合は、スクリプト
の中で設定を変更することができます:

setlocal textwidth=70

このファイルを "after" ディレクトリに保存すると、(例えば filetype=vim なら) 標
準配布の "vim.vim" が読み込まれた後に、保存したファイルが読み込まれるようにな
ります |after-directory|。Unix ならファイルのパスは
"~/.vim/after/ftplugin/vim.vim" です。Note: 標準プラグインは "b:did_ftplugin"
を設定しますが、ここではそれを無視しています。


オプション
----------

ファイルタイププラグインでは、カレントバッファの設定だけを変更するため、次のコ
マンドを使ってオプションを設定してください:

:setlocal

そして、バッファローカルなオプションだけを設定してください (どのオプションがそ
うなのかはヘルプで確認してください)。|:setlocal| コマンドでグローバルオプショ
ンやウィンドウローカルオプションを設定すると、たくさんのバッファの設定が変更さ
れます。ファイルタイププラグインはそのような動作をすべきではありません。

オプションの値がフラグや設定項目のリストなら、"+=" や "-=" を使うことで既存の
設定を維持することができます。ユーザーがそのオプションの設定を変更している可能
性もあるので注意してください。最初に初期設定に戻してから設定を変更するといいか
もしれません。例:

:setlocal formatoptions& formatoptions+=ro


マップ
------

カレントバッファの中だけで機能するマップを作るには次のコマンドを使います:

:map <buffer>

上述したように、マップは二段階に分けて作る必要があります。ファイルタイププラグ
インで機能を定義する例を示します:

if !hasmapto('<Plug>JavaImport')
map <buffer> <unique> <LocalLeader>i <Plug>JavaImport
endif
noremap <buffer> <unique> <Plug>JavaImport oimport ""<Left><Esc>

|hasmapto()| を使って、ユーザーが既に <Plug>JavaImport に対してマップを定義し
ているかどうかを調べます。未定義ならファイルタイププラグインの標準のマップを定
義します。マップは <LocalLeader> で開始します。そうすることで、ファイルタイプ
プラグインのマップを開始するキーをユーザーが選択できます。初期設定はバックス
ラッシュです。
"<unique>" を使って、マップが既に存在したとき、あるいは既存のマップと重複した
ときにエラーメッセージが表示されるようにします。
|:noremap| を使って、ユーザーが定義した他のマップの影響を受けないようにしま
す。":noremap <script>" を使うと、スクリプトの中で定義した <SID> で始まるマッ
プだけが再マップされます。

ユーザーがファイルタイププラグインのマップを無効化できる仕組みを提供しなければ
なりません。例えば、"mail" ファイルタイプのプラグインなら次のようにします:

" マップを追加する。ユーザーが望まない場合は追加しない。
if !exists("no_plugin_maps") && !exists("no_mail_maps")
" "> " を挿入して引用する
if !hasmapto('<Plug>MailQuote')
vmap <buffer> <LocalLeader>q <Plug>MailQuote
nmap <buffer> <LocalLeader>q <Plug>MailQuote
endif
vnoremap <buffer> <Plug>MailQuote :s/^/> /<CR>
nnoremap <buffer> <Plug>MailQuote :.,$s/^/> /<CR>
endif

ここでは二つのグローバル変数が使われています:
no_plugin_maps すべてのファイルタイププラグインのマップを無効化
no_mail_maps 特定のファイルタイププラグインのマップを無効化


ユーザー定義コマンド
--------------------

ファイルタイプ用のユーザー定義コマンドを追加して、それを一つのバッファの中だけ
で使えるようにするには、|:command| の引数に "-buffer" を指定します。例:

:command -buffer Make make %:r.s


変数
-----

ファイルタイププラグインは対応するすべてのバッファに対して実行されます。スクリ
プトローカル変数 |s:var| はすべての実行で共有されます。バッファごとの変数を使
いたい場合はバッファローカル変数 |b:var| を使ってください。


関数
-----

関数は一度だけ定義すれば十分です。しかし、ファイルタイププラグインは対応する
ファイルが開かれるたびに読み込まれます。次のようにすると関数が一度だけ定義され
るようになります:

:if !exists("*s:Func")
: function s:Func(arg)
: ...
: endfunction
:endif


アンドゥ *undo_ftplugin*
--------

ユーザーが ":setfiletype xyz" としたとき、それ以前のファイルタイプの効果は無効
になるべきです。b:undo_ftplugin 変数にコマンドを設定し、ファイルタイププラグイ
ンの設定をアンドゥするようにしてください。例:

let b:undo_ftplugin = "setlocal fo< com< tw< commentstring<"
\ . "| unlet b:match_ignorecase b:match_words b:match_skip"

":setlocal" でオプション名の後に "<" を付けると、そのオプションをグローバルな
値でリセットします。オプションをリセットするにはこの方法が一番です。

このように行継続を使うには 'cpoptions' から "C" フラグを取り除く必要がありま
す。上述の |use-cpo-save| を参照してください。


ファイル名
----------

ファイルタイププラグインのファイル名にはファイルタイプ名が含まれていなければな
りません |ftplugin-name|。次の三つのうちのどれかにしてください:

.../ftplugin/stuff.vim
.../ftplugin/stuff_foo.vim
.../ftplugin/stuff/bar.vim

"stuff" はファイルタイプ名、"foo" と "bar" は任意の名前です。


要約 *ftplugin-special*
-----

ファイルタイププラグインの特有事項を要約します:

<LocalLeader> "maplocalleader" の値。ユーザーがその変数にキーを設定
することで、ファイルタイププラグインのマップの開始キー
を指定できる。

:map <buffer> バッファローカルなマップを定義する。

:noremap <script> 同スクリプトで定義している <SID> で始まるマップだけを
再マップする。

:setlocal カレントバッファのオプションのみ設定する。

:command -buffer バッファローカルなユーザー定義コマンドを定義する。

exists("*s:Func") 関数が定義済かどうかをチェックする。

プラグイン全般に関する事項は |plugin-special| を参照してください。

==============================================================================
*41.13* コンパイラプラグインを書く *write-compiler-plugin*

コンパイラプラグインは特定のコンパイラを使うためのオプションを設定します。ユー
ザーは |:compiler| コマンドでその設定を読み込むことができます。設定されるオプ
ションは主に 'errorformat' と 'makeprg' です。

百聞は一見に如かず。次のコマンドですべての標準コンパイラプラグインを開くことが
できます:

:next $VIMRUNTIME/compiler/*.vim

|:next| を使って次のプラグインファイルに移動してください。

これらのファイルには二つの特有事項があります。一つは、標準ファイルに対して設定
を追加したり上書きしたりできる仕組みです。標準ファイルの先頭は次のようになって
います:

:if exists("current_compiler")
: finish
:endif
:let current_compiler = "mine"

コンパイラファイルを書いて、それを個人用のランタイムディレクトリ (例えば Unix
なら ~/.vim/compiler) に置いたとき、"current_compiler" 変数を設定することで標
準ファイルの設定をスキップすることができます。
*:CompilerSet*
二つ目は、":compiler!" が使われたときは ":set" を使い、":compiler" が使われた
ときは ":setlocal" を使う仕組みです。Vim はそのために ":CompilerSet" という
ユーザーコマンドを定義します。古い Vim はそれを定義しないので、プラグインの中
で定義してください。例:

if exists(":CompilerSet") != 2
command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet errorformat& " use the dfault 'errorformat'
CompilerSet makeprg=nmake

コンパイラプラグインを書いて、それを Vim の配布物に含めたり、システムのランタ
イムディレクトリに入れたりする場合は、上記の方法を使ってください。
"current_compiler" がユーザープラグインで設定された場合は何も実行しないように
します。

コンパイラプラグインを書いて標準プラグインの設定を上書きする場合は
"current_compiler" をチェックしないようにします。そのプラグインは最後に読み込
まれないといけないので、'runtimepath' の最後にあるディレクトリに置きます。例え
ば、Unix なら ~/.vim/after/compiler などです。

==============================================================================
*41.14* プラグインを書く (高速ロード版) *write-plugin-quickload*

プラグインが成長し、とても大きくなることがあります。すると、起動速度は遅くなっ
てきます。例えそのプラグインをたまにしか使わないとしても遅くなります。そういう
ときはクイックロードプラグインの出番です。

基本的なアイデアはプラグインを二回に分けて読み込むということです。一回目はユー
ザー定義コマンドやマップを定義して機能を提供します。二回目は機能を実装する関数
を定義します。

スクリプトを二回読み込むことがクイックロードだというと驚かれるかもしれません。
この手法の意味は、一回目は高速に読み込み、スクリプトの重い部分は二回目に後回し
にするということです。二回目の読み込みは、ユーザが実際にその機能を使用したとき
に発生します。あなたがその機能を常に使うなら、これは逆に遅くなってしまいます。

Note Vim 7 以降では代わりの方法があります。|41.15| で説明されている |autoload|
機能を使う方法です。

次に例を示します:

" クイックロードのデモ用のグローバルプラグイン
" Last Change: 2005 Feb 25
" Maintainer: Bram Moolenaar <Bram@vim.org>
" License: This file is placed in the public domain.

if !exists("s:did_load")
command -nargs=* BNRead call BufNetRead(<f-args>)
map <F19> :call BufNetWrite('something')<CR>

let s:did_load = 1
exe 'au FuncUndefined BufNet* source ' . expand('<sfile>')
finish
endif

function BufNetRead(...)
echo 'BufNetRead(' . string(a:000) . ')'
" read 機能をここに書く
endfunction

function BufNetWrite(...)
echo 'BufNetWrite(' . string(a:000) . ')'
" write 機能をここに書く
endfunction

このスクリプトが最初に読み込まれたとき、"s:did_load" は設定されていません。
"if" と "endif" の間のコマンドが実行されます。|:finish| コマンドによって終了
し、スクリプトの残りの部分は実行されません。

二回目に読み込まれたときは "s:did_load" が存在するので、"endif" 以降のコマンド
が実行されます。この部分では (長くなる可能性のある) BufNetRead() 関数と
BufNetWrite() 関数を定義します。

このスクリプトをプラグインディレクトリに置くと、Vim の起動時に実行されます。処
理の流れは次のようになります:

1. 起動時にスクリプトが読み込まれる。"BNRead" コマンドが定義され、<F19> キーに
マップが設定される。自動コマンドの |FuncUndefined| が定義される。":finish"
コマンドによってスクリプトが終了する。

2. ユーザーが BNRead コマンド実行する、または <F19> キーを押す。BufNetRead()
関数か BufNetWrite() 関数が呼び出される。

3. Vim はその関数を見つけることができず、自動コマンドの |FuncUndefined| イベン
トを発行する。関数名が "BufNet*" というパターンにマッチするので、"source
fname" コマンドが実行される。"fname" はスクリプトの名前になります。スクリプ
トがどこに保存されていても、"<sfile>" が展開されてファイル名になります
(|expand()|参照)。

4. スクリプトが再び読み込まれる。"s:did_load" 変数が存在するので関数が定義され
る。

遅延ロードされる関数の名前が |FuncUndefined| 自動コマンドのパターンにマッチし
ていることに注意してください。他のプラグインがこのパターンにマッチする関数を定
義しているとうまく動きません。

==============================================================================
*41.15* ライブラリスクリプトを書く *write-library-script*

いろいろな場所で同じ機能が必要になることがあります。コードが二、三行以上になる
場合は、それを一つのスクリプトに入れて、他のスクリプトから使えるようにしたくな
ると思います。そのようなスクリプトをライブラリスクリプトと呼びます。

自分でライブラリスクリプトを読み込むことは可能ですが、同じスクリプトを二重に読
み込まないようにする必要があります。それには |exists()| 関数を使います。例:

if !exists('*MyLibFunction')
runtime library/mylibscript.vim
endif
call MyLibFunction(arg)

'runtimepath' に設定されたディレクトリの中の "library/mylibscript.vim" の中で
MyLibFunction() が定義されている必要があります。

これをより簡単にするために、Vim には autoload という仕組みがあります。同じこと
を次のように書くことができます:

call mylib#myfunction(arg)

この方がずっと簡単でしょう？ Vim は関数の名前を見て、それが未定義なら、
'runtimepath' の中から "autoload/mylib.vim" を探します。そのスクリプトは関数
"mylib#myfunction()" を定義していなければなりません。

mylib.vim には他の関数も入れられます。ライブラリスクリプトの中では自由に関数を
作ることができます。ただし、関数名の '#' より前の部分はスクリプトの名前と同じ
にする必要があります。そうしないと Vim はどのスクリプトを読み込めばいいのかわ
かりません。

ライブラリスクリプトをたくさん書く場合は、サブディレクトリを使うといいかもしれ
ません。例:

call netlib#ftp#read('somefile')

Unix では、このライブラリスクリプトは次のような場所に置かれます:

~/.vim/autoload/netlib/ftp.vim

関数は次のように定義します:

function netlib#ftp#read(fname)
" ftp を使ってファイルを読み込む
endfunction

関数定義と関数呼び出しではまったく同じ名前が使われます。最後の '#' より前の部
分がサブディレクトリとスクリプトの名前に対応しています。

同じ方法で変数を扱うこともできます:

let weekdays = dutch#weekdays

これによって "autoload/dutch.vim" が読み込まれます。そのスクリプトには例えば次
のようなコードが書かれています:

let dutch#weekdays = ['zondag', 'maandag', 'dinsdag', 'woensdag',
\ 'donderdag', 'vrijdag', 'zaterdag']

より詳しくは |autoload| を参照してください。

==============================================================================
*41.16* Vim スクリプトを配布する *distribute-script*

Vim ユーザーは Vim のウェブサイト http://www.vim.org でスクリプトを探します。
便利なスクリプトを作ったら、ぜひ共有しましょう！

Vim スクリプトはどのシステムでも使えます。tar や gzip コマンドは存在しないこと
があります。ファイルをまとめたり圧縮したりするには "zip" ユーティリティが推奨
されています。

可搬性を最大限に高めるには、Vim 自身を使ってスクリプトをパッケージ化します。そ
れには Vimball ユーティリティを使います。|vimball| を参照。

自動更新するための行を書いておくと便利です。|glvs-plugins| を参照。

==============================================================================

次章: |usr_42.txt| 新しいメニューを追加する

Copyright: see |manual-copyright| vim:tw=78:ts=8:ft=help:norl:

------------------------------------------------------------------------------------------------------------------------------------------------

top - main help file
Download (not html): vimdoc.zip

Vim日本語ドキュメント

苦情は yukihiro.nakadaira@gmail.com まで。



               {Google} ]>
              Google 検索
              ( ) WWW を検索 (*) vimdoc を検索



Vim documentation: repeat
=========================

main help file

------------------------------------------------------------------------------------------------------------------------------------------------

*repeat.txt* For Vim バージョン 7.0. Last change: 2006 Apr 30


VIMリファレンスマニュアル by Bram Moolenaar


繰り返しコマンド、Vimスクリプトとデバッグ *repeating*

繰り返しについてはユーザーマニュアルの26章|usr_26.txt|に紹介があります。

1. 単発繰り返し |single-repeat|
2. 多重繰り返し |multi-repeat|
3. 複雑な繰り返し |complex-repeat|
4. Vimスクリプトを使う |using-scripts|
5. スクリプトのデバッグ |debug-scripts|
6. プロファイリング |profiling|

==============================================================================
1. 単発繰り返し *single-repeat*

*.*
. 最後の変更を繰り返す。変更の回数は[count]で指定した回
数で置き換えられる。'cpoptions'に'y'フラグが含まれてる
時には、ヤンクコマンドも繰り返す。コマンドラインコマン
ドは繰り返さない。

単純な変更は"."コマンドで繰り返すことができる。回数を指定しなければ、最後の変
更の回数が使用される。回数を指定した場合、最後のそれと置き換えられる。最後に行
なわれた変更が番号付きレジスタの指定を含んでいた場合、レジスタ番号は増加され
る。これをどのように使うかの例は|redo-register|を参照。ビジュアル選択を使用し
たコマンドを繰り返す時は、同じ「サイズ」の範囲が使用されることに注意。
|visual-repeat|を参照。

*@:*
@: 最後のコマンドラインを[count]回繰り返す。
{|+cmdline_hist|が無効にされていると使えない}


==============================================================================
2. 多重繰り返し *multi-repeat*

*:g* *:global* *E147* *E148*
:[range]g[lobal]/{pattern}/[cmd]
[range]の範囲で{pattern}にマッチする行に対して、Exコマ
ンド[cmd](省略した場合":p")を実行する。

:[range]g[lobal]!/{pattern}/[cmd]
[range]の範囲で{pattern}にマッチしない行に対して、Exコ
マンド[cmd](省略した場合":p")を実行する。

*:v* *:vglobal*
:[range]v[global]/{pattern}/[cmd]
Same as :g!.

globalコマンドの動作はまず第1に[range]の行をスキャンしマッチした行すべてに印を
つける(複数行にかかるパターンではマッチの最初の行だけが重要である)。
次のスキャンでマークされたすべての行の行番号が指定(前置)されて[cmd]が実行され
る。行が変更されたり削除された場合そのマークは消滅する。
省略した場合の[range]はバッファ全体(1,$)である。コマンドを中断するには"CTRL-C"
を使用する。ある行についてエラーメッセージが与えられると、そのラインに対するコ
マンドは中断されglobalコマンドはマッチした次の行の処理を続ける。

非Exコマンドを繰り返すには":normal"コマンドを使用すれば良い:
:g/pat/normal {commands}
{commands}が完全なコマンドとして終了することを確認すること。そうでないとVimは
全部のマッチに1つ1つについて、コマンドの残りを期待して貴方の入力を待ち続けるだ
ろう。画面は更新されないので、いま何をしているのかわからないだろう。|:normal|
を参照。

undo/redoコマンドはglobalコマンドを一度にundo/redoする。以前の文脈マークだけが
一度設定される("''"でグローバルコマンド実行前にカーソルがあった場所に戻ること
が出来る)。

globalコマンドは最後に使用した検索パターンと、最後に使用した置換パターンの両方
を設定する(これはvi互換)。これにより全体に対して文字列置換を行なうのが簡単にな
る:
:g/pat/s//PAT/g
これは総ての"pat"を"PAT"に置き換える。同じことがこれでも可能:
:%s/pat/PAT/g
こっちのほうが2文字短い!

コマンドに ":visual" を使った場合は特別である。これはマッチする行へ移動してノー
マルモードに入り、|Q| を押して Ex モードへ戻るまでコマンドを実行することができ
る。これがマッチする各行に対して繰り返される。これを行っている間は ":global" を
使うことはできない。
(訳注: この段落、意味がわかりません)

==============================================================================
3. 複雑な繰り返し *complex-repeat*

*q* *recording*
q{0-9a-zA-Z"} タイプした文字をレジスタ{0-9a-zA-Z"}にレコーディングす
る(大文字は追加する)。レジスタを実行中は'q'コマンドは
無効になり、マッピングの中でも無効になる。{Vi: レコー
ディングはない}

q レコーディングを終了する。(実装のメモ: レコーディング
を終了する'q'は、それがマッピングの結果であってもレジ
スタに記録されない) {Vi: レコーディングはない}

*@*
@{0-9a-z".=*} レジスタ{0-9a-z".=*}の内容を[count]回実行する。レジス
タ'%'(現在のファイルの名前)と'#' (裏ファイルの名前)は
使用できないことに留意。"@="を使用するとプロンプトが表
示されコマンドの評価式の入力モードになる。入力すると評
価の結果が実行される。|@:|も参照。{Vi: 名前付きレジス
タのみ}

*@@* *E748*
@@ 直前の@{0-9a-z":*}を[count]回繰り返す。

:[addr]*{0-9a-z".=} *:@* *:star*
:[addr]@{0-9a-z".=*} レジスタ{0-9a-z".=*}の内容をExコマンドとして実行する。
まず最初にカーソルを[addr]行に設定する(省略した場合現
在の行)。レジスタの最終行に<CR>が含まれない場合、
'cpoptions'に'e'フラグが含まれていれば自動的に追加され
る。
":*"コマンドは'cpoptions'に'*'フラグが含まれていた場合
にだけ認識されることに留意。これは'nocompatible'が使用
されている時にはデフォルトにはならない。
":@="には最後に評価された式が使用される。式の評価結果
がExコマンドとして実行される。
これらのコマンド内ではマッピングは行なわれない。
{Vi: 幾つかのバージョンだけ} 将来: 指定された範囲の
各々の行にたいしてレジスタの内容が実行されるだろう。

*:@:*
:[addr]@: 最後のコマンドラインを繰り返す。まずカーソルを[addr]行
に設定する(省略した場合現在の行)。 {Vi にはない}

*:@@*
:[addr]@@ 最後の:@{0-9a-z"}を繰り返す。まず最初にカーソルを
[addr]行に設定する(省略した場合現在の行)。 {Vi: 幾つか
のバージョンだけ}

==============================================================================
4. Vimスクリプトを使う *using-scripts*

Vimスクリプトの書き方はユーザーマニュアルの41章|usr_41.txt|を参照してくださ
い。

*:so* *:source* *load-vim-script*
:so[urce] {file} Exコマンドを{file}から読込む。これは":"で始まるコマン
ドを列挙したファイルです。
(訳注:実際に":"を書く必要はない)
自動コマンド |SourcePre| が発生する。

:so[urce]! {file} Vimコマンドを{file}から読込む。ノーマルモードでファイ
ルの内容をあなたがタイプしたのと同じように実行されま
す。
|:global|, |:argdo|, |:windo|, |:bufdo|で使ったとき、
ループ中や他のコマンドが続けられたときは、コマンドの実
行中は表示は更新されません。
{Vi にはない}

*:ru* *:runtime*
:ru[ntime][!] {file} ..
'runtimepath'で示された各ディレクトリの{file}からEx
コマンドを読み込みます。ファイルがなくてもエラーには
なりません。例:
:runtime syntax/c.vim

{file}には空白で区切って複数のファイルを指定できます。
指定された{file}は'runtimepath'の最初のディレクト
リ、次に二番目のディレクトリ、と検索されます。{file}
に空白を含めるにはバックスラッシュを使います(しかし
ファイル名に空白を含めるのは望ましくありません。トラ
ブルのもとです)。

[!]を付けると見つかった全てのファイルを読み込みま
す。付けなければ最初に見つかったファイルだけを読み込
みます。

{file}がワイルドカードを含んでいるとそれは展開されま
す。例:
:runtime! plugin/*.vim
これはVimが起動時にプラグインファイルを読み込むのに
使っているものです。次のは似ていますが:
:runtime plugin/*.vim
これは最初に見つかったファイルだけを読み込みます。

'verbose'が1以上ならファイルが見つからないときにメッ
セージが表示されます。
'verbose'が2以上なら見つかった全てのファイルについて
メッセージが表示されます。
{Vi にはない}

:scripte[ncoding] [encoding] *:scripte* *:scriptencoding* *E167*
スクリプトで使われている文字コードを宣言します。
それ以降の行は必要なら[encoding]から'encoding'オプ
ションの文字コードに変換されます。例:
scriptencoding iso-8859-5
scriptencoding cp932

[encoding]が空のときは変換はされません。これは文字
コードの変換を限定するために使います:
scriptencoding euc-jp
... 変換される ...
scriptencoding
... 変換されない ...

変換がシステムによって提供されない場合、エラーメッ
セージは表示されず変換もされません。

"ucs-2"や"ucs-4"を使わないでください。スクリプトをそ
の文字コードで書くことはできません(NULバイトが含まれ
てしまうため)。
スクリプトの最初にutf-8のBOM(Byte Order Mark : バイ
トオーダーマーク)があるとVimはそれを認識します。
":scriptencoding utf-8"と書く必要はありません。

Vimが|+multi_byte|付きでコンパイルされていない場合、
このコマンドは無視されます。
{Vi にはない}

*:scrip* *:scriptnames*
:scrip[tnames] 読み込まれているスクリプトを読み込まれた順番どおりに
全て表示します。数字はスクリプトのID(識別子)|<SID>|
に使われています。
{Vi にはない} {|+eval|付きでコンパイルしないと使えな
い}

*:fini* *:finish* *E168*
:fini[sh] スクリプトの読み込みを停止します。スクリプトファイル
でのみ使えます。これはファイルの残りを読み込ませない
ための手軽な方法です。|:try|を使った後で|:finally|を
見つける前に使われると、まず":finally"と|:endtry|の
間のコマンドが実行されます。この手続きは入れ子になっ
ている全ての":try"に対して適用されます。入れ子の一番
外側の":endtry"に達するとスクリプトを停止します。
{Vi にはない}

総てのコマンドとコマンドシーケンスは、名前付きレジスタに格納することで繰り返し
実行することができる。レジスタにコマンドを格納する方法は2つある:
- 記録コマンド"q"を使用する。実際にコマンドをタイプし、実行しながらそれをレジ
スタに格納する。今、何が起こっているかを確認できるので簡単である。間違いをし
たならば、レジスタの内容をいったんファイルへ書き出("p"ut)して、コマンドシー
ケンスを編集して、それからそれを削除して再びレジスタに格納することができる。
レジスタに追加することで継続してレコーディングすることができる(大文字を使用
する)。
- コマンドシーケンスを削除かヤンクしてレジスタに入れる。

良く使うコマンドは':map'コマンドでファンクションキーに割当てることができる:

別の方法としてコマンドをファイルに記述しておき、それを':source!'コマンドで読込
んで実行するという方法もある。長いコマンドシーケンスにとっては便利である。ファ
ンクションキーに複雑なコマンドを割当てるために':map'コマンドと組み合わせること
ができる。

':source'コマンドはファイルから一行ずつExコマンドを読込む。キーボード入力が必
要になった場合にはタイプする必要が生じる。':source!'コマンドはスクリプトファイ
ルから一字一句読込む。各々のキャラクタはユーザがタイプしたものとして解釈され
る。

例: ":!ls"コマンドを実行したとすると|hit-enter|プロンプトが表示される。"!ls"
を含むファイルを':source'したならば、自分で<Enter>をタイプする必要がある
だろう。しかし':!ls'を含んだファイルを':source!'したならば、<CR>が見つかるまで
そのファイルから続く文字が読込まれる。":!ls"がファイルの最終行でない限り、<CR>
を自分でタイプする必要はないだろう

スクリプトファイルの中で':source[!]'コマンドを使うことも可能なので、階層関係の
あるスクリプトファイルを作ることもできる。':source'コマンドは同時に開くことの
できるファイル数(だいたい15)と同じだけネスト(入れ子に)することができる。
':source!'コマンドは15段までネストすることができる。

読込まれるファイルの中ではファイル名が必要なところに、"<sfile>"という文字列(
文字 通りであってスペシャルキーではない)を使うことができる。この文字列は読込ま
れた ファイルのファイル名に置き換えられる。例えば、".vimrc"ファイルと同じ場所
に"other.vimrc"というファイルがあれば、".vimrc"から次のコマンドでそれを読込む
ことができる:
:source <sfile>:h/other.vimrc

スクリプトファイル内では端末依存のキーコードは端末非依存の2文字のコードで表現
される。これは異なる種類の端末でも同じ方法で依存キーコードを使用できることを意
味する。最初のキーコードの文字は0x80つまり128で、画面では"~@"と表される。2つ目
のキャラクタは|key-notation|の表にて見ることができる。これらのコードはどれも
CTRL-Vに続けて3つの10進コードを叩くことで入力できる。これはtermcapコード<t_xx>
に対しては使用できない。これらはマッピングの中だけで使うことができる。

*:source_crnl* *W15*
MS-DOS, Win32 and OS/2: ":source"で読込まれるファイルは通常、行末に<CR><NL>を
持っている。これらは常に働く。もしも行末に<NL>を持つファイルを使っているならば
(例えばUNIXで作られたファイル)、'fileformats'が空でかつ先頭行が<CR>で終わって
なければ正しく認識される。しかしこれは先頭行が":map <F1> :help^M"(^Mは<CR>)み
たいな内容だった場合には失敗する。ファイルの先頭行が<CR>で終わっていてその1行
限りの時、先頭行から<CR>が失われてしまうのでエラーメッセージが出るだろう。

Mac Classic: ":source"で読み込まれるファイルは通常、行末に<CR>を持っている。
これらは常に機能する。もしも行末に<NL>を持つファイルを使っているならば(例えば
UNIXで作られたファイル)、'fileformats'が空でかつ先頭行が<CR>で終わってなければ
正しく認識される。先頭行に<CR>を持ち<NL>で改行しているファイルを使用しないよう
に気を付けてください。

その他のシステムでは、Vimは取込まれた(":source"ed)ファイルの行末は<NL>であるこ
とを期待する。これは常に働く。もしも行末が<CR><NL>であるファイル(例えばMS-DOS
で作られたファイル)を使っているならば、総ての行が末尾に<CR>を持っていることに
なる。これは幾つかのコマンドにとって問題となるだろう(例、マッピング)。自動的に
行末記号を検出する機構はない。なぜなら<CR>で終了するマッピングの定義をファイル
の先頭に書くことは一般的で、自動検出用の仕組みを作るのが難しいからである。

*line-continuation*
読込まれた(":source"d")Exコマンドスクリプトのファイル内の長い行は、行継続記号
"\"(backslash)を次行の先頭に挿入することで分割できる。バックスラッシュの前に空
白を挿入することも可能で、これらは無視される。

例: 次の記述は
:set comments=sr:/*,mb:*,el:*/,
\://,
\b:#,
\:%,
\n:>,
\fb:-

次の1行と同じ意味として解釈される:
:set comments=sr:/*,mb:*,el:*/,://,b:#,:%,n:>,fb:-

バックスラッシュの前に先行する空白文字は全部無視される。しかしながらバックス
ラッシュのある行の1つ前の行末には、自由に空白文字を挿入することはできない; 付
加的な空白文字が許されるかどうかは、コマンドが分割される位置に依存する。

":append"と":insert"コマンドには1つ問題がある:
:1append
\asdf
.
バックスラッシュは行継続シンボルに見えるが、コマンドの結果はこのようになる:
:1appendasdf
.
これを避けるには、'cpoptions'に'C'フラグを追加することだ:
:set cpo+=C
:function Foo()
:1append
\asdf
:.
:set cpo-=C

Note 関数の中でその手のコマンドを実行するには、関数定義の際に'C'フラグを追加す
る必要があり、それが実行される際にではない。
:set cpo+=C
:function Foo()
:1append
\asdf
.
:endfunction
:set cpo-=C

解説:
多くのプログラムは行継続を、継続する行の末尾にバックスラッシュを置くこ
とで表現する。その方法をVimで採用してしまうと、Viとの互換性に重大な欠
陥ができてしまう。たとえばこのようなViのマッピングを考えるとわかりやす
い:
:map xx asdf\
従って一般的ではないが行頭のバックスラッシュを採用している。

==============================================================================
5. スクリプトのデバッグ *debug-scripts*

スクリプトの動作を知るためのコードを追加することができるのは当り前として、
Vimはデバッグモードを提供しています。これはスクリプトファイルやユーザーファン
クションをステップ実行することやブレークポイントを仕掛けることを可能にします。

NOTE: デバッグモードは未完成です。デバッグはVimの動作に副作用をあたえます。全
てをデバッグするのには使えません。例えば画面がデバッグメッセージで散乱するとき
など。
{Vi にはデバッグモードはない}

デバッグモードの代わりに'verbose'オプションが使えます。大きな値を設定するとV
imの動作についてより詳細なメッセージを得られます。


デバッグモードを開始する *debug-mode*

デバッグモードを開始するにはこれらの方法のうちどれかを使います:
1. Vimを|-D|引数付きで起動する:
vim -D file.txt
最初にvimrcを読み込むところからデバッグを開始します。これはVimの起動時に何
が起こっているのかを調査するのに便利です。副作用としてVimは初期化が完了する
前に安全のためターミナルモードを切替えます。
(WindowsやMacintoshの)GUI専用バージョンではGUIウインドウを開くとすぐにデバ
ッグが開始します。これを早めるにはvimrcファイルに":gui"と書いてください。
*:debug*
2. ":debug"を前に付けてコマンドを実行します。そのコマンドを実行する間だけデバ
ッグできます。特定のスクリプトファイルやユーザー関数をデバッグするのに便利
です。オートコマンドから呼び出されるスクリプトや関数にも便利です。
例:
:debug edit test.txt.gz

3. ブレークポイントをソースファイルやユーザーファンクションに設定します。コ
マンドラインから次のようにできます:
vim -c "breakadd file */explorer.vim"
これはVimを起動して"explorer.vim"の最初の行を読み込むところで停止します。
デバッグモード中でもブレークポイントを設定できます。

デバッグモード中に実行されるコマンドはそれが実行される前に表示されます。コメン
トや空の行、実行されない行はとばされます。行が"|"を使って二つのコマンドを含ん
でいた場合には分けて表示されます。


デバッグモード
--------------

デバッグモードに入ると、通常のExコマンドが使えます。例えば、変数の値を見るに
は:
echo idx
ユーザーファンクション内では、これはローカル変数の"idx"を表示します。"g:"を頭
に付けるとグローバル変数の値を表示します:
echo g:idx
全てのコマンドは実行中の関数やスクリプトの文脈として実行されます。オプションを
設定することもできます。例えば何が起こっているのかを表示するために'verbose'を
設定することができます。興味のある部分を実行する前に次のようにするといいでしょ
う:
:set verbose=20

スクリーンの更新を必要とするコマンドは避けるべきです。なぜならデバッグモードを
抜けるまでその作用に気付き難いからです。例えば:
:help
これはとても不便です。

デバッグモードのためのコマンドラインヒストリが別に用意されています。

関数の行番号はその関数の始まりから数えます。見ている行の番号を数えるのに苦労す
る場合はその関数の書かれたファイルを別のVimで開き、その関数の始まりを探しだし
、"99j"を実行してください。"99"は実際の行番号に合わせて変えてください。

さらに、以下のコマンドが使えます:
*>cont*
cont 次のブレークポイントまで実行します。
*>quit*
quit 異常停止します。これはCTRL-Cを使うことに似ていますが、
全てを停止するわけではありません。次のブレークポイント
で停止します。
*>next*
next コマンドを実行しそれが終わるとデバッグモードに戻りま
す。ユーザー関数やソースファイルの呼び出し時には呼び
出し元の次の行に進みます。
*>step*
step コマンドを実行しそれが終わるとデバッグモードに戻りま
す。ユーザー関数やソースファイルの呼び出し時には呼び
出し先の行に進みます。
*>interrupt*
interrupt CTRL-Cを使うことに似ていますが、次のコマンドを実行する
ためにデバッグモードに戻る場所が">quit"と違います。例
外割り込みについて|:finally|や|:catch|をテストするのに
便利です。
*>finish*
finish 実行中のスクリプトやユーザー関数を終了し呼び出し元で
デバッグモードに戻ります。

デバッグモードのコマンドについて:
- 補間はできません。通常のExコマンドのみ補間できます。
- 次の一文字に省略すことができます: "c", "n", "s" そして "f"。
- <CR>を押すと前回のものを繰り返します。関係ないコマンドを使うとリセットされま
す(どうすべきかがわかりにくいため)。
- 同じ名前のExコマンドを使うにはコロンを付けてください:
":cont", ":next", ":finish" (省略時も)


ブレークポイントの定義
----------------------
*:breaka* *:breakadd*
:breaka[dd] func [lnum] {name}
関数にブレークポイントを設定します。例:
:breakadd func Explore
関数名が妥当かどうか検査しませので、関数定義の前にブレークポイ
ントを定義できます。

:breaka[dd] file [lnum] {name}
ソースファイルにブレークポイントを設定します。例:
:breakadd file 43 .vimrc

:breaka[dd] here
カレントファイルのカレント行にブレークポイントを設定します。
次を行うのと同様です:
:breakadd file <cursor-line> <current-file>
Note これはファイルを読み込むときに実行されるコマンドに対して
だけ働きます。そのファイル中で定義される関数に対しては働きませ
ん。

[lnum]はブレークポイントにする行番号です。Vimはその行かそれ以降で停止します。
省略時すると1行目になります。

*:debug-name*
{name} はファイル名や関数名のパターンです。パターンはオートコマンドで使われる
ものと同じです。完全に一致しなければなりません(パターンが"^"で始まって"$"で終
わるように)。"*"は全ての文字列に一致します。'ignorecase'は使われませんが、大文
字と小文字を区別しないために"\c"を使うことができます|/c|。関数名には()を付け
ないでください!

ソースファイル名のパターン検査はファイルのフルネームに対して行われます。例:
breakadd file explorer
パスが間違っているので一致しません。
breakadd file *explorer.vim
".../plugin/explorer.vim"と".../plugin/iexplorer.vim"に一致します。
breakadd file */explorer.vim
".../plugin/explorer.vim"だけに一致します。

関数名のパターン検査は";function"で表示される名前に対して行われます。ローカ
ル関数には"<SNR>99_"といったものが前に付くということです。

Note 関数はまず読み込まれ、後で実行されます。読み込まれたときに "file" ブレー
クポイントがチェックされ、実行されるときに "func" ブレークポイントがチェックさ
れます。

ブレークポイントの削除
----------------------
*:breakd* *:breakdel* *E161*
:breakd[el] {nr}
ブレークポイント{nr}を削除します。|:breaklist|を使って番号を
確認してください。

:breakd[el] *
すべてのブレークポイントを削除します。

:breakd[el] func [lnum] {name}
関数内のブレークポイントを削除します。

:breakd[el] file [lnum] {name}
ソースファイル内のブレークポイントを削除します。

:breakd[el] here
カレントファイルのカレント行のブレークポイントを削除します。


[lnum]が省略されると関数、またはファイルの最初のブレークポイントが削除されま
す。
{name}は":breakadd"で使った名前と完全に同じでなければなりません。"eplorer"と
"*explorer.vim"、"*explorer*"は違います。


ブレークポイントを列挙する
--------------------------
*:breakl* *:breaklist*
:breakl[ist]
全てのブレークポイントを列挙します。


その他
------

*:debugg* *:debuggreedy*
:debugg[reedy]
デバッグモードのコマンドをユーザーから直接得るのではなく標準入
力から読み込みます。スクリプトのテストのときに便利です。
例:
echo 'q^Mq' | vim -e -s -c debuggreedy -c 'breakadd file script.vim' -S script.vim

:0debugg[reedy]
":debuggreedy"を取り消します。それ以降のデバッグモードコマンド
を使わず、ユーザーから直接デバッグモードコマンドを受け取ります
。

==============================================================================
6. プロファイリング *profile* *profiling*

プロファイリングとは、関数やスクリプトの実行にかかる時間を計測することです。
これを行うには |+profile| 機能が必要です。
この機能は "huge" 機能つきでコンパイルしたときだけ含まれます。
{Vi はプロファイリング機能を持っていない}

また、関数 |reltime()| を使っても時間を計測できます。この関数には |+reltime|
機能だけが必要です。これは "huge" 以外でもしばしばついてきます。

:prof[ile] start {fname} *:prof* *:profile* *E750*
プロファイリングを開始し、終了時に出力を {fname} に出力します。
{fname} がすでに存在するときは、警告なしに上書きされます。
変数 |v:profiling| に 1 が代入されます。

:prof[ile] continue
":profile pause" の後にこれを実行すると、プロファイリングを再
開します。

:prof[ile] func {pattern}
パターン {pattern} にマッチする関数をプロファイリングします。
{pattern} がどう使われるかは |:debug-name| を参照。

:prof[ile][!] file {pattern}
パターン {pattern} にマッチするスクリプトファイルをプロファイ
リングします。
{pattern} がどう使われるかは |:debug-name| を参照。
このコマンドはスクリプトそのものをプロファイリングするだけで、
その中で定義されている関数のプロファイリングは行いません。
[!] がつけられたときは、そのスクリプト中で定義されている全ての
関数のプロファイリングも行います。しかしスクリプトがこのコマン
ドの後で読み込まれたときだけです。

:profd[el] ... *:profd* *:profdel*
指定された引数に対するプロファイリングを停止します。引数につい
ては |:breakdel| を参照。

最初は常に ":profile start fname" コマンドで始めなければなりません。結果のファ
イルは Vim が終了するときに書き出されます。次に出力の例を挙げます。説明のため
に行番号が行頭についています:

1 FUNCTION Test2()
2 Called 1 time
3 Total time: 0.155251
4 Self time: 0.002006
5
6 count total (s) self (s)
7 9 0.000096 for i in range(8)
8 8 0.153655 0.000410 call Test3()
9 8 0.000070 endfor
10 " Ask a question
11 1 0.001341 echo input("give me an answer: ")

ヘッダ(1行目から4行目)は関数全体にかかった時間を示しています。"Total" はこの関
数を実行している間に経過した時間です。"Self" は "Total" のうち、次のことにかか
った時間を引いたものです:
- 他のユーザ定義関数
- スクリプトの読み込み
- 自動コマンドの実行
- 外部(シェル)プログラム

7行目から11行目は各実行行にかかった時間を示しています。実行されない行はカウン
トされません。それゆえ、コメント行は決してカウントされません。

Count の桁はその行が何回実行されたかを示します。7行目の "for" コマンドはそれ以
下の行と同様に何回も実行されることに注意してください。これは、ループの終わりを
検出するためにこの行が何回も実行されるためです。

ユーザ入力待ちにかかった時間は一切カウントされません。それゆえ、input() のプロ
ンプトに反応するのにどれだけ時間がかかろうとも無関係です。

プロファイリングはどこで時間が費やされたかのよい指標を与えてくれますが、多くの
原因によりその結果がごまかされてしまう場合があるということを覚えておいてくださ
い:

- システム関数 gettimeofday() に依存する時間計測の精度。たとえ時間がマイクロ秒
で表示されていたとしても、1/100秒の精度しかないこともあります。

- 実経過時間が計測されます。他のプロセスがビジーであると、それが予測できない箇
所で遅れを引き起こす可能性があります。

- 1行に複数のコマンドを書いていると、1つの時間しか得られません。ここのコマンド
に対して時間を見るにはその行を分割してください。

- 各行の時間の総和をとると、たいてい関数全体の時間より小さくなります。各行の間
にオーバーヘッドがあります。

- Vim が終了する前に削除された関数はプロファイリング情報を生成しません。必要な
ら変数 |v:profiling| をチェックしてください:
:if !v:profiling
: delfunc MyFunc
:endif

- マルチプロセッサシステム上では、スリープモードが作動したときや、省力のためプ
ロセッサの周波数が下がったとき、プロファイリングが奇妙な結果を出すかもしれま
せん。

vim:tw=78:ts=8:ft=help:norl:

------------------------------------------------------------------------------------------------------------------------------------------------

top - main help file
Download (not html): vimdoc.zip

Vim日本語ドキュメント

苦情は yukihiro.nakadaira@gmail.com まで。



ファイルupdown
	ベースは DB に保存で、キャッシュを使って高速化する
G	複数アプリサーバにした場合のキャッシュ削除はキャッシュ削除用の API を用意して wget などする。
	http://d.hatena.ne.jp/takihiro/20090225/1235571810
		ファイル保存の利点
		ファイルに保存の場合、速度重視で作りやすい（public 以下や Web サーバから見えるところに置くなど）
		ファイル保存のマイナス点
		複数アプリサーバにしづらい
		バックアップなどの際に、ファイルも対象にしなければならない
		DB 保存の利点
		複数アプリサーバ、バックアップが楽
		DB 保存のマイナス点
		画像など頻繁にアクセスがあり、かつサイズも大きいデータの場合は遅い

SEED
	insert into reports values (1,1,'㈱CAﾓﾊﾞｲﾙ','ｶﾃｺﾞﾘｰ','20130610',1,1,1,1,100,NULL,10000,NULL,2,1,1,'remarks',now(),now(),NULL);
	mysql> update contents set to_stop_newuser = '["1", "2"]'  where id > 0;

#repos merge
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mkdir /opt/logilogi/me/realaf_admin/app/assets/stylesheets/smaaash
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mkdir /opt/logilogi/me/realaf_admin/app/assets/javascripts/smaaash
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mkdir /opt/logilogi/me/realaf_admin/app/assets/images/smaaash
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mv *.css
	common.css   details.css
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mv *.css /opt/logilogi/me/realaf_admin/app/assets/stylesheets/smaaash/
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mv *.js /opt/logilogi/me/realaf_admin/app/assets/javascripts/smaaash/
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mv *.jpg /opt/logilogi/me/realaf_admin/app/assets/images/smaaash/
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/2# mv *.png /opt/logilogi/me/realaf_admin/app/assets/images/smaaash/
	root@localhost:/opt/logilogi/me/realaf_admin/app/views/admin/ex_contents/1# mv *.gif /opt/logilogi/me/realaf_admin/app/assets/images/smaaash/


	tar zcvf r01.tar.gz  r01/
	cd r01
	bundle install
	cp -p /opt/logilogi/me/realaf_admin/config/database.yml config
	diff -Nq  /opt/logilogi/me/realaf_admin/app/models/ /opt/logilogi/me/r01/app/models/


	cd /opt/logilogi/me/r01
	find . -name *.*rb* -mtime -2

git diff -w -b -B --name-only 9e9ab93bb8d08b25b6629daaece4ed11910821b5 HEAD@{0} |xargs ls
#目で除外ファイル群grouping
#目で変化詳細確認ファイル群grouping
git diff -w -b -B -Bbqrで片側しかないファイルを双方向ポピー
 diff -wrtBbq /opt/logilogi/me/r02/db/ /opt/logilogi/me/realaf_admin/db/
 diff -wrtBbq /opt/logilogi/me/r02/config /opt/logilogi/me/realaf_admin/config
  #rsyncにしたい。上の行は。
  vim -d A ../r02/A

  diff --help|grep -niE "(時|付|刻|名|表示)"



/opt/logilogi/me/mergetmp.sh


mysql> insert into stores values(1,NULL,NULL,'4701ＮＥＷ那覇店',735,47,'','','','','','','',1,1,NULL,'2010-11-30T14:59:00+09:00','2010-11-30T14:59:00+09:00',994701,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL);

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42333036-1', '192.168.85.130');
  ga('send', 'pageview');

</script>



#定番Gem
		 seeds.rb
		gem  "migration_comments"
	# a gem to load Constants from config/constants.yml
		gem 'settingslogic'

#Gemfile-関数メソッド
	# Load Local Gemfile
	local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
	if File.exists?(local_gemfile)
	  puts "Loading Gemfile.local ..." if $DEBUG # `ruby -d` or `bundle -v`
	  instance_eval File.read(local_gemfile)
	end

	# Load plugins' Gemfiles
	Dir.glob File.expand_path("../plugins/*/Gemfile", __FILE__) do |file|
	  puts "Loading #{file} ..." if $DEBUG # `ruby -d` or `bundle -v`
	  instance_eval File.read(file)
	end

#.gitignore
+/config/database.yml

	# Gems used only for assets and not required
	# in production environments by default.
		group :assets do
		  gem 'sass-rails',   '~> 3.2.3'
		  gem 'coffee-rails', '~> 3.2.1'

		  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
		  gem 'therubyracer', :platforms => :ruby

		  gem 'uglifier', '>= 1.0.3'
		end



		gem "migration_comments", "~> 0.3.1"
		group :development do
		  gem 'binding_of_caller'
		  gem 'sextant'
		  gem 'quiet_assets'
		  gem "bullet"
		  #gem 'better_errors'
		  #gem 'guard-livereload'
		end
		group :development, :test do
		  gem 'debugger'

		  #gem 'pry-rails'
		  #gem "pry-debugger"
		  #gem 'hirb'
		  #gem 'hirb-unicode'
		  #gem 'awesome_print'
		end





2)	Scribt2binのwindown版を起動し､gemfileが不足していればgem install “#{genfilename}”を発行する起動スクリプトを (I want you to write the script I a built-in script language of OS -----either in DOS batch file/VBscript/JScript for Windows, and in either sh/perl for linux ) ----

3) postgresql-sharing/ mongoDB linode解約 先行着手｡
4) Discuss-scraper


楽天ツール
Language 	: Ruby 1.8.x +  Rails 2.3.x
	(ア)	楽天は開発用アカウントをつくらせることが無理ならば、断念。
	(イ)	日本人に大枠試作させる。
	(ウ)	出品者ページで出品させる.
	(エ)	Iframeで上に操作フレーム､下はscraping用途iframe表示
	(オ)	管理画面つくる




