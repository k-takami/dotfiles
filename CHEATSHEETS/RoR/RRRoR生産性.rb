AgileWebDeb-DHH
  P421:cache
    page caching:  simplest, inside httpd
    action caching:  inside ActionControler,  before-filter
    #option B:  sweeper-base
      class ArticleSweeper < ActionController::Caching::Sweeper
        observe Article
      ...(cf.--->p426)
    #option A:  controller-base
      class content_controller < ApplicationController
      before_filter :verify_method_name, :except=>:publi_content
      def public_content
        @articles=Article.list_public
      end
      def privte_content
        @articles=Article.list_premium
      end
      def create_article
        article=Article.new(params[:article])
        if article.save
          expire_page  :action=>"public_content"
        end
      end
      def update_article
        article=Article.new(params[:article])
        if article.save
          expire_action  :action=>"premium_content"  :id=>article
        end
      end
      def delete_article
        Article.destroy(params[:id])
        expire_page  :action=>"public_content"
        expire_action  :action=>"premium_content"  :id=>params[:id]
      end

      private
      def verify_method_name
        user=session[:user_id]
        user=User.find(user) if user
        unless user && user.active?
          redirect_to :controller=>"login", :action=>"signup_new"
        end
      end
      #edit /config/environments/XXX.rb
        config.action_controller.perform_caching=true/false
      #prepare network-drive to store cache
      fragment caching --->p477
      #セッションの失効
        #cron 60分ごとに２ｎｎをキャッシュ,public.action/idをキャッシュ削除  411.585,
          #SQL:  delete from session where now() - updated_at > 3600;
        #cron 60分ごとに２ｎｎをキャッシュ,public.action/idをキャッシュ削除  411.585,
          #cron:  find {#@@page_cache_directory}/public -name '*.html*' -ctime +10m -delete
      p213,538,585  #ruby script/runner 'Hoge.piyo' -e production
      これだとRailsのアプリケーションの環境そのままにHogeモデルのpiyoメソッドを呼び出すことができる。
      eオプションをつけることにより実行環境を選べる

      id  11  92  *265    251
      ActiveRecord294-299
        SQL直実行: (テーブルがすでにloadされたときだけつかえる initializerでERROR:  relation "ndl_repositories" does not existの時点では無効)
        find_by_sql以外の方法
