 appirits
        # === Description
        # * recieve point notification from CA Reward
        # === URL
        # GET https:/__INSTANCE__/api4ext/ca_reward/v1/apps/:app_id_token/events/completion_of_ca_reward_event
        # === Request
        # ==== Mandatory parameters
        # <b>id</b>::
        #   store_user id with heroku app name
        # <b>cid</b>::
        #   ad id of ca reward
        # <b>point</b>::
        #   amount of coin
        # <b>action_id</b>::
        #   reward id of ca reward
        # <b>app_id_token</b>::
        #   app_id_token of app
        # ==== Optional parameters
        # <b>cname</b>::
        #   name of ad of ca reward
        # <b>carrier</b>::
        #   carrier of user
        # <b>click_date</b>::
        #   date of click
        # <b>action_date</b>::
        #   date of action
        # <b>amount</b>::
        #   amount of sales
        # <b>commission</b>::
        #   amount of commission
        # <b>aff_id</b>::
        #   affiliate id of ca reward
        # <b>pid</b>::
        #   cource id of ca reward
        # <b>media_data</b>::
        #   media_data
        # === Response
        # ==== success case
        # * Http status
        #   * 200
        # * body
        #   * OK
        # ==== fail case
        # * Http status
        #   * 403: request ip is not allowed
        #   * 400: request parameter is invalid
        # * body
        #   * NG

        # Quoted froom Publis: app/models/app.rb

//RDoc コメントの付け方
	■rdocの生成
	rdoc は、手元でドキュメントを生成してみて、ちゃんと出力されることを確認する。
	rdoc は、以下のコマンドで生成できる。
	$ rdoc -c utf8
	ドキュメントはカレントディレクトリの下の doc ディレクトリにHTML形式で生成される。また、オプションに -d をつけると、クラス図もつく（あまりわかりやすい図ではないが）
	rails の場合は、以下のようにして生成する。
	$ rake doc:app
	カレントディレクトリの下の doc/app に生成される。
	原則として、実装したクラス、モジュール、メソッド、定数には RDoc 形式のコメントを付ける。
		// スタック・アンダーフロー
		class UnderflowError < RuntimeError; end
		// スタック・オーバーフロー
		class OverflowError < RuntimeError; end
		// デフォルトのスタック容量
		DEFAULT_CAPACITY = 10
	
		// スタックの大きさ
		attr_reader :size
		// スタックの容量
		attr_reader :capacity
		// スタックへオブジェクトをプッシュする。
		// ==== Args
		// _obj_ :: プッシュするオブジェクト
		// ==== Raise
		// OverflowError :: スタック内のオブジェクトが容量を超える場合に発生。
		def push obj
			// TODO Stack//push の実装
		end
		// スタックからオブジェクトをポップする。
		// ==== Return
		// ポップされたオブジェクト。
		// ==== Raise
		// UnderflowError :: スタックが空である場合に発生。
		def pop
			// TODO Stack//pop の実装
		end
	end
	? クラスコメント(ファイル先頭部分)のルール
	o require、namespace定義は、クラスコメントより上に記述する。
	(クラスコメントより下に記述すると、ファイルのコメント部分に表示されるようになるため)
	o 必ずクラス名を含める。
	(この部分のRDocの出力にクラスのドキュメントへのリンクが自動で含まれないため)
	? メソッドのコメントルール
	o 引数は　# ==== Args以下に # _"変数名"_ :: "変数の説明"形式で記述する。 
	o 戻り値が有る場合は # === Return以下に必ず記述する。 
	o 特筆すべき例外は # ==== Raise以下に # "例外クラス名" :: "例外の説明"形式で必ず記述する。 
//#Rdoc #template
	# 処理内容 
	# ==== Args
	# _objectname_ :: description
	# ==== Return
	# _objectname_ :: description
	# ==== Raise
	# 処理内容 
	# 
	# ==== Args
	# __ :: 
	# ==== Return
	# __ ::
	# ==== Raise
	■rdocの生成
	rdoc は、手元でドキュメントを生成してみて、ちゃんと出力されることを確認する。
	rdoc は、以下のコマンドで生成できる。
	$ rdoc -c utf8
	ドキュメントはカレントディレクトリの下の doc ディレクトリにHTML形式で生成される。また、オプションに -d をつけると、クラス図もつく（あまりわかりやすい図ではないが）
	rails の場合は、以下のようにして生成する。
	$ rake doc:app
