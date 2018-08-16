変換into 定数
	from シンボル ":aaa".to_s.sub(':','').camelize.constantize
変換into Hash
	 from CSV::Row   : row.to_hash.each{|k,v|puts  k ; puts v }
変換into Class
	model = File.basename(file, '.tsv').classify.constantize # > rails3 
	cf: File.basename(file, '.tsv').classify
変換 into to web-measurement
	FQDN
	  def fqdn
    # request.url.sub(request.fullpath,'').sub(/https?/,'http') # rails < 3.0
    "http://#{request.host_with_port}"                          # rails 3.x <
  end
変換 into UNIXTIME
	(Time.at @attr['expireDate'] / 1000.0).strftime "%Y年%m月%d日"
変換 into summertime
  def considerSummerTimeDate(birth)
    if (birth >= -683794800000 && birth <= -672393600001) \
      || (birth >= -654764400000 && birth <= -640944000001) \
      || (birth >= -620290800000 && birth <= -609494400001) \
      || (birth >= -588841200000 && birth <= -578044800001)
      birth += 3600000
    end
    return birth
  end

