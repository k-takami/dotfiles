# coding: utf-8
# XXX: `sudo gem install debugger byebug rdebug sqlite3 pry-debugger ` 
require 'fileutils';  require 'nkf' ; require 'yaml';
require "optparse"; @option_parser = OptionParser.new; @option_parser.class
# require "getoptlong"; option_parser = GetOptLong.new; #<= before ruby 1.8

if RUBY_VERSION < "1.9"
  require 'pry'
  require 'rdebug'  ;
elsif RUBY_VERSION > "1.9.0" && RUBY_VERSION < "2.2.0"
  require 'pry'
  require 'debugger';
elsif RUBY_VERSION < "2.4.0"
  require 'byebug';
else
  # binding.irb
end


# class Time 関連 ########################################
def to_yyyymmdd
  Time.now.strftime('%Y%m%d')
end

# class Dir 関連 ########################################
def all_subfolders_under(path_str)
  all_subfolders = Dir.glob "#{path_str}/**/".sub("//","")
  all_subfolders.sort
end

# class File 関連 ########################################
def from_files_into_array_with_yyyymmdd_backups
  @ary_of_read_files = []
  FILES.each do |file|
    if File.exist? file
      `cp -p #{file} #{file}.#{to_yyyymmdd}`
      @ary_of_read_files << File.read(file).split("\n")
    else
      @ary_of_read_files << []
    end
  end
end

def give_copied_file_name_when_duplication(filename)
  filename.sub!(File.extname(filename), "_COPY#{File.extname filename}") if File.exist?(filename)
end

def megabytes(file)
  ('%.2f' % (File.size(file).to_f / 2**20)).to_f
end

def split_array_of_file_before_the_last_ending_terminator(array_of_read_file)
  offset_from_last = -1
  array_of_read_file.select{|i| i =~ /(bullet)/ }.each {|i| i.sub!(/^/, "# ") }
  array_of_read_file.reverse_each do |line |
    offset_from_last -= 1
    break if line =~ /^ *end/ 
  end
  [ array_of_read_file[0..offset_from_last], array_of_read_file[offset_from_last+1..-1] ]
end

def restore_files_having_yyyymmdd_suffix(yyyymmdd = to_yyyymmdd)
  (FILES << "db/migrate").each do |file|
    backupfile = "#{file}.#{yyyymmdd}"
    next unless File.exist? backupfile
    `rm -rf  #{file}`
    `mv #{backupfile} #{file}`
  end
end

# class Array 関連 ########################################
def from_array_into_file(array, file)
  File.open(file, "w") { |f| array.each { |line| f.puts(line) } }
end

def from_array_a_b_c_into_file(a, b, c, file, delimiting_ary)
  if delimiting_ary
    from_array_into_file (a + delimiting_ary + b + delimiting_ary + c), file
  else
    from_array_into_file (a + b + c), file
  end
end

# class String 関連 ########################################
# ファイル名全角があるときだけ半角に変換 NKFの精密さに問題あり
# ref: https://docs.ruby-lang.org/ja/latest/class/NKF.html
def from_utf8_into_hankaku_utf8_with(string)
   output = string =~ /[０-９ａ-ｚＡ-Ｚア-ンー]/ ? NKF.nkf('-m0Z41 -W -w', string) : string
   # 禁則文字、とりわけパス区切り文字は無変換
   output.gsub("/", "／").gsub("\\", "￥")
end

# class IO 関連 ########################################
def dialog_by_stdin(question, current_target, single_method, bulk_method = nil)
  print "#{question}? [ynaq] "
  case $stdin.gets.chomp
  when 'a'
    # bulk shori method
    eval(bulk_method)
  when 'y'
    # single shori method
    eval(single_method)
  when 'q'
    exit
  else
    puts "skipping ~/.#{current_target}"
  end
end

def customize_gitignore
  Dir.chdir @apps_root
  `echo "\n >> .gitignore`
  `echo "\n# superdry appended section below;"  >> .gitignore`
  `cat ~/.dotfiles/gitignore >> .gitignore`
end

def rails_bundle_install_reset_migrate_seed
  puts " Rails3  : rm Gemfile.lock; bdllikerails12 ; bx rake db:reset ; bxrdbm; bxrdbs #を実行して初期化してください"
  puts " Rails2  : rm Gemfile.lock; bdllikerails12 ; rake db:reset; rake db:migrate; rake db:seed  #を実行して初期化してください"
  # Dir.chdir @apps_root
  # ` bundle install --path vendor/bundle ;`
  # ` bundle exec rake db:reset ;`
  # ` bundle exec rake db:migrate;`
  # ` bundle exec rake db:seed;`
