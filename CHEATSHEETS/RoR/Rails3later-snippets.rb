bootstrap && flash
V:
<% flash.each do |message_type, message| %>
  <% bs_style= message_type != 'notice' ? 'alert-danger' : 'alert-info' %>
  <strong>
    <div class="alert <%=bs_style%> text-center text-left"><%= message %></div>
  </strong>
<% end %>

C:
    # render json: { message: '処理を受け付けました' }, status: :ok
    flash[:notice] = '処理を受け付けました'
    redirect_to :back


seeds.rb
	seeds/rb3 (=basic)
	Role.connection.execute("TRUNCATE TABLE roles;")
Role.create([
  {id: 1, role_name: 'admin', created_user_id: 1, created_ip_address: GarnetConsts.operation_ip_address, updated_ip_address: GarnetConsts.operation_ip_address, created_program_id: 'garnet_ope', updated_user_id: 1, updated_program_id: 'garnet_ope'},
	seeds.rb
		require 'yaml'
		require 'rake'
		def qa?
			Rails.env.production? && ENV['DENA_INTERNAL_DOMAIN'] == 'qa.kenko-pf.local'
		end
		import_limit = 1000
		# マスタ系
		%w(Category MedCode Disorder Relationship Gift).each do |c|
			c.constantize.delete_all
			c.constantize.create(YAML.load_file "#{Settings.fixture.dir}/#{c.tableize}.yml")
		end
		Rake::Task['update:standard_exam'].execute
		env = qa? ? 'qa' : Rails.env
		# XXX: 環境に関係ない初期化
		load 'db/seed/common.rb'
		# 個別の処理があれば
		load "db/seed/#{env}.rb" if File.exist?("db/seed/#{env}.rb")
	seeds.rb2
	# XXX: カラム変更があった際に、モデルに変更が反映されないため reset
ActiveRecord::Base.subclasses.each do |model|
  model.send(:reset_column_information)
end

class FixtureImport
  def initialize(file_name)
    @file_name = file_name
  end

  def run!
    ActiveRecord::Base.transaction do
      fixture.each do |source|
        yield(source.dup)
      end
    end
  end

  private
  def fixture
    YAML.load ERB.new(File.read(@file_name)).result
  end
end



	seed増築
		fileあ　load 'db/seeds/common_mappings.rb'
			common_mappings.rb'
			# frozen_string_literal: true
# require 'yaml'


vendor/bundleのrequure
gem_path = `gem env`.match(/INSTALLATION DIRECTORY.+\n/).to_s.chomp.sub(/^.+: /,'')
$LOAD_PATH.unshift("#{gem_path}/gems/activerecord-import-0.16.2/lib")
require "activerecord-import/base"
    require 'rubygems'
    require 'bundler/setup'
動的生成
	method
		target_records.each do |rec| rec.define_singleton_method(:email){"dena.co.jp"} end
	変数
		target_records.each do |rec| rec.instance_variable_set(:@email, "dena.co.jp") end
			rows.map { |row| row.instance_values.values }
		target_records.each do |rec| rec.instance_variable_get(:@email, "dena.co.jp") end




	main
	  def self.convert_to_kencom_if_file(kenpo, in_csv, statuses)
    writers = {}

    begin
      out_csv_timestamp = Time.now.strftime("%Y%m%d%H%M%S")
      processing_row = 0
      processed_count = 0

      open(in_csv, "rb:CP932:UTF-8", undef: :replace, replace: '・') do |f|
        CSV.new(f).each do |in_csv_row|
          processed_count += 1
          processing_row += 1
          csv_columns = self::MY_CSV_COLUMNS.zip(self::MY_COLUMNS_OPTIONS, in_csv_row)
          out_columns = create_out_csv_hash(csv_columns, kenpo['kumiai_code'])
          next if skip?(kenpo, out_columns, in_csv, processing_row)
          out_csv_row = create_out_csv_row(out_columns)
          out_csv_name = "H01-#{kenpo['kumiai_code']}-#{out_columns['SIBU_C']}-DSC-#{out_columns['SINRYO_FROM']}#{out_columns['SINRYO_TO']}-#{out_csv_timestamp}.csv"
          get_writer(writers, out_csv_name).(out_csv_row, false)
        end
      end

      writers.values.each { |writer| writer.(nil, true) }
      return processed_count

    rescue => csv_file_error
      save_error_csv(kenpo['kumiai_code'], in_csv)
      reset_statuses(statuses, in_csv)
      raise csv_file_error
    end

  end


  def self.create_out_csv_hash(csv_columns, kumiai_code)
    out_csv_hash = {}

    csv_columns.each do |csv_column|
      item_name = csv_column[0]
      out_csv_hash[item_name] = default_value(csv_column[2], csv_column[1])
    end

    out_csv_hash['KUMI_C'] = kumiai_code
    out_csv_hash
  end

  def self.default_value(value, options)
    return value if options.nil?
    return nil if options[:delete]
    if options[:mapper]
      mapping = options[:mapper].constantize.find_by_zokugara_code(value)
      return mapping.send(options[:into])
    end
    return value ||= options[:default]
  end




#upsert like postgres
  class << self
    def upsert_wallet_coin(id, number, account_id = nil, sales_type = nil)
      record = nil
      SwitchableModel.transaction_with do
        record = find_or_initialize_by(id)
        record.new_record? ? record.save! : record.update!(number: number)
      end
      record
    end
  end
