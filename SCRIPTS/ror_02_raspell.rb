# coding: utf-8
require 'rubygems'; 
require 'ffi/aspell'
# INSTALLING RASPELL & mecab
  #install mecab first of all
  # sudo rpm -ivh http://packages.groonga.org/centos/groonga-release-1.1.0-1.noarch.rpm ; sudo yum makecache
  # supkgadd mecab mecab-ipadic aspell-en ; mecab --version
  # gem install ffi-aspell 
  # gem install pry byebug rails_best_practices rubocop
# INSTALL(ALTERNATIVE: chasen)
  #supkgadd aspell libaspell-dev aspell-en chasen 

# require 'pry'; require 'byebug'
speller = FFI::Aspell::Speller.new("en")
speller.suggestion_mode = 'normal'
command=`git diff --cached |grep -E "^\\+.+\\b([A-Z][a-z\\d]+|[a-z\\d]+_?[a-z\\d]+)"  |aspell -l en --suggest list |sort |uniq `
string = command

string.gsub(/\b[\w\']+\b/) do |word|
  if !speller.correct?(word)
    puts "STATEMENT #{word}: MAYBE  #{speller.suggestions(word).first}"
  end
end

#日本語マッチ部分だけとりだす
ja_words =[]
ja_regexp = '[あ-んア-ンーーｱ-ﾝﾟﾞァ-ォャ-ョｰｧ-ｫｬ-ｮ一-龠々]+'
command=`git diff --cached |grep -E "^\\+.+#{ja_regexp}" |sort|uniq`
command.split(/[ 　]/).each do |matched_line|
  sanitized_matching = matched_line.gsub(/(<br *\/>|\s+|　+)/,'')
  if md = sanitized_matching.match(/#{ja_regexp}/)
     ja_words << md[0]
  end
end
ja_words.sort!.uniq!
ja_words.each do |i|
    p `echo #{i} |mecab -Owakati`.gsub!(/(\s+|EOS|\|)/, '')
    # p `echo #{i} |chasen -j  -F '%m ' `.gsub!(/(\s+|EOS|\|)/, '')  
end

#IGNORE LIST
#$ head  ~/.aspell.lang.pws
#personal_ws-1.1 en 0 utf-8
# (wording list here onwards....)
# フリーのIME・ATOKユーザ辞書リンク集:
# http://www.vector.co.jp/vpack/filearea/data/writing/dic/
# http://www.atok.com/useful/list_win.html
# http://www.mwsoft.jp/programming/munou/ime_dictionary_link.html#special


