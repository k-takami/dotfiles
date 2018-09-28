D
    1目的
        1.1導入経緯
            1.1.1JIRA
                1.1.1.1PTKP-TF / PTKP-1593 コーディング規約の作成
            1.1.2esa
                1.1.2.1TaskForce向けRubyコーディング規約導入プランの検討
                1.1.2.2TaskForce向けRubyコーディング規約検討MTG
    2関連リンク
        2.1ベースとなるコーディング規約
            2.1.1The Ruby Style Guide（日本語訳）
            2.1.2The Ruby Style Guide（原文）
        2.2規約の詳細説明
            2.2.1Rubyコーディング規約詳細説明
    3コーディング規約一覧
        3.1レイアウト
        3.2構文
        3.3命名規則
        3.4コメント
        3.5注釈
        3.6クラスとモジュール
        3.7例外
        3.8コレクション
        3.9文字列
        3.10正規表現
        3.11パーセントリテラル
        3.12メタプログラミング
        3.13雑則
    4Rubocop設定（fumiaki.sato 2016/09/13）
    5ドキュメント等でコードを表す際の記法（参考）
    6チートシート
        6.1同様の動作をするメソッドの利用（No.95）
        6.2注釈の用途
        6.3No.128 クラス定義の構造には一貫性をもたせましょう。
        6.4パーセント記法

目的

TaskForceチームメンバー及び関連作業者がAdminOPEアプリ群を製造する際のコーディング規約定義し利用する事により、ソースコードの可読性、統一性、安定性、保守性を高める。

これによりソフトウェア生産性活動のパフォーマンスを高め、また生産活動の定量性を持たせる事でプロジェクト管理の安定化を助ける事を目的とする。
導入経緯
JIRA
PTKP-TF / PTKP-1593 コーディング規約の作成

PTKP-1595 The Ruby Style Guide（日本語訳版）の内容調査

PTKP-1596 導入プラン作成
esa
TaskForce向けRubyコーディング規約導入プランの検討
TaskForce向けRubyコーディング規約検討MTG

1回目、2回目、3回目、4回目、5回目、6回目
関連リンク
ベースとなるコーディング規約
The Ruby Style Guide（日本語訳）
The Ruby Style Guide（原文）

これをベースにチーム独自の内容を追加・修正して利用する。
規約の詳細説明
Rubyコーディング規約詳細説明
コーディング規約一覧

説明ページの無い規約の詳細等は上記のリンク先を参照。
レイアウト
No.
	
概要
	
備考
1	ソースファイルのエンコーディングにはUTF-8を用いましょう。	 
2	インデントにはスペース2つを用いましょう(別名ソフトタブ)。
ハードタブを用いてはいけません。	 
3	Unix-styleの改行にしましょう。	 
4	命令文や式の区切りに;を用いてはいけません。	 
5	本文のないクラスは１行のフォーマットを用いましょう。	 
6	１行のメソッドは避けましょう。	 
7	演算子の前後、コンマ、コロン、セミコロンの後ろ、
{の前後、}の前にはスペースを入れましょう。	 
8	(、 [の後と、]、 )の前にはスペースは入れません。	 
9	!の後にはスペースは入れません。	 
10	範囲リテラルの内側にスペースは入れません。	 
11	whenはcaseと同じ深さに揃えましょう。	 
12	条件式を変数に代入するときは、
条件分岐のインデントは普段と同じ基準で揃えましょう。	 
13	メソッド定義式の間には空行をいれ、
メソッド同士は論理的なかたまりに分けましょう。	 
14	メソッド呼び出しの最後の引数の後ろのコンマは避けましょう。	 
15	メソッドの引数に初期値を割り当てるとき、
=演算子の周りにはスペースを入れましょう。	 
16	\を用いた行の継続は可能であれば避けましょう。	 
17	一貫した複数行のメソッドチェーンのスタイルを採用しましょう。	

メソッドチェーンを次の行へつなげる時は、

"."は次の行に置く。

（Option A）
18	メソッド呼び出しが複数行に及ぶときは、引数は揃えましょう。	 
19	複数行に及ぶ配列は、要素を揃えましょう。	 
20	可読性のため、大きな数値にはアンダースコアをつけましょう。	 
21	APIドキュメントを書くなら、RDocとその規約に従いましょう。	 
22	１行は80字までにしましょう。	

