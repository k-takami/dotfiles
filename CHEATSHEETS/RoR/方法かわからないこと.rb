RSPEC 
	コールバックrspec方法
	#validate_with 
File.basename(aaa.upload_file.path)
PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file)
PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file).validate
PasscodeKohaiDeliverInputFileValidator
PasscodeKohaiDeliverInputFileValidator
PasscodeKohaiDeliverInputFileValidator#methods: validate
PasscodeKohaiDeliverInputFileValidator(PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file)).validate
PasscodeKohaiDeliverInputFileValidator.new.validate
PasscodeKohaiDeliverInputFileValidator.new.validate
PasscodeKohaiDeliverInputFileValidator.new.validate( PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file) )
PasscodeKohaiDeliverInputFileValidator.new.validate(aaa)
PasscodeKohaiDeliverInputFileValidator.validate
PasscodeKohaiDeliverInputFileValidator.validate

aaa._run_validate_callbacks
aaa._validate_callbacks
aaa.ogiginal_filename
aaa.original_filename
aaa.run_callbacks
aaa.run_callbacks(PasscodeKohaiDeliverInputFileValidator.new.validate(aaa))
aaa.run_callbacks(PasscodeKohaiDeliverInputFileValidator.new.validate)
aaa.run_callbacks(PasscodeKohaiDeliverInputFileValidator.validate)
aaa.run_callbacks(bbb.validate(aaa))
aaa.upload_file
aaa.upload_file.methods.grep('original')
aaa=PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file)
aaa=PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file)
aaa=PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file, original_filename: :test_file_name)
aaa=PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file, original_filename: :test_file_name) 
bbb.options
bbb=PasscodeKohaiDeliverInputFileValidator.new
bbb=PasscodeKohaiDeliverInputFileValidator.new(original_filename: "###"
binding.pry

#Rspec
    context '異常データの場合' do
      let(:test_file_name) { 'test.badextention' }
      let(:test_file_path) { test_file_dir + test_file_name }
      let(:upload_file)    { File.open(test_file_path) }
      let(:handler) do
byebug
        PasscodeKohaiDeliver.new(hokensha_bango: hokensha_bango, upload_file: upload_file)
      end

      it '戻り値にtrueが返却される' do
        expect(handler.upload!).not_to be_truthy
      end

      it 'ファイルがアップロードされている' do
        handler.upload!
        expect(FileTest.exist?(upload_file_dir.join(out_file_name))).not_to be_truthy
      end
    end

