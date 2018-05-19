基本　＝ At-Build-BSTUB-Cre# インスタンスを生成（ただし未保存）
# インスタンスを生成（ただし未保存）
user = build(:user)

# インスタンスを生成（保存済み）
user = create(:user)

# インスタンス生成に使われる属性集合を返す
attrs = attributes_for(:user)

# スタブオブジェクトを生成
stub = build_stubbed(:user)

# インスタンス生成のためにブロックを渡すパターン
create(:user) do |user|
  user.posts.create(attributes_for(:post))
end

before { get :action_name, param1: param.....} 
json = JSON.parse(response.body, symbolize_names: true)
            expect(Dir.glob(@bill_gpg_path+'*.csv').count).not_to eq(0)
            expect(response.body).to include(controller.view_context.admin_search_row(Device, nil))



	user = build(:user)
	
	# インスタンスを生成（保存済み）
		user = create(:user)
	#引数にもDBにもなければ作る
		wallet  = arg_wallet || Wallet.where(id: 1).first ||  FactoryGirl.create(:wallet, id: 1, name: "DUMMY")
	has_manyな関連オブジェクトまで一気に作成
		create(:wallet, wallet_limits: [build(:wallet_limit, limit: wallet_limit)], name: "DUMMY") 
	関連モデル生成とid代入をしつつlet句を定義
		let(:wallet) { create(:wallet, wallet_limits: [build(:wallet_limit, coin_limit: 1000)], clients: [create(:client)]) }
		
	# インスタンス生成に使われる属性集合を返す
	attrs = attributes_for(:user)
	
	# スタブオブジェクトを生成
	stub = build_stubbed(:user)
	
	# インスタンス生成のためにブロックを渡すパターン
	create(:user) do |user|
		user.posts.create(attributes_for(:post))
	end
	
	before { get :action_name, param1: param.....} 
	json = JSON.parse(response.body, symbolize_names: true)
		expect(Dir.glob(@bill_gpg_path+'*.csv').count).not_to eq(0)
		expect(response.body).to include(controller.view_context.admin_search_row(Device, nil))
	Capybara.default_selector = :css

sample
    before do
      @zip_path = "spec/fixtures/files/bill/dsc1/"
      @csv_path = @zip_path + "csv/"

      @bill_csv_path = "tmp/data/knsys/knsys-garnet/vendor/V2/csv/"
      @bill_gpg_path = "tmp/data/kencom/"
      @target_dir_path = "tmp/data/knsys/dhs/dravite/latest/"
      @error_zip_path = "tmp/data/knsys/knsys-garnet/vendor/V2/error/"

      @src_zip_file = @zip_path + 'H01-dsc1_医療費.zip'
      @src_csv_file = @csv_path + 'JPCH001_dsc1_201610010000.csv'
      @target_csv_file = @target_dir_path + 'H01-dsc1_201610010000.csv'
    end
    after do
      delete_dir = "tmp/data"
      FileUtils.rm_r(delete_dir) if File.exist?(delete_dir)
    end

    context "valid bill csv file"  do
        it "is valid make csv exists" do
            # delete
            FileUtils.rm(Dir.glob(@bill_gpg_path+'*.csv'))
            # upload
            FileUtils.mkdir_p(@bill_csv_path,  {:mode => 0770} )
            FileUtils.cp( @src_csv_file, @bill_csv_path )
            FactoryGirl.build(:kenpo, vendor_code: 'V2', kumiai_code: 'dsc1', kencom_relation_pattern: :both).save
            FactoryGirl.create(:upload_insured_with_encryption,  kumiai_code: 'dsc1', personal_number: '1').save

            CreateKencomFileVendorMedicalBill.instance_variable_set(:@fiscal_year_last_date, 20170331)
            CreateKencomFileVendorMedicalBill.run
byebug
            expect(Dir.glob(@bill_gpg_path+'*.csv').count).not_to eq(0)
            expect(response.body).to include(controller.view_context.admin_search_row(Device, nil))
        end
    end

sample: helper-class
RSpec.describe Admin::BaseHelper, type: :helper do
  describe "#csv_download_limit_confirm" do
    let(:accounts) { Account.page(1) }

    before do
      Account.class_variable_set("@@csv_row_limit", csv_row_limit)
      10.times { create(:account) }
    end

  context 'ウォレット対応 (refs# 109530)' do
    let(:account) { create :account, :in_use }
    let(:wallet_coin_balance) { create(:wallet_coin_balance, account_id: account.id, wallet_id: 1, number: 9) }
    before do
      wallet_coin_balance.errors.add(:number, I18n.t("common.invalid_form_data"))
    end
    describe '#wallet_coin_form_group(erroneous_model)' do
      it "赤色でエラー表示をするCSSクラスを呼び出すHTMLコードが生成されること" do
        ret = helper.wallet_coin_form_group(wallet_coin_balance) { "<br />" }
        expect(ret !~ /<div class=.form.group has.error.>/).to be_falsy
      end
    end
mockup view result
    def mockup_format_ng
      create(:user, id: 1, kumiai_code: "dsc1", name: "DUMMY")
      @contents = build(:upload_status, id: 1, status: 6, upload_file_name: '日本語_髙.zip', file_type: 4, created_at: Time.now.utc)
      @upload_statuses << @contents
      assign(:upload_statuses, @upload_statuses)
      render :template => "upload_statuses/index.html.erb"
    end

API 





