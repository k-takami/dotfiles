#!/usr/bin/ruby 
require 'rubygems'; require 'mechanize'; require 'hpricot'; require 'nkf' #require 'logger' #$agent.log = Logger.new($stdout) 
require 'kconv'
#PG:nilがかえるとエラーになるので sub()...sub()は連続でつかうな。
  #PG:UNICODEアジア文字は2~4バイトなので正規表現では...?でマッチ
  #PG:Railsで一度regexpエラー起こすとサーバーCtrl-Cか再起動
#PG:cross-platform性をたかめるために なるべく ri -c --systemで表示されるクラスしかつかわない。
#PG:WiFI接続きれるとここでUncaught exception: private method `gsub' called for nil:NilClass
#PG:hash値だけの出力はprintで
#PG:w3mは../test/のレンダリングにバグあり。
#takamiredmine 
#PG helper-pathは起動時にやredmineで評価できない $adminurl = r2chnns_path+"/readurl/"+$levelM+"/" 
class Scraper # module LibScraper
  def initialize
    WWW::Mechanize.html_parser = Hpricot; $agent = WWW::Mechanize.new; $outHTML=""
  end
#-----------------------------------------------------------------------------------------------------------------
  def system( strCommandline, strOutfile)  #<--- in case of no outfile, pass"nil" as second argument
    strOutfile = strOutfile.nil? ? nil :  " > " + strOutfile
    return `#{strCommandline + strOutfile}` #; `cat #{strOutfile}`
  end
#-----------------------------------------------------------------------------------------------------------------
  #(subtree) l1中で次のrgxが一回だけ出てくるリンクコメントを抽出ハッシュにし#(subtree)のl1元要素をnil/empty
  def hs_2chSubTree(tree)
#opt     re=/(?:\&gt\;\&gt\;|>>|＞＞) *\d+/
    re = /\&gt\;\&gt\;/; subtree = Hash.new; 
    tree.each{|key, value| 
      $rx_link=/(?:\&gt\;\&gt\;|>>|＞＞)[ 　]*\d+/
      aryReferrer = value.scan($rx_link)
      if aryReferrer.length > 0 then
        anchor = aryReferrer[0].slice(/\d+/).to_i   #tree.keys.index(value.scan(/\d* ：/)[0].gsub(/ ：/,"" ))
        refferedYouso=tree[anchor];refferedYousoA=refferedYouso.to_s.scan($rx_link)[0].to_s.slice(/\d+/).to_i #後続ﾚｽへのﾊﾟｽ点検用
        if anchor!=key && refferedYouso != nil && key != refferedYousoA #自己参照ｸﾛｽ参照での無限ｻﾌﾞﾂﾘｰ生成防止 && thekey != nil
          refering = true 
        end
      end
      if refering && value =~ re && value.scan(re).length < 4 && value !~/<a name=\"[123]\"/i then #bp1 
        #opt aryreferrer.length>1 but 参照先同一もしくは>>[123]捨象後一個参照ならばhash代入
        #opt Anchor[123]との照合はl.length＜２の第一層でしかやらない
        #NG wifi-38sec/1000res加速効果なし         if $levelM >1 then value.sub!(/( *<a href="#\d+">|<\/a>)/,'') end
        #dbgpoint puts tree[key];key; anchor;puts; puts tree[anchor];
        tree[key] =  anchor; subtree[key] = value#subtree[key] = anchor + "<--" + value 
      end 
    }
    return subtree #     print("hfhfhf")
  end

  def downloadAfterBasicAuth(url,id,pw)
    $agent.auth('', 'sweet') ;$agent.user_agent_alias = 'Linux Mozilla'; 
#     url.sub!("http:","https:")
    page = $agent.get(url)
    puts `pwd`
    sTmp=url.split("/");domain=sTmp[2]; subpath="/"+sTmp[3..-1].join("/");

  #case HTTPS
    url.sub!("http:","https:")
    require 'net/https'
    req = Net::HTTP.new(domain, 443)
    req.use_ssl = true;req.ca_file = 'GTE_CyberTrust_Global_Root.pem';req.verify_mode = OpenSSL::SSL::VERIFY_PEER;req.verify_depth = 5
    req.start {|w|
      ret = w.get('/')
      puts response.body
    }
#WGET trial
#     exec("wget -o wgetlog.txt -S --http-user=#{id} --http-password=#{pw} #{url}")
##   url="http://sample.babyblue100.commain_files/movie/download.php?fn=#{cnt}_#{i}"
##   wget -o wgetlog.txt -S --http-user= --http-password=sweet https://sample.babyblue100.com/main_files/movie/download.php?fn=1898_3
    ##redirected: http://download03.babyblue100.com/Nh1YhrOk3Edb/9769200cfc8db6f6cf5b8abe169d4445.wmv
# --secure-protocol=auto --no-check-certificate --certificate='GTE_CyberTrust_Global_Root.pem'
# HTTPS (SSL/TLS) オプション:
# --secure-protocol=PR     セキュアプロトコルを選択する (auto, SSLv2, SSLv3, TLSv1)
# --no-check-certificate   サーバ証明書を検証しない
# --certificate=FILE       クライアント証明書として FILE を使う
# --certificate-type=TYPE  クライアント証明書の種類を TYPE (PEM, DER) に設定する
# --private-key=FILE       秘密鍵として FILE を使う
# --private-key-type=TYPE  秘密鍵の種類を TYPE (PEM, DER) に設定する
# --ca-certificate=FILE    CA 証明書として FILE を使う
# --ca-directory=DIR       CA のハッシュリストが保持されているディレクトリを指定する
# --random-file=FILE       SSL PRNG の初期化データに使うファイルを指定する
# --egd-file=FILE          EGD ソケットとして FILE を使う

#     req = Net::HTTP::Get.new("/main_files/movie/download.php?fn=#{cnt}_#{i}");

  #case HTTP
      req = Net::HTTP::Get.new(subpath)
      req.basic_auth id,pw
      Net::HTTP.start(domain, 80) {|http|
        ret = http.request(req)
        #NG:クッキーを有効にして再度ご利用下さい<br> <a href="http://sample.babyblue100.com/">こちら</a>よりご覧になれます<br>
        File.open($outdir+"/"+links[0].split("/")[3..-2].join("/")+"/#{i}", "w+b", 0644){|f| f.write(ret.body) }	
      }
    return
  end

  def getfilefromURL(url,port,mode,modearg1)
# debugger
    if url !~ /file:\/\// || url =~/takami.2ch-detail-all.html/
      #下の2行はURL階層長さに依存するので、not so good
      if mode=~/rss/ then 
        tgt = ($agent.get(url).body) 
        return tgt
      elsif mode=~/r2chnn/ then 
        tgt = ($agent.get(url).root) 
        return tgt
      elsif mode =~ /fetch/ || url =~/takami.2ch-detail-all.html/ 
        tgt = ($agent.get(url).root) 
      elsif mode=~/toutf8/ then 
        tgt =modearg1 
      end
    else
      tgt=File.open(url.sub("file://",""),"r+b"){|fh|fh.read }
      return tgt
    end
    if mode=="write"
      require'fileutils';
      if url=~/babyblue/
        sTmp=url.split("/");domain=sTmp[2]; subpath="/"+sTmp[3..-1].join("/");
        ret=Net::HTTP.start(domain, port) {|http| http.get(subpath)}
        tgt=ret.body
        FileUtils.mkdir_p(sTmp[3..-2].join("/") ,:mode=>0755)
        File.open("#{modearg1+'/'+sTmp[3..-1].join("/")}", "w+b", 0755){|f| f.write(tgt) }
        return #tgt
      else
        File.open("#{modearg1}", "w+b", 0644){|f| f.write(tgt) }
      end
    end
    #URL-REWRITE-----------------------------------------------------------------------------
    if url !~ $rx_2chNG && url !~ $rx_extNG; 
      #"count.2ch.net"は置換しない
    # NP:受験などMILKCAFE http://www.milkcafe.net/
    # NP:be.2ch.net http://localhost/r2chnns/readurl/4/http://be.2ch.net/
    # NP:アンケート http://localhost/r2chnns/readurl/4/http://find.2ch.net/enq/board.php
    # NG:2chの入り口 http://localhost/r2chnns/readurl/4/http://www.2ch.net/
    # NG:2ch検索 http://localhost/r2chnns/readurl/4/http://find.2ch.net/
    # NG:テレビ番組欄 http://localhost/r2chnns/readurl/4/http://epg.2ch.net/tv2chwiki/
    # NG:2chオークション http://localhost/r2chnns/readurl/4/http://shop.2ch.net/
    # NG:2ch観察帳 http://localhost/r2chnns/readurl/4/http://watch.2ch.net/
    # NG:2NN+ http://localhost/r2chnns/readurl/4/http://newsnavi.2ch.net/
    # NG:２ｃｈ＠ＩＲＣ http://localhost/r2chnns/readurl/4/http://irc.2ch.net/
# debugger
      rx_OKdomain= /http:\/+\w*.?(?:2ch.net|milkcafe.net|machi.to|bbspink.com|milkcafe.net|unkar.jp)\/[\w_\.\/]*/
        #pathizon:2ch内部のｽﾚｯﾄﾞ全部よみこみﾘﾝｸはr2chnn経由のﾘﾝｸに書き換え｡
#         body.gsub!("<a href=\"http://2ch.net/\">",'<a href="'+"/r2chnns/readurl/#{$levelM}/http://menu.2ch.net/bbsmanu.htm\">")
#         elsif url !~/(?:bbspink)/ 
#           erb_header.gsub!(threadpath,'<a href="'+"/r2chnns/readurl/#{$levelM}/"+url+"/")
#           footer.gsub!(threadpath,'<a href="'+"/r2chnns/readurl/#{$levelM}/"+url+"/")
        #dbg  body.scan(/href=.+r2chnns.+">/)
# debugger
      if url =~/milkcafe.net/
        (tgt/"a[@href^='/']").each do |link|
          link[:href]= $docbase+"/readurl/#{$levelM}/http://www.milkcafe.net"+link[:href]
        end
      end
      (tgt/"a[@href^='http://2ch.net']").each do |link|
        link[:href] = $docbase+"/readurl/#{$levelM}/http://menu.2ch.net/bbsmanu.htm"
      end
      (tgt/"a[@href^='./']").each do |link|
        link[:href] = $docbase+"/readurl/#{$levelM}/"+url.split("/")[0..-2].join("/")+"/"
      end

      (tgt/"frame[@src^='http://']").each do |link|
        strlink = link[:src] 
        if strlink =~ rx_OKdomain && strlink !~ $rx_2chNG && strlink !~ $rx_extNG
          link[:src] = $docbase+"/readurl/#{$levelM}/"+strlink
        end
      end
# debugger
      #//navigation-pageHREF絶対パスのリンクかきかえ : 
      (tgt/"a[@HREF^='http://']").each do |link|
        strlink = link[:HREF] 
        if strlink =~ rx_OKdomain && strlink !~ $rx_2chNG && strlink !~ $rx_extNG
          link[:HREF] = $docbase+"/readurl/#{$levelM}/"+strlink
        end
      end
# debugger
      #板トップページhref絶対パスのリンクかきかえ : ここでset.bbspinkもかわるはず
      (tgt/"a[@href^='http://']").each do |link|
        strlink = link[:href] 
        if strlink =~ rx_OKdomain && strlink !~ $rx_2chNG && strlink !~ $rx_extNG
#           if strlink.slice(url) !=nil
            link[:href] = $docbase+"/readurl/#{$levelM}/"+strlink
#           end
        end
      end
