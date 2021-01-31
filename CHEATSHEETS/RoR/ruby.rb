
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
        //定数展開例；　when *ITEMNAMES4SUPERVISED_APPLE_DEVICE

        //form_tag　の　片側だけをif分で条件分岐生成はできない。
        //不定HTMLtemplate変数引き渡し：　    <%= component_view_line(item, {index: local_assigns[:index].presence}) %>
        //不定引数SQL化：　uri_variable_value = uri_variable_value.nil? ? 'NULL' : %Q('#{uri_variable_value}')
        if ***count > 0 || **.present?  --->  if good_news.presence
        users.each { |user| process_user(user) } --->  users.each(&method(:process_user))

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
        主処理 rescue 例外処理 ensure 例外の発生にかかわらず実行される処理
      * 018 予約語 32
        #Rails予約語　:-aで終わるロマンシュ語っぽい英語､information,policeもか?
        # **create "rails test" add for troubleshooting such as installation of plugins.
        # *never use "new/create/destroy/list/index/update/edit/" for controller/model/action name. otherwise Rails router get confused.
        # *don't use "_" character for DB table/coolumn name. this way U can easily tell "_" of helper/plugin method name.
        # *WiFI connection must check every 10 minutes before every donloading.
        # *don't read japanese docment until you stuck into a trouble. it's waste of time.

        # gem breakman予約語　 :admin :role :banned :account_id
        # https://github.com/presidentbeef/brakeman/blob/c8dd4599cd70482613223963b353a3c5b3123895/lib/brakeman/checks/check_model_attr_accessible.rb

        PATH|redo
        __END__, DATA #Ruby スクリプトの終わりを表すキーワードで、これ以降はスクリプトとして読み込まれません。DATAは__END__以降の各行
        __FILE__|__LINE__|BEGIN|END|RUBYLIB|RUBYOPT|RUBYSHELL|RUBYPATH|COMSPEC
        begin|end|alias|and|break|case|class|def|defined?|do|else|elsif|ensure|false|for|if|in|module|
        next|nil|not|or|redo|rescue|retry|return|self|super|then|true|undef|unless|when|while|yield|

    第3章 配列とハッシュ
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
      ary1.each.with_index(n) {|el,i| ...}  #<---- each . with_index(要素nからオフセットして反復する
        ary1.each_with_index{|el,i| ...}
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
          alias :old_method_name, t:new_method_name
          どちらも既存のメソッドに対して別名をつけることができるものですが、下記の点が違いがあります。

                                        alias alias_method
          グローバル変数に別名をつける  可能  不可能
          メソッド名に文字列が使える  不可能  可能
          キーワードである              Yes No
          メソッドである                No  Yes
          オーバーライドできる        不可能  可能

          alias_methodメソッドで別名を付ける場合、元のメソッドに対してremove_methodやundef_methodを適用することで元にメソッドを呼べないようにすることもできます。



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





Hash
取得    ：  hash_a.slice( keys )
除外取得：  hash_a.except( keys )
差分取得：  hash_a.diff{hash_b},

def httpz_elements_of(collective_object)
  collective_object.select{|k, _v| k[0..5] == "HTTP_Z" }
end

def to_hash_even_from_arrayish(target_obj)
  if target_obj.is_a?(Array)
    target_obj << nil if target_obj.size.odd?
    target_obj = Hash[*target_obj.flatten]
  end
  target_obj ||= {}
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

#ruby語呂合わせ
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
