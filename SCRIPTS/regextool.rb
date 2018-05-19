#RegexTool 3.0.1 #copyright 2001 by Howard Stellar
#
#Backend is the "main" program class of Regextool
#First we ascertain whether a file or all files in a directory will be altered.
#Based on this choice the program flow forks to one of two paths:
#
#(i) If only a single file is to be altered,we ascertain what file to open for reading,
#then request a regular expression pattern to look for, #and a string to replace the found pattern,
#and weather the substitution is to be done once per line (single) #or for as many matches as will occur on each line (global).
#We ascertain if the user wants additional substitutions performed on this file.
#Upon completion of this, we ascertain the file to create #with the desired changes from the data gathered.
#Finally, we open the file, and while reading it line by line, perform 
#the desired substitutions, which are also written line by line into the created file.
#A short report of the created file is generated.The program terminates.
#
#(ii) If instead the user chose to alter all the files in a directory,
#all of the above takes place, with the notable exceptions that #we ascertain which directory to open for reading,
#we ascertain which directory to create with the desired changes from the data gathered,
#and the substitutions are performed for all files in the opened directory.

# Regextool 3.0.1
# Copyright 2001 by Howard Stellar

# The command line interface
# --------------------------

# - Upon execution, RegexTool with ask if you want to open a single file or all files in a directory.
# - Type "F" or "D" repectively.
# - You will then be asked to name the file or directory to open.  It is best to specify the absolute location    (eg. C:\mystuff\thisfile.txt, or /home/myusername/thisdirectory).

# - You will then be prompted for a regular expression search pattern, without the leading and trailing "/"s (At this point, your knowledge of regular expressions will prove useful, or else you will have to go out and inform yourself about these matters, to which there are many good sources of  information.) 
# NOTE: Substition strings are provided by backslash sequences.   (ie.\1, \2, . . . \9 match their respective grouped subexpressions, \& is the last match,   \` (backquote) is the part before the match, \' is the part after the match, \+ is the   highest-numbered group.

# - You will then be prompted to enter a replacement string.
# - You will then be prompted to enter "S" for single or "G" for global substitution (which matches no more than  once per line, or allows multiple matches per line, respectively.)
# - You will then be prompted to continue building search and replace sequences (which will be executed in the order then were received), or else to indicate you are finished.
# - You will then be prompted to enter a file (in the case of single file replacement) or a directory (in the case of directory replacement) in which to output the substituted file(s).  The name given must be unique, and with the absolute path.
# - RegexTool will then create the named file or directory with the desired modifications and report that said file(s) have been created.

class Backend 
  def initialize 
    @con = Console.new 
    if @con.getFD == "F"
      @choice = nil; @choice = "F" ; taken = @con.readFile ; subArray = @con.getSubArray(@choice) ; written = @con.writeFile; @con.space(1)
      File.open(written,"w") do |aFile| 
        IO.foreach(taken){|line| aFile.puts line.substitute!(subArray)}
        @con.report(written)
      end    
      @con.space(1)   
    else
      @choice = nil; @choice ="D"; taken = @con.readDir; subArray = @con.getSubArray(@choice); written = @con.writeDir; @con.space(1)
      Dir.foreach(taken) do |theFile|
        if File.stat(File.join(taken,theFile)).file?
          File.open(File.join(written,theFile),"w") do |aFile| 
            IO.foreach(File.join(taken,theFile)){|line|aFile.puts line.substitute!(subArray)}
            @con.report(File.join(written,theFile))
          end
        end
      end
      @con.space(1)
    end
  end 
end 

###
#Adding a method to built-in String class, #which enables any string to undergo substitution.  #The passed array must contain, in order:
#(i) a valid regular expression pattern,
#(ii) a replacement string
#(iii) the value "S" or "G"
#(note: this sequence may be continued so long as there is memory #to hold the data in the array: eg: [(i),(ii),(iii),(i),(ii),(iii),...])
#
#The substitute! method duplicates the passed array, #then removes the third element.
#If it is "S": #a single substitution is performed based on #the pattern of the first element #and the replacement string of the second element.
#If it is "G" #the substitution performed is global.  #(ie. will match as many times as possible per line.)
#
#The substitute! method is undefined in the main program, #returning the String class to its original form just before program termination.
###

