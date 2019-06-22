ruby インストール compile installation
  # wget https://www.ruby-lang.org/ja/downloads/
  $ tar zxvf ruby-1.9.3-p194.tar.gz
  $ cd ruby-1.9.3-p194
  $ ./configure
  $ make
  $ sudo make install
  $ sudo make clean
  ＃確認
  $ ruby -v
  $ sudo gem install bundler --no-rdoc --no-ri

gem
  gem install --local <gem ファイル名>
  #github特定tagのgemをローカルビルドインストールするながれ；
  $ git clone https://github.com/teamcapybara/capybara.git
  $ cd capybara/
  $ git tag -l
  $ gico-b 1.1.4
  $ gico tags/1.1.4
  $ gem build ./capybara.gemspec
  $ cp capybara-1.1.4.gem /usr/local/lib/ruby/gems/1.8/gems/
  $ cd /usr/local/lib/ruby/gems/1.8/gems/
  $ gem install --local capybara-1.1.4.gem
  #でも依存性までは解決してくれない・・・
  $ gem install selenium-webdriver -v 2.0

#1-liner
    文字列の置換には、sub、sub!、gsub、gsub!メソッドを使う
      string#sub(置換前パターン,置換後文字列)
        * subは最初のパターンだけを置換。gsubは全てのパターンを置換する。
        * !をつけると、元のインスタンスの内容を変更する。
      ruby -e 'puts File.read("in.txt").gsub(/foo/,"bar")' > out.txt

      ruby test.rb yomikaku.txt >new ;sort     new >new2
      ruby test.rb yomikaku.txt >new ;sort -b new >new2

      -e … このオプションのあとにスクリプト片を与えると、ファイルからスクリプトを読み込むのではなくそれをそのまま実行してくれます。
        ruby -e ‘print “Hello World!\n”‘     画面にHello World!が表示されます
        ruby -ne ‘gsub(/ +/, “\t”)’ <filename  ファイル中のスペースの連続をTSVタブに置換
        ruby -ne ‘$_.upcase!’ <filename    ファイル中のアルファベットをすべて大文字に
      -p … このオプション（引数なし）を与えると、プログラム全体が
        while gets
          …
          print $_
        end
      FILE SPACING:
        # double space a file
          $  ruby -pe 'puts' < file.txt
        # triple space a file
          $  ruby -pe '2.times {puts}' < file.txt
        # undo double-spacing (w/ and w/o whitespace in lines)
          $  ruby -lne 'BEGIN{$/="\n\n"}; puts $_' < file.txt
          $  ruby -ne 'BEGIN{$/="\n\n"}; puts $_.chomp' < file.txt
          $  ruby -e 'puts STDIN.readlines.to_s.gsub(/\n\n/, "\n")' < file.txt
      NUMBERING:
        # number each line of a file (left justified).
          $  ruby -ne 'printf("%-6s%s", $., $_)' < file.txt
        # number each line of a file (right justified).
          $  ruby -ne 'printf("%6s%s", $., $_)' < file.txt
        # number each line of a file, only print non-blank lines
          $  ruby -e 'while gets; end; puts $.' < file.txt
        # count lines (emulates 'wc -l')
          $  ruby -ne 'END {puts $.}' < file.txt
          $  ruby -e 'while gets; end; puts $.' < file.txt
      TEXT CONVERSION AND SUBSTITUTION:
        # convert DOS newlines (CR/LF) to Unix format (LF)
        # - strip newline regardless; re-print with unix EOL
          $  ruby -ne 'BEGIN{$\="\n"}; print $_.chomp' < file.txt
        # convert Unix newlines (LF) to DOS format (CR/LF)
        # - strip newline regardless; re-print with dos EOL
          $  ruby -ne 'BEGIN{$\="\r\n"}; print $_.chomp' < file.txt
        # delete leading whitespace (spaces/tabs/etc) from beginning of each line
          $  ruby -pe 'gsub(/^\s+/, "")' < file.txt
        # delete trailing whitespace (spaces/tabs/etc) from end of each line
        # - strip newline regardless; replace with default platform record separator
          $  ruby -pe 'gsub(/\s+$/, $/)' < file.txt
        # delete BOTH leading and trailing whitespace from each line
          $  ruby -pe 'gsub(/^\s+/, "").gsub(/\s+$/, $/)' < file.txt
        # insert 5 blank spaces at the beginning of each line (ie. page offset)
          $  ruby -pe 'gsub(/%/, "   ")' < file.txt
          FAILS! $  ruby -pe 'gsub(/%/, 5.times{putc " "})' < file.txt
        # align all text flush right on a 79-column width
          $  ruby -ne 'printf("%79s", $_)' < file.txt
        # center all text in middle of 79-column width
          $  ruby -ne 'puts $_.chomp.center(79)' < file.txt
          $  ruby -lne 'puts $_.center(79)' < file.txt
        # substitute (find and replace) "foo" with "bar" on each line
          $  ruby -pe 'gsub(/foo/, "bar")' < file.txt
        # substitute "foo" with "bar" ONLY for lines which contain "baz"
          $  ruby -pe 'gsub(/foo/, "bar") if $_ =~ /baz/' < file.txt
        # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
          $  ruby -pe 'gsub(/foo/, "bar") unless $_ =~ /baz/' < file.txt
        # substitute "foo" or "bar" or "baz".... with "baq"
          $  ruby -pe 'gsub(/(foo|bar|baz)/, "baq")' < file.txt
        # reverse order of lines (emulates 'tac') IMPROVE
          $  ruby -ne 'BEGIN{@arr=Array.new}; @arr.push $_; END{puts @arr.reverse}' < file.txt
        # reverse each character on the line (emulates 'rev')
          $  ruby -ne 'puts $_.chomp.reverse' < file.txt
          $  ruby -lne 'puts $_.reverse' < file.txt
        # join pairs of lines side-by-side (like 'paste')
          $  ruby -pe '$_ = $_.chomp + " " + gets if $. % 2' < file.txt
        # if a line ends with a backslash, append the next line to it
          $  ruby -pe 'while $_.match(/\\$/); $_ = $_.chomp.chop + gets; end' < file.txt
          $  ruby -e 'puts STDIN.readlines.to_s.gsub(/\\\n/, "")' < file.txt
        # if a line begins with an equal sign, append it to the previous line (Unix)
          $  ruby -e 'puts STDIN.readlines.to_s.gsub(/\n=/, "")' < file.txt
        # add a blank line every 5 lines (after lines 5, 10, 15, etc)
          $  ruby -pe 'puts if $. % 6 == 0' < file.txt
      SELECTIVE PRINTING OF CERTAIN LINES
        # print first 10 lines of a file (emulate 'head')
          $  ruby -pe 'exit if $. > 10' < file.txt
        # print first line of a file (emulate 'head -1')
          $  ruby -pe 'puts $_; exit' < file.txt
        # print the last 10 lines of a file (emulate 'tail'); NOTE reads entire file!
          $  ruby -e 'puts STDIN.readlines.reverse!.slice(0,10).reverse!' < file.txt
        # print the last 2 lines of a file (emulate 'tail -2'); NOTE reads entire file!
          $  ruby -e 'puts STDIN.readlines.reverse!.slice(0,2).reverse!' < file.txt
        # print the last line of a file (emulates 'tail -1')
          $  ruby -ne 'line = $_; END {puts line}' < file.txt
        # print only lines that match a regular expression (emulates 'grep')
          $  ruby -pe 'next unless $_ =~ /regexp/' < file.txt
        # print only lines that DO NOT match a regular expression (emulates 'grep')
          $  ruby -pe 'next if $_ =~ /regexp/' < file.txt
        # print the line immediately before a regexp, but not the regex matching line
          $  ruby -ne 'puts @prev if $_ =~ /regex/; @prev = $_;' < file.txt
        # print the line immediately after a regexp, but not the regex matching line
          $  ruby -ne 'puts $_ if @prev =~ /regex/; @prev = $_;' < file.txt
        # grep for foo AND bar AND baz (in any order)
          $  ruby -pe 'next unless $_ =~ /foo/ && $_ =~ /bar/ && $_ =~ /baz/' < file.txt
        # grep for foo AND bar AND baz (in order)
          $  ruby -pe 'next unless $_ =~ /foo.*bar.*baz/' < file.txt
        # grep for foo OR bar OR baz
          $  ruby -pe 'next unless $_ =~ /(foo|bar|baz)/' < file.txt
        # print paragraph if it contains regexp; blank lines separate paragraphs
          $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /regexp/' < file.txt
        # print paragraph if it contains foo AND bar AND baz (in any order); blank lines separate paragraphs
          $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /foo/ && $_ =~ /bar/ && $_ =~ /baz/' < file.txt
        # print paragraph if it contains foo AND bar AND baz (in order); blank lines separate paragraphs
          $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /(foo.*bar.*baz)/' < file.txt
        # print paragraph if it contains foo OR bar OR baz; blank lines separate paragraphs
          $  ruby -ne 'BEGIN{$/="\n\n"}; print $_ if $_ =~ /(foo|bar|baz)/' < file.txt
        # print only lines of 65 characters or greater
          $  ruby -pe 'next unless $_.chomp.length >= 65' < file.txt
          $  ruby -lpe 'next unless $_.length >= 65' < file.txt
        # print only lines of 65 characters or less
          $  ruby -pe 'next unless $_.chomp.length < 65' < file.txt
          $  ruby -lpe 'next unless $_.length < 65' < file.txt
        # print section of file from regex to end of file
          $  ruby -pe '@found=true if $_ =~ /regex/; next unless @found' < file.txt
        # print section of file based on line numbers (eg. lines 2-7 inclusive)
          $  ruby -pe 'next unless $. >= 2 && $. <= 7' < file.txt
        # print line number 52
          $  ruby -pe 'next unless $. == 52' < file.txt
        # print every 3rd line starting at line 4
          $  ruby -pe 'next unless $. >= 4 && $. % 3 == 0' < file.txt
        # print section of file between two regular expressions, /foo/ and /bar/
          $  ruby -ne '@found=true if $_ =~ /foo/; next unless @found; puts $_; exit if $_ =~ /bar/' < file.txt
      SELECTIVE DELETION OF CERTAIN LINES
        # print all of file except between two regular expressions, /foo/ and /bar/
          $  ruby -ne '@found = true if $_ =~ /foo/; puts $_ unless @found; @found = false if $_ =~ /bar/' < file.txt
        # print file and remove duplicate, consecutive lines from a file (emulates 'uniq')
          $  ruby -ne 'puts $_ unless $_ == @prev; @prev = $_' < file.txt
        # print file and remove duplicate, non-consecutive lines from a file (careful of memory!)
          $  ruby -e 'puts STDIN.readlines.sort.uniq!.to_s' < file.txt
        # print file except for first 10 lines
          $  ruby -pe 'next if $. <= 10' < file.txt
        # print file except for last line
          $  ruby -e 'lines=STDIN.readlines; puts lines[0,lines.size-1]' < file.txt
        # print file except for last 2 lines
          $  ruby -e 'lines=STDIN.readlines; puts lines[0,lines.size-2]' < file.txt
        # print file except for last 10 lines
          $  ruby -e 'lines=STDIN.readlines; puts lines[0,lines.size-10]' < file.txt
        # print file except for every 8th line
          $  ruby -pe 'next if $. % 8 == 0' < file.txt
        # print file except for blank lines
          $  ruby -pe 'next if $_ =~ /^\s*$/' < file.txt
        # delete all consecutive blank lines from a file except the first
          $  ruby -e 'BEGIN{$/=nil}; puts STDIN.readlines.to_s.gsub(/\n(\n)+/, "\n\n")' < file.txt
        # delete all consecutive blank lines from a file except for the first 2
          $  ruby -e 'BEGIN{$/=nil}; puts STDIN.readlines.to_s.gsub(/\n(\n)+/, "\n\n")' < file.txt
        # delete all leading blank lines at top of file
          $  ruby -pe '@lineFound = true if $_ !~ /^\s*$/; next if !@lineFound' < file.txt




  『Rubレシピブック第2版』目次 rubyrecipebook2
    第1章 Rubyの文法
      * 001 リテラル（＝記法） 2
        1_000_000
        # 正規表現は%r<> でも %r[]でも 認識される
        # %Q[]　では式展開できる
      * 002 演算子 7
        <=, >=
        and or not は優先度がひくい
      * 003 変数と定数 10
        lvar, @ivar, @@cvar, $gvar, Const
      * 004 代入 12
      * 005 文の区切り 13
        # 行末に二項演算子や　引数の区切がくると改行は無視され　文のおわりとはみなされない
      * 006 コメント 14
      * 007 真偽値と条件分岐 15
      * 008 繰り返し 19
        break;next;retry;redo
        for i in [n..m] do ....... end
        処理 while cond end
        処理 until cond end
        while cond do ...... end
        until cond do ...... end
        #処理を最低一回は実行したい場合
        begin 処理 end while cond
        begin 処理 end until cond
      * 176 回数を指定して処理を繰り返す 276
        10.times{|i| 処理 }
        開始値.upto(終了整数){|i| 処理}
        開始値.downto(終了整数){|i| 処理}
        (開始値..終了整数).each{|i| 処理}
        (開始値...終了整数).each{|i| 処理} #終了整数未満
      * 009 メソッド呼び出し 21
        #引数に*配列型 とすると、配列が第一第二...第nと展開してわたる
        obj.method( *ary1) == obj.method( el1, 4el2, e3....elN )
      * 010 ブロック 22
        local_val
        @instance_val
        @@class_val
        $global_val
        Const
      * 011 メソッド定義 23
        priotity:  def sample( arg, arg=defaultvalue, *valiable-arg{,1}, &block-arg{,1}
        # yield 引数 は ブロックに引数を渡す
        引数展開    #{arg}
        引数展開実行  `#{arg}`
      * 012 メソッドの呼び出し制限 24
        public
        private <----receiver定義を省略した形でしかよべなくする,initializeもprivate
        protected <-----only callable from sub-class/same-class
      * 013 クラス定義 25
        #selfはclass定義直下ではclass自身を返し、メソッド定義内ではインスタンスを返す
      * 014 モジュール定義 27
                      class     module
        include       不可      可能
        inheritance   可能      不可
        instanciate   可能      不可
        #selfはincludeされるとincludeされたオブジェクトを返す
      * 015 特異メソッド 29
        #特異メソッド定義
        def オブジェクト.特異メソッド名(args) end
        #特異クラス定義(<< と　< のちがいに注意)
        class foo << bar;  def tokui-method-name(args); end  #<---callable inside by "self."
      * 016 例外処理 30
        begin [shori1] resucue [cond1] then [reigaishori1] rescue [cond2] then [reigaishori2] ... else [shori2] ensure [mandatory-shori]
        # rescue修飾子をつかう書き方
        主処理 rescue 例外処理
      * 018 予約語 32
        PATH|redo
        __END__, DATA #Ruby スクリプトの終わりを表すキーワードで、これ以降はスクリプトとして読み込まれません。DATAは__END__以降の各行
        __FILE__|__LINE__|BEGIN|END|RUBYLIB|RUBYOPT|RUBYSHELL|RUBYPATH|COMSPEC
        begin|end|alias|and|break|case|class|def|defined?|do|else|elsif|ensure|false|for|if|in|module|
        next|nil|not|or|redo|rescue|retry|return|self|super|then|true|undef|unless|when|while|yield|

    第2章 文字列
      * 019 適切な文字列リテラルを選ぶ 34
        '|%q()  ;<--- ['\]|noescape
        "#{formula} " == %Q(#{formula})  <----escape&expand
        %W(el2 el2)     <-----["el1","el2"]
        %w( el1 el2)    <-----[el1,el2]
*h 020 デフォルトの文字コードを設定する 36
      * 021 文字コードを変換する 38
        #推測はKconv&NKFともに 文字化けの誤動作がありがちで、やめた方が無難。
        require 'kconv'
          変換前コード 変換後コード  自動判定           入力文字コードを指定
          EUC-JP       UTF-8        str.toutf8  str.kconv(Kconv::UTF8, Kconv::EUC)
          EUC-JP       UTF-16       str.toutf16 str.kconv(Kconv::UTF16, Kconv::EUC)
          EUC-JP       Shift_JIS    str.tosjis  str.kconv(Kconv::SJIS, Kconv::EUC)
          EUC-JP       JIS          str.tojis   str.kconv(Kconv::JIS, Kconv::EUC)
          Shift_JIS    EUC-JP       str.toeuc   str.kconv(Kconv::EUC, Kconv::SJIS)
        require 'nkf'
          JIS          UTF-8        NKF.nkf('-w', str) NKF.nkf('-J -s', str)
          UTF-8        Shift_JIS    NKF.nkf('-s', str) NKF.nkf('-W -s', str)
          EUC-JP       JIS          NKF.nkf('-j', str) NKF.nkf('-E -j', str)
          Shift_JIS    EUC-JP       NKF.nkf('-e', str) NKF.nkf('-S -e', str)
*h 022 文字コードを推測する 41
      * 023 文字列を複製する 43
        str1.dup　 #<---文字列だけコピーする
        str1.clone #<---特異メソッド　.taint .freeze 情報もコピーする
        puts str1.dup/clone.obect_id　#<---確認
      * 024 文字列を反復する 44
        "str" * 999
      * 025 文字列の長さを得る 45
        バイト数は.length, 文字数は .split(//).size
*h 026 文字列を検索する 46
        出現bバイト位置は、.index(正規表現または文字列) , .rindex(正規表現または文字列)
        str1.grep(/RE/){line| line-statement }
      * 027 正規表現が文字列の先頭・末尾にマッチするか調べる 49
        start_with?(string) <=> end_with?(string)
        # メタキャラクター ^ $ は行の頭尾をあらわし、文字列全体ではない \Zは最後の行末を表す
        "文字列あたま  \A
        "文字おわり    \z #<---改行コードふくむ
        PHONE_NO_REGEX = /\A[-+[:digit:]]*\z/u  #add
* 028 単語にマッチさせる 50
      * 029 特定の文字コードで正規表現マッチを行う 52
        /正規表現/[usen]/  : 例 EUCならば /REGEXP/e マルチバイト扱いなしならば　/REGEXP/n
        escape sequenced literal embedding: /#{"\245"}/[usen]
*h 030 正規表現「.」に\nをマッチさせる 54
        /正規表現/m #<--- [usen]と排他指定
      * 031 前回マッチした部分の続きからマッチさせる 55
        require'strscan';scanner=SrtingScaner.new(orgstr1);until scanner.eos? { scanner.scan /regexp/ }
      * 032 特定の文字・文字列の出現回数を調べる 57
        str1.scan(/RE/).length;
        count=0 ; str1.scan(/RE/){ count += 1}
*h 033 文字の出現頻度を調べる 59
      * 034 文字列を比較する 60
        ==, <=, < <=
      * 035 空白にマッチさせる 61
        /[\t\n\r\f/ #<--- \fは改ページ記号
      * 036 文字列が空行か調べる 62
        /^$/      　
      * 037 数字文字列か調べる 63
        Integer(str）または　Float(str) #<--- ただし数字じゃないと例外。ArgumentError .to_i, .to_fはだめ。
      * 038 文字列を数値に変換する 64
        str1.to_i;str1.to_f; str1.hex;tr1.oct; "010101001110".to_i(2|8|1-|16|32) #<---各進数に変換
      * 040 文字を大文字・小文字に変換する 67
        .upcase, .downcase,
        特定文字だけ変換ならば　"some string".tr "some", "SOME" #===> "SOME String"
        先頭文字だけ変換ならば　.capitalize
        大文字小文字逆転ならば  .swapcase
        #X-Mailer, Content-Typeみたいに統一するメソッドの例；
        def canonical_header_name(str)
          str.split('-').map{|s| s.capitalize.join('-')}
        end
        #全角半角を連想配列で変換
        TABLE = { a" => "Ａ", "b" => "Ｂ"}; "abc".gsub(/[ab]/){|ch| TABLE[ch] }
*h 041 文字列の一部を取り出す 69
      * 042 正規表現にマッチした部分を取り出す 71
        str1stMatch = str1.slice(/RE(group)/, 0)
          slice(XXX,[0..n])にはマッチしたキャラクタークラス\0..\nが格納される. .scan(/some_pattern\/(some_group)/).flatten[n]とおなじだが短文
        retary = str1.scan(/RE/)
        retaryCollection = str1.scan(/(grp1)(grpN)/)
        retary = /RE(grp1)i(grp2)(grpN)/.match("line").to_a[1..-1]
      * 043 正規表現にマッチした部分の前後の文字列を取り出す 73
        REobj = /RE/.match(org-str); str1 = REobj.pre_match; str2 = REobj.post_match;
*h 044 特定の文字を含む部分の長さを調べる 74
      * 045 文字列を段落に分ける 76
        String#.split(/REGEXP/);
        String#.to_a;
        #区切ごとの出力
        "some-str\n\nanother-str".each("\n\n"){|paragraph| p paragraph }
*h 046 文字列を行に分ける 78
        String#.to_a;
*h 047 文字列を単語に分ける 79
        String#.split(nil)
        String#.scan(/REGEXP/); String#.scan(/(?:RE|RE)/); #<---grouping は(?: ) をつかわないと.scanの挙動が保証されない
      * 048 正規表現で文字列を分割する 81
        require 'strscan';
      * 049 文字列を文字ごとに処理する 83
        String#.split(//);
        String#.scan(/./m){|el|   };
      * 050 文字列をバイトごとに処理する 84
        String#.unpack(C*)
        String#.each_byte{|el|   };
      * 052 文字列の一部を置換する 86
        DbyteStrReplaceOnce.sub(/RE,"ato"/); DbyteSstrReplaceMulti.gsub(/RE/,"ato")
        DbyteStrReplaceOnce.sub(/RE/){strAry-formula}; DbyteStrReplaceeMulti.gsub(/RE/){strAry-formula};
        1byteStr.tr("mae", "ato")
        str1[n,m] ="charAto"
*h 053 文字をエスケープする/エスケープを外す 88
      * 055 行末の改行文字を取り除く 92
        String#.chomp("\n")
      * 056 文字列の先頭・末尾から空白などを取り除く 94
        String#.strip
        str1.sub(/^[\s　]+/,"").sub(/^[\s　]+$/,"")
        ruby1.8String#.rstrip
        ruby1.8String#.lstrip
*h 057 タブと半角空白文字を変換する 96
        require 'nkf' ; NKF.nkf('-m0Z1 -W -w', new_filename)
*h 058 インデントを変更する 97
*h 059 ヒアドキュメントの本体をインデントして書く 99
        禁則：herecodumentはruby1.8.xでこった長文のデバッグがしづらいのでコマンドラインくみたてには使わない。
        悪い例
          １）
             heredoc = <<-`CODE`
               some-#{expandable} here
             CODE
           ２）
            result = IO.popen(sso_api_query, "r+").gets
            *ruby2 < だとrequire 'open3'とかある。

        よい例
          print << heredoc
          print << "#{heredoc-formula}"
          print << ('heredoc')  #<---no need to escape \

      * 060 文字列の末尾に文字列を追加する 100
        str1 << str2 << str3
        str1.concat "apend-str";
      * 061 文字列の一部を破壊的に削除する 102
        str1.delete "けしたい文字列"
        str1[from, to] = ""
      * 062 文字列の途中に破壊的に文字列を挿入する 104
        str1.sub(/^.{index}/){|s| s + "挿入文字列" }
      *  063 文字と文字コードを相互変換する 106
        "文字列".unpack("C*")
        # "C*"は符号なし8ビット整数。逆変換はpack
        "字"[0].chr
        (Obsolete@ ruby 2.5) 97.chr ?97
      * 064 文字列をn文字ずつに分割する 108
         some_string.scan(/.{1,n}/m)
      * 065 文字列を最大nバイトに切り詰める 109
      * 066 文字列を最大n文字に切り詰める 111
        str1stMatch = str1.slice(/\A.{0, n}/m)
*h 067 文字列を最大n桁に切り詰める 112
      * 068 文字列の一部を特定の文字で埋める 113
        str.gsub(/(.)/ "*" * $1/length)
      * 069 メッセージダイジェスト(MD5)を作成する 114
          #IMAP, SMTP-AUTH, APOP
          require 'digest/md5';
          Digest::MD5.digest("some_string * 1024)
          Digest::MD5.digest("some_string * 1024i + x)
          Digest::MD5.hexdigest("some_string * 1024)
      * 070 文字列が正規表現として正しいか調べる 116
        Regexp.compile(ptn)
        rescue RegexpError
      * 071 正規表現のメタ文字をエスケープする 117
        Regexp.quote(meta-char)
      * 072 文字列が複数の正規表現のすべてにマッチするか調べる 118
      * 073 正規表現を分割して記述する 120
        /(?:ptn1)|(?:ptn2)/
        /#{ptn1}|#{ptn2}/
        正規表現を文字列に変換するのは /re/.source
*h 074 正規表現集 122 #TODO: .
      * 075 文字列を段落ごとに整形する 124
        require 'nkf' ; NKF.nkf( "-f80 -m0", some_long_string) #<--- 80文字界行でMIMEデコードをOFFに折り返し整形する例
*h 076 いろいろなテキストフォーマットを解析する 125
      * 077 「,」で区切られたデータ（CSV）を処理する 128
        require 'csv' ; CSV.parse(   filename, delimiter_string){|line | p line.to_a } #<---readming
        require 'csv' ; CSV.generate(filename, delimiter_string){|lines| lines << some_array } #<---writing
        変換into Hash
           from CSV::Row   : row.to_hash.each{|k,v|puts  k ; puts v }

*h 078 XMLを解析する 130
        (1)  require 'rexml/document';require'iconv'
        (2)  require 'hpricot'
      * 079 YAMLを解析する 134
        #input
        str = << YAML
        ---
        key: value
        ...
        YAML
        require 'yaml'; YAML.load(str)
        #
        #cwoutputinput
        require 'yaml'; YAML.dump(hash)  #<--- ruby 18.8.xではデフォルト値つきのハッシュは出力できない

*h 080 HTMLを処理する 136
        require 'uri'; URI.extract(raw_html)  #<---url文字列だけ配列で取得
*h 081 単語を補完する 139
*h 082 有効なメールアドレスか調べる 141

    第3章 配列とハッシュ
        取得    ：  hash_a.slice( keys )
        除外取得：  hash_a.except( keys )
        差分取得：  hash_a.diff{hash_b},
        ハッシュ経由の特定キー名抽出　　RUN_KB_SONOTA
          obj.to_h.select { |k| k =~ /sonota/ }.values

          require 'bigdecimal'
          BigDecimal.new(nnn)

          case...when
          & ==|x|
          .any? --> 一個trueがあればtrue
          .any?(&:method) --> methodが一個trueがあればtrue
          .compact --> nil要素のぞいた要素数
          (hash, ary)  .any?  [boolean]
          (hash, ary)  .all?  [boolean]
          (hash,    )  .fetch(key) == ['keystr']
          (hash,    )  .fetch(key, defaultvalue) == ['keystr']
        deep_merge
        deep_symbolize_keys ; #全階層をto_sym
        キャストcasting:
          if some_obj.is_a?(Array)
            some_obj.even? ? Hash[*some_obj.flatten] : Hash[*(some_obj << nil).flatten]
          end
        複数hashの値をﾏｰｼﾞ
            def get_message_hash
          # @message_hash = IB.ndl_online_locales[ja_or_en]["message"]
          hash_ja = IB.ndl_online_locales['ja']["message"]
          hash_en = IB.ndl_online_locales['en']["message"]
          @message_hash = hash_ja.merge(hash_en){ |key, val_ja, val_en| "#{val_ja} (#{val_en})" }
        end

        .rand, .split, .split{x| 分割条件式},
        .each_slice(要素分割単位数).to_a　= Rails.AR#.in_groups_of(要素分割単位数),

      * 083 配列を作成する 144
        Array.new(m)  #m elements
        ary1 = [val1, val2, ... , val3]; ary1 = %w(srt1 str2 ... str3 ); ary1 = str1.split(/RE/)
      * 084 配列を複製する 146
        ary2 = Marshall.load(Marshall.dump(ary1)  #<---deep-copy, ary1変更でary2もかわらない
        ary2 = ary1.dup                #<---pointer-sharrow-copy, ary1変更でary2もかわる
      * 085 多次元配列を作成する 147
        collectiveary = [ [x,y,z], [a,b,c]]
        (0..n).map{Array.new(m)}  #<-----2Darray with N*M space
      * 086 配列やハッシュの全要素を順に処理する 148
        .each
      * 087 複数の配列を並行処理する 149  #making collective-array
        ruby1.8receiverAry.zip(senderAry) #マージできない要素はnilがはいる
        はいれつがばかでかければeach_with_indexでマージするしかない
      * 088 多次元配列をまたがってループする 151
        .eachのネスト
      * 089 配列の要素を取得する 152
        ary1[idx, kosuu];  e.g., ary1[-3, 2]
        ary1[range..range]
        ary1[range...range直前要素]
      * 090 配列の要素を変更する 154
        ary[要素数上限超過の飛び番号]　で動的拡張、歯抜け要素はnil埋め になる
      * 091 配列の要素を削除する 155
        ary1.delete("value")
        ary1.slice![idx, kosuu]
        ary1.delete_at(idx)
      * 092 配列の先頭・末尾に要素を追加する 156
        ary1.unshift( insertion-object)
        ary1.shift( appendix-object);  ary1 << appendix-object
      * 093 配列の先頭・末尾の要素を取り除く 157
        ary1.shift
        ary1.pop
      * 094 配列の要素を置換する 158
        ary1.map!{|el| el.METHOD }
        ary1.fill(value, start-index, end-index )
        ary1.replace(ary2) #ary2の内容でおきかわる
      * 095 配列の要素をランダムに取得する 159
        n = ary[rand(ary.length)]
*h 096 配列の要素をシャッフルする 160
      * 097 配列の要素数を調べる 161
        ary1.length
      * 098 配列の要素の出現回数を調べる 162
        count=Hash.new; ary1.each{|el| count[el] += 1
      * 099 配列から複数の要素を一度に取得する 163
        Array#.values_at(n, m, o)
      * 100 配列のインデックスと要素のペアを取得する 164
        ary1.each_with_index{|el| ...}
      * 101 同じ値で配列の要素を埋める 165
        ary1.fill(value)
        ary1.new; ary1.new(kosuu, value);
      * 102 配列から重複する要素を取り除く 166
        ary1.uniq
      * 103 配列から条件を満たす要素を取得する 167
        Array#.find{|el|  cond }
        Array#.select{|el|  cond }
      * 104 配列の要素を検索する 168
        ary1.index(value)         #ary1.include?(strPtn)
      * 105 2つの配列を比較する 169
        if ary1 == ary2
      * 106 2つの配列に共通する要素を調べる 170
        ary1 & ary2
      * 107 2つの配列の差を取る 171
        ary1 - ary2
      * 108 配列を連結する 172
        distinctive joint  =>  ary1 | ary2;
        simple joint     =>  ary1 + ary2;   ary1.concat(ary2)
      * 109 配列の要素の順序を逆転する 173
        ary.reverse
      * 110 一定範囲の整数を要素とする配列を作成する 174
        n..m.to_a
      * 111 配列を（「,」つきで）連結して文字列にする 175
        ary1.join(",")
        require 'csv';CSV.generate_line(ary1)
      * 112 バイナリサーチを行う 176  #<= DL from RAA
        require 'bsearch'; obj1.bsearch_first|.bsearch_last{|el| el <=> cond1 }
*h 113 ハッシュのキーになるクラスを作る 177
      * 114 ハッシュに要素を追加する 178
        hash1 = {}
          hash1["x"] = y
          hash1 = { "x" => y, "x1" => y1, ... }
      * 115 ハッシュ内にキーが存在するか調べる 179
        hash1.key? ("x")
      * 116 ハッシュの要素を削除する 180
        hash1.delete("x")
        filteredHash = hash1.reject!{ |key, value| key/value-condition }
        hash1.reject!{ |key, value| key/value-condition }
        hash1.clear  #<= all
        snippet_non_blank_and_mapped_array: 空白値を除去して変換
          some_array = some_array.uniq.map(&:to_s).reject(&:empty?).map!{|i| SomeObj.some_method(i)}

      * 117 ハッシュの内容を表示する 181
        hash1.inspect  #<= into strngs
        hash1.each{ |key, value|
          command "#{key} #{value}"
          command key value
        }
#* 118 ハッシュの要素を挿入した順に取り出す 182
        require "pseudohash"; hash1["x", true] = y  #<= DL from RAA
#      * 124 デフォルト値を設定する 191
        ary1 = Array.new(要素数){|i| デフォルト値}
        hash1 = Hash.new{|h, key| h[key] = デフォルト値}
      * 119 1つのキーに複数の値が対応するハッシュを作る 185
        ruby1.8hash1 = Hash.new{|hash1, key| hash1[key] = []};
        ruby1.8hash1["x"] << y; ruby1.8hash1["x"] << y1  ...
*h 120 ハッシュのキーと値を入れ替える 186
        .invert
      * 122 配列やハッシュやActiveRecordをソートする  = sort_by, sort 187 snippet_sort
        sortedAry =  ary1.sort
        sortedAry =  ary1.sort{|a,b| a.to_f <=> b.to_f } #<= convert into float
        #以下はキー順ソート、値順ソート、キーで第一値で第二ソートする書き方
        sortedHash =  Hash.sort_by{|key,value| key}
        sortedHash =  Hash.sort_by{|key,value| value}
#        sortedHash =  Hash.sort_by{|key,value| [key,value]}
        # Rails 別のname配列出現順でソート
          aryX = MemberCountry.pluck(:name)[5..-1]
            collection = collection.sort_by{|x| aryX.index x.value }# 配列内での値出現index順
        #Rails 別テーブルでORMソート
          scope :ordered, -> { includes(:availabilities).order('availabilities.price') }


      * 122 ハッシュをマージする 189
        hash1.update(hash2)
#        #値の大きい方を勇戦してマージするブロック月記述例
        hash1.merge(hash2){|key, val1, val2| val1 > val2 ? val1 : val2 }
#      * 123 2つのハッシュの両方にあるキー/一方にしかないキーを見つける 190
        #shared keys
        hash1.keys & hash2.keys
        #different keys
        (hash1.keys | hash2.keys) - (hash1.keys & hash2.keys)
*h 126 コレクションのような性質をもつクラスを作る 193
        配列やハッシュを継承または移譲する
      * 127 スタックやキューを使う 194
        aryOrHash.push; aryOrHash.pop    #<= removing-get from earlier element
        aryOrHash.push; aryOrHash.shift    #<= removing-get from last element

    第4章 ファイルとディレクトリ
      * 128 ファイル名を構成要素に分割する 198
        File.split(str);  # == [File.dirname, File.basename],  <----> File.join
#        File.dirname(str);
        File.basename(str)
#        File.basename(str, ".拡張子") #拡張子以外を返す
        File.extname(str)
        Pathname(path).sub_ext  [ruby1.9]拡張子を与えられた文字列で置き換えた Pathname オブジェクト返します。eg) export_file_name.sub_ext(Dnp::Settings.extension.plane_file)
      * 129 相対パスから絶対パスを求める 200
        File.expand_path(str) #~, ./ ../ など MSwinでは/C://みたくドライブ文字つきで展開される
        eg) Dir.glob(File.expand_path('../histories/*id.rb', __FILE__)).each { |file| require file }
*h 130 パス名がワイルドカードと正規表現の中間的パターンにマッチするか調べる 201
#        File.fnmatch("半正規表現wildcard", "ファイル名" )
*h 131 ディレクトリとファイルの一覧を取得する 203
        ** は階層無視ワイルドカード
        eg) Dir.glob("**/[ch]")  #<---cソースを再帰的に
      * 132 現在のディレクトリ名を取得する 205
        dirname=Dir.pwd
      * 133 現在のディレクトリを変更する 206
        dirname=Dir.chdir("dirName")
      * 134 実行しているスクリプト自身のパスを求める 207
        dirname=File.expand_path(__FILE__)
      * 135 ファイル名を変更する 208
        dirname=File.rename("old","new")
        new_filename = File.join(File.dirname(file), File.basename(file).sub(/^\d+ +/, ''))
      * 136 ファイルをコピーする 209
        # * 146 ディレクトリを再帰的にコピーするばあいは.cp_r メソッド；:preserveは属性保持、:modeはパーミッション指定
        #ruby 1.8.x
        mkdir tgtdir ;require 'fileutils' ;FileUtils.cp("org.file", "copied.file", :preserve=>true)
        mkdir tgtdir ;require 'fileutils' ;FileUtils.cp(["1.file","2.file"..."n.file"] "tgtdir", :preserve=>true)
        mkdir tgtdir ;require 'fileutils' ;FileUtils.cp(Dir.glob(".txt"), "tgtdir", :preserve=>true)
                      require 'fileutils' ;FileUtils.install("org.file", "/dir/path", :mode=>0644)
      * 137 ファイルを削除する 211
        require'fileutils';FileUtils.rm(file or ary_file,:force=true)
      * 138 ファイルが読み込み・書き込み可能か調べる 212
        File.readable_real?(path)
        File.writable_real?(path)
        File.executable_real?(path)
        File.owned?(path) #<--- in case of windows, available on NTFS only
        File.grpowned?(path)
      * 139 ファイルの存在を調べる/種類を判定する 214
        File.size?(path)  # nil in case of 0 === File.zero?
        File.file?(path) # boolean
        File.directory?(path) # boolean
        File.exist?(path) # boolean 先述 .file? directory?は存在しなければfalseになる
        File.symlink?(path) # boolean
        File.socket?(path) # boolean
        File.pipe?(path) # boolean
        File.blockdev?(path) # boolean
        File.chardev?(path) # boolean
        File.lstat(path) # symlink情報
*h 140 ファイルの属性を取得する 216
        File.stat(path).(dev|ino|mode|nlink|uid|gid|rdev|rdev_major|rdev_minor|size|blksize|blocks|atime|ntime|ctime)
      * 141 ファイルの属性を変更する 218
        File.utaime(Time型アクセス時刻, Time型変更時刻, path1, path2 ...)
        require 'fileutils'; FileUtils.chmod(0644, [file1, file2 ...])
        require 'etc';Etc.getpwnam(uid).uid,  File.chown(Etc.getpwnam(uid).gid, file1, file2, ...)
        # Etc.getgrpnam(gid)はgid--->uid変換;
      * 142 リンクを作成する 220
        File.symlink(target_path, sym_link_path)
        File.link(target_path, hard_link_path)
        File.readlink(link_path)
        File.lstat(link_path)
*h 143 2つのファイルが同じか調べる 222
        require 'fileutils'; FileUtils.cmp(file1, file2) #<---boolean
      * 144 ディレクトリを作成する 224
        #ruby1.8
        require'fileutils';FileUtils.mkdir_p("dir" or ary_dirname   ,:mode=>0644)
        #ruby1.6
        require'ftools';File.makedirs("dir")
        # OR, go native
        Dir.mkdir("dir_name", 0644)
      * 145 ディレクトリ内のすべてのファイルを再帰的に処理する 225
        # 再帰処理ラッパー
        require 'common'
        all_subfolders_under(@option[:from]).each do |folder|
          p "------------ folder #{folder} を処理中・・・ -----------"
          process_a_folder folder
          p "------------ folder #{folder} を処理しました -----------"
          break if Dir.glob("*.iso").none?
          puts "\n ISOファイル一覧は以下のとおり----------------------"
          puts `ls -alt ./*iso `
        end
        # OR, require 'find'
      * 147 ディレクトリを削除する 227
        require 'fileutils'; FileUtils.rm_r([file1, file2 ...])
        require 'fileutils'; FileUtils.rm_r(Dir.glob "pattern*")
        #強制は[files], :force => true にする
      * 148 ファイル操作を事前に確認する 228
        :noop => true, verbose => true  #<---noopはdummy&skip, verboseは出力
*h 149 名前がぶつからない新しいファイルを作成する 229

    第5章 入出力
      * 150 (~展開なしのパスで)ファイルを開く 232
        File.open("filename"){|f| ...... }
        f=File.open("filename"); f.each{|line| ...... }
        # OR, specify line delimiter as below;
        f=File.open("filename"); f.each("。"){|line| ...... }
      * 152 ファイルの内容を読み込む 236
        #(Ruby 1.8 latee<)
          File.read("filename", bytesTorRead, OffsetFromFileTop ){|f| ...... }
        #(all version of Ruby
          #改行コード無変換のバイナリモード
          File.open("filename"){|f| f.binmode;f.read}  <---read all
          File.open("filename"){|f| f.binmode;f.read(bytesToReaad)}
      * 151 ファイルを行/delimiter単位で処理する 234
        f=File.readlines("filename").each{|line| line.chomp!;...... }
        f=File.open("filename"); f.each(strDelimiter){|someFlagment| ...... }
        File.open("filename"){|f|
          while line=f.gets
            ....
          end
        }
        File.open("filename"){|f|
          while smeFlagment=f.gets(strDelimiter)
            ....
          end
        }
      * 153 新しいファイルを作成する 238 /
        #ブロックわたすと自動でFile.close
        flags= %w[r w w+ a a+ b] #readonly, writeonly, read-write, append, read-and-append, binmode 改行コード無変換のバイナリモード
        File.open("filename", flags, 0644){|f| f.puts(str)}
        File.open("filename", "[rwab]+?"){|f| f.puts(str)}
      * 154 ファイルの最後にデータを追加する 240
        File.open("filename", "[rwa]+?b"){|f| f.puts "str" } #<---waが基本
*h 155 ワンライナでファイルを更新する 241
        -p print
        -i別名　別名つきでバックアップ
        -a array化して$Fに代入
        -F 区切文字指定
        -l lineをよしなに整形入出力。\nをとったり自動改行したり
*h 156 出力操作とファイルの更新を同期させる 243
      $stdout.sync = true
      * 157 ファイルの行数を数える 245
        File.open("filename", "[rwa]+?b"){|f| f.lineno }
        or
        File.read("in.txt").count #<--- in case of ruby1.6, File.open("filename", "[rwa]+?b"){|f| f.read }.count
*h 158 行単位にファイルを末尾から処理する 246
        f=File.readlines("filename").reverse_each{|line| line.処理 }
*h 159 成長するファイルをtailコマンドみたく追いかけながら読む 249
        File.seek(0, IO::SEEK_END)
        File.seek(0, IO::SEEK_CUR)
      * 160 テンポラリファイルを作成する 250
        require 'tempfile'; temp = Tempfile.new(path) ; temp.puts "something"; temp.close
        #garbage collectionで自動削除されるが、temp.openで再度オープンできる
        #garbage collectionで自動削除されるが、明示的削除したければ temp.close(true)
      * 161 ファイルをロックする(ロック最中に再度ロックしようとするとdead lock) 251
        mode = File::LOCK_EX #exclusive
        mode = File::LOCK_SH #shared 別プロセスからもロック可能
        mode = File::LOCK_NB #no_blocking. dead lock回避方法
        mode = File::LOCK_UN #unlockを明示的に指定。通常file.closeで自動unlock
        File.open("filename"){|f| f.flock(mode) }
*h 162 ファイルを16進ダンプする 253
*h 163 ファイルに1行挿入する 254
      * 164 ファイルに改行コード無変換のバイナリモードで書き込む 256#ブロックわたすと自動でFile.close
        File.open("filename", "[rwa]+?b"){|f| f.binmode;f.write(str)}
*a 165 固定長レコードを処理する 257
      * 166 ファイルのサイズを切り詰める 259
        File.trancate(bytesize)
*h 167 ファイルの先頭のn行を削除する 260 ---> n行以降をtmpfileにwriteしてrename-swap
*h 168 ファイルの末尾のn行を削除する 261
*h 169 標準入出力をファイルにつなぎ換える 263
*a 170 IOオブジェクトを複製する 264
      * 171 printfで出力を整形する 266
        %d %o %b %x #<---整数　バインド変数
        %f %e %g %x #<---float バインド変数
        %s          #<---文字列  バインド変数
        %p          #<---Object#inspect  バインド変数
        "%s %s" % %w(foo bar) # => "foo bar" をsprintf,つまり文字列整形だけして返す

    第6章 数値
*h 172 数値をフォーマットする 270

      * 173 ビット演算を行う 273
        ビット表現は 0b11111111 みたく0bプレフィクス
        b = 0b11110000 b2= 0b******** のとき、
        b[i] は最下位ビットを0としてそのビットを取得。上記例では b[0]からb[7]まで全部１
        ~b, b & b2, b | b2, b ^ b2, b >> N, b << Nはそれぞれ ビットの
        反転、積、   和、     XOR, Nビット0詰め左シフト、Nビット0詰め右シフト、をあらわす
        def pb(i)
          printf("%08b\n", i & 0b11111111)
        end
      * 174 2進，8進，10進，16進の各表現を相互に変換する 274
        文字列→数値
          方法1: Integer("0b***"), Integer("0***"), Integer("0x***") は二進数8進数16進数の変換
          方法2: "0b***".to_i(2),"0***".to_i(8),"0x***".to_i(16)     は二進数8進数16進数の変換
        数値→文字列
          "%d" % 数,"%b" % 数,"%c" % 数,"%x" % 数 は 10, 2, 8, 16進数の文字列化
      * 175 数値を3桁ずつ「，」で区切る 275
        def commify(numstr)
          int, frac = numstr.split('.')
          int = int.gsub(/(\d)(?=\d{3}+$)/, '\\1,\\2') #?=は先読み取得対象、?>はマッチ範囲最大化の「強欲マッチ」
          int << '.' << frac if frac
          return int
        end
      * 177 最大値・最小値を求める 277
        [].max | [].min #文字列は辞書順でmax/minを返す
      * 178 数値の総和や反復処理結果を求める 278
        [*1..5].inject(0){|result, i| result + i} #0は初期値
        [*1..5].inject(0){|result, i| result * i} #0は初期値
      * 179 絶対値を求める 279
        数.abs
        複素数最寄り素数の絶対値：require'complex'#<--- ruby 1.8
        Complex(3.0,4.0).abs #=> 5.0
      * 180 割り算の余りを求める 280
        %または　数.divmod(数)[1]
        10 % -3.5 #=> -0.5
        10.remainder -3.5 #=> 3 レシーバーの符号にあわせて計算
        有理数：require'rational' #<---ruby 1.8
        10.quo(3) #=>[10,3] quotient
      * 181 べき乗を求める 282
        2 ** 4 #=>16
      * 182 最大公約数i(Gretest Common Divisor)と最小公倍数(Least Common Multiple)を求める 283
        require'rational' #<---ruby 1.8
        数A.gcd 数B  ;  数A.lcm 数B
      * 183 平方根を求める 284
        Math.sqrt 10  または　10 ** 0.5
      * 184 三角関数を計算する 285
        Math.sin 数 # .cos .tan .asin .acos .atan もある
        module Math
          def deg2rad(degree)
            degree / ( 360.0 / (PI*2))
          end
          module_function :deg2rad
        end
        Math.sin(Math.deg2rad(30)) #=> 0.5
*h 185 直交座標を極座標に変換する 286
      * 186 対数計算を行う 287
        Math.log() #自然対数
        Math::E #自然対数の底
        Math.log10() #常用対数
        Math.exp() #指数関数
        Math::E ** Math.log(10) #=> 10.0
        Math.exp(Math.log(10)) #=> 10.0
        Math.log10(1000) #=> 3.0
      * 187 浮動小数点数を丸める 288
        数.(round|truncate|ceil|floor) #それぞれ、四捨五入、切り捨て、正負上寄せ、正負下寄せ　のmethod
        class Numeric
          def round_n(nth)
            num = self * (10 ** (-nth))
            num.round * (10 ** nth)
          end
        end
*h 188 浮動小数点数を比較する 290
*h 189 乱数を得る 291
        rend(n) #0~nの整数、省略ならば0~1までのフロート
        srand   #初期値設定
*h 190 行列を使う 293
        require 'matrix'
*h 191 複素数を使う 295
        require'complex'#<--- ruby 1.8
        Comple.(abs|polar|image|conungate)
*h 192 有理数を使う 296
        有理数：require'rational' #<---ruby 1.8
        Rational(1, 5)
        数.(to_r|quo)

    第7章 日付と時刻
        Time.now**.strftime('%Y-%m-%d_%H:%M:%S')**
        .yesterday, .tomorrow, .ago, .since, .last_***, .gininning_of_***, , .local,
        *rails 1.2互換にするときは。.to_time <=> to_datetime
        時計上の時間で検索したい場合は
          Time.parse("2012-09-20 22:35").gmtime
          といったようにやる。 MySQL上での時間データは、時差を加味しない時間が保存されているため、gmtimeで調整する/

      * 193 現在の日時を調べる 298
        Time.now.[getutc|localtime]
        Date.today.to_s
        DateTime.now.to_s
      * 194 日時から月や曜日を取り出す 300
        Time.now.[year|month|day|hour|min|sec|wday|yday|dst?|utc_offset|zone|usec]
      * 195 日時とエポック秒(=19700101 0:00:00)を相互に変換する 301
        Time.now.to_i / .to_f <---> Time.at(epoc-seconds)
      * 196 2つの日時の差を求める 303
        Time.at(nnnnn1)- Time.at(nnnnn2)
      * 197 日時をフォーマットする 304
        require"date";DateTime.[now].strftime("%[AaBcdHIjMmpSUWwXxYyZz%]")
          フォーマット	説明
          %A	曜日の名称(Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday)
          %a	曜日の省略名(Sun, Mon, Tue, Wed, Thu, Fri, Sat)
          %B	月の名称(January, February, March, April, May, June, July, August, September, October, November, December)
          %b	月の省略名(Jan, Feb, Mar, Aprm May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
          %c	日付と時刻
          %d	日(01-31)
          %H	24時間制の時(00-23)
          %I	12時間制の時(01-12)
          %j	年中の通算日(001-366)
          %M	分(00-59)
          %m	月を表す数字(01-12)
          %p	午前または午後(AM,PM)
          %S	秒(00-60) (60はうるう秒)
          %U	週を表す数。最初の日曜日が第1週の始まり(00-53)
          %W	週を表す数。最初の月曜日が第1週の始まり(00-53)
          %w	曜日を表す数。日曜日が0(0-6)
          %X	時刻
          %x	日付
          %Y	西暦を表す数
          %y	西暦の下2桁(00-99)
          %Z	タイムゾーン
          %%	パーセント文字

      * 198 文字列を日時に変換する 306
        require"time";Time.parse("str1")
        require"date";Date.parse("str1")
        require"date";DateTime.parse("str1")
      * 199 1月1日からの通算日を求める 307
        Time.now.yday   /  (Time.now.yday-1)/7
        require"date";DateTime.[now].strftime("%U").to_i)
      * 200 うるう年を判定する 308
        require"date";Date.new(2010).leap?  <----reutrns true/false
      * 201 月末の日付を求める 309
        当月  require"date";Date.new(year, month, -nOffSetNum).day
        前月  require"date";((Date.new(year, month, 1) >> 1) -1).day # Date#>>で一ヶ月ずらしてー１
* 202 休日を判定する 310
        require"date"; require"date/holiday"; Date.new(2010, 12,25 ).national_holiday?  <----reutrns true/false
        #download "date2(date/holiday) 3rd party lib
* 203 「今月の第3月曜日」の日付を求める 311
        require"date"; require"date/holiday"; Date.nth_kday(yearObj,monthObj, 週番号,星期幾）
        #download "date2(date/holiday) 3rd party lib

    第8章 環境とのかかわり
      * 204 Rubyスクリプトをコマンドにする 314
        #chmodで実行可能にして次のshbang
        #!/usr/bin/env ruby
        #!/usr/absolute_path/ruby -Ke  #<---一個限定でオプション指定可能

        #!/bin/sh ruby
        exec ruby -S -x ${@ + "$@"}
        #!ruby
          #以下にスクリプト本体

        #cygwin環境 #chmodで実行可能にして次のshbang
          #!ruby

        #Windows-native
          #関連付けでrubyを起動して、なおかつ> >> |をつかいたいばあいはレジストリ編集：
            # cf: support.microsoft.com/efault.aspx?scid=kb;en-us;321788
          # rubyのインタプリターとファイルを1パックに配布するソフトは加藤勇也さんのExerbがよい

        # Winows-batch作成
          @echo off
          if "%OS" == "Windows_NT" goto WinNT
          "C:\Program Files\ruby\bin\ruby" -x "C:/some/script.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
          goto end_of_ruby
          :WinNT
          "C:\Program Files\ruby\bin\ruby" -x "C:/some/script.bat" %*
          goto end_of_ruby
          #!ruby
            #以下にスクリプト本体
          __END__
          :end_of_ruby

      * 205 コマンドにしたRubyスクリプトを一時的にオプションつきで実行する 317
        UNIX: $ env RUBYOPt=-d scriptname
        WIN:  $ set RUBYOPt=-d scriptname
      * 206 コマンドライン引数を得る 319
        WIN: rubyは内部的に\を/におきかえる。引数を””でくくることで、? *のグロブ展開がされる。引数両端が''ではダメ。
      * 207 コマンドラインオプションを解析する 321
      * 208 環境変数にアクセスする 324
        ENV
      * 209 コマンドとしてもライブラリとしても使えるようにする 325
        class XXXclass
          #etc
        end
        if __FILE__ == $0
          #statement using XXXclass
        end
      * 210 Rubyのライブラリローダを制御する 326
        $ruyb -I./some/path
        UNIX: $ env RUBYLIB=***:***:***
        WIN:  $ set RUBYLIB=***;***;***
        irb> $LOAD_PATH  #<--- = $:
        irb> $"  #<--- = loaded libralies

      *h 211 Rubyスクリプトをデバッグする 327
           ruby -r debug some_path.rb
           b fullpath.rb:linenumber #<--- break
      * 212 ユーザやグループに関する情報を得る 331
        require'etc';Etc.get*** : [pwuid|name|passwd|uid|gid|dir|shell|grnam|grgid|]
      * 213 ユーザID・グループIDを切り替える 334
        require 'etc';
        #rootから一般ユーザーに一時的にきりかえる
        def switch_euid(user)
          uid = Process.euid; Process.euid = Etc.getpwnam(user).pid; yield
        ensure
          Process.euid = uid
        end
        switch_euid("test"){ shori }

        #rootから一般ユーザーに完全にきりかえる
        def switch_uid(user)
          uid = Process.uid; Process::UID.change_privilege(uid) ; yield
        end
        switch_uid("test")
        #これ以降はtestユーザーに切り替わって処理

        #gid uid全部きりかえ >= ruby 1.8
        def switch_user(user)
          fork{
            pw = Etc.getpwnam(user); Process.initroups(pw.gid) ;
            Process::GID.change_privilege(pw.gid) ; Process::UID.change_privilege(pw.uid) ;
            #確認はProcess.groups
          }
        end
        switch_user("test"){ shori }

      * 214 Windowsレジストリにアクセスする 337
        require 'win32/registry'
        Win32::Registry::HKEY_CURRENT_USER.open('some\parent\of\key', Win32::Registry::KEY_WRITE){|reg|
          reg['key'] = some_value
        end
        #上の Win32::Registry::KEY_WRITEをはぶくと、取得モードになる
    * 215 システムのライブラリ関数を呼ぶ 339
        WIN: require 'Win32API'; Win32API.new(i'user32', 'MessageBoxA', %w(P P P I), "I").call('0', 'message', 'caption', 0)
        # P=pointer, I=integer, V=void above
        UNIX: require 'dl'; 'dl/import';
        #例）
        module Xlib
          extend Dl::Importable
          dlload 'libX11.so'
          extern "Display* XopenDisplay(char*)"
        end
        Xlib.methods(true).detect{|name| /xopen/i =~ name}

    * 222 Windowsアプリケーションを操る 353
      #Windows native path取得(Win32APIライブラリーで取得する面倒な方法も有る）
    　`cygpath -w #{path_before_conversion}`
  第9章 プロセスとプロセス間通信
    * 216 スクリプトを一時的に停止する 344
      sleep(n.n秒)
      sleep #<---永久停止
    * 217 スクリプトの処理時間を計測する / ベンチマーク 345
      #ruby > 1.8
      require 'bnchmark'; Benchmark.bm(見出しの長さの整数値) {|x|
        x.report("caption"){
          処理
        }
      }
      #ruby < 1.8
      times0 = Process.times
      10000.times{ 処理 }
      times1 = Process.times
      [times1.utime - times0.utime, times1.stime - times0.stime]
      #utime = user time, stime = sytem call time, ctime = child process time summary , cstime = child process system call time summary
* 218 コマンドを起動する 347
      `command`                  :まとめて取得
      open("| command" ){|f| f.gets }   :STDOUTすこしづづ処理
      require 'open3'; stdin, stdout, stderr = Open3.popen3("command"){|stdin, stdout, stderr|
        print stderr.read
        print stdout.read
        # 不要なハンドラは明示的にcloseできる：stdini.close; stdout.close; stderr.close
      }

      open("| command", "w" ){|f| f.puts }   :STDINすこしづづ処理
        #open("| command") {|msg| msg.gets } #list = open('|ls /home/hogehoge/') {|msg| msg.gets}
        #注意しなくてはいけないのがopenする際に、ブロックを与えないとバックグラウンドで実行したプロセスへのpipeがクローズされないまま、ゾンビになってしまうのです。

    * 219 プロセスをフォークする 349
      child_pid = fork{ exec('usr/bin/ruby') }
      exit_pid, status = *Process.waitpid2(child_pid) #ruby 1.6 では status >> 8 すると終了コードを取得でる
*h 220 シグナルハンドラを設定する 350
*h 221 デーモンになる 351
    * 223 ローカルホスト名を得る 355
      require 'socket'; Socket.gethostname
    * 224 ホスト名とIPアドレスを変換する 356
      require 'socket'
      Socket.getaddrinfo(hostname, nil, Socket::AF_UNSPEC)[0][3]
      Socket.getnameinfo([Socket::AF_UNSPEC, nil, ipaddress)[0]
      # IPv4指定ならばAF_inet, IPv6指定ならばAF_INET6, hostname未設定ならばIPアドレスが戻る
    * 225 TCPクライアントを作る 357
      require 'socket'; TCPSocket.open('localhost', 80){|f| f.print 'GET / HTTP/1.0\r\n\r\n'
        print f.read
      }

*h 226 TCPサーバを作る 358
    * 227 HTTPクライアントを作る 361 (NOTE: Windows版ではIOとスレッドの併用でフリーズするらしい)
      require 'net/http'
      Net::HTTP.version_1_2
      httpclass = Net::HTTP
      # OR
      httpclass = Net::HTTP.Proxy("https?://proxy_server_fqdn", port_number)

      httpclass.start('news2.2ch.net', 80) {|http|
        response = http.get('/newsplus/kako/1037/10377/1037776113.html')
        puts response.body
      }
    * 228 別プロセスのRubyオブジェクトにアクセスする 363
      # NOTE: rubyバージョン同一、garbage-collectorでのオブジェクト消失に注意、クラサバ間でオブジェクトの型が異なりうる
      # server-process
      require 'drb'; exposed_obj = %w[drb server]
      Drb.start_service('druby://localhost:8787', exposed_obj);Drb.thread.join
      # client-process
      require 'drb'; Drb.start_service; exposed_obj = DrbObject.new_with_uri('druby://localhost:8787')
      exposed_obj.each{i| 処理 }
      #ref:  dRubyによる分散・Webプログラミング、オーム社

  第10章 CGI
    * 229 フォームから入力された値を取り出す 366
    * 230 クエリ文字列を取り出す 368
    * 231 セッションを使用する 369
    *** 232 クッキーを処理する 371**
    * 233 メタ変数を参照する 373
      require'cgi'; metvaar=CGI.new.referrer
    * 234 HTTPヘッダを出力する 374
    * 235 URLをエンコードする/デコードする 375
      require'cgi'
      CGI.escape(str)
      CGI.unescape(str)
      cf: "str".html_safe === raw "str"
    * 236 HTMLをエスケープする/エスケープを外す 376
      require'cgi';CGI.escapeHTML(str)
      require'cgi';CGI.unescapeHTML(str)
    * 237 汚染モード（taintモード）を使う 378
    * 238 クロスサイトスクリプティングを防ぐ 380
    * 239 HTMLにRubyのスクリプトを埋め込む 382
    * 240 ファイルをアップロードする 383
  第11章 オブジェクト
* 241 オブジェクトが同じか(=object ID the same ?)調べる 通常は代入で同一オブジェクトの参照点ができる 386
      obj1 == obj2;
      puts obj1.object_id
      obj1.equal?(obj2)
    * 242 オブジェクトを複製する 388  #sharrow copy
      object.dup;
      objet.clone;  #<---including 特異メソッド汚染フラグfrozenまでsharrowコピーする。
* 243 オブジェクトのクラスを調べる 389
      OBJ.class; OBJ.class.ansestors
    * 244 オブジェクトを文字列に変換する 391
      .to_s
    * 245 オブジェクトを数値に変換する 392
      .to_i
      .to_f
    * 246 オブジェクトを配列に変換する 394
      .to_a
    * 247 オブジェクトをファイルに保存する 395 #IO, Socket, pipeオブジェクトは復元できない
      Marshal.dump(object) #<---ruby version依存の可能性あり。しかもバイナリー保存
      #ファイルの共有とmutex
      require 'pstore'; db = PStore.new('shared-file-name'); db.transaction {
        db["key"] = some_object
      }

      # .to_yaml <---> YAML.load($stdin) でASCII形式保存リストアする方法も有る
      # AMartial.dump(obj) <---> AMartial.load($stdin)          する方法も有る

    * 248 多重継承する 398
      module M1
        def a end
      end
      module M2
        def a end
      end
      class C # M1とM2の両方の属性を継承させる
        include M1
        include M2
      end
    * 249 メソッドを委譲する 399
      forwardable  #個別に委譲する
      delegate   #全部に委譲する
      # 方法1：引数を* と&で転送する
      class SomeWrapper
        def pop(*args, &block) @output.pop(*args, &block) end
      end
      # 方法2A：forwardable ライブラリーをつかう
      require 'forwardable'
      class SomeWrapper
        def initialize @output = [] end
        extend Forwardable
        def_delegator @output, :pop, :pop_new_name
      end
      # 方法2B：forwardable ライブラリーをつかう
      require 'forwardable'
      class SomeWrapper
        DelegateClass(Array)
        def initialize super [] end
      end
    * 250 ブロックを委譲する 401
      &block うけわたし
*h 251 StringやArrayとして扱えるクラスを作る 402
    * 252 無名関数を使う 405
      noname-func = lambda{|arg1| ... }
      noname-func.call(arg1)

      &:*** = Proc.new{|x| x.***}
      .to_proc.call(***) = Proc.new{|x| x.send(***) }

    * 253 メソッドを擬似オーバーロードoverloadする 406
          #ラッパーオブジェクトからの文字列に対応できないので、まずpolymorphism, respond_to? で対応すべき
          def some_method(args)
            case arg #case1文は内部で===演算子で比較するので.class は不要
            when  String
            when  Array
            when  IO
            else
              rais ArgumentError, "some_message"
            end
          end
    * 254 キーワード引数(== Hash引数）を使う 408
      calling(:symbol1 => "xxx", ...:symbolN => "yyy" )
    * 255 モジュール関数を定義する 409 snippet_module_methodize
      module_function :method_name

    * 257 同じインスタンス変数をクラスごとにプライベートにするのは不可能 411
    * 258 オブジェクトやクラスにメソッドが存在するか調べる 413
     obj.responde_to?(:sym, [boolean] #第二引数にtrue指定だとprivateなメソッドの確認ができる
     klass.method_defined?
     defined?
    * 259 オブジェクトやクラスに定義されているメソッドのリストを得る 415
      obj.(|public_|private_|protected_|singleton_)methods
      klass.(public_instance_|private_instance|protected_instance_)methods
      #第一引数にtrueをわたさないとダメかも。バージョン独立にならない
    * 256 クラスメソッドの別名を定義する 410
    * 017 aliasとundef(メソッド無効化) 31
      alias method-newname medhod-oldname; undef forbidden-method-name
    * 260 互換性を保ったままメソッド名を変える 417
          alias old_method_name new_method_name
    * 261 互換性を保ったまま引数の個数を変える 419
          def some_method(*args)
            case args.length
            when
            else
              rais ArgumentError, "some_message"
            end
          end
    * 262 互換性を保ったままブロックをつける/外す 421
          if block_given?
          else
          end
    * 263 互換性を保ったままクラス名を変える 422
          NewClass = CurentClass
          #ruby内部ではクラス名は一種の定数
    * 264 互換性を保ったままライブラリ名を変える 423
          warn "obsoleted because its now ruby 1.8 later"
          #ruby1.6 :  warn == $stderr.puts
    * 265 新しいRubyのメソッドを古いRubyでも使う 424
      (1) polyfill RAA ライブラリーshimi-ruby16_18をつかう
          作者 武者晶紀 Akinori Musha
      (2) 未定義ならばクラス拡張　
      　　unless Array.method_defined? :values_at
            class Array
              def values_at(*args)
                keys.map{|k| self[k] }
              end
            end
          end
    * 266 ファイルをRubyスクリプトとしてロードする 426
      load '絶対パス' #早退パスだと ＄LOAD_PATHからさがします
        eg) load (File.dirname(@rails_template) + '/recipes/rails_stripe_checkout.rb')
      SomeClass.new.instance_eval(File.read 'path'))とすると、SomeClassで読んだファイルを実行できる。
    * 267 文字列をRubyスクリプトとして実行する 427
      eval #<--- String#dump , .marshall のオブジェクト化
      # 意図をはっきりさせたければ instance_variables(_get|_set), constants, const_(get|set), define_method, send i をつかうべき
        o local_variables(局所変数名）
        o global_variables（グローバル変数名）
        #Rails below?;
          o Object#instance_variables（インスタンス変数名）
          o Module#class_variables（モジュール（クラス）変数名）
          o Module#constants（そのモジュール（クラス）の定数名）
        o Module.constants（そのモジュール（クラス）とインクルード（上位）を含む（アクセスできる）定数名）
    * 268 スクリプトファイル名・行番号をすり替える 428
      #シングルクオート記号をつかって全部のエスケープを無効にするのが要点
      class MyClass
        module_eval(<<-'EOS', 'another_file_name.rb', すり替えたい開始行番号)
          def some_method
            処理
          end
        EOS
      end
*h  付録
    * A01 Web上のリソース 430
    * A02 コマンドラインオプション 431
    * A03 Rubyが参照する環境変数 434
    * A04 Ruby標準クラスライブラリ 435
    * A05 printfフォーマット文字列 438
    * A06 packテンプレート文字列 441



#Rails183Tips
    ActiveSupport
      .camelize  <=> .underscore
      .tablerize <=>.classify
      .humanize
      .constantize.new
      .***gytes

    XML
      xml= <<-ENDOFHEARDOC
        <?xml....
        <entry>
          ......
        </entry>
      ENDOFHEARDOC
      .from_xml(xml)

    時間
      .yesterday, .tomorrow, .ago, .since, .last_***, .gininning_of_***, , .local,
      *rails 1.2互換にするときは。.to_time <=> to_datetime

    JSON
      *rails 1系をrails2互換にする時は .attributes.to_json
      hash変換: JSON.decode(***)

    Proc
      &:*** = Proc.new{|x| x.***}
      .to_proc.call(***) = Proc.new{|x| x.send(***)

    Array
      .rand, .split, .split{x| 分割条件式}, .in_groups_of(要素分割単位数),

    Enumerable
      .index_by(&:***), .group_by(&:***), .sum(&:***)
    ModelA.find(:all).index_by( hash_keys_array)
    ModelA.find(:all).index_by( &:attribute_name_of_model_A)

    Hash
    取得    ：  hash_a.slice( keys )
    除外取得：  hash_a.except( keys )
    差分取得：  hash_a.diff{hash_b},

    単数複数 ActiveSupport::CoreExtentions::String::Inflections
      str1.pluralize  <---> strs1.singularize
      StrCamelCase.underscore <----> str_camel_case.camelize
      Modelname.tableize <----> table_names.classify
      str_under_score.humanize ---> "Str under score"
    Model名をモデルそのものに変換
      Modelname.constantize
    rubyでシンボルと文字列と変数名（定数名）の関係と変換
      * シンボルと文字列の相互変換
        o Symbol#id2name(to_s)→String
        o String#intern→Symbol
      * 文字列から変数への変換
        o eval(String)→変数
      * 変数（定数）名の文字列（のリスト）の取得

  #Ruby未整理
    injectの場合はresultにはブロック内で最後に評価した値が入る
    each_with_objectの場合は、resultは常にeach_with_objectの引数として渡されたオブジェクトを指す
    .map.with_index
    未整理
正規表現にマッチしているときだけ 切り取ってキーにしてハッシュ代入　：　@generated_job_info_links[uid] = str if (uid = str.match(/uid=\w+/).to_s[4..-1])
 Rubyではfalseとnilがfalse、それ以外の値がすべてtrueと評価されます。
 シンボルを使うと以下のようなメリットがあります。

 { key: value } のように簡潔なリテラルで書ける。

 文字列よりも速い。

文字列よりもメモリの使用効率が良い。
 参考： Why use symbols as hash keys in Ruby? - Stack Overflow
 基本的に配列だが、nilが渡される場合もある変数を処理する場合、Array()（Kernel#Array）castを使うと条件分岐を無くせます。
 if users
 users.each{|user| send_direct_mail(user) }
 end
↓
 Array(users).each{|user| send_direct_mail(user) }
 最初の見つかった要素のインデックスを返す場合はfind_index。
 users.count(&:admin?) #条件に合う要素の数を返す
 flat_map: mapの結果をネストしないフラットな配列として受け取る
 [[1, 2, 3], [4, 5, 6]].flat_map {|array| array.map {|n| n * 10 } }
 # => [10, 20, 30, 40, 50, 60]
sample: 任意の要素を返す
users[rand(users.size)]
 ↓
 users.sample
 each_with_object: ループを回しつつ、別のオブジェクトを組み立ててそれを返す　似select(&:***).map(&:***)
 def admin_names(users)
   ret = []
   users.each do |user|
     ret << user.name if user.admin?
   end
   ret
 end
 ↓
 def admin_names(users)
   users.each_with_object([]) do |user, names|
     names << user.name if user.admin?
   end
 end

  def hanbaiten_csv_generation
    header_fields = %w(eigyou_date midashi eigyou_naiyou status)
    output_attributes_hash = header_fields.each_with_object({}) do |key, temp_hash|
      temp_hash[key] = Hoken::EigyouRireki.columns_hash[key].comment
    end
    csv = to_csv(Hoken::EigyouRireki.order(eigyou_date: :desc), output_attributes_hash, { master_hanbaiten_id: params[:id] })
    send_data csv, filename: "eigyou-rireki-tbl-#{Time.current}.csv"
  end



 with_indexはカウンタの初期値を指定できます。（デフォルトはゼロ）
 users_with_index = users.map.with_index(1) do |user, counter|
 [counter, user]
 end
 #例外　メソッド全体rescueの対象にするときはbegin/endを省く
 def process_user(user)
 send_to_mail(user)
 rescue Exception => ex
# NoMemoryError等の致命的な例外まで捕捉してしまうので良くない
 end
 ↓
 def process_user(user)
 send_to_mail(user)
 rescue => ex
# すべての実行時エラー(＝ StandardErrorとそのサブクラス)が捕捉される

 raise
# 元のエラーを再度raiseする
end
#meta-programming ruby
 def prepare_for_index_with_build_requester

 prepare_for_index_without_build_requester

 build_requester

 build_app_list
 end
 alias_method_chain :prepare_for_index,
:build_requester

 新しいメソッドは xxx_with_xxx という名前で定義する必要がある。

正規表現にマッチしているときだけ 切り取ってキーにしてハッシュ代入　：　@generated_job_info_links[uid] = str if (uid = str.match(/uid=\w+/).to_s[4..-1])
Rubyではfalseとnilがfalse、それ以外の値がすべてtrueと評価されます。
シンボルを使うと以下のようなメリットがあります。

{ key: value } のように簡潔なリテラルで書ける。

文字列よりも速い。

文字列よりもメモリの使用効率が良い。
参考： Why use symbols as hash keys in Ruby? - Stack Overflow
基本的に配列だが、nilが渡される場合もある変数を処理する場合、Array()（Kernel#Array）castを使うと条件分岐を無くせます。
if users
 users.each{|user| send_direct_mail(user) }
end
↓
Array(users).each{|user| send_direct_mail(user) }
最初の見つかった要素のインデックスを返す場合はfind_index。
users.count(&:admin?) #条件に合う要素の数を返す
flat_map: mapの結果をネストしないフラットな配列として受け取る
[[1, 2, 3], [4, 5, 6]].flat_map {|array| array.map {|n| n * 10 } }
# => [10, 20, 30, 40, 50, 60]
sample: 任意の要素を返す
users[rand(users.size)]
↓
users.sample
each_with_object: ループを回しつつ、別のオブジェクトを組み立ててそれを返す　似select(&:***).map(&:***)
def admin_names(users)
  ret = []
  users.each do |user|
    ret << user.name if user.admin?
  end
  ret
end
↓
def admin_names(users)
  users.each_with_object([]) do |user, names|
    names << user.name if user.admin?
  end
end
with_indexはカウンタの初期値を指定できます。（デフォルトはゼロ）
users_with_index = users.map.with_index(1) do |user, counter|
 [counter, user]
end
#例外　メソッド全体rescueの対象にするときはbegin/endを省く
def process_user(user)
 send_to_mail(user)
rescue Exception => ex
# NoMemoryError等の致命的な例外まで捕捉してしまうので良くない
end
↓
 def process_user(user)
 send_to_mail(user)
rescue => ex
# すべての実行時エラー(＝ StandardErrorとそのサブクラス)が捕捉される

raise
# 元のエラーを再度raiseする
end
#meta-programming ruby
 def prepare_for_index_with_build_requester

prepare_for_index_without_build_requester

build_requester

build_app_list
 end
 alias_method_chain :prepare_for_index,
:build_requester

新しいメソッドは xxx_with_xxx という名前で定義する必要がある。

オリジナルのメソッドは xxx_without_xxx という名前に置き換えられる
 #
#irb technique
  helper.render :template => "common/feed", :formats => [:atom], :layout => false,  :content_type => 'application/atom+xml'
  helper.request
  ActiveRecord::Base.connection.select_values('SELECT * FROM evacuation_advisories')
    ActiveRecord::Base.connection.select_value("select nextval('evacuation_code_seq')")  #<---sequence name
  privateメソッドはIRBからは定義行しか見えない｡
  #
#Rails環境変数=  Rails.application.config

#rubyごろあわせ
  escape meta blacktets :  qwrsix : str, str-ary, regexp, sym, sym-aryi, exec`` : 大文字で""のエスケープ nil->"nil"にしないようにqwは注意
#rubyわりざん: 16.quo(27).to_f

// Rubyコーディングスタイル
  // then 省略
  // .blank? .present?をつかう｡　.nil? .empty?はつかわない｡
  // ※find_by_xxxという書き方はNG（元々あるメソッドを上書きしてし まうため）
  //   find(:all, :conditions => ["name LIKE ?%", "A"], :order => "name ASC")
  // ビジネスロジックはモデルに記入
  // モデルは共通モデルクラスを継承
  //  require_dependency 'model_helper'
  //   class Foo < CustomModel extend ModelHelper
  //
  //文法チェックと警告
  // ruby -wc <ファイル名>
    ruby -wTW2 <ファイル名>
  //pwdのRDoc生成は　 rdoc -c utf8
  //Rails全体の rake doc:app
  //
  // Stackはスタックを実装するクラスである。
  class Stack

#逆引き
    #Errno::ENOENT Exception: --> FileUtils.mkdir_p していないから

イテレーション
	基本：10.times { p "#"} ;            1.upto(10) {|i| p i}
	区切ってインデックス付き：arr.each_slice(2).with_index { |(a, b), i| puts "#{i} - #{a}, #{b}" }


[MD]
---
title: 【まとめ】インスタンス変数、クラス変数、クラスインスタンス変数 tags: Ruby author: mogulla3 slide: false
---
すっかりPHP脳になっていたため、Ruby脳に切り替えるべくクラスに関わる変数まわりをおさらいした。

## 1. インスタンス変数
インスタンスごとに独立して持つ変数。

- インスタンス変数にアクセスできるのは、initializeメソッドとオブジェクトのインスタンスメソッドだけ
- initializeメソッドで初期化されて、その後各インスタンスメソッドから参照・変更される使い方が多い（と思う）
- PHPやJavaみたいに事前にクラス定義内で定義する必要がない

### 1-1. 定義
変数名の前に「@」をつけて定義する

```ruby
@instance_var = 'instance_var'
```

### 1-2. 使い方

```ruby
class Foo
  # 明示的にインスタンス変数を宣言しなくて良い
  # => 宣言した場合、それは「クラスインスタンス変数」と見なされる

  # (o) initializeメソッドからアクセス
  def initialize
    @instance_var = 'instance_var'
    p "#{@instance_var} at initialize"
  end

  # (o) インスタンスメソッドからアクセス
  def xxx
    p "#{@instance_var} at xxx"
  end

  # (x) クラスメソッドからアクセス
  def self.yyy
    p @instance_var
  end
end

# initializeメソッドからはアクセスできる
foo = Foo.new # => 'instance_var at initialize'

# インスタンスメソッドからもアクセスできる
foo.xxx # => 'instance_var at xxx'

# クラスメソッドからはアクセスできない
Foo.yyy # => nil
```

## 2. クラス変数
そのクラスの全てのインスタンスで共有される変数

- クラスとそのインスタンスがスコープになる
- 定数と似ているがクラス変数は何度でも値を変更できる点で異なる
- クラスメソッド、インスタンスメソッド、クラス定義式内でアクセス可能

### 2-1. 定義
変数名の前に「@@」をつけて定義する

```ruby
@@class_var = 'class_var'
```

### 2-2. 使い方
```ruby
class Foo
  @@class_var = 0

  def xxx
    @@class_var += 1
    p @@class_var
  end

  def self.yyy
    @@class_var += 1
    p @@class_var
  end
end

foo = Foo.new

# 同一インスタンス内で値は共有される
foo.xxx # => 1
foo.xxx # => 2

# インスタンスが異なっても、値は共有されている
foo2 = Foo.new
foo2.xxx # => 3

# クラスメソッドからもアクセスできるし、値も共有されている
Foo.yyy # => 4
```

## 3. クラスインスタンス変数
クラスオブジェクトのインスタンス変数
個人的に非常にややこしい。見た目はインスタンス変数なのに、機能的にはクラス変数に近いため。

-  一見するとクラス変数とほぼ同じように使えるが、そのクラスのみでしか参照できない。例えば、そのクラスを継承したクラスではその変数にアクセスできない。
- クラスメソッドからはアクセスできる
- インスタンスメソッドからアクセスすることはできない（クラスオブジェクトのインスタンス変数であるため）
- クラス定義式内で定義される（メソッド内で初期化されない）
- 見た目は通常のインスタンス変数と同じため、混同されやすい

### 3-1. 定義
変数名の前に「@」をつけて定義する
**※ 見た目はインスタンス変数と同じだが、定義する場所がクラス定義式内になる**

```ruby
@class_instance_var = 'class_instance_var'
```

### 3-2. 使い方
```ruby
class Foo
  # クラス定義式内で定義される
  @class_instance_var = 'class_instance_var'

  # クラスメソッド内でクラスインスタンス変数を出力
  def self.xxx
    p @class_instance_var
  end

  # インスタンスメソッド内でクラスインスタンス変数を出力
  # => これはインスタンス変数扱いとなり、参照できない
  def yyy
    p @class_instance_var
  end
end

# Fooを継承したBarクラスを作成
class Bar < Foo
end

# クラスメソッドからクラスインスタンス変数は参照できる
Foo.xxx # => 'class_instance_var'

# インスタンスメソッドからクラスインスタンス変数は参照できない
# => インスタンス変数とみなされるため
foo = Foo.new
foo.yyy # => nil

# 継承されたクラスからクラスインスタンス変数は参照できない
Bar.xxx # => nil
```