# debugger
      ##板トップページhref相対パス
      #残骸pinkbbs ：../test/read.cgi/adultsite/1273761039/l50" target="body">29: ここのパスわかる人いない？ 33 (259)</a><a 
      #dbg puts (tgt/"a").to_s.toutf8.grep(/http:..set./).to_s.split("href")
      #dbg puts (tgt/"a[@href^='.']").to_s.toutf8.grep(/..*read./).to_s.split("<a href=")
      domainOfReadCGI=url.gsub(/(http:\/+|\/.*)/,"")
      (tgt/"a[@href^='.']").each do |link|
          strlink = link[:href];refrange=strlink.sub(/.+\//,"")
          if refrange !~ /[\-lnx]/ && refrange!="" then refalone = true else refalone=false end
          refthread=strlink.gsub(/(?:\.\.\/|[\w\-]+$)/,"")
          #dbg p url;p strlink;p refrange;p refalone; p refthread 
          if strlink.slice(refthread) !=nil && refalone
            #同一スレッド単一レスの参照はアンカーにかえる。
            link[:href] = "#"+strlink.sub(/.+\//,""); link.remove_attribute("target")
          elsif url =~/read.cgi/ && strlink =~/\/(?:l50|n|\d+n-)$/
            #2ch l50 フォーム表示失敗 *l50 \d\+n-は生リンクかきかえダメ 最新50 新着レスの表示  
            link[:href]= "http://"+domainOfReadCGI+strlink.gsub("..", "")
          else
            link[:href]= $docbase+"/readurl/#{$levelM}/"+"http://"+domainOfReadCGI+strlink.gsub("..", "")
          end
      end
# debugger
      if url =~/(?:subback|2ch).htm/  #"http://gimpo.2ch.net/namazuplus/subback.html" :format=>  <a href="1249765570/l50">121:
        (tgt/"a").each do |link|
          strlink = link[:href] 
          link[:href]= $docbase+"/readurl/#{$levelM}/"+url.sub(/(?:subback|2ch).\w+/,"")+strlink
        end
      end
      if url =~/hozen.org/
        (tgt/"a").each do |link|
          strlink = link[:href] 
          if strlink !~ /(?:www.hozen.org|creativecommons)/
            link[:href]= $docbase+"/readurl/#{$levelM}/"+url.sub(/(?:.org)\/.+/,".org")+strlink
          else
            link[:href]= $docbase+"/readurl/#{$levelM}/"+strlink
          end
        end
      end
    end
    if $kaikyuu!="" then 
      #/home/you/RoRapps/2chnrg/lib/scraper.rb 2chdetail http://www.2nn.jp/dqnplus 4 admin 
#       debugger
      (tgt/"a").each do |link|
        strlink = link[:href] 
        if strlink =~ /(l50|l100|-100)/
          link[:href] = link[:href].sub!(/(l50|l100|-100)/ , "")#.to_s
        end
      end
    end

    if mode=~/toutf8/ then 
      tgt =tgt.to_html.toutf8;tgt.sub!(/(?:x-sjis|Shift_JIS)/i,"utf-8")
      #XPFize
      tgt.sub!(%r(<meta content=.+Content-Type" />)i, "\n<meta http-equiv=\"content-type\" content=\"text\/html\;charset=UTF-8\" \/>" )
      tgt.sub!(/<base href=\".+\" \/>\n/, "")
#       変換前コード 変換後コード  自動判定           入力文字コードを指定
#       EUC-JP       UTF-8        str.toutf8  str.kconv(Kconv::UTF8, Kconv::EUC)
#       EUC-JP       UTF-16       str.toutf16 str.kconv(Kconv::UTF16, Kconv::EUC)
#       EUC-JP       Shift_JIS    str.tosjis  str.kconv(Kconv::SJIS, Kconv::EUC)
#       EUC-JP       JIS          str.tojis   str.kconv(Kconv::JIS, Kconv::EUC)
#       Shift_JIS    EUC-JP       str.toeuc   str.kconv(Kconv::EUC, Kconv::SJIS)
    end
    return tgt
  end

  def readINI(filepath, mode, key,value)
			i=1;aryPtn=Array.new; aryPtn[1]=["",""];aryPtn[2]=["",""];aryPtn[3]=["",""]
			key="file-gsub";hs_ptn=Hash.new
			File.readlines(ARGV[1]).each{ |line|
				#dbg     puts line
				if line =~ %r(#many-times-substitution-pattern-per-line-as-follows) then
					i=2 
				elsif line =~ %r(#just-once-substitution-pattern-per-line-as-follows) then
					i=3 
				end
				if line !~ /\t/ then next end #\tなし行を無視
				line.chomp!; tmpary= line.split(/\t/) ;tmpary[0]=tmpary[0].to_s; tmpary[1]=tmpary[1].to_s;aryPtn[i]<<tmpary #end
			}
			aryPtn[1].shift;aryPtn[1].shift;aryPtn[2].shift;aryPtn[2].shift;aryPtn[3].shift;aryPtn[3].shift
  end
  def yahooChintai(utf8txt)
#       str2=utf8txt.gsub(/^ +/," ").gsub(/\[[\-\?\/\w %_:=&.]+.+\]/,"").split("設定はこちら 。")[1].split("画像の上に")[0].gsub(/\n/,"").gsub("画像を拡大","\n")
#       str2=str2.gsub(/(キーワード検索結果：|間取り図あり写真あり|閲覧済み|写真あり|チェックした物件をまとめて一覧表示 物件一覧.+一覧表示.+昇順画像 |\.\.\.)/,"").gsub(/を表示しています。\d+/,"\n")
      str2= utf8txt.gsub(/[\n\r]/,"").gsub(/(地上|間取り|部分|階数|面積データ専有面積|賃料敷金礼金.*|築年数|済み)/,"").sub(/.*すべてにチェックチェックした物件をお気に入りに登録/,"").split("年")
      str2.each_with_index{|x,y|
        x=x.sub(/(^.*\;]|)/,"").gsub(/(\w*:?\[?http:..[\w\-\.\/\]]+|.start=\d+.|お気に入りに登録\[?)/,"")
        x=x.gsub(/^.+(東武|西武|相模|青梅).+線?.+\n/,"")
        x=x.gsub(/,000円/,"千円").gsub(/か月/,"月").gsub(/^.+線\//,"")
        x=x.gsub(/.+( .+駅).+(....万円).+(築\d+年).+/,"\\1 \\2 \\3").gsub(/万円/,'').gsub(/(駅|金|徒)/,'')
        x=x.gsub(/(−\d+分|\d月)/,'').gsub(/\d千円.+（/,'(').gsub(/.+(\d+\.\d+K).+(\d+年).+/,"\\1 \\2 \\3")
        x=x.gsub(/(.+年数|.+\d+件|.+選択|線|\/)/,'')
        x=x.gsub(/階(建て)?/,'F ')
        x=x.gsub(/(m2)/,'\\1 ')
        str2[y] = " ■" + x
      }
      return str2.join
  end  

  def hs_2hCommentShori(rx_ptn,rx_jogai, strSectionHD, strSectionSubHD, strSpacer,valOption)#/hs_tmp)
    if valOption.class == Hash
                                         aryOrHashSize = valOption.length
    else
      aryGreped=$l[0].to_s.grep(rx_ptn); aryOrHashSize = aryGreped.length; if rx_jogai.class==Regexp then rxx=true end
      #;eee= h2.to_s.split(%(<br />)).grep(gomi) #dbg	puts tokua.to_s.split(%(<br />))
    end
    if aryOrHashSize>0 then 
      if valOption.class == Hash
        hs_tmp=valOption#.dup
      else
        hs_tmp=Hash.new;aryGreped.each{|el| 
          key=el.slice(/\d+/).to_i;
          if $l[0][key] != nil then 
            if rxx != true
              hs_tmp[key]=$l[0][key]; $l[0].delete(key) 
            elsif el !~ rx_jogai #opt rxxとnostdout併用できるように、ノ　引数追加 
              hs_tmp[key]=$l[0][key]; $l[0].delete(key) 
#dbg        else
#             puts el + "　:valOption="+ valOption.to_s
            end
          end
        }
      end
      if hs_tmp.size>0 then #dd       if strSectionSubHD ==nil then strSectionSubHD="" end
        hs_tmp[0]="</dl><h3>"+strSectionHD+"</h3>"+strSectionSubHD+"<dl><dd>";
        if valOption !="nostdout" then
#           hs_tmp.keys.sort.each{|key| $outHTML<< strSpacer+hs_tmp[key]}; $outHTML<<"\n</dd>\n"  #hs_tmp[key].to_s
          hs_tmp.keys.sort.each{|key| $outHTML<< strSpacer+hs_tmp[key]}; 
          #dev090825
          #kugiri= "</dd>" #if ARGV[1]  =~/hozen.org/ then kugiri= "</blockquote></dd>" else kugiri= "</dd>"  end
          #$outHTML<<"\n#{kugiri}\n"  #hs_tmp[key].to_s
          return hs_tmp.length
          if valOption.class == Hash then hs_tmp.clear end
        else
          return hs_tmp
        end
      end
    end
  end
end #of class---------------------------
#-----------------------------------------------------------------------------------------------------------------
if __FILE__ == $0
  $clm = Scraper.new; 
    if ARGV[0] =="help" || ARGV[0] =="--help" || ARGV[0] =="-h"
       puts "---USAGE----
#        usage: ruby scraper.rb 2nn (local|ive) [rails]    > ../app/views/r2chnns/index.html.erb
#        usage: ruby scraper.rb 2chdetail url|local levelM kaikyuu [mobile] > /usr/local/apache2/htdocs/takami/out2.html
      #sample:  ruby /tchKoiNews/home/you/RoRapps/2chnrg/lib/scraper.rb 2chdetail local 4 viewer mobile
#        usage: ruby test.rb yomikakudev.txt|more
#        usage: ruby test.rb yomikakudev.txt| sort  >new2
#        usage: ruby scraper.rb watchmiracle [1400]
#        usage: ruby scraper.rb watchdailyDL [1400]
#        usage: cd /RoR/redmine-0.9.5/lib/; ruby scraper.rb watchKoiNews [local]
#        usage: ruby scraper.rb watchRefresh [local]
#-----------------------------------------------------------------------------------------------------------------
       "
    elsif ARGV[0] =~ /2nn/ # 
    #2NN hotentry scraper 時間につれてレス数はふえ、瞬間投稿速度はおちていくので、それを一々取得しないことにした。気になる人は2NNを利用。
      #opt 解析ロジック実装後、2nn-mobile(ソースと記者名なし)->2chdomain-conv-table 加速URL変換 PC33sec--->mobile7sec
      #   http://www.2nn.jp/m/bizplus/1245743319/
      #     http://orz.2ch.io/p/1!...2/anchorage.2ch.net/bizplus/1245743319/
      #       http://anchorage.2ch.net/test/read.cgi/bizplus/1245743319/
      #opt     "index.cgi?"から始まるリンクを全て探す	doc/"a[@href^='index.cgi?']"	: (doc/"a[@href^='index.cgi?']").each do |link| 
      #     テキストに"new"という文字列が入っているリンクを全て探す(※version 0.5以降) doc/"a[text()*='new']"
      dpage="2chnrg";#"remix2ch"
#       dpage=="2chnrg"? newhref="http://localhost:3000/r2chnns/readurl=": newhref="http://contents-factory.net/remix2ch/read.php?url="
      dpage=="2chnrg"? newhref="readurl=": newhref="http://contents-factory.net/remix2ch/read.php?url="
      ARGV[1] =~ /local$/?  url='http://localhost/takami/': url=ARGV[3].to_s
      if url=="" then url = 'http://www.2nn.jp/' end #page = $agent.get('http://localhost:3000/craps/') 
      doc =($agent.get(url).root);
      #HTMLERBize#1 除去
      (doc/:meta).remove;(doc/:title).remove; #buggy:	(doc/:head).remove
      #C-HTMLize#1	<script	の除去連結
      (doc/:script).remove;                                                                       
      #2NN support-menu隠蔽
      (doc/'#SmallMenu').remove;(doc/'#cloud').remove;(doc/'#LatestNews').remove;(doc/'#PageBodySub').remove;(doc/'#boardspeed').remove;
      #(doc/'#toolnews').remove ;(doc/'#toolothers').remove; 
      #2NN crappythread隠蔽
#       (doc/"li.newsbox"/"a[@href*='takeshima']").each{|el| el.parent.parent.inner_html =nil} #"東アジアニュース速報
      (doc/"li.newsbox"/"a[@href*='tsushima']").each{|el| el.parent.parent.inner_html =nil} #news sokuhou
      (doc/"#Mnewsplus").each{|el| el.parent.inner_html =nil}                               #gei-spo
      (doc/'div.NewsRankHead').remove ; (doc/'div.NewsImage').remove ;

      (doc/:a).each do |link| 
        strlink = link[:href]; strlink.sub!(%r((l50|l100|-100)/?$) , "") 
        #remix2chは/, /-100, /l50しか表示不能 http://contents-factory.net/remix2ch/read.php?url=http...
        #//--remix2ch経由でのツリー表示型閲覧にhref書き換える//本家URL	http://mamono.2ch.net/test/read.cgi/newsplus/1214022204/l50
        if strlink =~ %r(.net/test/read.cgi/) || strlink =~ %r(.2ch.net/) #//絶対パスのリンクかきかえ : 
            link[:href]= newhref+strlink #dbg print link[:href]
        elsif strlink =~ %r(../test/read.cgi/) #//相対パスの内部リンクかきかえ :(例) ../test/read.cgi/newsplus/1213863381/l100
            link[:href]= newhref+"http://" #+ doc.domain + strlink.gsub(%r(../), "");
          #dbg print link[:href]
        end
      end

      if ARGV[2] =~ /rails/   #rdebug lib/scraper.rb 2nn (local|live) rails
        strdoc = doc.to_plain_text;
#         strdoc=strdoc.to_s.gsub!(%r(.*楽天市場),"")
        strdoc.gsub!(/(\[img:.+photo|2NNのURL|.+javascript|\[#.+\]|<.+>).*\n/,"") #.+2nn\.jp|
        strdoc.gsub!(%r(\n[\s]+), "\n") ;
        $outHTML<< strdoc;
				$outHTML<< "\n"	

				#SBIsecurities rate quote
				ARGV[1] =~ /local$/?  url='http://localhost/takami/sbisec-forex-chart.html': url='https://site2.sbisec.co.jp/ETGate/?_ControlID=WPLETmkR001Control&_DataStoreID=DSWPLETmkR001Control&_PageID=WPLETmkR001Edtl20&getFlg=on&_ActionID=createChartForDollar&PER=1'
				doc =($agent.get(url).root); #         page=$agent.get(url).root;
				zzz= (doc/"td.stockMod0101") ;(zzz/"td.mbody").remove;(zzz/:a).remove;(zzz/:div).remove; (zzz/"img").remove;(zzz/"font").remove
				tmphtml = NKF.nkf("-S -x -w -m0" , zzz.to_s); #dbg print remixpageHTML 
				strforex=tmphtml.gsub(/<\/\w+>/,'|').gsub(/ ?(td|mtext|class|nowrap|align|colspan|width|height|right|center|&nbsp\;|\")=?/,'')
        strforex=strforex.gsub(/(<\w+>|<table.+=0>|<fm01 \w+>|blue>|red>|<\d*%?>|< bg\w+\W+[\w\d]+>|<font |color=|\d+:\d+|[ \t]+)/,'').gsub(/[\s\|]/,'')
        $outHTML<< strforex; #.split(/\|/)	#PG*putsは配列要素ごと改行出力、printは連結出力
				$outHTML<< "\n"	
          #read a[1..3]
          #     (rdb:194) puts a[3]
          #     津川雅彦ブログ】「日本人の誇りを踏みにじるテポドンは迎撃してほしい!」「小沢さんは民主党党主で居座れるのかな?」 [http://localhost:3000/r2chnns/readurl=http://takeshima.2ch.net/test/read.cgi/news4plus/1241416396/]
          #     ビジネスニュース＋ [http://localhost:3000/r2chnns/readurl=http://anchorage.2ch.net/bizplus/]
          #     投稿時速：411res/h #     [img:r2chnn.html_files/1241425802.jpg]
          #     MSN産経ニュース [http://sankei.jp.msn.com/world/korea/090504/kor0905041631000-n1.htm]
          ##read a[4..-1]
          #      (rdb:194) puts a[4]
          #     話題/食文化】世界に売り込め韓国料理--ペ・ヨンジュンさん参加の推進団発足 [http://localhost:3000/r2chnns/readurl=http://anchorage.2ch.net/test/read.cgi/bizplus/1241425802/]
          #     05/04 12:11 #     785res #     137res/h #     28.4% #     nil
      else
        #HTMLERBize#2
        strdoc = doc.to_html;strdoc.gsub!(%r(</?(li|ul)>),"");
        #C-HTMLize#2	
        strdoc.gsub!(/<\/?span(..?class.?.?=".+".?>?)?>/,"") # <span	<class # <html lang="ja"> # </body> # </html> # </head><body>
        #2NN support-menu隠蔽
        strdoc.gsub!(%r((<a.+2nn.jp/\w+/\d+/.+>|</body>|</html>)),"")#もっと見る　リライト
  #       strdoc.grep(%r(<a.+2nn.jp/.+>)){|line| line.sub!( line.slice(%r(<a.+2nn.jp/.+>),1)," " }
  #       strdoc.gsub!(%r(<(.?DOCTYPE.+".+".+".+"|html\slang.?=".+"|/?(html|body|))>?), "")       
            # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
          #opt css-replace strdoc.grep(/ class.?.?=".+".?>)/     font-size=
            # strdoc.grep(/%r(\n[\s]+\d*){|line| line.sub!( line.slice(\d*,1)," " }
        strdoc.gsub!(%r(\n[\s　]+\n), "\n") ;
        $outHTML<< strdoc;
      end
#-----------------------------------------------------------------------------------------------------------------
    elsif ARGV[0] =~ /2chdetail/ 
#yobi ARGV[1] =~ /local$/? url='http://localhost/takami/2ch-detail-all.html': url= ARGV[1]
      ARGV[1] =~ /local$/? url='file:///usr/local/apache2/htdocs/takami/2ch-detail-all.html': url= ARGV[1]
      if ARGV[2] != nil then 
        $levelM=ARGV[2].sub(/K/,'').to_i 
        if ARGV[2] =~ /\d+K/ then spacer="\n<hr>" else spacer="\n" end
      else 
        $levelM=2 ;spacer="\n"
      end
      if ARGV[3] != nil then 
        $kaikyuu=ARGV[3]
      end
#       ARGV[1] =~ /local$/? url='http://localhost/takami/2ch-detail-short.html': url= ARGV[1]
      #'http://localhost'#page = $agent.get('http://localhost:3000/craps/') 
      #DETAIL PAGE---------------------------------
#       if url=~/2ch.net.+kako/ then exit end 
      if url =~/2ch.+kako/i
        sTmp=url.split("/");domain=sTmp[2];subpath="/"+sTmp[3..-1].join("/");
        page=String.new;require 'net/http';Net::HTTP.version_1_2;Net::HTTP.start(domain, 80) {|http| page << http.get(subpath).body }
        #bodyはstringくらす、get結果はHTTP::OKクラス
      else
        page=$agent.get(url).root;
      end
      $docbase="/r2chnns"
      $rx_2chNG= /(?:be|find|epg|shop|watch|irc).2ch/ 
      $rx_extNG=/(?:dummy)/
      $rx_OKurl   =/(?:2ch.net.+read.cgi|bbspink.+read.cgi|machi.to.bbs.read.cgi|unkar.jp.read.+2ch.net.\w+.\d|hozen.org.bbs.\d+\/\d)/
      if url =~/hozen.org/
        tmphtml = page.to_html
        header = tmphtml.split(%r(<a name="R1">))[0] 
        tmpstr = tmphtml.split(%r(<br />\s+<p><a href="/bbs))
        footer = '<BR>'+"\n"+'<p><a href="/bbs'+tmpstr[1]
        body   = "<a name=\"R1\">"+tmpstr[0].split(%r(<a name="R1">))[1] 
        body.gsub!(/(\n)+/,'').gsub!(/<a name=/,"\n<a name=")
#         <a name="R143">143</a> 名前:<span class="green">
#         <b><a href="sage" rel="nofollow">名無しさん＠お腹いっぱい。</a></b>
#         </span>投稿日:2009/02/03(火) 18:33:16 P<blockquote> スレ伸びてたから、またFBIフィッシングに引っかかって騒いでるのかと思ったら別人か。 <br />  <br />  <br /> しかしまたこの人も、平然とマルチポストできるってすごい神経してるなあ。 </blockquote><br />
      elsif url =~/unkar.jp/
        tmphtml=Scraper.new.getfilefromURL(url,80,"toutf8XPF",page)
        header = tmphtml.split(%r(<dt id="l1">))[0]
        tmpstr = tmphtml.split(%r(</dl>))
        footer = '</dl>'+tmpstr[1]
        body   = "<dt id=\"l1\">"+tmpstr[0].split(%r(<dt id="l1">))[1] .sub!(/Shift_JIS/i,"utf-8") 
      else#2ch-style-read.cgi
        if url =~/2ch.+kako/i
          tmphtml=Scraper.new.getfilefromURL(url,80,"toutf8XPF",page)
          aryTmphtml = tmphtml.split(%r(<dl>|</dl>))
          header = aryTmphtml[0]+"<dl>"  #; header.sub!(/<base href=\".+\" \/>\n/, "")
        elsif url =~/(htdocs.takami|2ch.net)/
          tmphtml=Scraper.new.getfilefromURL(url,80,"toutf8XPF",page)
          aryTmphtml = tmphtml.split(%r(<dl class="thread">|</dl>)) 
          header = aryTmphtml[0]+ "<dl class=\"thread\">"
        elsif url =~/milkcafe.net/
          tmphtml=Scraper.new.getfilefromURL(url,80,"toutf8XPF",page)
          aryTmphtml = tmphtml.split(%r(<dl class="commentlist">|</dl>)) 
          header = aryTmphtml[0]+ "<dl class=\"commentlist\">"
        else #url =~/bbspink/
          tmphtml=Scraper.new.getfilefromURL(url,80,"toutf8XPF",page)
          aryTmphtml = tmphtml.split(%r(<dl class="thread">|</dl>)) 
          header = aryTmphtml[0]+ "<dl class=\"thread\">"
        end
        #HEADeR #<dl class="thread"> #</dl>i<font color=red face="Arial"><b>28 KB</b></font>:#FOOTER #<dt>.*<dd> TREE
        #2ch処理中絶例外-----------------------------------------
        if url !~/(htdocs.takami|read.cgi)/ then 
          puts tmphtml;abort("")  #navigation menuではここで終了  
#         else
#           resrange =url.split("/")[-1]# "245"
#           if resrange.length <= 4 && resrange !~/[-lnx]/  #nil
#             puts tmphtml;abort("")
#           end
        end
        #-----------------------------------------
        body  = aryTmphtml[1]
        if aryTmphtml[2]!=nil then
          tmpstr = "</dl>" + aryTmphtml[2] 
          tmpstr1=tmpstr.split(/form/)
          footer=""; uefooter= tmpstr1[0][0..-3].gsub(/(新着レスの表示|最新50)/, "\\1と追記")



          if tmpstr1.length >1	#1000full対策 
            footer=uefooter+tmpstr1[2][1..-1]  #新着レスの表示  最新50  &コメント(2ch生スレッド表示)
          else
            footer=uefooter 
          end
        else
          footer="R2CHNN: NO FOOTER GENERATED<br></body></html>"
        end
        body.gsub!(/\.\.\/test/, ARGV[1].sub(/test.+/,'test'))
        if $kaikyuu=="admin" then body.gsub!(/ime\.nu\//,"") end
        #yobi       strDomain=ARGV[1].sub(/test.+/,'test')
        #yobi       erb_footer=footer.gsub(/\.\.\/test/,strDomain)  # erb_footer=footer.sub(%r(),'')
        #opt calc-5secs, render-5secs, +http-fetch*2* Xsecs
      end
      if url =~/hozen.org/
        erb_header=header
      elsif url =~/unkar.jp/
        erb_header=header
      else  
        erb_header=header.sub(%r(.+</script></div>),'')
        #.gsub(/\.\.\/test/,strDomain)  # erb_footer=footer.sub(%r(),'')
      end

      #WiFI接続きれるとここでUncaught exception: private method `gsub' called for nil:NilClass
#dd       body.gsub!(/(\s)ttp/, "\\1http");body.gsub!(/(　)ttp/, "\\1http")
      body.gsub(/＞＞/, "&gt\;&gt\;"); body.gsub!(/ (&gt\;|＞)(\d+)/, " &gt\;&gt\;\\2")      
			body.gsub!(/((　|\s))ttp/, "\\1http") 
			body.gsub!(/０/, "0"); body.gsub!(/１/, "1"); body.gsub!(/２/, "2"); body.gsub!(/３/, "3"); body.gsub!(/４/, "4");
			body.gsub!(/５/, "5"); body.gsub!(/６/, "6"); body.gsub!(/７/, "7"); body.gsub!(/８/, "8"); body.gsub!(/９/, "9");
      #空行連続、
      body.gsub!(/(<br ?\/> ?){3,}/,"<br/> ")
      ##ptn7=/[ｗwW].?</;body.gsub!(ptn7,"<") #ptn7=/[ハは]{4,}/;body.gsub!(ptn7,"(笑)")  4,122,49-50,
      body.gsub!(/w{4,}/i,"笑");body.gsub!(/ｗｗｗｗ+/,"笑");body.gsub!(/ｗｗ+\s+<br/,"笑<br")
      body.gsub!(/ハハハハ+/,"笑");body.gsub!(/ハハ+/,"笑");body.gsub!(/笑笑笑笑+/,"笑");body.gsub!(/笑笑+/,"(笑)")
      if url !~/hozen.org/ && url !~/unkar.jp/
        if url =~/2ch.+kako/i
          threadpath="<a href=\""+url
        else
          ptn8=/<dt>1 ：.+.+<dd> /;popstr=body.slice(ptn8); body.sub!(ptn8, popstr.to_s)
          threadpath=header.slice(/<a href="[\w:\/\"\. _=]+read[\w:\/\"\. _=]+">.*全/m).slice(/<a href="[\w:\/\.]+/m).to_s
          if url=~/(?:machi.to|bbspink)/ then threadpath2=threadpath.gsub(/(?:<a href="|\/\w+\/$)/,"").to_s end
        end
        if url=~/(?:machi.to)/ 
          erb_header.gsub!(threadpath2,"/r2chnns/readurl/#{$levelM}/"+threadpath2)
              footer.gsub!(threadpath2,"/r2chnns/readurl/#{$levelM}/"+threadpath2)
        end
      end
#opt    body.gsub!(/ｗ+/,"w");body.gsub!(/w{4,}+/,"w")
#         ptn7=/ははは+/; body.gsub!(ptn7,"はは(笑)")
      if $levelM >1 #改行圧縮要約モード
        #hozen: <b><a href="sage" rel="nofollow">クリックで救われる名無しさんがいる</a></b>
        ptn2=%r(：<font color="\w*green"><b>.+</font>); body.gsub!(ptn2, "") #optHpricot
        body.gsub!(%r(<a href="mailto:(.?age|\w+\.)"><b>.+</b>), "<a href=\"mailto:\\1\">某");
        body.gsub!(/[ \t]*<br \/>[ \t]*/i,'<br/>');
        body.gsub!(/(<font color="\w+">|<\/font>|<\/?b>)/i,'')
        body.gsub!(/\((日|月|火|水|木|金|土)\)/,'');body.gsub!(/(<br\/>){2,}/i,'<br/>');body.gsub!(/：某2/,'：2')
        #NG: body.gsub!(/<dd>(<br>)+/,'<dd>') #         body.gsub!(/<\/?dt>/,'')
      end
      if $levelM >3 then #timestamp & ID
#         body.gsub!(/：\d+\/\d+\/\d+ \d+:\d+:\d+ ID/,'：ID')
#opt      body.gsub!(/<.?dt>/,'')
      end
      $l = Array.new; 
#       rx_ref=/(dd> つ |dd> つ【|\sttp|著 |著　|年.+月.+日|%.+%.+%|％.+％.+％)/ #|『
      rx_ref=/(?:dd> つ |dd> つ【|ttp|著 |著　|年.+月.+日|%.+%.+%|％.+％.+％)/ #|『
      #<br> (\-|+|\\|\/#$<>:) ----> no gsub! of <br>
      rx_cyber= /<br> [\-+\\\/\#\$<>:i].+<br> [\-+\\\/\#\$<>:i].+<br> [\-+\\\/\#\$<>:i]/i
      rx_kajo=/(?:a>.+=.+=.+<|＝.+＝|\*.+br.+\*.+\*|･.+br.+･.+･|\-\w.+\-\w.+\-\w|・.+br.+・.+・|1\..+2\..+3\.|1\).+2\).+3\)|①.+②.+③)/
      rx_aa=/(?:＼|∧|_人|／|░|▓|▒|∩|∪|⊂|⊃|●.+●.+●|::::|\;\;\;\;)/
      rx_chart=/(?:＞\s*\D|>>\s*\D| \&gt\;\D|.+：.+：.+：|\|.+\|.+\||→.+→|↓.+↓|←.+←|┏.+┓.+┗.+┛)/ #NG:Buggy =.+=, \=.+\=.+=,
      rx_top3= /<a name=\"[123]\"/i 
      l0 = Hash.new; 
      #levelM>2で事前濾過
      rx_ero=/(?:レイプ|おっぱい|オッパイ|セフレ|６９し|６９す|俗嬢|プ嬢|ル嬢|ロ嬢|ピンサロ|デリヘル|フェラす|フェラし|クンニす|クンニし|レイパ-|オナホ|ガン見|ちんぽこ|チンポコ|ポコチ|ちんちん|チンチン|ティンティン|マムコ|ティムポ|ペニス|まんこ|マンコ|ホイミ-|ヴァギナ|肛門|陰核|陰茎|クリトリス|アナル|ウホッ|アッ-\s|ｱｯ-\s)/
      rx_zako=/(?:か翻訳|天誅|天罰|核の雨|逃げてー|記念カ|に酷い事したよね|記念真|！！！|おそろしや|終了のお知|イイハナシ|オワタ|なにこれ|なんだこの|キター！|ママン|忘れないであげて|ホッキアゲ|ゴルゴ|天狗の|おそロシ|誰か.+頼む|ざまあ|ザマア|まだ.*〜.?\s|三行で|涙目|死にたい|メシウマ|は勝ち組。?\s|何とか.+よ。?\s|ど.+でもいい|\(笑\)|w\s|ｗ\s|ｳﾞｫｰ|ｷﾀ—|ｵﾜﾀ|ｳﾝｺｰ|ﾏﾀﾞｰ|♪)/
      rx_gundam=/(?:カイジ|ハイジ|ラスカル|ルパン三世|北斗.+拳|セカンドインパクト|ゴジラ|モスラ|バスターマシン|ベジータ|ndインパクト|ギレンザビ|ギレンの野望|ギレン総帥|まだ終わらんよ|が勝つわ.?\s|などカスであると|坊やだからさ|違いが.+戦力の決定的差|後10年は戦える|キシリア|諸君らが愛.+た.+は死んだ|あえて言おう！|モビルスーツ|ジークジオン|ギャン|ゲルググ|ゾッグ|ドズル|ガンダム|シャア|立てよ国民|意外と兄上も)/
      rx_label=/(?:ネトウヨ|ネトサヨ|クソサヨ|ネトアサ|アグネス|ネットアサヒ|ネット右翼)/
      rx_tosi=/\d\d?(.+a>)?(?:歳|\d*才)/
      #levelM>3で事前濾過
      rx_yahi=/(?:図々し|あつかま|さっさと|押し付?け|ずうずうし|ふざけ|許せん|内政干渉|厚顔|無礼|恥.らず|卑怯|卑劣|嘘つき|うそつき|がましく|でて.?.?.?け|出て.?.?.?け|出てって|て行ってく|お断り|おことわり|追い出|来るな.?.?.?\s|こっち.+んな|カエレ.?.?.?\s|帰れ|かえれ|勝手な|死ね)/
      rx_nega=/(?:無理|要りません|何の意味|要らない.?.?.?\s|いらない.?.?.?\s|似合わない.?.?.?\s|ムダ|無意味|ムリ|ナンセンス|終わ.?たな|おわ.?た|これ.*ひど|には失望した|反対\s|キモい.?.?.?\s|キモイ.?.?.?\s)/
      rx_negaZokusei=/(がいうな._\s|が言うのか|くせに.+言|が言うな.?\s|何言|い.?まさら|今更)/
      rx_akiaki=/(?:いい加減にし|いい加減に汁|また.*か.?\s|うんざり|ウンザリ|こりごり|コリゴリ)/
      rx_inori=/(?:合掌|アーメン|南無|R\.?I\.?P|エロイム)/
      #levelM>4で事前濾過
      rx_about=/(?:絶対に|まぁ.?しかし|強時代|絶対反対|断固反対|失われ.+年|地獄絵図|遠交近攻|永遠に|永劫|ときまって.?.?.?る|に決まって.?.?.?る|永久に|日本だけ|日本しか|日本.だけ|日本.しか|世界中|世界制覇|世界最|結局|アジア|一番|しかない|唯一の|最も|仕方.?.?.?い|しかた.?.?.?い|なわけない|が.+訳がない.?.?.?\s|楽勝)/
      rx_guess=/(?:だろ.?.?.?\s|だろうな|でしょ。?|かも|やもしれ|やも知れ|どうせ.+だろ|じゃないの|ような気|じゃね)/
      rx_hatena=/(?:？|\?|だろうか|不.?思議|てんのか|よく...?からん)/
      if header.slice(/news4plus/m) != nil then $ita_toua=true else $ita_toua=false end
      #example of remix-2ch
      #<dl>
      #<dt>129 ：<span class="name"><a href="mailto:sage"><b>名刺は切らしておりまして</b></a> </span>：2009/08/24(月) 12:49:56 ID:F0I9FsMi (スコア1：オフトピック)
      #<input id="129" name="edit_res[]" value="129" checked="checked" type="checkbox">
      #<label for="129">このレスを掲載する</label></dt>
      #<dd> <a href="../test/read.cgi/bizplus/1251077797/125" target="_blank">&gt;&gt;125</a> <br> 閉め <br> 安物。 <br> 結局。 <br>  
      if url =~/hozen.org/ then 
        kugiri= "</blockquote>";suffixR= "</blockquote>";prefixT= "<dl><dd>"
      elsif url =~/unkar.jp/ then 
        kugiri= "</dd>"        ;suffixR= ""             ;prefixT= "<dl>"  #kugiri= "<dt id=" 
      else  #read.cgi
        if url =~/(?:2ch.+kako|machi.to)/i 
          kugiri= "<dt>"        ;suffixR= ""             ;prefixT= "<dl>"
        else
          kugiri= "</dd>"        ;suffixR= ""             ;prefixT= "<dl>"
        end
      end 
      #過去ログ倉庫生 <dt>4 名前：<font color="forestgreen"><b> 名無しさん＠３周年 </b></font> 投稿日： 02/11/20 16:09 ID:x3DzCfsY<br><dd>
      #過去ログ倉庫   986 名前：<font color="forestgreen"><b> 名無しさん＠３周年 </b></font> 投稿日： 02
      #過去ログ倉庫  ><A name="429">429</A> 名前： 名無しさん＠3周年  投稿日：  
      #hozen:  <b><a href="sage" rel="nofollow">クリックで救われる名無しさんがいる</a></b>
#       print body;abort("")
      ptn1=%r(<a href="mailto:.+"><b>.+</b>.+<b></b></a>)i; ptn1sub=/◆/; #◆だけがIDあり、あとは匿名
      body.split(%r(#{kugiri})).each{|el| 
#opt       if $levelM>3 then strsp=/<\/dt>/ else strsp=/<\/dd>/ end
          if url =~/2ch.+kako/i then el = "<dt>"+ el.to_s end
          if el !~ ptn1sub then el.sub!(ptn1, "某") end
          #(layor1)中で次のrgxが参照するコメントをアンカーに変える(unkarはかえなくてよい）　 
          if url !~/hozen.org/ && url !~/unkar.jp/
            if url =~ /machi.to/
              strNum_res =el.slice(/(\d*) /,1); el.sub!(/\d*/,"<dt><a name=\"#{strNum_res}\">"+strNum_res+"</a>")
            else  #2ch
              strNum_res =el.slice(/<dt>(\d*)/,1); el.sub!(/<dt>\d*/,"<dt><a name=\"#{strNum_res}\">"+strNum_res.to_s+"</a>")
            end
          end
  #opt    body.gsub!(/(<dt>)(\d*)/,"<dt><A name=\"#\\2>\\2</A>" )
          #PG:NG: 不整形タグレンダリングは意外と遅い         el.sub!(/<dt>/,"<dt><A name=\"#{el.slice(/<dt>(\d*)/,1)}\"> ")
          if $levelM >1 && el !~ /="[123]"/ then 
            if $ita_toua !=true
              if $levelM>3&&(el=~rx_about||el=~rx_guess||el=~rx_hatena) 
                el = nil 
              elsif $levelM>3&&(el=~rx_yahi||el=~rx_nega||el=~rx_negaZokusei||el=~rx_akiaki||el=~rx_inori)
                el = nil 
              end
              #opt break
            end
            if $levelM>2&&(el=~rx_zako||el=~rx_ero||el=~rx_gundam||el=~rx_label||el=~rx_tosi) 
              el = nil 
            elsif el != nil
              el.gsub!(/(<a href="mailto:\w+">|某?<\/a>：?)/,'')
              if el !~ rx_top3 && el !~ rx_ref && el !~ rx_chart && el !~ rx_kajo && el !~ rx_aa && el !~ rx_cyber #bp2 
                el.gsub!(/　/,' ');el.gsub!(/<br ?\/?>/,' ');
#dd             el.gsub!(%r(</a> <br /> ),"</a> ");el.gsub!(/<br>/,' ') 
              end
            end
          end #PG:opt:これではmailto:ﾀﾞﾌﾞﾙﾊﾞｲﾄ はけせない
          if el!=nil && el!="" then 
            l0[el.slice(/\d+/).to_i] = el + suffixR 
          end #l0[el.match(/\d* ：/).to_s] = el
      }; 
      if url =~/hozen.org/ || url=~/2ch.+kako/i 
        l0.each{|key, value| 
          newvalue = value.sub(/<\/a> 名前 投稿日(:|： )/i," ");newvalue = newvalue.sub(/<\/a> 名前(:|： )/i," ");
          newvalue = newvalue.sub(/<\/(a|span)> ?投稿日(:|： )/i," ")
          l0[key]= newvalue
        }
      end
      $l << l0
      #(lN) l(N-1)中で次のrgxが一回だけ出てくるリンクコメントを抽出ハッシュに, #次のrgxが一回も出なくなるまでループ  %r(&gt;&gt|＞＞) 
      $clm=Scraper.new;
      while true
#         subtree = Scraper.new.hs_2chSubTree($l[-1]) ;subtree.keys.length == 0 ?  break : l << subtree 
        subtree = $clm.hs_2chSubTree($l[-1]);
        subtree.keys.length == 0 ?  break : $l << subtree
        #;dd $l[-1].merge!(subtree){|key, val1, val2| nil }; #rescue print ("--------ERROR IN 93-SUB TREE GENERATION------------")
      end
#dbg  puts $l.to_s.scan(/.+\&gt\;\&gt\;\d+/)
      if $l.length > 1 
        #ckpoint01:  hash.keysでl1にsubtree..Nを順次</dd>なし<dl>...</dd></dl><hr>インデント挿入していく
        j = -1 ;layors = $l.length - 1      
        while true
          $l[j].keys.sort.each{|key|
            ataiOya =  $l[j-1][$l[j-1][key].to_i]; ataiKo = $l[j][key]
            if ataiOya !~ /\d\d?\d?$/ && ataiKo !~ /\d\d?\d?$/ 
#dbg          puts ataiOya+"\n"+ataiKo;$l[j-1][$l[j-1][key]] << "<dl>" + $l[j][key].to_s +"</dl>";#if ataiOya !~ %r(<hr>) then $l[j-1][$l[j-1][key]] << "<hr>" end
#               $l[j-1][$l[j-1][key].to_i].concat
              $l[j-1][$l[j-1][key].to_i].to_s << prefixT+ $l[j][key].to_s + "</dl>" #opt  (lN)のl(N-1)元要素をnil/empty
            end
          }
          j = j-1; 
          if j.abs > layors then 
            break 
          else
      #dbg puts "="*40+"layor="+(layors+j-1).to_s;puts $l[j-1].keys;puts "-"*40+"j="+j.to_s;$l[j].keys.each{|el| puts " "*4+el };puts "-"*40
          end
        end
        #index-only-deletion
        $l[0].merge!($l[1]){|key, val1, val2| nil };$l[0].reject!{|key, value| value == nil}
      end
      #------------------------------------------------------------------------------------------------------------------------------
      if $levelM >2 #参照先がフィルターずみのハッシュ要素をけす。tree構築関数でやると、HTMLみだれてむずかしい。PG:
         $l[0].each{|key, value| 
          aryReferrer = value.scan($rx_link)
          if aryReferrer.length > 0 && key >3 then
            anchor = aryReferrer[0].slice(/\d+/).to_i;#dbg puts "key-ref=" +key.to_s+aryReferrer[0]
            if $l[0][anchor]==nil then $l[0].delete(key) end # $l[0][key]="</dd><dt>DUMMY</dt><dd>";
          end
        }
      end
			#craps言葉遊び行別配列化#top3 themeを対比
#       taihitop=Array.new(3);
#         taihitop[1]=$l[0][1] #       if $l[0][2].grep(/<br \/>/).length >1 then 
#         taihitop[2]=$l[0][2] #end #       if $l[0][3].grep(/<br \/>/).length >1 then 
#         taihitop[3]=$l[0][3] #end
      taihifinish=$l[0][1001];$l[0].delete(1001)
#     $clm.hs_2hCommentShori(//,//,"","",spacer,"") 
      #------------------------------------------------------------------------------------------------------------------------------
      if ARGV[4]=="mobile" && url =~/unkar.jp/
        tmpstr="<html lang=\"ja\">\n<head>\n<meta content=\"text/html\; charset=utf-8\" http-equiv=\"content-type\" \/>\n<meta content=\"text\/javascript\" http-equiv=\"content-script-type\" \/>"
        tmpstr<< erb_header.scan(%r(<title>.+</title>)).to_s
        tmpstr<< "</head>\n<li><a href=\"#hip\">最新</a></li>"
        tmpstr<< erb_header.scan(%r(<li><a href="http://.+">.+</a></li>)).to_s
        tmpstr<< erb_header.scan(%r(<h1>.+</h1>)).to_s
#         erb_header=tmpstr.gsub!(/<br *\/>/m,'')
      end
      $outHTML<< erb_header+"\n<table width=10000><td>\n";  #PG:<table...td>じゃないとFFOXでうまく横幅広がらない。trやx-froatだとだめ。
#       if url =~/hozen.org/ 
#       strA="<a name=\"R1\"><a name=\"R2\"><a name=\"R3\">"
#         elsif url =~/unkar.jp/
#       strA="<dt id=\"l1\">" #<dt id=\"l2\"><dt id=\"l3\">"
#       else	#2ch.net
#         strA="<a name=\"1\"><a name=\"2\"><a name=\"3\">"
#       end
      str1=$l[0][1].to_s;str2=$l[0][2].to_s;str3=$l[0][3].to_s
      str1s=str1.split(/<dl>/);str2s=str2.split(/<dl>/);str3s=str3.split(/<dl>/)
#       taihitop<< str1.slice(/(.+)<dl>/m,1).to_s+str2.slice(/(.+)<dl>/m,1).to_s+str3.slice(/(.+)<dl>/m,1).to_s
      taihitop= String.new;taihitop<< str1s[0].to_s+str2s[0].to_s+str3s[0].to_s
#       taihitop<< str1[0].to_s+str2[0].to_s+str3[0].to_s
      if str1s[1] !=nil then taihitop<< str1.slice(/<dl>.+/m) end
      if str2s[2] !=nil then taihitop<< str2.slice(/<dl>.+/m) end
      if str3s[3] !=nil then taihitop<< str3.slice(/<dl>.+/m) end
#       taihitop<< str1.slice(/<dl>.+/m).to_s #"<dl>"+str1[1]+"</dl\">" end
#       taihitop<< str2.slice(/<dl>.+/m).to_s  #"<dl>"+str1[1]+"</dl\">" end
#       taihitop<< str3.slice(/<dl>.+/m).to_s  #"<dl>"+str1[1]+"</dl\">" end
      $l[0].delete(0);$l[0].delete(1) ;$l[0].delete(2);$l[0].delete(3) 
      $outHTML<< taihitop.to_s + "\n</dd>\n" #PG:hash値だけの出力はprintで
      #------------------------------------------------------------------------------------------------------------------------------
			if $levelM>1
        hs_aa=$clm.hs_2hCommentShori(rx_aa,nil," ","",spacer,"nostdout") 
        #参考情報フィルター
        hs_ref=$clm.hs_2hCommentShori(rx_ref,nil,"追加資料","",spacer,"nostdout") 
        hs_chart=$clm.hs_2hCommentShori(rx_chart,/(＞＜|ノ)/,"記号で指摘・図解","",spacer,"nostdout") 
        hs_mame=$clm.hs_2hCommentShori(/(?:ちなみに|因みに|参考ま?で?に?|まめ知識|豆知識|豆.?.?な)/,nil,"ﾏﾒ知識","",spacer,"nostdout") 
        #ゴミノイズフィルター
        rx_tokua=/(?:ジャップ|棒子|虫国|密入国.{1,4}人|中共|日本.+孤立化|ヒトモドキ|火病|三国人|ファビョ|ホルホル|哀号|アイゴ-|ニダ|ﾆﾀﾞ|チョン|キムチ|ニカ|ﾆｶ|HIDEYOSHI|姦国|ﾎﾙﾎﾙ|ｳｪｰﾊｯﾊｯ|白丁|倭奴|倭猪|倭豚|倭猿|チョッパリ|ﾁｮｯﾊﾟﾘ|阪民[国団]|民譚|総連|パチン|鮮玉入|嘗糞|ホンタク|病身舞|コレコレア|金朴李|テコンV|ロスケ|露助|支那|シナ|チャンコロ|｀ハ´|小日本|トンキン|頭狂[人都]|ウリナラ|シナチョン|FUC|ｱｲｺﾞ)/i
#         hs_tokua=$clm.hs_2hCommentShori(rx_tokua,rx_ref," ","",spacer,"nostdout") 
        hs_tokua=$clm.hs_2hCommentShori(rx_tokua,nil," ","",spacer,"nostdout") 
        if $levelM <3
          hs_label=$clm.hs_2hCommentShori( rx_label,nil,"レッテル派","",spacer,"nostdout") 
        end
        if header.slice(/title>.+<\/title/).slice(/(?:中国|韓|朝|鮮|チャイナ|LG|サム.ン)/) == nil 
          rx_tokua2=/(?:中国|韓|朝鮮|特ア|特亜|特定ア|在日|コリア|チャイナ|チャイニ|三星|サムスン|LG|ヒュンダイ|ハイアール|ファーウェイ)/
          hs_tokua_non4plus=$clm.hs_2hCommentShori(rx_tokua2,nil," ","",spacer,"nostdout") 
        end
#       end
        if hs_tokua==nil then hs_tokua=Hash.new end;if hs_tokua_non4plus==nil then hs_tokua_non4plus=Hash.new end
        hs_tokua.update(hs_tokua_non4plus);
        rx_kokuzoku=/(?:バカヒ|経団連|念仏平和主義|空想的|マスゴミ|茶坊主|アカヒ|ネット朝日|侮日|売日|南京.+殺|慰安婦問題|マッチポン|ナベツネ|押し?紙|TBS|ＴＢＳ|犬HK|犬ＨＫ|9条|９条|プロ市民|売国|国賊|紅野|エロ拓|二階|歯科医師会|使途不明金)/ #団塊|
          hs_zoku=$clm.hs_2hCommentShori(rx_kokuzoku,nil," ","",spacer,"nostdout") 
#         if $levelM <3
          hs_ero=$clm.hs_2hCommentShori(rx_ero,nil," ","",spacer,"nostdout") 
          hs_zako=$clm.hs_2hCommentShori(rx_zako,nil," ","",spacer,"nostdout")#|\!\!\!
#         end
        rx_omoni=/(?:ジジババ|公務員|特殊法人|人天国|員天国|老害|士天国|文系|天下り)/;hs_omoni=$clm.hs_2hCommentShori(rx_omoni,nil," ","",spacer,"nostdout") 

        #参考情報フィルター
        $clm.hs_2hCommentShori(rx_ref,nil,"追加資料","",spacer,hs_ref)
        $clm.hs_2hCommentShori(rx_chart,nil,"記号で指摘・図解","",spacer,hs_chart)
        $clm.hs_2hCommentShori(/(?:ちなみに|因みに|参考ま?で?に?|まめ知識|豆知識|豆.?.?な)/,nil,"ﾏﾒ知識","",spacer,hs_mame)
        #アドバイスフィルター
        rx_point=/(?:が要点|がカギ|-完-|がミソ|が味噌|禁物|答えは|気をつけ|用心|準備|留意|そもそも|注意|がポイント|大事だ|要は.+事|要は.+こと|が結論|で結論|解決.?法|至言|名言|格言|天才|その発想はなか|名案|単に.+だけ。?\s)/#|勿体.い|もったい|はヤバ|らヤバ
          $clm.hs_2hCommentShori(rx_point,nil,"結論と要点とidea","",spacer,"") 
        rx_wake=/(?:=.+=|＝.+＝|%|％|わけで|だからである|るから|せいで|おかげで|理屈|理由|効果|効率|要素|要因|関係|原因|\*.+br.+\*.+\*|･.+br.+･.+･|・.+br.+・.+・|1\..+2\..+3\.|1\).+2\).+3\)|①.+②.+③.+|論拠)/
          $clm.hs_2hCommentShori(rx_wake,/ｳﾝｺ/,"理路と列挙","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:廃止|撤廃|契約|約束|確約|脱退|違法|合法|許可|認可|認定|審査|監査|監督|検査|検収|予防|措置|臨検|検定|管理|不法|摘発|没収|徴収|刑|処罰|罰金|罰則|褒.金|逮捕|取り締|規則|ルール|罷免|解任|更迭|改訂|改正|制定|策定|決議|議決)/,nil,"法と体制と契約","",spacer,"") 
#         if header.slice(/bizplus/) == nil
          $clm.hs_2hCommentShori(/(?:株|投資|値崩|経済的な|割安|割高|コスト|原価|償却|投機|価格|建値|採算|収支|安.?上)/,nil,"資金運用関係","",spacer,"") 
#         end
        $clm.hs_2hCommentShori(/(?:しよう.?.?.?\s|しよーぜ|ろうぜ.?.?.?\s|通報|ましょう.?.?.?\s)/,nil,"よびかけ","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:が|ら|ば|て|れ)(ほしい|欲しい|売れる|買う|くれ.?.?.?)。?\s/,nil,"要望","",spacer,"") 
        rx_koji=/(?:するな|せよ.?.?.?\s|が.うな|爪の垢|お願いだから|がマシ|いいのに|なさい|ええやん|ればいい|の方が|ほうが|かったのに|次は|つぎは|のが先|優先|先決|条件|前提|まず|えろ|きろ|けろ|しろ|じろ|せろ|ぜろ|ちろ|てろ|ねろ|びろ|りろ|れろ|汁.?\s|てもらえ|てやれ.?.?.?\s|だせよ|出せ.?.?.?\s)/
        $clm.hs_2hCommentShori(/(?:マナー|モラル|礼儀|エチケット|作法|下品|品位|品格|民度)/,nil,"品行と品格","",spacer,"") #yet-in-help
          $clm.hs_2hCommentShori(rx_koji,nil,"一言居士","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:オチ|がアップを始め|予感|期待.?\s|予測|予言|そのうち|明日|来週|来月|来年|年後|ますます|しそうだ|たりして|と化す.+ろ|になる.+ろ|に.+ペリカ|に.+ペソ)/,/そのうちの/,"予言的","",spacer,"") 
        #評価フィルター
        $clm.hs_2hCommentShori(/(?:英断|素晴らしい|これはいい|悪くない|ありがたい|ナイス|いいことだ|いいぞもっと|うまい|上手い|いい選別|いい判断|GJ|ＧＪ|おもしろい.?.?.?\s|面白い.?.?.?\s|いいな.?.?.?\s|いいね.?.?.?\s|くやった|最高です.?.?.?\s|がんばれ.?.?.?\s|頑張れ.?.?.?\s|乙.?.?.?\s)/,nil,"Positive","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:でいいや|でいいじゃん|で十分|静観|模様眺め|様子見|以外なら.{1,10}|ただし.+、|ただし.{1,20}。|※ただし)/,nil,"静観または留保派","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:かっこ悪.*\s|だっさ|恥ずかしい|はずかしい|ナウい|デザイン.+ぎ|ダサい.?\s)/,nil,"外見・外聞派","",spacer,"") 
        if $levelM <4
          $clm.hs_2hCommentShori( rx_nega,nil,"Negaive","",spacer,"") 
          $clm.hs_2hCommentShori(rx_yahi,nil,"不愉快千万","",spacer,"") 
          $clm.hs_2hCommentShori(rx_negaZokusei,nil,"経緯がNegaive","",spacer,"") 
          $clm.hs_2hCommentShori(rx_akiaki,nil,"うんざり派","",spacer,"") 
          $clm.hs_2hCommentShori(rx_inori,nil,"いのり","",spacer,"") 
        end
        #
        #帰納演繹用フィルター
#         hs_data2=$clm.hs_2hCommentShori(/(メガ|MB|GB|bps|ｂｐｓ|ギガ|テラ|ペタ|リットル|リッター|\/h|kg|キロ|社|時速|時給|換算|年|月|週).*[\d+一二三四五六七八九十百千万億兆０-９]/,nil,"Data","",spacer,"nostdout") 
        hs_data1=$clm.hs_2hCommentShori(/<\/dt><dd>.*[\d+一二三四五六七八九十百千万億兆０-９](?:メガ|G|M|T|B|bps|ｂｐｓ|ギガ|テラ|ペタ|リットル|リッター|\/h|kg|キロ|換算|月|週)/,nil,"Data","",spacer,"nostdout") 
#           if hs_data1==nil then hs_data1=Hash.new end;
#           if hs_data2==nil then hs_data2=Hash.new end;hs_data1.update(hs_data2)
          $clm.hs_2hCommentShori(nil,nil,"Data","",spacer,hs_data1);
        $clm.hs_2hCommentShori(/(?:アルカリ|酸性|排泄|免疫|菌|抗生|粘膜|歯周|発がん|発ガン|発癌|タンパク|蛋白|プロテイン|感染|エンザイム|酵素|ビタミン|バイオフィル)/,nil,"生化学","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:次亜|クエン酸|ハイター|炭酸水|イソジン|重曹|フッ素|水道水)/,nil,"キッチン化学","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:自分|私|俺|オレ|近所)の.*(?:周|会社|同僚|近)?.+(?:る|い|た.+た)/,nil,"みぢかな事例","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:日本だと|日本から見|ドリフ)/,/ドリフト/,"日本で例示","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:欧州|欧米|海外|外国|英米|北米|ヨーロッパ)(?:と|だと|から見|じゃ)/,nil,"海外で例示","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:ジェンガ|黒ヒゲ危|ルーレット|ドミノ|ファミコン|スーファミ|セガサターン|スーパーマリオ|チキンレース|ポーカー|麻雀|マージャン|将棋|碁|ｼﾞｪﾝｶﾞ)/,nil,"ゲームで例示","",spacer,"") 
#template         $clm.hs_2hCommentShori(()/(だと|から見|じゃ)/,nil,"で例示","",spacer,"") 
        $clm.hs_2hCommentShori(/(?:年|時代|古代|世代|中世|昔|上古|紀元前|\d+世紀)/,/(?:強時代|年のせい)/,"時代や年代について","",spacer,"") 
        if $levelM <4
          $clm.hs_2hCommentShori(rx_tosi,nil,"歳について","",spacer,"") 
        end
        $clm.hs_2hCommentShori(/(?:似て|にしか見え| そういや| そう...?えば| なんという|思い出した.?.?.?\s|連想|なもんだろ|みたいなも|みたい.?.?.?\s|同レベルだ.?\s|大差ない.?\s|同等だ.?\s|と同じ|ような.?\s|様...?.?.?.?\s|ようだ.?.?.?\s)/,nil,"連想","",spacer,"") 
        #よしなしごとフィルター
        
        hs_about=$clm.hs_2hCommentShori(rx_about,nil," ","",spacer,"nostdout") 
        if $levelM<4
          $clm.hs_2hCommentShori(rx_guess,nil, "だろ・かも・でしょ","",spacer,"") 
          $clm.hs_2hCommentShori(rx_hatena,nil,"疑問符つき","",spacer,"") 
          $clm.hs_2hCommentShori(nil,nil,"<a href='http://anond.hatelabo.jp/20071204193149'>概論派</a>","",spacer,hs_about) 
#         else
#           hs_hatena=$clm.hs_2hCommentShori(rx_hatena,nil,"疑問符つき","",spacer,"nostdout") 
        end
        $clm.hs_2hCommentShori(/(?:べき|べし|べからず)/,nil,"べし","",spacer,"") 
        #ざれごとフィルター
        if $ita_toua==true
          if header.slice(/title>.+<\/title/).slice(/(?:ロシア|露|北方)/) != nil 
            hs_putin=$clm.hs_2hCommentShori(/(?:プーチン|命がな|毒盛|医者|粛清|消され|殺され|死ぬ|KGB)/,nil,"プーチン","",spacer,"nostdout") 
          end
          if header.slice(/title>.+<\/title/).slice(/(?:放火|国技|レイプ|強姦|暴行)/) == nil 
            $clm.hs_2hCommentShori(/(?:放火|国技|レイプ|強姦|暴行)/,nil,"韓国国技","",spacer,"") 
          end
        end
        if $levelM<4
          if header.slice(/title>.+<\/title/).slice(/(?:エヴァ|ガンダム|使徒|死海文書)/) == nil 
            hs_gundam=$clm.hs_2hCommentShori(rx_gundam,nil,"アニメ","",spacer,"nostdout") 
          end
        end
        hs_tubuyaki=$clm.hs_2hCommentShori(/性欲/, nil,"性欲","",spacer,"") 
        hs_tubuyaki=$clm.hs_2hCommentShori(/./, /(?:は|が|よ、)/,"主語不明のつぶやき程度","",spacer,"nostdout") 
      end
      #-----------------------------------------------------
      #         $outHTML<< "\n</dd>\n"
      #template         $clm.hs_2hCommentShori(/(.?\s|.?\s|)/,nil,"--","",spacer,"") 
      #template         $clm.hs_2hCommentShori(/()/,nil,"派","",spacer,"") 
      #         spacer="\n<br/><br/>" #opt vim-editing-mode=no-spaeer   spacer="\n</dd>"
      #id="xxx"mode --->ARGV[n]="xxx"---> 要約
      #未分類ジャンプリンクをヘッダーに
      #show ranking checkboxes #insert ranking into DBtable & update (CRUD)
      #opt  $outHTML<< "\n<%= hidden_field_tag :referer, (params[:referer] || request.env['HTTP_REFERER']) %> "
			#opt calc pollute-ratio into r2chnns.obj; 
      if $l[0].length >0 
        if $levelM >1 then $outHTML<< "\n</dd><hr><h3>未分類</h3><dd>\n"end
        h2 = $l[0].sort_by{|key,value| key}; h2.each{|key,value| $outHTML<< spacer+value}#PG*sortするとarray-colectionになりkey消滅する
        $outHTML<< "\n</dd>\n" ;h2.clear;
        ##-----------------------------------------------------
      end
        strTokuaLink="<a href='http://namidame.2ch.net/pachi/'> ﾊﾟﾁﾝｺｻﾛﾝ</a>
              <a href='http://namidame.2ch.net/pachij/'> ｽﾛｯﾄｻﾛﾝ</a>
              <a href='http://namidame.2ch.net/venture/'> ﾍﾞﾝﾁｬｰ</a>
              <a href='http://machi.to/'> まちBBS</a>
              <a href='http://namonakishimin.web.fc2.com/'> 名もなき市民の会</a>
              <a href='http://www.geocities.jp/monthlynucleus/'> 核抑止力</a>　"
#               <a href='http://'></a>
#               <a href='http://'>Turkistan</a>
#               <a href='http://'>Tibet</a>
#               <a href='http://'>Viet-nam-rape-victim</a>
#             strTokuaSectionHD<<"\n<small>[実弾補給:"+strTokuaLink
        strUtopianLink="<a href='http://namidame.2ch.net/recruit/'> 就職</a>
              <a href='http://changi.2ch.net/job/'> 転職</a>　"
        strCommonLink="\n<a href='http://www35.atwiki.jp/kolia/'> 反日工作と対策まとめ</a>
              <a href='http://h8comyac.web.fc2.com/'> 不買運動まとめ</a>
              <a href='http://townmarket.jp/MP/touroku/'> 無料宅配のﾁﾗｼとTV番組表</a>
              <a href='http://www.sankei.co.jp/netview/'> 新聞月額315円</a>
              <a href='http://www.nicovideo.jp/watch/sm7040601'> 50円でNHK解約</a>
              <a href='http://hideyoshi.2ch.net/ms/'> 既婚女性板</a>
              <a href='http://society6.2ch.net/mayor/'> 地方自治</a>
              <a href='http://society6.2ch.net/koumu/'> 公務員</a>
              <a href='http://namidame.2ch.net/edu/'> 教育</a>
              <a href='http://gimpo.2ch.net/cafe50/'> 60歳以上</a>
              <a href='http://dubai.2ch.net/cafe60/'> 50歳以上</a> "
#               "<a href='http://seiji.rakuten.co.jp'>楽天政治献金決済代行</a> "
			if $levelM >1
        if $levelM <4
          $clm.hs_2hCommentShori(nil,nil,"主語不明のつぶやき程度","",spacer,hs_tubuyaki) 
        end
        if $levelM <3
          $clm.hs_2hCommentShori(nil,nil,"<a href='http://anond.hatelabo.jp/20071204193149'>思考停止</a>・他力本願・ｗ笑ｗ(備考:三行要約依頼は外国人かも)<br/>","",spacer,hs_zako) 
          $clm.hs_2hCommentShori(nil,nil,"<a href='http://www.hi-ho.ne.jp/inverse/kibennogaidorain.htm'>レッテル派</a>","",spacer,hs_label)
          $clm.hs_2hCommentShori(nil,nil,"Erotic<br/>","",spacer,hs_ero) 
          $clm.hs_2hCommentShori(rx_gundam,nil,"アニメで例示","",spacer,hs_gundam)
          $clm.hs_2hCommentShori(nil,nil,"プーチン","",spacer,hs_putin) 
        end
        $clm.hs_2hCommentShori(nil,nil,"UNICODE ART<br/>","",spacer,hs_aa) 
        strHeader1="font";strHeader2=" size='+1'" #        strHeader1="h2";strHeader2="" #        <a href=''></a>
        strOmoniSectionHD="\n<"+strHeader1+strHeader2+">構造問題:老人,腐敗公務員,教育</"+strHeader1+">"
          strOmoniSectionSubHD="\n<small>[情報共有:"+strCommonLink+strUtopianLink+"]</small>\n"
          i_omoni=$clm.hs_2hCommentShori(nil,nil,strOmoniSectionHD,strOmoniSectionSubHD,spacer,hs_omoni) 
        if $ita_toua !=true then strTokuaCaption=">敵性国がらみ(罵詈雑言あり)</" else strTokuaCaption=">罵詈雑言あり</" end  
        strTokuaSectionHD="\n<"+strHeader1+strHeader2+strTokuaCaption+strHeader1+">"
            strTokuaSectionSubHD="\n<small>[情報共有:"+strTokuaLink+strCommonLink+"]</small>\n"
          $clm.hs_2hCommentShori(nil,nil,strTokuaSectionHD,strTokuaSectionSubHD,spacer,hs_tokua) 
        strKokuzokuSectionHD="\n<"+strHeader1+strHeader2+">外国買弁や高等遊民,虚業家について</"+strHeader1+">"
          strKokuzokuSectionSubHD="\n<small>[情報共有:"+strUtopianLink+strCommonLink+"]</small>\n"
          i_tokuaRegime=$clm.hs_2hCommentShori(nil,nil,strKokuzokuSectionHD,strKokuzokuSectionSubHD,spacer,hs_zoku)
			end
      if taihifinish !=nil then $outHTML<< taihifinish end;
      if $ita_toua==true && i_tokuaRegime == nil
        $outHTML<< "\n<hr>[情報共有:"+strTokuaLink+strUtopianLink+strCommonLink+"]</dl>\n"
      end
      if url =~/hozen.org/ then strdum="</dd></dl></dd></dl>" else strdum="" end
      #おすすめ2ch
      footer.gsub!(/l50x/,"")
#yobi     footer.scan(/<a href=\"http.+read.cgi.+l50x/).each{|i|
#       iurl2=i.gsub(/(<a href="|l50.*)/,'')
#       footer.sub!('<a href="'+iurl2+'l50x','<a href="r2chnns/readurl/'+$levelM.to_s+'/'+iurl2)
        #footer.sub!('<a href="'+iurl2+'l50x','<a href="http://mheo.moe.hm/r2chnns/readurl/'+$levelM.to_s+'/'+iurl2)
        #footer.sub!('<a href="'+iurl2+'l50x','<a href="localhost/r2chnns/readurl/'+$levelM.to_s+'/'+iurl2)
#     }
      if url !~/hozen.org/ && url !~/unkar.jp/ then $outHTML<< strdum+"\n</dt></table>\n<hr>"+footer+"\n" end #yobi $outHTML<< "\n"+erb_footer+"\n" #$outHTML<< footer
      #PG:<table...td>じゃないとFFOXでうまく横幅広がらない。trやx-froatだとだめ。

      if ARGV[4]=="mobile" then 
#       $outHTML.sub!(/<font size="-1"/,"</font><font size='-2'>")
        if url =~/hozen.org/ 
          $outHTML.sub!(/<a name="R1">/,"<font size='-2'><a name=\"R1\">"); 
        elsif url =~/unkar.jp/
          $outHTML.sub!(/<dt id="l1">/,"<font size='-2'><dt id=\"l1\">"); 
#           $outHTML.gsub!(/<script .+\/script>/,'')
        else  #2ch.net
          $outHTML.sub!(/<div style=/,"<font size='-2'><div style="); 
        end

        $outHTML.gsub!(/<font size=\W+1\W/,"<font ");$outHTML.sub!(/<h1 style=/,"<h6 style=");$outHTML.sub!(/<\/h1>/,"</h6>")
        $outHTML.sub!(/<\/body/,"</font></body>")
        #opt defize
        if url !~/hozen.org/ && url !~/unkar.jp/
#           threadpath1=threadpath.sub(/<a href=\"../,'')
#           threadpath2=threadpath.sub(/<a href=\".+read.cgi/,'http://c.2ch.net/test/-')
#           $outHTML.gsub!(%r(#{threadpath1}), threadpath2) #http://c.2ch.net/test/-/
          #/l50--->i/n /-100 --->/1-   href="./" --> href="../i"  href="http://2ch.net/" -- href="http://c.2ch.net/"
          $outHTML.gsub!(/\/+l50\">最新50/m,"/n\">最新50")
          $outHTML.gsub!(/\/+-100\">1-</m,"/1-\">1-<")
          
          iurl=url.gsub(/(.+read.cgi|l50.*)/,'')
          #mae  $outHTML.gsub!(/<a href=\".+read.cgi/,'<a href="http://c.2ch.net/test/-')
          $outHTML.gsub!(%r(<a href="#{url}),'<a href="http://c.2ch.net/test/-'+iurl)
          $outHTML.sub!("href=\"http://2ch.net/","href=\"http://c.2ch.net/")
          $outHTML.gsub!("href=\"./\"","href=\"..\/i")
          #dbg puts $outHTML.grep(%r(#{threadpath2}))
          #<a href="http://2ch.net/">２ちゃんねる</a>
            #<a href="./">■掲示板に戻る■</a>
            #<a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/">全部</a>
            #<a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/-100">1-</a>
            #<a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/l50">最新50</a>
            #<center><a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/117n-">新着レスの表示と追記</a></center>
            #<a href="./">掲示板に戻る</a>
            #<a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/">全部</a>
            #<a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/1-1">前100</a>
            #<a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/117-117">次100</a>
            #<a href="http://gimpo.2ch.net/test/read.cgi/scienceplus/1250905717/l50">最新50と追記</a>
          # i-mode 2ch LINK
            # <a href=#b accesskey=8>下</a>
            # <a name=b></a><a href=#u accesskey=2>上</a>

            # <a href=1- accesskey=7>前</a><a href=2- accesskey=9>次</a>
            # <a href=n accesskey=3>新</a>
            # <a href=w accesskey=4>書</a>
            # <a href=c accesskey=5>写</a>
            # <a href=../i accesskey=6>板</a>
            # <a href=../../../../00.p/-/i accesskey=0>覧</a>
            # <a href=C accesskey=*>設</a>
            # <a href=a>AA</a><br>
        end
      end
#-----------------------------------------------------------------------------------------------------------------
    elsif ARGV[0] =~ /watch/ 
      $outdir=Dir.pwd; 
      outfile=$outdir+"/miracle.html"
      if ARGV[0] =~ /miracle/ 
        inifile=$outdir+"/movie_image/initWrapper.sh"
#opt       cnt=$clm.readINI(inifile,"r","last-counter","")
        if ARGV[1] != nil then cnt=ARGV[1].to_i else cnt=1611 end
        File.open(outfile, "w+b", 0644){|f| f.write("<html><body>") }	
        dl_linkMatome=Array.new
        while true do
          #opt basic認証突破
          url="http://sample.babyblue100.com/main_files/movie/#{cnt}.htm";puts "analyzing URL:"+url
          begin
            tmp=$agent.get(url)
          rescue #SystemCallError 
            cnt=cnt+1; break #next 
          end 
          if tmp then objRoot=tmp.root end 
          page=NKF.nkf("-S -x -w -m0" , objRoot.to_html)
          page.sub!(/.*moviefiles.gif/m,%q(<table cellspacing="2" border="0" cellpadding="1" width="100%"><tr><td><img src="../../assets/moviefiles.gif"));
          page.sub!(/<tr>\s*<td>\s*<br \/><iframe.*/m,"");
          suji=page.scan(/【.*】/);ary_i=[];plots=[];
          rx_NG =/(?:３Ｐ|４Ｐ|５Ｐ|\dp|乱交|レイプ|女子高|コスプレ|白衣|ナース|パイパン|ぶっかけ|ロリ|JK|ＪＫ|萌え)/
          for i in suji do
            if i=~ /(?:６９|69|ハメ撮|本番)/ && i !~ rx_NG then ary_i<<suji.index(i) ;plots<<i end
          end
          pics=page.scan(/http.*image.*jpg/);title=page.scan(/■\S*<\/p>/)[0..5].to_s.gsub("</p>","")  #title= NKF.nkf("-S -x -w -m0" , objRoot.to_plain_text)
          if ary_i.size ==0 || title =~rx_NG then cnt=cnt+1;next end
          links=[];links<<pics[0]
          picHTML=page.scan(/<.*image.*>/);strA="http://img.babyblue100.com/";strB="./"
          picHTMLs=[];picHTMLs<<picHTML[0].sub(strA,strB)
          dlref=page.scan(/<.*href.*>/);dlrefs=[];
          for i in ary_i do 
            links<<pics[i*3+1];links<<pics[i*3+2];links<<pics[i*3+3] 
            picHTMLs<<picHTML[i*3+1].sub(strA,strB);picHTMLs<<picHTML[i*3+2].sub(strA,strB);picHTMLs<<picHTML[i*3+3].sub(strA,strB)
            tmpstr="http://sample.babyblue100.com/main_files/movie/download.php?fn=#{cnt}_#{i+1}";dl_linkMatome<<tmpstr+"<br/>"
            dlrefs<<"<a href=\""+tmpstr+"\">DL#{i+1}　</a>"
          end
          s=[];s<< "<table><tr>"+title+plots.to_s<<(dlrefs+picHTMLs);s<<"</tr></table>"
          File.open(outfile, "a+b", 0644){|f| f.write(s) }	
          #DOWLOADE THUMBNAIL
          for link in links do $clm.getfilefromURL(link,80,"write",$outdir) end
          cnt=cnt+1
        end
      s=[];s<<"\n<hr>DLlink=<br/>\n";s<< dl_linkMatome;s<<"<hr></body></html>"
      File.open(outfile, "a+b", 0644){|f| f.write(s) }	
    elsif ARGV[0] =~ /dailyDL/ 
      require './VB2RB/modSTD.rb'
			#iniファイルhotlistを標準入力からよみこむ
      tgtary=[];mod=ModSTD.new;
      ary_babyblueINI    = mod.readFile_to1DArray(tgtary, "./movie_image/lastcounter", "", nil)#inifile
      ary_babyblueHOTLIST= mod.readFile_to1DArray(tgtary, outfile, "", nil)[2].split("<br/>")
      i_lastDLURL        = ary_babyblueHOTLIST.index(ary_babyblueINI[0]).to_i
      if i_lastDLURL == nil then i_lastDLURL=0 end
      yetVisitURLs=ary_babyblueHOTLIST[i_lastDLURL..-1]
      #認証mehanize突破できない
      $agent.auth('', 'sweet') ;$agent.user_agent_alias = 'Linux Mozilla'; 
      yetVisitURLs.each{|url|
#NG     doc =($agent.get("http://sample.babyblue100.com/main_files/movie/1656.htm").root) #dbg  puts doc.to_plain_text.toutf8
#NG     doc =($agent.get(url).root) #dbg  puts doc.to_plain_text.toutf8
#NG     $agent.click((doc/:a)[-4]);
#NG     page = $agent.get((doc/:a)[-4])
        #上のどれでも　直のDLリンクをgetすると　cookieを有効にしてください、
        #上のどれでも　WWW::Mechanize::ResponseCodeError Exception: 401 => Net::HTTPUnauthorized　がかえってくる
        ret = Scraper.new.downloadAfterBasicAuth(url, "","sweet")
        #updaate INIfile 
        #http://sample.babyblue100.com/main_files/movie/download.php?fn=1586_2
      }
#       fileary.each{|line| #         if line =~/^\./ #         else #         end #       }
      #automonitor of pw @ pinkbbs
    elsif ARGV[0] =~ /watchRefresh/    #<----------------cron 
      url="http://mheo.moe.hm/r2chnns/refresh/1"
      doc= Scraper.new.getfilefromURL(url,80,"r2chnn","")
    elsif ARGV[0] =~ /KoiNews/    #<----------------cron ruby /home/you/RoRapps/2chnrg/lib/scraper.rb watchKoiNews

      url_tenki='http://weather.nifty.com/cs/catalog/weather_pinpoint/catalog_13103_1.htm'
      sn=Scraper.new
      doc= sn.getfilefromURL(url_tenki,80,"fetch","");doc=(doc/"#mainPinPoint"); (doc/:span).remove;
      $NifTenkiTxt=doc.inner_text.toutf8.gsub(/\s\s/,"").gsub(/((今日|明日|0時|週間天気|気温|降水量|風向|天気降水))/,"\n\\1")
      $NifTenkiTxt=$NifTenkiTxt.gsub(/(\d+)日/,'\\1').gsub(/(時|m|（|）|℃)/,'').gsub('％','%').gsub('東','E').gsub('西','W').gsub('南','S').gsub('北','N')
      tenkiHline=$NifTenkiTxt.grep(/気温・降水確率.+/)[0].gsub(/(\t| |気温・)/,'').sub(/%/,'% ').chomp+ $NifTenkiTxt.grep(/天気降水確率.+/)[0].gsub(/天気降水確率/,' 以後は')
      $NifTenkiTxt=$NifTenkiTxt.gsub(/\s\s/,"").gsub(/((今日|明日|0時|週間天気|気温|降水量|風向|天気降水))/,"\n\\1")
#       url="http://mheo.moe.hm/r2chnns/index/category=2nn-hatena-fresh&recPP=100&query=&ptn=&order=ASC&sort=kisha"
#       url="http://mheo.moe.hm/r2chnns/index/category=2nn-hatena-fresh&sort=time&order=DESC&recPP=400"
#       url="http://mheo.moe.hm/r2chnns/index/category=crazy-hatena&sort=sbm&order=DESC&recPP=1000"

      url="http://mheo.moe.hm/r2chnns/index/category=crazy-hatena&sort=time&order=DESC&recPP=1000"
      doc= Scraper.new.getfilefromURL(url,80,"r2chnn","");
      str2=doc.to_plain_text.gsub(/^ +/," ").gsub(/\[[\-\?\/\w %_:=&.]+.+\]/,"") #.gsub(/▼.*▼/,"")
      str2=str2.split("Remix2chNN")[2].split("1次ｿｰｽ")[1];
      str2=str2.gsub(/(http:..www.2nn.jp.search.\?q=|【.+】|R2\s*生\s*\n)/,"").gsub(/\n\n+/,"\n")
      str2=str2.gsub(/\n/,"").gsub(/\d\d\d\d\//,"\n").gsub(/ \d+ +\[/,"[").gsub(/( |\t)+/," ").gsub(/ﾊﾟﾁﾝｺ.+/,"")
      str2=str2.gsub(/(R2 |^\d\d\/)/,"")
      if str2=~/はてな/ then str2=str2.gsub(/はてな hotentry/,"?B") end
      koinews=str2
      forex=str2.split(/株ｶﾜｾ/)[1]
      forexHline=forex.sub(/.+米ドル円/,'USD').sub(/ユーロ円/,'EUR')

#       url="http://localhost/yahoo-apartment-search.html"
#       url="http://rent.realestate.yahoo.co.jp/bin/rsearch?lc=03&md=wd&p=%C5%EC%B5%FE&submit=%B8%A1%BA%F7&from=0&to=25000&lo=0"
#       url="http://rent.realestate.yahoo.co.jp/bin/rsearch?lc=03&from=0&to=25000&spfrom=0&spto=0&inc=1&lo=1&wlk=0&yr=0&con=gr&god=1&md=con&pf=13&submit_x=60&submit_y=104&ln=2196&ln=2172&ln=2349&ln=2332&request=type%3Drent%26show%3D20%26md%3Dcon%26lc%3D03%26pf%3D13%26ln%3D2196%26ln%3D2172%26ln%3D2349%26ln%3D2332%26from%3D0%26to%3D25000%26inc%3D1%26nc%3D0%26lo%3D1%26spfrom%3D0%26spto%3D0%26yr%3D0%26wlk%3D0%26con%3Dgr%26god%3D1%26p%3D%26so%3D0%26rev%3D0&disp=0"
      url="http://rent.realestate.yahoo.co.jp/bin/rsearch?lc=03&from=0&to=25000&spfrom=0&spto=0&inc=1&lo=1&wlk=0&yr=0&con=gr&god=1&md=con&pf=13&submit.x=60&submit.y=104&ln=2196&ln=2172&ln=2349&ln=2332"
      doc= sn.getfilefromURL(url,80,"r2chnn","");
      str2=sn.yahooChintai(doc.to_plain_text.toutf8)
      url2="http://rent.realestate.yahoo.co.jp/bin/rsearch?type=rent&from=0&to=25000&pf=13&swd=%C9%CA%C0%EE&dest=2149&long=1&god=1&md=time&lc=03&jsoff=0&x=67&y=93"
      doc= sn.getfilefromURL(url2,80,"r2chnn","");
      str3=sn.yahooChintai(doc.to_plain_text.toutf8)
      str2<<str3;str2=str2.sort.to_s

      chintaiHline=str2.gsub(/[\r\n]/,'|').gsub('||','').gsub(/(\(|（)\d+年(\)|）)/,'')
      if str2 =~/1\.\d/ then addstar  = "★カルタ:"else addstar="" end 

      chintai=url+"\n"+url2+"\n"+str2.gsub('■',"\n■")
      spacer="\n-----------------\n"
      $outHTML=chintai+spacer+$NifTenkiTxt +spacer+forex+spacer+koinews
      $outHTML=NKF.nkf("-Zw",$outHTML)  #全角英数を半角変換)
      require './mailer.rb'
      Mailer.new.gmail('example@some.com' ,'example@.com', addstar+forexHline+tenkiHline+chintaiHline,$outHTML,"stdout") #opt htmltoPDF
#     Mailer.new.gmail('example@some.com' ,'example@.com','koiNews',$outHTML,"stdout")
    elsif ARGV[0] =~ /gonekorean/ 
      #wget+scraper html2denyfrom 在日コリアン会社の事務所：メーカー、本社、##船橋 鶴橋 新大久保 赤坂 池袋 tibet-turkistan-内蒙古
    end
    #readfiles html from wgotdir do
  else
  #携帯gmail
  #login to atom feed page basic認証突破:
  #$agent.auth('some_user_id', 'some_password') ;$agent.user_$agent_alias = 'linux mozilla';page = $agent.get('https://mail.google.com/mail/feed/atom')
    $agent.user_agent_alias = 'so903i'
    page = $agent.get('https://www.google.com/accounts/serviceloginauth?service=mail')
    form = page.forms.first; form.email = 'some_user_id'; form.passwd = 'some_password'
    page = $agent.submit form
    page = $agent.get('http://mail.google.com/mail?hl=ja')
    #order no mailshaver ord で検索する
      page.form("sf").q = "order mailshaver ord"; page = $agent.submit page.form("sf")
      page.links_with(:href => /order.*mailshaver.*ord/ ).each{|el| # page.links.each {|el| 
        #リンクからメールアドレスがかいてある続きページまで一気にクリック＆代入
        detailpage = el.click; detailpage = detailpage.links_with(:text => /続き/)[0]; detailpage = detailpage.click 
        email = detailpage.links_with(:href => /cs=.*to=/)[0].text #(rdb:1) p $outhtml<< detailpage.root.to_plain_text
        #以下のプログラムはmailshaver ver.1.2 一個でもうれてからやる.
        #login to adva-cms with admin prev.  #http://localhost:3000/admin/sites/1/users/new #message"ait 30seonds!......"
        #register mail address into adva-cms #rand()  =>  randomely issue password #send greeting mail to registerer
      }    
  end
  puts $outHTML
end
#-----------------------------------------------------------------------------------------------------------------
#yobi-code::debug module
#   if el.text =~ /share*it/  then #   else #   end
#(rdb:1) p puts page.root/"a#subj0"
#(rdb:1) p puts page.root/:a
# (rdb:1) p puts page.links.each {|el| print el.text + "\n" + el.href + "\n" if el.text =~ /toeic/  } 
# (rdb:1) p print ptext.grep(/toeic/).each{|el| print el +"\n"  } 
# (rdb:1) p page.uri
# ptext =  page.root.to_plain_text  #print page.body  #<--mechanize:   hpicot--> print page.root.to_plain_text + "\n";print page.root.to_html + "\n"
# ptext2 = nkf.guess(ptext)
#p puts cgi.unescapehtml(page.body)
# ptext = "_" end #stdin.readlines.to_s.  
#<uri::http:0xb687cad8 url:http://mail.google.com/mail/x/16a232b2vrj55-/?hl=ja&gausr=gmail_account%40gmail.com&f=1&shva=1>
# #filebuf= filebuf.to_s.gsub!(tmpary[0], tmpary[1])

#==============================================================================================================
#これから新規で学習する人は www::mechanize::form#click_button を submit の代わりに覚えるといいと思います。
#dbg sleep 5;  page2 = page.to_s; print page2

#opt #(クソ|糞)スレ 確率事前注意報  #重複行の強調表示 
#opt def filterStranger
#       IDなざし検出
#       　ID抽出
#          　倭(猿|人)(\s|だ|は|が|よ|を|の)
#          チョン(は|だろ)
#          ＞ID:\w+
#            ID:\w+(\s|だ|は|が|よ|を|の)