class String 
  def substitute!(array) 
    each do |line| 			
      @new = array.dup  
      until @new.empty? 
        @slice = @new.slice!(2)  
        if @slice == "S" then 
          line.sub!(@new.shift,@new.shift) 
        else 
          line.gsub!(@new.shift,@new.shift) 
        end      
      end    
      return line 
    end     
  end      
end

###
#The Console class is used as a way of separating out the #program's user interface from the backend.
#In theory, to implement a new interface, #(like a GUI, or within the interface of a pre-existing program),
# all that would be needed is to re-write the methods in Console class.
#With the exception of initialize method, #all Console methods are principally limited to the following four functions:
#(i) request user input
#(ii) receive user input
#(iii) create a loop structure
#(iv) pass input to a Checking method via a conditional statement (like 'if') 
###
class Console 
  def initialize 
    @checking = Checking.new 
  end 
   
  def getFD 
    loop do
      puts "\nEnter read from a single (f)ile,"; puts "or all files in a (d)irectory?"
      @input = nil ; @input = gets.chop.capitalize 
      if @checking.getFD(@input) 
        return @input ; break 
      else 
        puts "\nPlease enter \"f\" or \"d\"" ; redo 
      end    
    end 
  end 
   
  def readFile 
    loop do
      puts "\nEnter a file to modify:\n" ; @taken = nil ; @taken = gets.chop 
      if !@checking.readable?(@taken) 
        puts "\nSorry, that is not a readable file."; redo
      end
      if !@checking.aFile?(@taken)
        puts "\nSorry, that is not a file."; redo
      end 
      return @taken; break 
    end 
  end 
   
  def readParameterFile
	  #fileopen1 as textobject
	  #fileopen2 as text
  	#split
  	#read to hashArrayi2()
  	#loop foreach array
  		#s/hashkey/hashvalue/g
  end

  def readDir
    loop do
      puts "\nEnter a directory to open:\n"; @taken = nil ; @taken = gets.chop
      if !@checking.readable?(@taken) 
        puts "\nSorry, that is not a readable directory."; redo
      end
      if !@checking.aDir?(@taken)
        puts "\nSorry, that is not a directory."; redo
      end
      return @taken; break
    end
  end  
   
  def getSubArray(fileOrDir) 
    @subArray = Array.new ; @message = nil
    @message = "to this file" if fileOrDir =="F"; 
    @message = "to the files in this directory" if fileOrDir =="D" 
    loop do      
      loop do 
        begin 
          puts "\nEnter a regular expression search pattern:\n"
          @input = nil; @input = gets.chop
          if !@checking.regexable?(@input)
            puts "\nThat is not a valid regular expression." ; redo
          else
            @subArray.push(Regexp.new(@input))
          end
        end
        break 
      end     
 
      puts "\nEnter a replacement string:\n" 
      @subArray.push(gets.chop); @input = nil 
      loop do 
        puts "\nIs this a (s)ingle substitution, or (g)lobal substitution?\n" 
        break if @input = @checking.getSG(gets.chop.capitalize)         
      end   
    
      @subArray.push(@input) ; @input = nil 
      loop do 
        puts "\nDo you wish to do any further pattern substition"; puts "#{@message} (y/n)?\n"                
        break if @input = @checking.getYN(gets.chop.capitalize)        
      end   
 
      if @input =="N" 
        return @subArray       ; break 
      end   
    end 
  end

  def writeFile
    loop do 
      puts "\nEnter a file name you wish to save as:\n"
      @written = nil;	@written = gets.chop
      if @checking.fileExists?(@written)
        puts "\nSorry, that filename already exists."; redo
      end
      if !@checking.fileWritable?(@written)
        puts "\nSorry, that filename is invalid."; redo
      end
      return @written; break 
    end 
  end

  def writeDir
    loop do
      puts "\nEnter a new directory name to save the file in:\n"
      @written = nil; @written = gets.chop
      if @checking.fileExists?(@written)
        puts"\nSorry, that directory already exists."; redo
      end
      if !@checking.dirCreatable?(@written)
        puts "\nSorry, cannot make that directory."; redo
      end
      return @written; break 
    end
  end

  def space(aNumber)
    aNumber.times {puts}
  end

 def report(wasWritten)
    puts "#{wasWritten} was written"
  end 