find_by_sql以外の方法もついでに紹介。
ActiveRecord::Base.connection.select_all
返り値はActiveRecord::Result、各要素はHashになっておりドットアクセスができない。プレースホルダーもActiveRecord::Base::sanitizeとかを使わないと利用できない。
ActiveRecord::Base.connection.execute
返り値はMysql2::Result。各要素の取得に一手間必要で面倒。
ActiveRecord::Base.connection.select
select_allとほぼ一緒。同じようなメソッドとしてdelete, insertもあるらしい。

    cycle (layoutスタイル交互切り替えhelper）
    link_to "Nonsense search", searches_path(:foo => "bar", :baz => "quux")
      # => <a href="/searches?foo=bar&amp;baz=quux">Nonsense search</a>
    link_to "Profile", @profile
      # => <a href="/profiles/1">Profile</a>
      <% link_to(@profile) do %>
        <strong><%= @profile.name %></strong> -- <span>Check it out!!</span>
    <% end %>
      # => <a href="/profiles/1"><strong>David</strong> -- <span>Check it out!!</span></a>
      #99 flash
      #ActonCtrler  before_filter 147,414
      #68,  335  validate_xxx
      #verify only=>[:method1a,:method1b] :except=>:method2,
        #:add_flash=> {:keyOrHash => "msg"},
        #:redirect_to=> params,
        #:params=> :keyOrHash,
        #:method=> :[:get/:post/:put/:delete],
        #:session=> :keyOrHash,
        #:xhr=> :keyOrHash,
        #:session=> :keyOrHash,
        #:add_flash=> {:hash=>hashvalue},
        #:add_headers=> {:hash=>hashvalue}e
        #:render=> params,
        #
      #before/after/around_filter :method1,only=>[:method1a,:method1b] :except=>:method2
      #before/after/around_filter do |cntroller_name|
        #--> controller.self.filter  #100  flash
    #335  validate_xxx

    #flash[:success|danger|alert|danger|notice]と4種つかえるが　redirect_to.*{success:|alert: ***}
    #  https://api.rubyonrails.org/classes/ActionController/Redirecting.html


#写経 #rails2-180tips /ash
    JSON
      *rails 1系をrails2互換にする時は .attributes.to_json
      hash変換: JSON.decode(***)
    Enumerable
      .index_by(&:***), .group_by(&:***), .sum(&:***)
      ModelA.find(:all).index_by( hash_keys_array)
      ModelA.find(:all).index_by( &:attribute_name_of_model_A)

#Rails 2新比較
find-all_by_columnname(値配列 ) as array
mytigbug; tigbug
#Railsよびだし
	ActionView::Helpers, ActionController::Base.helpers ,

			validator
			 def require_allowed_ip_address request_ip = IPAddress.parse request.remote_ip render_fail(:forbidden) unless CARewardConfig::ALLOWED_IP_ADDRESSES.any? { |ip| ip.include? request_ip } # export CA_REWARD_IP_ADDRESSES="192.168.0.0/16" みたくサブネットマスク書式でshell変数に定義されていても動作可能 end





#decorator
	@M:
		include Draper::Decoratable
	@decorators/module_name/class_name.rb
		module Hokensha
			class MemberPasscodesDecorator < Draper::Decorator
			delegate_all
#validator
	@M:
		attr_accessor :hokensha_bango, :upload_file
		validates :hokensha_bango, presence: true, numericality: { only_integer: true }, length: { in: 7..8 }
		...
		validates_with PasscodeMailDeliverInputFileValidator
	@Vldtr
		def validate(record)
			return if record.upload_file.blank?
	　
	1 orf 2
	M
validate :presence_of_first_name_or_second_name

  private

  def presence_of_first_name_or_second_name
    if member_name_first.blank? && member_name_second.blank?
      errors.add(:member_name, ' is totally blank')
    elsif member_name_first && !SymmetricEncryption.encrypted?(encrypted_member_name_first)
      errors.add(:member_name_first, ' is not encrypted')
    elsif member_name_second && !SymmetricEncryption.encrypted?(encrypted_member_name_second)
      errors.add(:member_name_second, ' is not encrypted')
    end
  end
	regexp
	#BUILTIN
  validates :insurance_code, format: { with: /^[a-zA-Z0-9]{1,8}$/ }
  validates :number, presence: true, if: Proc.new{|_self| _self.number.to_s !~ /\A\-*\d+\z/}


#CUSTOM
#       @wallet_coin_balance.wallet_coin_check(params[:number])
#論外       fail StandardError if @wallet_coin_balance.errors.any?

  #ARGS: params[****_id]
  validate :wallet_coin_check
  def wallet_coin_check
    if number.blank?
      errors.add(:number, :blank)
    elsif number !~ /\A\-?\d+\z/
      errors.add(:number, I18n.t("common.invalid_form_data"))
    end
  end
  def wallet_coin_check2(requested_number)
    if requested_number.blank?
      errors.add(:number, :blank)
    elsif requested_number !~ /\A\-?\d+\z/
      errors.add(:number, I18n.t("common.invalid_form_data"))
    end
  end

	Controller
	module Api
  module V1
    # APIベースコントローラ
    class ApiController < ::ApplicationController
      class BadRequest          < StandardError; end
      ...

      skip_before_action :verify_authenticity_token

      before_action :authenticate_account!, except: [:render_404, :render_405]
      before_action :required_app_version!, except: [:render_404, :render_405]
      rescue_from StandardError, with: :rescue_exception




#callbacks
	prepend_before_filter ＞ before_filter
	skip_before_filter #<---親コントローラー設定したフィルターを、子コントローラーでは無効化





  snippet_view_jquery
  <script src="https://code.jquery.com/jquery-3.1.0.slim.min.js"></script>


### snippet-rails-model モデルにありがちな処理
  https://qiita.com/hmuronaka/items/818c421dc632e3efb7a6
  snippet_Rails5 FK制約テーブルドロップ ---> Rails5
  DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=development  rake db:drop
  ORM 一方向：keyは両方書かないとバギー　uniratarall
  has_one :master_torihikisaki, class_name: 'Master::Torihikisaki', foreign_key: 'id',  primary_key: 'master_torihikisaki_id'
  Rack::Utils.parse_nested_query(format)['master_torihikisaki_id']


# Cracking
  DB password:  ActiveRecord::Base.connection.execute("select COUNT(*) from XXXX") で多分表示される
th_op
~                                                                                           |  tions if: :
~                                                                                           |  filter_date