end

module GeneralTools
  # extend ActiveSupport::Concern
  class << self
    def read_file_into_array(filename_relativepath, _newline_code = 'unix')
      # newline_code = newline_code[0].downcase
      File.read("#{Dir.pwd}/#{filename_relativepath}").split(/\n/)
    end

    # 改行コードをふくむ文字列を引数で受けとれば それを標準入出力コマンド群とし、
    # 改行コードがなければファイル名相対パスとして解釈し、標準入出力コマンド群として
    # 対話処理を行う
    # 標準入出力結果をredirecting_outfileにリダイレクトも可能
    def expect_and_send_by_script(target, redirecting_outfile = nil, second_prompt_regexp = nil)
      begin
        unless target =~ /[\r\n]/m
          batch_commands = read_file_into_array(target)
        else
          batch_commands = target.split(/[\r\n]/)
        end
        #batch_commands 1行目をプロセス開始コマンドとしてみなす
        spawn_command = batch_commands.shift
        #batch_commands 2行目をパスワードとしてみなす
        password = batch_commands.shift
        password = password.strip unless password.nil?
        #batch_commands 3行目をコマンドプロンプト文字パターンとしてみなす
        prompt = batch_commands.shift
        if second_prompt_regexp
          prompt = /(#{prompt}|#{second_prompt_regexp})/
        end
        if redirecting_outfile
          original_std_out = STDOUT.clone
          STDOUT.reopen(open(redirecting_outfile, 'w+b', 0664))
        end
        #batch_commands 4行目移行をコマンドとしてみなし、実行 (*終了コマンドが末尾に必須)
        require 'pty'
        require 'expect'
        $expect_verbose = true
        PTY.spawn(spawn_command) do |reader, writer, _pid|
          writer.sync = true
          if password.length > 0
            reader.expect(/(パスワード:|word:|password.for.+:)/, timeout = 1) {
              writer.puts password
            }
          end
          # 3行しかないシナリオはishift *3回で以下を通過しない；
          batch_commands.each do |line|
            # プロンプトが＃記号でなければ
            # ’#マーク’はじまりでないコマンド行,または’#■’はじまりのコマンド行は
            # 「コメント行ではない」とみなして標準出力し、対話処理をつづける
            if prompt != '#' || (prompt == '#' && (line =~ /^\s*#/ || line =~ /^\s*#■/))
              reader.expect(prompt) { writer.puts line }
              #logger.info prompt; logger.info line
            end
          end
        end
        STDOUT.reopen(original_std_out) if redirecting_outfile #; File.delete redirecting_outfile if redirecting_outfile
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
    end
  end
end


@option = {}
@logmsg = []
caller_is_sctipt = nil

if ARGV[0]
  @option_parser.on("-h", "--help", "ヘルプ"){ puts @option_parser.help; exit 0 }
  @option_parser.on("-f", "--from=X", String, "パスやファイルを指定") do |arg|
    @option[:from] = arg || Dir.pwd
    caller_is_sctipt = true
  end
  @option_parser.on("-t", "--to=X", String, "パスやファイルを指定") do |arg|
    @option[:to] = arg
  end
  @option_parser.on("-h", "--host=X", String, "") do |arg|
    @option[:host] = arg
    caller_is_sctipt = true
  end
  @option_parser.on("-p", "--port=X", String, "") do |arg|
    @option[:port] = arg
    caller_is_sctipt = true
  end
  @option_parser.on("-u", "--user=X", String, "") do |arg|
    @option[:user] = arg
  end
  @option_parser.on("-P", "--password=X", String, "") do |arg|
    @option[:password] = arg
  end
  @option_parser.on("-m", "--mode=X", String, "") do |arg|
    @option[:mode] = arg
  end
  begin
    @option_parser.parse!
  rescue OptionParser::ParseError => e
    $stderr.puts e.message
    $stderr.puts @option_parser.help
    exit 1
  end
end

@option[:from] ||= Dir.pwd
@option[:port] ||= '80'
@option[:host] ||= '0.0.0.0'
if caller_is_sctipt
  #XXX: どのファイルからrequire/includeされたかで分岐したい
  puts "------------ 処理開始します -----------"
  puts "@option = #{@option}"
  puts "---------------------------------------"
end

Dir.chdir @option[:from] 

