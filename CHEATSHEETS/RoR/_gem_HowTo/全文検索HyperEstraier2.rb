Hyper Estraier

a full-text search system for communities

これは何？

全文検索システムです。指定した語句を含む文書を探すことができます。本文中の語句をもとにして検索するだけでなく、題名などの属性をもとに検索す
ることもできます。

検索対象はJava（JDK 1.5）の文書群ですので、「ネットワーク」とか「データベース」とか「XML」とか入力してみてください。

使い方

画面最上部にある入力欄には、検索フレーズを入力します。例えば、「コンピュータ」という文字列を含む文書を探したいなら、「コンピュータ」とその
まま入力してください。

検索語を空白で挟んで並べると、AND検索ができます。例えば、「インターネットセキュリティ」と入力すると、「インターネット」と「セキュリティ」
の両方を含む文書を検索します。「&」を使って、「インターネット & セキュリティ」としても同じです。

複数の検索語を「""」で括ると、フレーズ検索ができます。例えば、「"United Nations"」と入力すると、「United」の直後に「Nations」が出現する文
書を検索します。

「!」を使うとANDNOT検索ができます。例えば、「スキー ! スノボー」と入力すると、「スキー」を含むが「スノボー」を含まない文書を検索します。
ANDNOT検索は、探したい語が他の語の一部に含まれてうまく検索できない場合にも便利です。「ファイル」で検索すると「プロファイル」がヒットして鬱
陶しい場合には、「ファイル ! プロファイル」とするとよいでしょう。

「|」を使うとOR検索ができます。例えば、「レモン | ライム」と入力すると、「レモン」か「ライム」のどちらか（または両方）を含む文書を検索しま
す。OR検索は、類義語や表記の揺れに対応した検索をするのに便利です。「woman | women」などとして英単語の活用を吸収したり、「龍馬 | 竜馬」など
として漢字表記の揺れを吸収したりするとよいでしょう。

「|」は空白や「&」や「!」よりも優先順位が高いことに注意してください。例えば、「F1 | F-1 | "Formula One" & 優勝 | チャンピオン」と入力した
場合、「F1」か「F-1」か「Formula One」のどれかを含んで、かつ「優勝」か「チャンピオン」のどちらかを含む文書を探します。

「*」を文字列の後に置くと、その文字列で始まる単語を含む文書を探します。例えば、「inter*」と入力すると、「inter」で始まる単語を含む文書を探
します。「*」を文字列の前に置くと、その文字列で終わる単語を含む文書を探します。例えば、「*sphere」と入力すると、「sphere」で終わる単語を含
む文書を探します。また、「*」を文字列の前後に置くと、その文字列の正規表現に合致する単語を含む文書を探します。例えば、「*^un.*able$*」と入
力すると、「un」で始まって「able」で終わる単語を含む文書を探します。なお、前方一致や後方一致や正規表現の概念は、英語など、空白で単語が区切
られる言語に対してのみ意味を持ちます。

属性による絞り込み

「with XXX」のXXXは、属性による絞り込み条件を指定します。例えば、「@title STRINC 重要」と指定すると、タイトルに「重要」という文字列を含む
文書だけに絞り込みます。「@title」はタイトルを示す属性名です。属性には以下のものがあります。

  • @uri : 文書のURI（URL）。
  • @title : 文書のタイトル。メールの場合はSubjectの値と同じ。
  • @author : 文書の作者。メールの場合はFromの値と同じ。
  • @cdate : 文書の作成時間。メールの場合はDateの値と同じ。
  • @mdate : 文書の最終更新時間。メールの場合はDateの値と同じ。
  • @size : 文書（ファイル）のサイズ。

「STRINC」は部分文字列を含むかを判定する演算子です。絞り込み用の演算子には以下のものがあります。

  • STREQ : 指定した文字列と一致する。
  • STRNE : 指定した文字列と一致しない。
  • STRINC : 指定した文字列を含む。
  • STRBW : 指定した文字列で始まる。
  • STREW : 指定した文字列で終わる。
  • STRAND : 指定した文字列の全てのトークンを含む。
  • STROR : 指定した文字列の一つ以上のトークンを含む。
  • STRRX : 指定した文字列の正規表現に合致する。
  • NUMEQ : 数値や日付が指定したものと等しい。
  • NUMNE : 数値や日付が指定したものと等しくない。
  • NUMGT : 数値や日付が指定したものより大きい。
  • NUMGE : 数値や日付が指定したものと同じかより大きい。
  • NUMLT : 数値や日付が指定したものより小さい。
  • NUMLE : 数値や日付が指定したものと同じかより小さい。
  • NUMBT : 数値や日付が指定したものの間である。

演算子の前に「!」を置いて「!STREQ」などとすると、条件に当てはまらないものに絞り込みます。文字列の演算子の前に「I」を置いて「ISTREQ」などと
すると、英字などの大文字と小文字の違いを無視します。演算子を省略して属性名のみを指定した場合、値は問わずに、その属性を備える文書を該当とみ
なします。STRANDとSTRORとNUMBTは空白で区切った複数の文字列を引数に取ります。「NUMBT 51 100」は、「51から100まで」という意味であり、境界値
も範囲に含みます。

順序指定