150行以下を推奨。
rubocop.yml
?
Metrics/LineLength:
  Max: 150
23	行末のスペースは避けましょう。	 
24	ファイルの終端には改行を入れましょう。	 
25	ブロックコメントは使ってはいけません。	 

 
構文
No.
	
概要
	
備考
26	::は、定数(クラスやモジュールも含みます)やコンストラクタ
(例えばArray()やNokogiri::HTML())を参照するときにのみ使いましょう。	 
27	引数があるとき、defは括弧と共に使いましょう。	 
28	オプショナル引数は引数リストの最後に定義しましょう。	 
29	変数を定義するために多重代入を使うのは避けましょう。	 
30	多重代入においては不要なアンダースコア変数を後ろに並べないようにしましょう。	 
31	forは、どうしても使わなければいけない明確な理由が明言できる人以外は、
使ってはいけません。	 
32	thenは複数行にまたがるif/unlessでは使ってはいけません。	 
33	複数行にまたがるif/unlessでは、条件式は常にif/unlessと同じ行に置きましょう。	 
34	三項演算子(?:)をif/then/else/end構文よりも優先的に使いましょう。	 
35	三項演算子の１つの分岐には１つだけ式を入れましょう。	 
36	if x; ...を使ってはいけません。代わりに三項演算子を使いましょう。	 
37	ifやcaseが式で、値を返すという事実を活用しましょう。	 
38	１行のcase文ではwhen x then ...を使いましょう。	 
39	when x; ...を使ってはいけません。前のルールを見てください。	 
40	notの代わりに!を使いましょう。	 
41	!!は避けましょう。	 
42	andとorの使用は禁止です。使うべき理由がないです。	 
43	複数行にまたがる三項演算子?:は避けましょう; 代わりにif/unlessを使いましょう。	 
44	本文が１行のときは、if/unless修飾子を優先的に使いましょう。	 
45	複数行に渡るような些細とは言えない規模のブロックに
if/unless修飾子を用いるのは避けましょう。	 
46	if/unless/while/until 修飾子をネストして利用しないようにしましょう。	 
47	否定形のときはifよりunlessを優先的に使いましょう。
(もしくは||構文を使いましょう)。	 
48	unlessをelse付きで使ってはいけません。	 
49	if/unless/while/untilの条件式の周囲を括弧で括らないようにしましょう。	 
50	複数行のwhile/untilでは、while/until condition doを使ってはいけません。	 
51	本文が１行のときは、while/until修飾子を利用しましょう。	 
52	否定形のときは、whileよりもuntilを使いましょう。	 
53	無限ループが必要な時は、while/untilの代わりにKernel#loopを用いましょう。	 
54	後判定ループの場合、begin/end/untilやbegin/end/whileより、
break付きのKernel#loopを使いましょう。	 
55	内部DSL(例えばRake、Rails、RSpec)や、
Rubyで「キーワード」と認識されているメソッド(例えばattr_reader やputs)や、
アトリビュートにアクセスするメソッドでは、引数の周りの括弧を省略しましょう。	 
56	暗黙のオプションハッシュの外側の括弧は省略しましょう。	 
57	内部DSLの一部として使われるメソッドの引数では、
外側の括弧類は省略しましょう	 
58	引数のないメソッド呼び出しの括弧は省略しましょう。	 
59	ブロック内で呼び出されるメソッドがただ１つである場合、
簡略化されたproc呼び出しを用いましょう。	 
60	１行のブロックではdo...endより{...}を使いましょう。	Rubyコーディング規約詳細説明
61	単に他のブロックに引数を渡すだけのブロックリテラルを避けるため、
ブロック引数を明示することを検討しましょう。	 
62	制御構文上不要なreturnは避けましょう。	 
63	不要なselfは避けましょう (selfのアクセサへの書き込みでのみ必要です)。	 
64	当然の帰結として、ローカル変数でメソッドをシャドウイングするのは、
それらが等価なものでない限り避けましょう。	 
65	代入部分を括弧で囲まずに、=の返り値を条件式に用いてはいけません。	 
66	利用できるときには省略された自己代入演算子を用いましょう。	 
67	変数がまだ初期化されていないときにだけ初期化したいのであれば、
||=を使いましょう。	 
68	boolean変数には||=を用いてはいけません	 
69	値が入っているかわからない変数の前処理のは&&=を用いましょう。	 
70	case等価演算子===の露骨な使用は避けましょう。	 
71	==で用が足りるならeql?は使わないようにしましょう。	 
72	Perlスタイルの($:や$;などのような)特別な変数の使用は避けましょう。	 
73	メソッド名と開き括弧の間にスペースを入れてはいけません。	 
74	メソッドの最初の引数が開き括弧で始まるならば、
常にメソッド呼び出しに括弧を用いましょう。	 
75	Rubyインタープリタを走らせるときは、常に-wオプションを付けましょう。	 
76	ネストしたメソッド定義は行ってはいけません - 代わりにラムダを用いましょう。	