end 


###
#Checking class, initialized by Console class, #was created to make it easier for interface designers
#to know the possible errors to catch when writing a new #Console class.  Depending on the design of a new interface,
#some or all of the Checking class methods may be needed.
#Checking class makes use of Valid class methods.  #Individual comments for methods are below.
###
class Checking 
  def initialize 
    @valid = Valid.new   
  end   
  #was the input either "F" or "D" ?  
  def getFD(theInput) 
    @valid.binary('F','D',theInput)  
  end 

  #is the selected file or directory readable to this user?
  def readable?(fileDirectory) 
    File.readable?(fileDirectory) 
  end 
  
  #does the selected name represent a file?
  def aFile?(someFile) 
    File.stat(someFile).file? 
  end 

  #does the selected name represent a directory?
  def aDir?(someDirectory)
    File.stat(someDirectory).directory?
  end 

  #will the passed string raise errors when made into a regular expression?
  def regexable?(theRegexp)
    begin
      Regexp.new(theRegexp);
      true
    rescue SystemCallError 
      false 
    end 
  end

  #was the input either "S" or "G"?
  def getSG(theInput) 
    @valid.binary('S','G',theInput)  
  end 
  
  #was the input either "Y" or "N"    
  def getYN(theInput) 
    @valid.binary('Y', 'N', theInput)  
  end 
  
  #is this the name of a file that already exists?
  def fileExists?(someFile)
    File.exists?(someFile)
  end 

  #can this name be used to create a new file?
  def fileWritable?(someFile)
    @valid.file(someFile)
  end

  #can this name be used to create a new directory?
  def dirCreatable?(someDirectory)
    @valid.directory(someDirectory)
  end
  #VB-BRIDGE--------------------------------------------------------------------------------------
	#e.g.: MsgBox(" Do you want to abort processing ?", vbYesNo, commonCaption) = vbYes 
  def MsgB(strMsg,strMode,strCaption)	#,strCaption,strToolTipText) 
#       @subArray.push(@input) ; 
			@input = nil 
      loop do 
        puts "\n#{stMsg}\n"                
				if strMode=="vbYesNo" || strMode==""|| strMode==nil  then
					break if @input = @valid.binary('Y', 'N', gets.chop.capitalize) 
				end
      end   
  end 
end  
     
#Valid class was created to verify user input and ensure all errors are caught.  #Individual comments for methods are below.
class Valid
  #was the input either value one or value two? 
  def binary(one, two, theInput) 
    @one = one; @two = two; @input = theInput 
    if @input == @one then 
      @input 
    elsif @input == @two then 
      @input  
    else   
      false 
    end
  end

  #can this name be used to create a new file?
  def file(fileName) 
    begin 
      File.open(fileName, "w") { } 
      true 
    rescue SystemCallError 
      false 
    end 
  end

  #can this name be used to create a new directory?
  def directory(dirName)
    begin
      Dir.mkdir(dirName)
      true
    rescue SystemCallError
      false
    end
  end
end  
 
#The core class String is restored to its original form before program terminates.
class String 
  undef_method :substitute!
end
class Vb2rbCommon
  def PrintRubyFileSchelton(mode)
    if mode =="header"  #header
      tmpStr= "#!/usr/bin/ruby 
#require 'rubygems'; require 'mechanize'; require 'hpricot'; require 'nkf' #require 'logger' #$agent.log = Logger.new($stdout) 
class ThisFileClassName
  def initialize
    # WWW::Mechanize.html_parser = Hpricot; $agent = WWW::Mechanize.new; $infile=""; $outfile=""
  end
  #-----------------------------------------------------------------------------------------------------------------\n"
    elsif mode=="footer"
      tmpStr="\n
end #of class---------------------------
if __FILE__ == $0
  if ARGV[0] == nil
    # when called without any argument, simply instantiate the class itself above 
    ThisFileClassName.new
  elsif ARGV[0] =='help' || ARGV[0] =='--help' || ARGV[0] =='-h'
    # when called with help/h option, show help message to standard output
     puts '
       usage: ruby FILENAME.rb
       usage: ruby FILENAME.rb ARGV[0] ARGV[1]...ARGV[N] 
     '
  elsif ARGV[1]=='somevalue' then 
    # when called with some arguments, some procedures/stgatements continues here...
  end