「order by XXX」のXXXは、結果の表示順序を指定します。例えば、「@size NUMA」と指定すると、サイズが小さい文書から並べられます。「@size」は属
性名です。属性名には絞り込み条件のものと同じものが指定できます。「NUMA」は演算子です。順序指定用の演算子には以下のものがあります。

  • STRA : 文字列（辞書順）の昇順。
  • STRD : 文字列（辞書順）の降順。
  • NUMA : 数値または日付の昇順。
  • NUMD : 数値または日付の降順。

順序指定を行わなかった場合は、スコアの降順になります。スコアは、検索語が多く含まれる文書ほど高くなります。属性名だけを指定して演算子を省略
した場合は、STRAが指定されたとみなします。

その他の機能

「XX per page」のXXは、結果の各ページに表示する文書の数を指定します。検索結果が1ページに収まらない場合は、検索結果のページの下端にある「
PREV」と「NEXT」を選択することで、前後のページに移動することができます。

「clip by XX」のXXは、結果に含まれる類似した文書をまとめる力の強さを指定します。検索結果に同じ様な文書ばかり表示されて何ページも移動するの
が面倒な場合に使うとよいでしょう。

検索結果の「[detail]」を選択すると、各々の文書の詳細な情報が表示されます。検索結果の「[similar]」を選択すると、各々の文書に類似した文書が
検索されます。検索結果の「[include]」を選択すると、そこに省略されていた文書が表示されます。

補足

Hyper Estraierは、日本語だけでなく、英語、ドイツ語、フランス語、中国語など、大抵の言語を扱うことができます。英字の大文字と小文字の違いは無
視されます。「Japan」「japan」「JAPAN」「jaPaN」は全て同じです。ダイアクリティカルマーク付きのラテン文字（àéîõü）や、ギリシア文字（αβγδε）
、キリル文字（абвгд）でも同様です。

欧文は単語を単位にして検索され、それ以外の言語（中国語、日本語、韓国語、アラビア語など）は文字を単位にして検索されます（N-gram方式）。

空白や「&」「!」「|」「*」を検索語そのものとして指定したい場合は、フレーズ検索を応用してください。例えば「AT&T」を検索したい場合は、「"AT&
T"」とします。

検索語を入力しなくても、属性条件だけで検索することができます。その場合、全ての文書の中から、属性条件に合致するものが検索されます。




インストール
# aptitude install hyperestraier

initでfultxtidxディレクトリが作られます。この中にインデックスなどが格納されます。
startでサーバー起動。http://localhost:1978/master_uiにアクセスして（admin, adminで入れる）、ノード=sample / label = sampleを作成。
$ estmaster init fultxtidx
$ estmaster start fultxtidx
$ estmaster start -bg fultxtidx	#デーモンとして起動するなら。


次にRails側。search_doプラグインをインストール。
$ script/plugin install git://github.com/moro/search_do.git

config/database.ymlの設定。
	development:
		adapter: mysql
		encoding: utf8
		database: test
		pool: 5
		username: test
		password: test
		estraier:
			host: localhost
			user: admin
			password: admin
			port: 1978
			node: sample

nodeの設定の仕様がビミョーだったので、プラグインのコードを勝手に改造。絶望はしてない。
  • Railsの全文検索にはacts_as_searchableじゃなくてsearch_do - このブログは証明できない。

全文検索したいmodelの設定。
	class R2chnn< ActiveRecord::Base
		acts_as_searchable :searchable_fields => [:title, :body]
	end

script/consoleに入って(script/server不要。ctrl+Zで中断してfgで復帰するときは二回ctrl+Z-->fgを反復して要約画面制御ができる。)
インデックスの作成。

>> R2chnn.reindex!
Kokueki.reindex!;R2chnn.reindex!;Osusume.reindex!

R2chnn.fulltext_search("ニート")

2009-03-31
■[Rails]Railsで全文検索(search_do)＋ページ処理(will_paginate)
@r2chnns = R2chnn.paginate params[:keyword],
  :page => params[:page],
  :per_page => $recPP,
  :total_entries => R2chnn.count_fulltext(params[:keyword]),
  :finder => 'fulltext_search'

finderで検索するためのメソッドを指定できるんです。デフォルトはfindメソッドです。これを、search_doのfulltext_searchメソッドに変えます。あと
、検索結果の件数を指定するために、total_entriesにcount_fulltextメソッドの結果を渡します。これだけでOK。

ただ、複雑な条件が使えない気がするので、こんなカンジで対応。

ids = R2chnn.matched_ids params[:keyword]
@entries = R2chnn.paginate :page => params[:page],
  :per_page => 10,
  :conditions => ["#{R2chnn.table_name}.id IN (?) AND 複雑な条件", ids]

本当は、SQLを書かないようにするのがRailsっぽいのかもしれませんが。。

●サーバ起動
Hyper Estraier は CGI インターフェースも、APIも両方持っているが、acts_as_searchable では http 経由でアクセスしている模様。ということで、
Webのサービスを起動しておく。ポートのデフォルトは1978。Debian では /etc/default/hyperestraier が設定ファイルみたい。(/etc/hyperestraier/*
でないのがちょっと意外)。
/etc/default/hyperestraier

NO_START=0   # NO_START=1 だとサービスが起動できない

サーバ起動
# /etc/init.d/hyperestraier start

●参考
  • acts_as_searchable http://weblog.rubyonrails.org/articles/2006/04/06/plug-into-hyperestraier-with-acts_as_searchable
  • Hyper Estraier http://hyperestraier.sourceforge.net/uguide-ja.html
  • CGIインタフェース http://wota.jp:1978/node/tdiary/search_ui

