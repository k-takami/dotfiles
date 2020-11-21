モック基本
	メソッドチェーン末尾オブジェクトから順にモックをぶらさげていく；
	  let(:client)   { Yamazaki::Client.new }
  let(:body)     { instance_double(Yamazaki::Response::Body) }
  let(:response) { instance_double(Yamazaki::Response) }
  let(:hokensha_bango) { 00000001 }

  describe '#passcode_kohai_reserve_fetch' do
    before do
      allow(body).to receive(:to_obj)
      allow(response).to receive(:body).and_return(body)
      allow_any_instance_of(Yamazaki::Client).to receive(:get).and_return(response)
    end
		なにもかえさないdeaf mock

          # Yamazaki.config.jwt.claim.aud = "https://kp-beryl-ope.dev.kenko-pf.local"
          # Yamazaki.config.jwt.claim.iss = "https://kp-fluorite.dev.kenko-pf.local"
          # Yamazaki.config.jwt.secret = "68ba6b6Ca52_a075455314d29f2fd14BG695fd71"
        before do
          allow_any_instance_of(yamazaki.new.class).to( receive(:state_as_checked))
          allow_any_instance_of(yamazaki.new.class).to( receive(:state_as_error)
    allow_any_instance_of(yamazaki.new.class).to(
      receive(:passcode_kohai_reserve_fetch).and_return(fetch_response)
    )


	ファイルアップロード
	pp @mockup_members[0..-1].map(&:passcode).map{|i| [i[:notification_method],i[:state]] }
    before do

      # Dir.mktmpdirにブロックを渡すと、ブロックを抜ける時に自動的に削除されます。
      # @@dir = Dir.mktmpdir.create_file

      # dravite_client_directory.setup
          # dravite_client_directory.create_file(
            # :medical_bill,
            # filename,
            # StringIO.new(
              # <<-DEFAULT_MEDICAL_BILL_CSV.gsub(/^\s+/, '')
              # DEFAULT_MEDICAL_BILL_CSV
            # )
          # )



        # response = (@yamazaki.get '/ope/kohai/state_as_checked',
          # {hokensha_bango: hokensha_bango, filename: filename_for_api}
        # ).body.to_obj

      # create_member_file(filename)
    end

# params << tmpfile[:members]



    after do
      # FileUtils.remove_entry_secure(@@dir)
    end




RSpecの標準matchers(マッチャー)一覧
	禁則
		:all  (before/after)禁止。完全に挙動せず、インスタンスが後続spec.rbをあてあずれエラーにする。
		#不要なテストコードはかかない。 処理に時間をかけたくないから。
		#mockはさける。挙動の理解と共有がむずかしい。
		#should禁止gem@github:　should_not, shoud_clean
	チートシート：https://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf

	https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
		http://freak-da.hatenablog.com/entry/20080124/p1
		http://www.rubydoc.info/gems/rspec-expectations/file/README.md
		http://morizyun.github.io/blog/rspec-builtin-matcher-rails/

	時間計算検証
	  describe "#calculated_previous_reset_time" do
    before { @ordinary_reset_timing = Time.zone.today.beginning_of_day + @trigger.reset_time.seconds_since_midnight }

    context "トリガーにリセット時間がない" do
      it "トリガー.start_date　を前回リセット日時として返す" do
        @trigger.reset_time = nil
        expect(described_class.new.calculated_previous_reset_time(@trigger)).to eq @trigger.start_date
      end
    end
    context "トリガーにリセット時間がある" do
      context "日本時間今日0:00:00にリセット時間を加算した時刻　が　プログラム実行時刻 以前" do
        it "日本時間今日0:00:00にリセット時間を加算した時刻　を前回リセット日時として返す" do
          Timecop.freeze(Time.zone.today.end_of_day)
          expect(described_class.new.calculated_previous_reset_time(@trigger)).to eq @ordinary_reset_timing
          Timecop.return
        end
      end
      context "日本時間今日0:00:00にリセット時間を加算した時刻　が　プログラム実行時刻よりもあと" do
        it "日本時間今日0:00:00にリセット時間を加算した時刻の1日前の時刻　を前回リセット日時として返す" do
          Timecop.freeze(Time.zone.today.beginning_of_day)
          expect(described_class.new.calculated_previous_reset_time(@trigger)).to eq @ordinary_reset_timing - 1.day
          Timecop.return
        end
      end
    end
  end
		@M

  def calculated_previous_reset_time(trigger)
    return trigger.start_date if trigger.reset_time.nil?
    ordinary_reset_timing = Time.zone.today.beginning_of_day + trigger.reset_time.seconds_since_midnight
    ordinary_reset_timing <= Time.zone.now ? ordinary_reset_timing : ordinary_reset_timing - 1.day
  end

	増減・移管検証
	     it "移動元アカウントIDのレコードが移動先のアカウントIDに書き換わっていること" do
      expect {
        WalletCoinBalance.transfer_ownership(guest_account.id, regular_account.id, client.id)
      }.to change(
        WalletCoinBalance.where(account_id: guest_account  ), :count
      ).by(-1).and change(
        WalletCoinBalance.where(account_id: regular_account), :count
      ).by(1)
    end





		.reload.number/count

	raising error and rollback
		ptn1
		﻿﻿    context "セッションの削除に失敗した場合" do
      it "変更はロールバックされること", :use_transaction do
        expect(controller.session).to receive(:delete) do
          fail StandardError
        end
session[:cart_id] = cart.id
	入出力型チェック
		ptn1
		+
+    it "商品購入履歴を作成し、ウォレットコイン残高引当処理をコールする" do
+      expect(ProductPurchaseHistory).to receive(:create_with_reading_status).and_return(history)
+      expect(Wallet).to receive(:purchase).with(account, released_sales_type, history)
+      ProductPurchaseHistory.create_coin_products(account, cart)
+    end


	 Time
		TimeCope
		    let(:current) { Time.new(2017, 4, 1).getlocal }
+
+    before { Timecop.freeze(current) }
+    after { Timecop.return }


	共通処理
		shared_examples_for '名前' {}
		subject {}
		+    subject { WalletCoinBalance.reduce(trigger, wallet, account, reduce_number) }
+      it "引き当てられたコイン出納履歴が作成される" do
+        expect { subject }.to change { CoinBalanceHistory.count }.by(2)
+      end
+      it "有効期限外のウォレットから残高が引き当てられない" do
+        expect { subject }.not_to change { old_wallet_coin_balance.**reload**.number }
+      end
+      it "引当残が0で返る" do
+        expect(subject).to eq 0
+      end
表示が妥当なこと
	正規表現マッチ
	      it '表示が妥当' do
        # /メールアドレス.+ウォレット名.+有効期限.+残高.+贈答・没収枚数.+顧客向けメッセージ/ を表示すること
        regexp_labels_tobe = /
          #{I18n.t("activerecord.attributes.account.email")}.+
          #{I18n.t("activerecord.attributes.account.wallet")}.+
          #{I18n.t("admin.accounts.expiration_at")}.+
          #{I18n.t("admin.accounts.wallet_coin_balance")}.+
          #{I18n.t("admin.accounts.coin_number")}.+
          #{I18n.t("admin.accounts.coin_balance_history_nessage")}
        /x
        expect(response.body).to match(regexp_labels_tobe)
      end
	expect(response.body).to have_content("Hello world")
	expect(response.body).to have_css("input", between: 1..3) # true if there 1 to 3 input tags
	expect(response.body).to have_css("p a", text: /[hH]ello(.+)/i) # true if there is a anchor tag with text matching regex
	expect(response.body).to have_selector(:css, "p a#movie_edit_path")
file upload
	patteernA: File.puts
	  before do
    remove_file(test_file_path)
    File.open(test_file_path, 'a', encoding: 'UTF-8', row_sep: :auto) do |file|
      file.puts('kigo,bango,birthday,name_kana,email')
      file.puts('100001,200001,1980-01-01,テスト君,yohei.a.ito+1@dena.com')
    end
  end
not_to raise_error
全部〜なこと & 逆
     shared_examples_for '画面でえらんだ通知手段が全件のパスコード.通知手段にセットされる' do
      it do
        targets_in_db = Member.where( id: params[:members]).map(&:passcode)
        notification_methods_in_db = targets_in_db.map(&:notification_method)
        expect(notification_methods_in_db).to all eq notification_method_name_new
      end
    end

    shared_examples_for 'エラー発生の処理単位ONE_TIME_PARAMETER_MAX件以降では通知手段は更新しない' do |offset_of_erroneous_member|
      it do
        targets_in_db = Member.where( id: params[:members][offset_of_erroneous_member..-1])
        notification_methods_in_db = targets_in_db.map(&:passcode).map(&:notification_method)
        expect(notification_methods_in_db.include? notification_method_name_new).to be_falsey
      end
    end
TRAVERSING
	links a[:href]
		doc = Nokogiri::HTML.parse(response.body)
		doc.css("a").map { |a| [a[:href], a.text] }
	submitting (WIP, with nokogiri)
	      it 'リンクが妥当' do
        # doc = Nokogiri::HTML.parse(response.body)
        # form = doc.css("form.simple_form")
        # button = eval(method) submission_path
        # submission_path = doc.css("form.simple_form").attribute("action").value
        # method = doc.css("form.simple_form").attribute("method").value
      end


config.mock_with :   ----Mock FrameWork
	rspec sample
	expect().to_receive
allow().to_receive
double(:model)
	rr sample
	let(:entities1) do
  [ NdlData::Entity.new({ :@name => 'いくらの図書館', :@library_code => '1234'}),
    NdlData::Entity.new({ :@name=>'うにの図書館', :@library_code => '5678'}),
    NdlData::Entity.new({ :@name=>'いくらの図書館'}), ]
end
stub(@mani).entities{entities1}
stub(NdlLibrary).find_by_code('1234'){NdlLibrary.new({
  :name => 'いくらの図書館', :repository_no => NdlRepository::NDL_OPAC_REPOSITORY_NO
})}
stub(NdlLibrary).find_by_code(nil){nil}

	__mocha sample__
	__flexmock sample__