メソッドのネストは禁止。

「解決策の一つとして lambda が利用できる」という意味。
77	１行の本文を持つラムダには新しいリテラルを持ちましょう。	Rubyコーディング規約詳細説明
78	stabby lambdaを定義するときは、
引数の周りの括弧は省略しないようにしましょう。	

stabby lambdaとは "->" で表記するlamda関数の記法を指す。

"->" 記法についてはNo.77を参照
79	stabby lambdaに引数がないときは、引数のための括弧は省略しましょう。	同上
80	Proc.newよりprocを使いましょう。	 
81	lambdaやprocの呼び出しにはproc[]やproc.()よりproc.call()を使いましょう。	 
82	使わないブロック引数やローカル変数の先頭には_を付けましょう。	 
83	STDOUT/STDERR/STDINの代わりに$stdout/$stderr/$stdinを用いましょう。	 
84	$stderr.putsの代わりにwarnを用いましょう。	 
85	あまりに暗号めいているString#%メソッドよりもsprintfやformatを使いましょう。	 
86	あまりに暗号めいているArray#*メソッドよりもArray#joinを使いましょう。	 
87	配列かどうかわからない変数を配列とみなして処理したいときは、
明示的にArrayかどうかチェックするよりも、[*var]やArray()を使いましょう。	 
88	ロジックを使って複雑な比較を行うよりも、
可能な限りRangeやComparable#between?を用いましょう。	 
89	==を明示した比較よりも判定メソッドを用いましょう。	 
90	boolean値を扱わない限り、明示的なnilでないかの検査は避けましょう。	 
91	BEGINブロックの使用は避けましょう。	 
92	ENDブロックを使ってはいけません。代わりにKernel#at_exitを使いましょう。	 
93	フリップフロップの使用は避けましょう。	 
94	制御構文で条件式のネストは避けましょう。	 
95	collectよりmap、detectよりfind、find_allよりselect、
injectよりreduce、lengthよりsizeを使いましょう。	 
96	sizeの代わりにcountを用いてはいけません。	 
97	mapとflattenの組み合わせの代わりに、flat_mapを用いましょう。	Rubyコーディング規約詳細説明
98	reverse.eachの代わりにreverse_eachを用いましょう。	 

 
命名規則
No.
	
概要
	
備考
99	識別子は英語で名づけましょう。	 

100
	シンボル、メソッド、変数にはsnake_caseを用いましょう。	 
101	クラスやモジュールにはCamelCaseを用いましょう。
(HTTP、RFC、XMLのような頭字語は大文字を保ちましょう)。	 
102	ファイル名にはsnake_caseを用いましょう。例えばhello_world.rbのように。	 
103	ディレクトリ名にはsnake_caseを用いましょう。
例えばlib/hello_world/hello_world.rbのように。	 
104	ソースファイル１つにつきただ１つの
クラス/モジュールだけが書かれている状態を目指しましょう。	 
105	他の定数はSCREAMING_SNAKE_CASEを用いましょう。	 
106	述語メソッド(boolean値が返るメソッド)は疑問符で終わりましょう。	 
107	危険な可能性のあるメソッドは、その安全なバージョンがある場合には、
危険であることを明示する意味で感嘆符で終わりましょう。	 
108	危険な(感嘆符付き)メソッドがあるときは、
対応する安全な(感嘆符なし)メソッドを定義できないか検討しましょう。	 
109	短いブロックと共にreduceを使うとき、引数は|a, e|と名づけましょう。	

