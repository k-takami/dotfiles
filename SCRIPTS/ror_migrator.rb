class Migrator #< ActiveRecord::Base
  include ActiveModel::Model
  attr_accessor :division_id, :branch_id, :sales_staff_id, :ym_type, :ym, :ym_from, :ym_to

  #アップロードされたファイルからの自動shori判別(仮：構想中)
  #caller = MigratorsController#profile_importer
  def self.set_migration_parameters(file = nil, division_id, branch_id)
    return if file.nil?
    tasknames = %w(migrate_ams_shigoto migrate_ems_oubosya migrate_lms_shisetsu migrate_lms_rireki update_client) # 'migrate_lms_shisetsu(20000, 0)',
    $csv_name = "tmp/files/#{file.original_filename}"
    $shori = tasknames.grep(/#{file.original_filename.match(/\wms/i).to_s.downcase}/)[0]
    $target_div_cd = division_id
    $arg_division = { 'NC' => 1, 'OS' => 2, 'BS' => 3, 'TECH' => 4 }.rassoc($target_div_cd)[0]
    $msg_division = "#{$arg_division}事業部を対象として #{$db}に"
    $host = 'localhost' #'172.19.51.133' #
    $db = 'neo_development' #'neo_db4'
    $branch_id = branch_id
    Rails.logger.info 'データ移行機能: 元ﾌｧｲﾙ ｱｯﾌﾟﾛｰﾄﾞで指定された事業部と支店IDは ' << $arg_division << ' ' << branch_id.to_s
    [$csv_name, $shori]
  end

  def self.check_migration_parameters
    ary = [$csv_name, $shori, $target_div_cd, $arg_division, $msg_division, $host, $db, $branch_id]
    ary.exclude?(nil)
  end

  def self.global_variables
    [$csv_name, $shori, $target_div_cd, $arg_division, $msg_division, $host, $db, $branch_id, $test, $logmessage]
  end

  # CSVロード関連処理
  # caller = MigratorsController#profile_importer
  def self.do_import_jobs(file, division_id, branch_id)
    # ﾌｧｲﾙｼｽﾃﾑ上に仮置き保管
    ExtInOut.new.save_attachment(file)
    # 移行ツール動作諸元 初期化
    csv, shori = set_migration_parameters(file, division_id, branch_id)
    # MySQLにロード
    load_specified_csv_into_mysql("#{Rails.root}/#{csv}", shori.sub('migrate_', '').pluralize)
    # 清掃と地ならし
    File.delete("#{csv}.conv") if File.exist?("#{csv}.conv")
    make_orm_class_when_missing
  end

  # caller = MigratorsController#profile_importer
  def self.load_specified_csv_into_mysql(csv_name, table_name)
    ActiveRecord::Base.connection.execute('set character_set_database=utf8') #if db == 'neo_db4'
    ActiveRecord::Base.connection.execute("truncate #{table_name}")
    shellcommands = <<-"SCENARIO"
      mysql -h localhost -u neo -p #{$db};
neoneo
>
      LOAD DATA LOCAL INFILE '#{csv_name}' INTO TABLE #{table_name} FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\\r\\n';
      quit;
    SCENARIO
    GeneralTools.expect_and_send_by_script(shellcommands)
  end

  #caller = MigratorsController#new
  def self.comparative_recs_for_mapping
    described_work_table = ActiveRecord::Base.connection.select('show full columns from ems_oubosyas')
    sample_records_max = 3
    work_table_records = ActiveRecord::Base.connection.select("select * from ems_oubosyas limit #{sample_records_max}")
    described_work_table.each do |described_column|
      (1..sample_records_max).each do |i|
        described_column["sample#{i}"] = work_table_records[i - 1][described_column['Field']]
      end
    end
    described_preview_table = ActiveRecord::Base.connection.select('show full columns from employees') #clients.dup projects.dup
    [described_work_table, described_preview_table]
  end

  def self.describe_table_header(task_name)
    mvc_model = to_mvc_model(task_name)
    tablename = mvc_model.name.downcase.pluralize
    desc_result = ActiveRecord::Base.connection.select("show full columns from #{tablename}")
    desc_result.map do |hash|
      hash['Comment'].present? ? [hash['Comment'], hash['Type']] : [hash['Field'], hash['Type']]
    end
  end

  def self.to_mvc_model(shori)
    keyword_of_class = { 'rireki' => ActionHistory, 'lms' => Client, 'ems' => Employee, 'ams' => Project }
    keyword_of_class.each do |keyword, modelclass|
      return modelclass if shori.include?(keyword)
    end
  end

  def self.evidencial_model_name
    ms_name, _ = names_of_ms_and_table($shori)
    "#{ms_name.humanize}#{$arg_division.humanize}Id"
  end

  def self.names_of_ms_and_table(shori_name)
    keyword_of_table = { 'lms' => 'clients', 'ems' => 'employees', 'ams' => 'projects' }
    ms_name = shori_name.match(/\wms/i).to_s
    [ms_name, keyword_of_table.assoc(ms_name)[1]]
  end

  def self.get_shoriname_by(csvname)
    tasknames = %w(migrate_ams_shigoto migrate_ems_oubosya migrate_lms_shisetsu migrate_lms_rireki update_client) # 'migrate_lms_shisetsu(20000, 0)',
    tasknames.grep(/#{csvname.match(/\wms/i).to_s.downcase}/)[0]
  end

  # caller = MigratorsController#preview
  def self.preview
    $test = true
    $logmessage = []
    @stat_after = nil
    @stat_before = stats(Time.now.to_s.sub(/ [\+\-]\d{4}$/, ''))
    @described_table_header = describe_table_header($shori)
    @csv_name, @shori, @target_div_cd, @division_acronym, @division_specific_message, @host, @db, @branch_id, @test, @logmessage = global_variables
    @converted_records, @logmessage, subtable = eval($shori)
    #Excelシートオブジェクトをマウス操作でコピーや移動をすると(255文字目がエスケープ文字で)途切れ、
    #区切り引用符直線にエスケープ文字が重なり、再度引用符が登場するまで CSVインポート結果が後続列でずれることがある。
    #そのためのCSV生ファイル事前チェックをいれる。
    duplicated_escape = ` grep -niE '\\\\\"' #{Rails.root}/#{$csv_name}`
    @logmessage << "ERROR - 引用符前のエスケープ文字(バックスラッシュ)あり:\n" << duplicated_escape if duplicated_escape.present?
    chpped_off_at255 = ` grep -niE ',".{255}",' #{Rails.root}/#{$csv_name}`
    @logmessage << "warning - 255文字目で切れている文字列のおそれ:\n" << chpped_off_at255 if chpped_off_at255.present?
    #表示用のオブジェクトを保存
    File.open("#{$csv_name}.conv", 'wb') { |fh| Marshal.dump([@converted_records, @described_table_header, @logmessage, @stat_before, @stat_after, subtable], fh) }
    [@converted_records, @described_table_header, @logmessage, @stat_before, @stat_after, subtable]
  end

  # DB状態(件数など)の表示
  # caller = MigratorsController#preview, #bulk_insert
  def self.stats(starting_timestamp)
    tablename = $shori.sub('migrate_', '').pluralize
    rollback_timestamp = starting_timestamp
    ms_name, destination_tbl = names_of_ms_and_table($shori)
    evidencial_tbl = "#{ms_name}_#{$arg_division.downcase}_ids"
    division, branch = [$target_div_cd, $branch_id]
    branch_statement = " AND branch_id = #{branch}" if branch > 0
    shellcommands = <<-"SCENARIO"
mysql -h localhost -u neo -p #{$db};
neoneo
>
status;

CREATE TABLE IF NOT EXISTS `#{evidencial_tbl}` ( `source_id` INT NOT NULL, `tms_id` varchar(100), `some_id` varchar(100), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NULL, `deleted_at` DATETIME NULL, `lock_version` INT NOT NULL DEFAULT 0);
desc #{evidencial_tbl};

#■構造点検
select * from branches ;
select * from branches_divisions ;
#■総件数
select count(*) from #{tablename};
select count(*) from #{destination_tbl} ;
select count(*) from #{destination_tbl} where updated_at >= '#{rollback_timestamp}' ;
select count(*) from #{evidencial_tbl};
select count(*) from #{evidencial_tbl} where updated_at >= '#{rollback_timestamp}' ;
#■移行例：最後10件づつ
select id, updated_at from #{destination_tbl} order by updated_at desc limit 10;
select * from #{evidencial_tbl} order by created_at desc limit 10;

#■総件数 LMS&AMS固有 (※ EMSにはdivision_id/branch_idがない)
#select division_id ,branch_id, count(*) from #{destination_tbl} group by division_id, branch_id ;
#select count(*) from #{destination_tbl} where updated_at >= '#{rollback_timestamp}' and division_id = #{division} #{branch_statement};

#■LMS固有点検：不整形データの点検
# select col10,col11,col37 from lms_shisetsus where LENGTH(col10) > 100 OR LENGTH(col11) > 100 OR LENGTH(col37) > 100 ;
# select id, client_name, prefecture_id, address1,address2,homepage_url from #{destination_tbl} where LENGTH(address1) > 100 OR LENGTH(address2) > 100 OR LENGTH(homepage_url) > 100 ;
# select id, other_company_use_round_min, other_company_use_round_max from #{destination_tbl} where created_at > current_date limit 100;
#■LMS固有点検：市区町村コード別
#select division_id , prefecture_id, city_id, count(*) from #{destination_tbl} group by division_id, prefecture_id, city_id ;
#■LMS固有点検：当社現取区分
#select division_id , our_company_trading_situation_cd, count(*) from #{destination_tbl} group by division_id, our_company_trading_situation_cd ;
#■LMS固有点検：他社稼働状況
# select division_id , other_company_use_cd, other_company_use_round_min, other_company_use_round_max, count(*) from #{destination_tbl} group by division_id, other_company_use_cd;
#■LMS-NC固有点検
#SELECT id, created_at, updated_at , client_type_label FROM #{destination_tbl} WHERE updated_at >= '#{rollback_timestamp}' AND LENGTH(client_type_label) >0 AND division_id = 1 ORDER BY updated_at desc;
#■LMS-BS & LMS-TECH固有点検
# SELECT id, created_at, updated_at , client_type_label FROM #{destination_tbl} WHERE LENGTH(client_type_label) >0 AND division_id IN (3,4) ORDER BY updated_at desc;
quit;
SCENARIO
    stats_file = "#{Rails.root}/tmp/files/typescript"
    GeneralTools.expect_and_send_by_script(shellcommands, stats_file)
    File.read(stats_file)
  end

  # caller = MigratorsController#bulk_insert
  def self.bulk_insert(converted_records, subtable = nil)
    ActiveRecord::Base.lock_optimistically = false
    # Client.reset_callbacks(:create)
    # Employee.reset_callbacks(:create)
    # Project.reset_callbacks(:create)
    #OPT:: 以下のコールバックを逐一ONのままにできるか チューニング
    Client.reset_callbacks(:find)
    Employee.reset_callbacks(:find)
    Project.reset_callbacks(:find)
    Client.reset_callbacks(:save)
    Employee.reset_callbacks(:save)
    Project.reset_callbacks(:save)

    starting_timestamp = Time.now.to_s.sub(/ [\+\-]\d{4}$/, '')
    #移行データとりこみ
    mvc_model = to_mvc_model($shori)
    mvc_model.import(converted_records, validate: false) if converted_records.present?
    #移行履歴テーブルにもとりこみ
    evidencial_model = eval(evidencial_model_name)
    evidencial_model.import(subtable, validate: false) if subtable.present?
    ActiveRecord::Base.lock_optimistically = true
    #エビデンス返却
    stats(starting_timestamp)
  end

  def self.make_orm_class_when_missing
    classname = evidencial_model_name.underscore
    mvc_model = to_mvc_model($shori).name.downcase
    class_file = "#{Rails.root}/app/models/migrator_sub/histories/#{classname}.rb"
    class_file_str = <<-"STR"
class #{evidencial_model_name} < ActiveRecord::Base
  belongs_to :#{mvc_model}
end
    STR
    File.open(class_file, 'w+b', 0664) { |f| f.write(class_file_str) } unless File.exist?(class_file)
  end

  def opt
    # DB global_variablesわたしか、
    # division_acronym --> division_acronym
    #担当者不明ならば未設定
    # E&Aに別種レイアウト
    # グローバル変数外し
    #GUI:
    #   index.erb ファイル名を*ms_事業部ID_支店IDにするとそれが優先されるのもいい
    #Validators:
    #   支店整合性 指定
    #   改行コード文字コードチェック
    #   列数=ActiveRecord.select().columns.count
    #    AMS: 92, EMS: 66, LMS: 54
    #柔軟性
    #    Marshall.dump 歴代保存；事業部× (AMS/LMS/EMS/***)の 10以上のパターンをeditメソッド&画面で編集予定
    #  host db きりかえ対応
  end
end