end\n "
    end
    return tmpStr
  end
	#PG疎結合:RegexpTools::Vb2rbCommon にはruby標準ライブラリーレベルのオブジェクトしか記述しない。rhtml/html.erb/MVCにはrailsレベルのオブジェクトしか記述せず、

	def setAryPtn(line_splitted_array)
			i=1
			line_splitted_array.each{ |line|
				#dbg     puts line
				if line =~ %r(#many-times-substitution-pattern-per-line-as-follows) then
					i=2
				elsif line =~ %r(#just-once-substitution-pattern-per-line-as-follows) then
					i=3
				elsif line =~ %r(#conditional-substitution-pattern-per-line-as-follows) then
					i=4																									#<--condition-match ---> 加工parameterで分岐
				end
				if line !~ /\t/ then next end #\tなし行を無視
				line.chomp!; tmpary= line.split(/\t/) ;tmpary[0]=tmpary[0].to_s; tmpary[1]=tmpary[1].to_s;
				@@aryPtn[i]<<tmpary #end
			}
			return @@aryPtn
	end
  def ptnfileconv(argv0, argv1, argv2, mode, optionalStr ="")
		#===================================================================================================
    if argv0 =="help" || argv0 =="--help" || argv0 =="-h"
       return "
       usage: ruby test.rb 
       usage: ruby test.rb yomikakudev.txt idtwz 
       usage: ruby test.rb yomikakudev.txt ptn/ptnfile 
         *ptn/ptnfile NOTE: 
          if line =~ %r(#line-gsub-pattern) then line.gsub 
          if line =~ %r(#line-sub-pattern)  then line.sub 
       "
		#===================================================================================================
		elsif argv1=="idtwz" then
			#つかいかたは　ruby regextool.rb input-file-name.wz idtwz > output-file-name.otl みたいに
			#ファイルを標準入力からよみこむ
			filebuf=File.open(argv0){ |file| file.binmode;file.read }
			#下の行は予備：引数xがsift-jisファイルをUTF-8に変換。
#       if argv2 =="sjis" then require'nkf';filebuf = NKF.nkf("-S -x -w -m0", filebuf) end

			fileary=filebuf.split(/\n/)
			fileary.each{|line|
				#^\.+の下から次の^\.+までを.出現回数分、\t挿入インデント
				if line =~/^\./
					#.始まりの行は.をタブに変換し、変数@indentsに.の個数を記憶
					line.gsub!(".","\t" )
					@indents= line.scan(".").size
				else
					#.始まりでない行は . を先に記憶した変数@indentsの個数+1個分分、タブを行頭挿入
					line.gsub!(/^(.*)/,"\t" * (@indents.to_i+1) + "\\1")
				end
			}
			return fileary
		#===================================================================================================
		else
      ret=""
			#-----------------------------------------------------------------------------------------------------------------------------------
			#@@aryPtn作成:@@aryPtn[0]=nil, @@aryPtn[1]=gsubパターン、@@aryPtn[2]=行単位gsubパターン、@@aryPtn[3]=行単位subパターン,@@aryPtn[4]=行単位条件付き変換パターン
			#-----------------------------------------------------------------------------------------------------------------------------------
			@@aryPtn=[]; @@aryPtn[1]=["",""];@@aryPtn[2]=["",""];@@aryPtn[3]=["",""];@@aryPtn[4]=["",""]; #     @@aryPtn[5]=["",""]

			arySplitted=File.readlines(argv1);setAryPtn(arySplitted)
			if optionalStr != nil then arySplitted=optionalStr.split(/\n/);setAryPtn(arySplitted) end

			@@aryPtn[1].shift;@@aryPtn[1].shift;@@aryPtn[2].shift;@@aryPtn[2].shift;@@aryPtn[3].shift;@@aryPtn[3].shift;
			@@aryPtn[4].shift;@@aryPtn[4].shift #     @@aryPtn[5].shift;@@aryPtn[5].shift

      if mode != "CGI" then
        filebuf=File.open(argv0){ |file| file.binmode;file.read }
      else
        filebuf=argv0
        print "argv0=" + argv0.to_s
      end
			@checking = Checking.new ;maeMatch=[]

			#-----------------------------------------------------------------------------------------------------------------------------------
			#@@aryPtn[1]=gsubパターン適用 ファイル全体の反復的置換
			#-----------------------------------------------------------------------------------------------------------------------------------
			@@aryPtn[1].each{|j|
#dbg print j.to_s+"\n"
				if !@checking.regexable?(j[0])
					ret<< "\nThat is not a valid regular expression." ; redo
				else
					mae= /#{j[0]}/i
				end
				if j[2] != nil then
					if	j[2]=="mae" then
						maeMatch=filebuf.match(mae).to_a
					elsif j[2] =="ato"		then
						j2=j[0].sub("\\1", maeMatch[1].to_s);mae= /#{j2}/i
					end
				end
				j[1].sub!("\\t","\t");j[1].sub!("\\n","\n")
				filebuf.gsub!(mae, j[1])
			}

			if argv1 =~ /vb2rb/
				key ="file-gsub";#<--dd?
				#関数引数一覧作成　ーーー＞大文字始まりの引数を全部小文字にする
				methArgs=filebuf.grep(/(?:def|Sub|Function) /).each{|j| j.gsub!(/[\(\)\s]/,"").gsub!(/(?:def *\w+=?)/,"").gsub!(","," ") }.to_s.split
				hs_ArgvGsub={};methArgs.select{|j| j =~/^[A-Z]/ }.each{|k| hs_ArgvGsub[k] = k.downcase }
				hs_ArgvGsub.each{|key,value| filebuf.gsub!(key,value) }
				#shebangとヘッダー定型文を吐く
#-----------
        if argv2 =~ /schelton=on/
          ret<< PrintRubyFileSchelton("header");ret<<"\n"
        end
			end

			fileary=filebuf.split(/\n/) ; #dbg	print fileary[0..10]

			#-----------------------------------------------------------------------------------------------------------------------------------
			#@@aryPtn[2..4]=適用 行単位の反復的置換
			#-----------------------------------------------------------------------------------------------------------------------------------
			fileary.each{|line|
				if @@aryPtn[2] !=nil then @@aryPtn[2].each{|j| line.gsub!( /#{j[0]}/i, j[1]) } end
				if @@aryPtn[3] !=nil then @@aryPtn[3].each{|j| line.sub!( /#{j[0]}/i, j[1]) } end
				if @@aryPtn[4] !=nil then
					@@aryPtn[4].each{|j|
						#正規表現にマッチした部分を取り出す 71
						m = /#{j[0]}/i.match(line).to_a
						if j[2]=="MSwildcard" then
							m[1]=m[1].to_s.gsub("*",".*").to_s.gsub("?",".")
							if m[1] != "" 
								ato=j[1].sub( /\\1/, m[1]) #;j[1].sub!( /\\2/, m[2]);#j[1].sub!( /\\3/, m[3])
								line.gsub!( /#{j[0]}/i, ato)
							end
						end
					}
				end
				if @@aryPtn[5] !=nil then @@aryPtn[5].each{|j| print j.to_s+"\n" } end
				ret<< line
        ret<<"\n"
			}

			#CLASS GENERATION			
			if argv1 =~ /vb2rb/
#-----------
        if argv2 =~ /schelton=on/
          ret<< PrintRubyFileSchelton("footer");ret<<"\n"
        end
			end
			# open("out2.txt","w"){ |o| o.puts line.gsub("foo","bar") }
			#if /./ !~ tmpary[1] then tmpary[1] = "_" end #STDIN.readlines.to_s.  #filebuf= filebuf.to_s.gsub!(tmpary[0], tmpary[1])
		end
    return ret
  end  
end

if __FILE__ == $0
	if ARGV[0] == nil
		#End of Class Libraries #Program flow begins:
		taken = nil; subArray = Array.new; written = nil; Backend.new
	else
    ret = Vb2rbCommon.new.ptnfileconv(ARGV[0], ARGV[1], ARGV[2] ,nil)
    puts ret
	end
end