reduceはmapのようにブロックを渡すメソッド。

aとeはaccumulator、elementを指す。
110	二項演算子を定義するとき、引数名はotherを用いましょう	 

 
コメント
No.
	
概要
	
備考
111	自己説明的なコードを書いて、
このセクションの残りのパートは無視しましょう。本当に！	 
112	コメントは英語で書きましょう。	

英語以外のコメントを許容
rubocop.yml
?
Style/AsciiComments:
  Enabled: false
113	最初の#とコメントの間にスペースを１つ入れましょう。	 
114	１語より長いコメントは頭語を大文字化してピリオドを打ちましょう。	 
115	過剰なコメントは避けましょう。	 
116	コメントは最新に保ちましょう。	 
117	悪いコードを説明するコメントは避けましょう。	 

 
注釈
No.
	
概要
	
備考
118	注釈は、通常関連するコードのすぐ上に書きましょう。	 
119	注釈のキーワードの後ろは: を続けましょう。	 
120	もし問題点の記述に複数行かかる場合は、
後続の行は#の後ろにスペース３つでインデントしましょう。	 
121	もし問題が明らかで、説明すると冗長になる時は、
問題のある行の末尾に、本文なしの注釈だけ付けましょう。	 
122	あとで追加されるべき、今はない特徴や機能の注釈にはTODOを使いましょう。	 
123	直す必要がある壊れたコードの注釈にはFIXMEを使いましょう。	 
124	パフォーマンスに問題を及ぼすかもしれない遅い、
または非効率なコードの注釈にはOPTIMIZEを使いましょう。	 
125	疑問の残るコードの書き方でコードの臭いを感じた箇所の注釈にはHACKを使いましょう。	 
126	意図したとおりに動くか確認する必要がある箇所の注釈にはREVIEWを使いましょう。	 
127	適切に感じるのであれば、他の独自のキーワードを用いても構いませんが、
それらのキーワードはREADMEやそれに類するものに書いておきましょう。	 

 
クラスとモジュール
No.
	
概要
	
備考
128	クラス定義の構造には一貫性をもたせましょう。	 
129	クラスの中に複数行あるようなクラスをネストしてはいけません。	 
130	クラスメソッドしかないクラスよりモジュールを使いましょう。	 
131	モジュールのインスタンスメソッドをクラスメソッドにしたいときは、
extend selfよりもmodule_functionを使いましょう。	Rubyコーディング規約詳細説明 
132	クラス階層の設計を行うときは、リスコフの置換原則. に従いましょう。	 
133	あなたのクラスを可能な限りSOLID に保ちましょう。	 
134	ドメインオブジェクトのクラスにおいては常に適切なto_sメソッドを提供しましょう。	 
135	単純なアクセサやミューテータの定義には、attr群を用いましょう。	 
136	attrの使用は避けましょう。代わりにattr_readerやattr_accessorを使いましょう。	 
137	Struct.newの使用を考えましょう、それは、
単純なアクセサ、コンストラクタや比較演算子を定義してくれます。	Rubyコーディング規約詳細説明
138	Struct.newで初期化されたインスタンスを拡張してはいけません。	Structに関しては上記 No.137を参照
139	あるクラスのインスタンス生成する追加の方法を提供したいときは、
ファクトリメソッドの追加を検討しましょう。	Rubyコーディング規約詳細説明
140	継承より[ダック・タイピング]を使いましょう。	 
141	継承での振る舞いが"扱いづらい"ので、クラス変数(@@)の使用は避けましょう。	 
142	意図した使い方に沿って、可視性(private、protected)を設定しましょう。	 
143	public、protected、privateは、適用するメソッド定義と同じインデントにしましょう。	 
144	クラスメソッドを定義するときはdef self.methodを用いましょう。	 
145	メソッドの別名をつける時はaliasを使いましょう。	Rubyコーディング規約詳細説明
146	モジュールやクラス、実行時のシングルトンクラス等では、aliasの挙動が予期できないので、
エイリアス定義には常にalias_methodを用いましょう。	Rubyコーディング規約詳細説明

 
例外
No.
	
概要
	
備考
147	

例外はfailを使って発生させましょう。

例外はfailよりraiseを推奨します。（意訳）
	Prefer raise over fail for exceptions.
