
	#budle exec guard で更新されたMVCだけテストする 
	#Guardfile例: 
	guard 'rspec', cli: '--drb --format Fuubar --color', version: 2 do 
		# すべての更新されたspecを実行 
		watch(%r{^spec/.+_spec\.rb$}) 
		# lib/フォルダーの中のファイルが変更された時libのspecを実行 
		watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" } 
		# モデルが変更された時関連モデルのspecを実行 
		watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" } 
		# ビューが変更された時関連ビューのspecを実行 
		watch(%r{^app/(.*)(\.erb|\.haml)$}) { |m| "spec/#{m[1]}#{m[2]}_spec.rb" } 
		# コントローラが変更された時コントローラと関連ある統合テストのspecを実行 
		watch(%r{^app/controllers/(.+)\.rb}) { |m| "spec/requests/#{m[1]}_spec.rb" } 
		# application_controllerが変更された時すべての統合テストのspecを実行 
		watch('app/controllers/application_controller.rb') { "spec/requests" } 
	end 

	#まれに外部webサービスをテストするときは代用にgithub: webmock 
	let(:uri) {'http://***'} :NG=inside 'before' 
	before {stub_requent(:get|post, uri).to_return(status: ***, body: 
		:OK=inside 'it', NG=inside describe using with 'it_should_behave_like' 

	fixture('ficture_name'))} 
	it *** do 
		page.driver.get uri 
		expect(page).to have_content '******' 
	end 

	#メッセージ着色は　guthub: foobar 
	　http://jeffkreeftmeijer.com/2010/fuubar-the-instafailing-rspec-progress-bar-formatter/ 

	#ステートメントはsubjectで集約する 
	subject {chainX} 
	it {should  match Y} 
	it {should  match Z} 

	　#named subject 
	　subject (:name){chainX} 
	　it {expect(name.attr).to *****} 

	#before内変数はlet句で集約。※単にインスタンス変数置き換え表現のこともある。 
	#変数の効果的な代入はbeforeじゃなくlet : for lazy loading 
	#ブロックが定義されたときにloadさせたければlet! 
	let(:name) {chainX}   :OK=inside 'it'  NG= inside 'before' 
	it {expect{(name.attr).to ****}} 

	****疑問:letとsubjectのちがいは? 

	#コントローラーのテストではShared exampleを検討する 
	#置き場所は spec/support/shared_examples_for_***.rb 

	it_behaves_like 'a SHARED EXAMPLE NAME' 

	#よびだしかた: 宣言 
		include_examples "name"      # include the examples in the current context 
		it_behaves_like "name"       # include the examples in a nested context 
		it_should_behave_like "name" # include the examples in a nested context 
	#複数describeのかきかた 
	　require 'set' 
		shared_examples "sahred example name" do |obj1, obj2, ... objN | 
		end 
		describe **** do 
		end 
		describe **** do 
		end 

	#built-in matchers 
	#ぐうたらな方法は全部satisfyですますこと 
		expect(10).to satisfy { |v| v % 5 == 0 } 
		expect(7).not_to satisfy { |v| v % 5 == 0 } 

	# 
	.to be 
		expect(9).to be >= 6 
		expect(3).to be <= 3 
		expect(1).to be < 6 

	.to eq 

	.to be_instance_of 
	.to be_kind_of 
	.to be_a      #*************************************** 
	.to exist     #= obj.exist? 
	expect(obj).to respond_to(:foo, :bar) # passes if 
	obj.respond_to?(:foo) && obj.respond_to?(:bar) 
	expect(obj).to respond_to(:foo).with(1).argument  #引数1個うけとること 
	expect(obj).to respond_to(:bar).with(2).arguments #引数2個うけとること 
	specify { expect { 5 + 5 }.not_to throw_symbol }  #シンボル型でないこと 
	specify { expect { print('foo') }.to output.to_stdout } 
	specify { expect { print('foo') }.to output('foo').to_stdout } 
	specify { expect { print('foo') }.to output(/foo/).to_stdout } 
	specify { expect { }.to_not output.to_stdout }    #STDOUT 

	.to be_truthy #=present? 
	.to be_falthy #=blank? 
	.to be_true 
	.to be_false 
	.to be_nil 

	.to be_XXX    #=obj.XXX? 
		expect([]).to be_empty 
		.be_zero 

	#返値 変動幅のマッチャー 
	(value).to be_within(diff).of(expected-value)   #= ABS(value - 
	expected-value) < diff 
	expect { Obj.method }.to change(object, :attribute)}.from(X).to(Y) 
		expect { Obj.method }.to change(Obj.attribute)}.from(X).to(Y) 
	expect { Obj.method }.to change(object, :attribute)}.by(diff-number)   #step 
		expect { Obj.method }.to change(Obj.attribute)}.by(diff-number) 

	.to match(/RE/) 
	.to have_XXX  #=obj.has_XXX? 
		expect(:a =>1).to have_key(:a) 

	(arr|str|kv).to include(elements|str|kv) 
	(arr|str).to start_with(elements|str) 
	(arr|str).to   end_with(elements|str) 
		expect("this string").to start_with("this") 
		expect("this string").not_to start_with("that") 
		expect([0,1,2]).to start_with(0, 1) 
		expect("this string").to end_with "string" 
		expect("this string").not_to end_with "stringy" 
		expect([0, 1, 2]).to end_with 1, 2 

	([1,2,3]).to match_array([1,2,3]) 
	([1,2,3]).to contain_exactly(2,1,3)  #順不同 

	.to raise_error 
	.to raise_error(ErrClass) 
	.to raise_error('msg') 
	.to raise_error(ErrClass, 'msg') 
	.to throw_symbol 
	.to throw_symbol(:sym) 
	.to throw_symbol(:sym, 'val') 
		expect { raise "oops" }.to raise_error 
		expect { raise "oops" }.to raise_error(RuntimeError) 
		expect { raise "oops" }.to raise_error("oops") 
		expect { raise "oops" }.to raise_error(/op/) 
		expect { raise "oops" }.to raise_error(RuntimeError, "oops") 
		expect { raise "oops" }.to raise_error(RuntimeError, /op/) 

	　例) 
	　expect { 3 / 0 }.to raise_exception 
	　　= expect { 3 / 0 }.to raise_error 
		expect { raise StandardError, 'this message exactly'}.to 
	raise_error('this message exactly') 
		expect { raise StandardError, "my message" }.to raise_error(/my mess/) 

	https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/yield-matchers 
		yield_control matches if the method-under-test yields, regardless 
	of whether or not arguments are 

	yielded. 
		yield_with_args matches if the method-under-test yields with 
	arguments. If arguments are provided to 

	this matcher, it will only pass if the actual yielded arguments match 
	the expected ones using === or ==. 
		yield_with_no_args matches if the method-under-test yields with no 
	arguments. 
		yield_successive_args is designed for iterators, and will match if 
	the method-under-test yields the 

	same number of times as arguments passed to this matcher, and all 
	actual yielded arguments match the 

	expected ones using === or ==. 

	#rspec pending --> # pending("") 
