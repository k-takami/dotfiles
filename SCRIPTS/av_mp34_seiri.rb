# coding: utf-8
require_relative 'common'


def process_a_folder(foldername)
  (Dir.glob "#{foldername}/*").grep(/\.(mp3|mp4|wav|cdr|iso|m4v)/).sort.each do |file|
    # ファイル名の整形(/^\d+ +/, '')、／重複整頓、*.cdr->*.isoに
    file         = file.gsub("//", '/')
    new_filename = File.basename(file).sub(/^[\-\d\.]+ +/, '')
    new_filename = new_filename.sub(/\.cdr$/, '.iso')
    new_filename = new_filename.sub(/\.m4v$/, '.mp4')
    new_filename = from_utf8_into_hankaku_utf8_with new_filename
    new_file     = File.join(File.dirname(file), new_filename)

    #整形ファイル名で保存 ただし、既存ならば別名_COPYをつける
    if new_file != file 
      give_copied_file_name_when_duplication(new_file)
      p " --------- MPx_Shaver file/new_file = #{file} ---> #{new_file}"
      File.rename file, new_file
    end
    # 似た名前のファイル抽出、
    similar_filenames = (Dir.glob "#{File.basename(new_file)[0..10]}*").sort
    similar_filenames.map{|j| [j, megabytes(j)]}.each_with_index do |stats, i|
      break if i == similar_filenames.length - 1
    end
  end
end


# 再帰処理ラッパー
all_subfolders_under(@option[:from]).each do |folder|
  p "------------ folder #{folder} を処理中・・・ -----------"
  process_a_folder folder
  p "------------ folder #{folder} を処理しました -----------"
  break if Dir.glob("*.iso").none?
  puts "\n ISOファイル一覧は以下のとおり----------------------"
  puts `ls -alt ./*iso `
end


exit

# XXX: # サイズ比較、ファイル名包含調査 # 比較して差が閾値未満ならば 同一ファイルとみなす、ログ出力
def compare_files
  # It confirms once by the file size. When the same, it confirms a digest (md5).
  require 'digest/md5'
  def find_duplicate_files(dir)
    puts "\nDirectory : #{dir}"
    Dir.chdir(dir) do
      file_size = Dir.foreach('.').select{|f| FileTest.file?(f)}.group_by{|f| File.size(f)}
      file_size.each do |size, files|
        next if files.size==1
        files.group_by{|f| Digest::MD5.file(f).to_s}.each do |md5,fs|
          next if fs.size==1
          puts "  --------------------------------------------"
          fs.each{|file| puts "  #{File.mtime(file)}  #{size}  #{file}"}
        end
      end
    end
  end
  find_duplicate_files("/Windows/System32")
end