148	２引数のfail/raiseでは、RuntimeErrorを明示しないようにしましょう。	 
149	fail/raiseの引数としては例外クラスのインスタンスよりも、
例外クラスとメッセージをそれぞれの引数で渡す方を使いましょう。	 
150	ensureブロックからreturnしてはいけません。	 
151	可能な場所では、暗黙のbeginブロックを用いましょう。	 
152	不確実性のあるメソッド(Avdi Grimmによって作られた言葉です)
を用いてbeginの蔓延を和らげましょう。	 
153	例外をもみ消してはいけません。	 
154	rescueを修飾子として利用するのは避けましょう。	 
155	制御フローに例外を使っては行けません。	 
156	Exceptionをrescueするのは避けましょう。	 
157	より詳細な例外をrescueチェーンの上に配置しましょう。	 
158	プログラム内で確保した外部リソースは、ensureで開放しましょう	 
159	自動的にリソースを開放してくれる機能を含むメソッドを利用可能な時は、
そちらを使いましょう。	 
160	新しい例外クラスを導入するより、基本ライブラリの例外クラスを使いましょう	 

 
コレクション
No.
	
概要
	
備考
161	配列やハッシュを生成する時はリテラル記法を使いましょう。	 
162	単語(空でなく、スペースを含まない文字列)の配列を生成する時は%wリテラルを使いましょう。	 
163	シンボルの配列が必要な時は %iリテラルを使いましょう。	 
164	ArrayやHashリテラルの最後の要素の後ろの,は避けましょう。	 
165	配列に大きな隙間を作るのは避けましょう。	 
166	配列の最初や最後にアクセスしたいときは、[0]や[-1]よりfirstやlastを使いましょう。	 
167	要素が一意のものを扱うときは、Arrayの代わりにSetを用いましょう。	Rubyコーディング規約詳細説明
168	ハッシュのキーには文字列よりシンボルが好まれます。	 
169	変更のできるオブジェクトをハッシュのキーに使うのは避けましょう。	 
170	ハッシュのキーがシンボルの時は、Ruby 1.9のハッシュリテラル記法を用いましょう。	 
171	Ruby 1.9のハッシュ記法とロケット記法を同じハッシュリテラル内で混在させてはいけません。	 
172	Hash#has_key?よりHash#key?を、Hash#has_value?よりHash#value?を用いましょう。	 
173	存在すべきキーを扱う時は、Hash#fetchを用いましょう。	 
174	Hash#fetchのデフォルト値を使い、自力でロジックを書かないようにしましょう。	 
175	Hash#fetchのデフォルト値は評価するべき式に副作用があったり
実行コストが高いときはうまくいかないので、代わりにブロックを使いましょう。	 
176	ハッシュから連続して複数の値が必要になる時は、Hash#values_atを用いましょう。	 
177	Ruby 1.9以降、ハッシュは順序付けられるということを信頼しましょう。	 
178	コレクションを走査している時に変更を加えてはいけません。	 
179	コレクションにアクセスするとき、[n]の代替のリーダーメソッドが
提供されている場合に直接[n]経由でアクセスすることは避けましょう。	 
180	コレクションに対するアクセサを提供するとき、コレクション内の要素にアクセスする前に、
nilでアクセスするのを防ぐための代替のアクセス方法を提供しましょう。	 

 
文字列
No.
	
概要
	
備考
181	文字列連結の代わりに文字列挿入や文字列整形を使いましょう。	 
182	文字列挿入時には、括弧の内部にスペースを入れるべきではありません。	 
183	文字列リテラルの引用符は一貫したスタイルで使いましょう。	

デフォルトでシングルクォートを使用

（Option A）
184	文字リテラル構文?xを用いてはいけません。	 
185	文字列の中の挿入されるインスタンス変数や
グローバル変数の周りの{}は省略してはいけません。	 
186	文字列に挿入するときにObject#to_sを使ってはいけません。	 
187	大きなデータの塊を作る必要があるときは、String#+の使用は避けましょう。	 
188	利用するケースにより特化した速い代替手段がある場合、
String#gsubは使わないようにしましょう。	 
189	複数行のヒアドキュメントを用いるときは、
先頭のスペースも保持してしまうということを頭に入れておかなければなりません。	 

 
正規表現
No.
	
概要
	
備考
196	^や$は、文字列の先頭や末尾ではなく、行頭や行末にマッチするので注意が必要です。	 
198	sub/gsubでの複雑な置換は、ブロックやハッシュを用いることで実現できます。	Rubyコーディング規約詳細説明
194	どの値が入っているか追うのが困難になるので、グループ番号を使うのは避けましょう。	 
192	キャプチャした結果を使う必要のないときは、
キャプチャしないグループを用いましょう。	Rubyコーディング規約詳細説明
190	単に文字列中から文字列を探すだけの時は、
正規表現を使ってはいけません: string['text']を使いましょう。	Rubyコーディング規約詳細説明
195	文字クラスの中では、特別な意味を持つ文字が少ないので注意が必要です:	Rubyコーディング規約詳細説明
191	文字列の添字に直接正規表現を渡すことで、文字列の構築をシンプルにできます。	Rubyコーディング規約詳細説明
193	最後に正規表現にマッチした値を示すPerlレガシーの
暗号的な変数を用いてはいけません($1、$2など)。	 
197	複雑な正規表現にはx識別子を用いましょう。	Rubyコーディング規約詳細説明

 
パーセントリテラル
No.
	
概要
	
備考
199	文字列挿入と"文字の双方が入る１行の文字列には、
%()(%Q()の短縮形)を使いましょう。複数行の時はヒアドキュメントを使いましょう。	 
200	文字列に'と"双方が含まれない限り、%qの使用は避けましょう。	 
201	/'が１つ以上の正規表現に限り、%rを使いましょう。	 
202	呼び出すコマンドにバッククォートが含まれる(かなり起こりえないが)
ことがない限り、%xの使用は避けましょう。	 
203	%sの使用は避けましょう。	 
204	パーセントリテラルの区切り文字は、%rを除いて()が好まれます。	 

 
メタプログラミング
No.
	
概要
	
備考
205	不要なメタプログラミングは避けましょう。	 
206	ライブラリを作成する時にコアクラスを汚染するのはやめましょう。	 
207	ブロック渡しのclass_evalのほうが、文字列挿入型よりも好ましいです。	 
208	文字列挿入型のclass_eval(または他のeval)を用いる時は、
挿入されたときのコードをコメントに追加しましょう	 
209	method_missingを用いたメタプログラミングは避けましょう。	 
210	private/protected制約を回避しないために、sendよりもpublic_sendを使いましょう。	 
211	sendは他の既存のメソッドと衝突するかもしれないので、__send__を使いましょう。	 

 
雑則
No.
	
概要
	
備考
212	ruby -wで実行しても何も警告されないコードを書きましょう。	 
213	オプショナルな変数としてのハッシュの使用を避けましょう。	 
214	コードのある行が10行を超えるメソッドは避けましょう。	

20行以下を推奨
rubocop.yml
?
Metrics/MethodLength:
  Max: 20
215	３つや４つ以上引数を設定するのは避けましょう。	 
216	もし本当にグローバルなメソッドが必要な場合は、
Kernelに定義し、privateに設定しましょう。	 
217	グローバル変数の代わりに、モジュールのインスタンス変数を使用しましょう。	 
218	複雑なコマンドラインオプションをパースするためにOptionParserを使いましょう。	 
219	現在のシステム時間を読み出すには、Time.newよりもTime.nowを使いましょう。	 
220	破壊的変更をしなくても済むなら、
できるだけ関数的プログラミング手法を使いましょう。	 
221	それがメソッドの目的でない限り、引数に破壊的変更をするのはやめましょう。	 
222	３段階を超えるブロックのネストは避けましょう。	 
223	一貫性を保ちましょう。理想を言えば、このガイドラインに沿いましょう。	 
224	常識を用いましょう。	 
Rubocop設定（fumiaki.sato 2016/09/13）
rubocop.yml
?
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
	
AllCops:
#  RunRailsCops: true
  TargetRubyVersion: 2.3
  Exclude:
    - 'vendor/**'
    - 'schema.rb'
 
Style/AsciiComments:
  Enabled: false
 
Style/BlockComments:
  Enabled: false
 
Style/Documentation:
  Enabled: false
 
Style/FrozenStringLiteralComment:
  Enabled: false
 
Metrics/LineLength:
  Max: 150
 
Metrics/AbcSize:
  Max: 20
 
Metrics/MethodLength:
  Max: 20
 
Metrics/ClassLength:
  Max: 150
 
ドキュメント等でコードを表す際の記法（参考）
対象
	
記法
	
例
インスタンスメソッド	#instance_method_name	ClassName#instance_method_name
クラスメソッド	.class_method_name	ClassName.class_method_name
定数	::CONSTANT_VAR_NAME	ClassName::CONSTANT_VAR_NAME

 
チートシート
同様の動作をするメソッドの利用（No.95）
推奨メソッド
	
非推奨メソッド
map	collect
find	detect
select	find_all
reduce	inject
size	length

    The Ruby Style Guide（日本語訳）での説明箇所
    Rubyist Magazine - map と collect、reduce と inject ―― 名前の違いに見る発想の違い

注釈の用途
名称
	
用途
	
対応する規約
TODO	後で追加する予定の特徴や機能	No.122
FIXME	masterにマージする前に修正する予定の箇所	No.123
OPTIMIZE	

パフォーマンスに影響を及ぼす恐れのある、遅い、もしくは、非効率なコードの箇所
	No.124
HACK	疑わしい書き方をしたコード、リファクタリングすべきコードの箇所	No.125
REVIEW	意図したとおりに動作するか確認する必要がある箇所	No.126
No.128 クラス定義の構造には一貫性をもたせましょう。
Class Definition
?
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
	
class Person
  # extendとincludeを最初に書きます。
  extend SomeModule
  include AnotherModule
 
  # 内部クラス
  CustomErrorKlass = Class.new(StandardError)
 
  # 次に定数
  SOME_CONSTANT = 20
 
  # 次にattribute系マクロ
  attr_reader :name
 
  # (あれば) それ以外のマクロ
  validates :name
 
  # publicクラスメソッドが続きます
  def self.some_method
  end
 
  # initializationはクラスメソッドと他のpublicメソッドの間に
  def initialize
  end
 
  # 他のpublicメソッドが続きます
  def some_method
  end
 
  # protectedとprivateのメソッドは最後のあたりにグループ化します
  protected
 
  def some_protected_method
  end
 
  private
 
  def some_private_method
  end
end
 

    The Ruby Style Guide（日本語訳）での説明箇所

パーセント記法

文字列リテラル、コマンド出力、正規表現リテラル、配列式、シンボルでは、%で始まる形式の記法を用いることができる。

文字列や正規表現では、`"', `/' など（通常のリテラルの区切り文字）を要素 に含めたい場合にバックスラッシュの数をコードから減らす効果がある。

また配列式では文字列の配列を簡単に表現できる。
表記
	
用途
%Q!STRING! 	ダブルクォート
%!STRING!	上記の省略形
%q!STRING!	シングルクォート
%x!STRING!	コマンド出力
%r!STRING!	正規表現
%w!STRING!	要素が文字列の配列（空白区切り）
%W!STRING!	

要素が文字列の配列（空白区切り）

式展開、バックスラッシュ記法が有効
%s!STRING!	

シンボル

式展開、バックスラッシュ記法は無効
%i!STRING!	要素がシンボルの配列（空白区切り）
%I!STRING!	

要素がシンボルの配列（空白区切り）

式展開、バックスラッシュ記法が有効

    !の部分には改行を含めた任意の非英数字（記号等）を使える
    %w、%W、%i、%I では、区切りに空白、改行を用いるため、!の文字としては使えない


■■■■ CSS/SCSS/BootStrap/Foundation  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

まずはGoogleのCSSコーディングガイドラインにしたがうこと；
　https://google.github.io/styleguide/htmlcssguide.html
流用したファイルのいかんを問わず、以下の加筆をすること；
　インラインスタイルは禁止。
　文書構造だけをViewテンプレートに描き、なるべく外部スタイルシートで書式指定すること
　　ただし、bootstrap/Foundationの書式指定クラスはViewの中にかいてもよい
　書式指定用のHTMLタグも極力書かない。レイアウト調整のための空タグも書かないこと
　ViewテンプレートのコメントはHTML出力されないコメント形式をえらぶこと
　SCSSの空行、空白のフォーマッターをつかうこと。
　レイアウト識別子としてのクラス名指定はせず、クラスIDをつかうこと。


