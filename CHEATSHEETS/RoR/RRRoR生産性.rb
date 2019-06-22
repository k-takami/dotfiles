
#写経 #rails2-180tips /ash
    #remove rdoc and ri doc
      rm -r `gem env gemdir`/doc

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
<%= debug @article %>

#Rails-core
	template rendering = ActionView::LookupContext>
	[32, 41] in /usr/local/lib/ruby/gems/2.3.0/gems/actionpack-5.0.0.1/lib/action_controller/metal/implicit_render.rb
   32:     include BasicImplicitRender
   33:
   34:     def default_render(*args)
   35:       if template_exists?(action_name.to_s, _prefixes, variants: request.variant)
   36:         render(*args)
=> 37:       elsif any_templates?(action_name.to_s, _prefixes)
   38:         message = "#{self.class.name}\##{action_name} is missing a template " \
   39:           "for this request format and variant.\n" \
   40:           "\nrequest.formats: #{request.formats.map(&:to_s).inspect}" \
   41:           "\nrequest.variant: #{request.variant.inspect}"
(byebug) any_templates?(action_name.to_s, _prefixes)




From: /usr/local/lib/ruby/gems/2.3.0/gems/actionview-5.0.0.1/lib/action_view/lookup_context.rb @ line 135 ActionView::LookupContext::ViewPaths#exists?:

    134: def exists?(name, prefixes = [], partial = false, keys = [], **options)
 => 135:   @view_paths.exists?(*args_for_lookup(name, prefixes, partial, keys, options))
    136: end

[1] pry(#<ActionView::LookupContext>)> @view_paths
=> #<ActionView::PathSet:0x007fa6b191dac0
 @paths=
  [#<ActionView::OptimizedFileSystemResolver:0x007fa6ac341430
    @cache=#<ActionView::Resolver::Cache:0x7fa6ac3413b8 keys=32 queries=0>,
    @path="/Users/some_body/Downloads/platinum-dev-env/cms/app/views",
    @pattern=":prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}">,
   #<ActionView::OptimizedFileSystemResolver:0x007fa6ac341b60
    @cache=#<ActionView::Resolver::Cache:0x7fa6ac341b38 keys=32 queries=0>,
    @path="/usr/local/lib/ruby/gems/2.3.0/gems/apipie-rails-0.3.6/app/views",
    @pattern=":prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}">,
   #<ActionView::OptimizedFileSystemResolver:0x007fa6ac342240
    @cache=#<ActionView::Resolver::Cache:0x7fa6ac342218 keys=32 queries=0>,
    @path="/usr/local/lib/ruby/gems/2.3.0/gems/devise-4.2.0/app/views",
    @pattern=":prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}">]>
[2] pry(#<ActionView::LookupContext>)> prefixes
=> ["whatisdna", "contentpage", "basepage", "application"]
[3] pry(#<ActionView::LookupContext>)> partial
=> false
[4] pry(#<ActionView::LookupContext>)> args_for_lookup(name, prefixes, partial, keys, options)
=> ["future",
 ["whatisdna", "contentpage", "basepage", "application"],
 false,
 {:locale=>[:en], :formats=>[:html], :variants=>[], :handlers=>[:raw, :erb, :html, :builder, :ruby, :slim, :coffee, :jbuilder]},
 #<ActionView::LookupContext::DetailsKey:0x007fa6b2c53ba8 @digest_cache=#<Concurrent::Map:0x007fa6b2c53b80 entries=0 default_proc=nil>>,
 []]
ネストロード nested loading [[http://qiita.com/necojackarc/items/fb76352dbea5bdd83366
	model, lib >> config/application.rb
	module Myapp
  class Application < Rails::Application
    # < rails4
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]
    # > rails5
    config.paths.add 'lib', eager_load: true
	#some_body nested loading
		config.autoload_paths += Dir["#{Rails.root}/app/models/*"] #recursive
		# config.autoload_paths += Dir["#{Rails.root}/app/viewmodels/*/"] #just 1 dir
		#some_body nested loading ##################################################
		IP判定
		　



			init
			  USER_ID_PREFIX       = ENV["CA_REWARD_USER_ID_PREFIX"] || ""
  ALLOWED_IP_ADDRESSES = (ENV["CA_REWARD_IP_ADDRESSES"] || "")
  ALLOWED_IP_ADDRESSES = ALLOWED_IP_ADDRESSES.split(",").map(&:strip).map { |s| IPAddress.parse(s) } if ALLOWED_IP_ADDRESSES
  TEST_APP_CONFIG      = ENV["CA_REWARD_TEST_APP_CONFIG"].present? ? JSON.parse(ENV["CA_REWARD_TEST_APP_CONFIG"]) : nil


			validator
			 def require_allowed_ip_address request_ip = IPAddress.parse request.remote_ip render_fail(:forbidden) unless CARewardConfig::ALLOWED_IP_ADDRESSES.any? { |ip| ip.include? request_ip } # export CA_REWARD_IP_ADDRESSES="192.168.0.0/16" みたくサブネットマスク書式でshell変数に定義されていても動作可能 end


request.env["HTTP_USER_AGENT"]
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





    ### snippet_rails_controllers コントローラーにありがちな処理
      @model = eval(controller_name.singularize.classify)
      rails_root_fqdn = request.url.slice /^.+#{request.env["HTTP_HOST"]}/  || root_url.chop
      possible_approval_id = request.referer&.slice(/approval_object_lists\/(\d+)/, 1)
      Rack::Utils.parse_nested_query(format)['master_torihikisaki_id']



  **snippet_cyclic連番** ---> RoR
    / 論理削除されていない範囲でcodeに"000"~"999"連番をサイクリックにセット
    - numerized_code = @resource&.class&.last&.code.to_i
    - unless @resource&.code

      = f.hidden_field :code, value: ((numerized_code + 1) < 999 ? (numerized_code + 1).to_s.rjust(3 , '0') : '000')

  snippet_view_jquery
  <script src="https://code.jquery.com/jquery-3.1.0.slim.min.js"></script>






### snippet-rails-model モデルにありがちな処理
  snippet_複数の子レコードを作成・更新する RoR . accepts_nested_attributes_for
  =　has_*** dependent ?
  https://qiita.com/hmuronaka/items/818c421dc632e3efb7a6
  snippet_Rails5 FK制約テーブルドロップ ---> Rails5
  DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=development  rake db:drop
  ORM 一方向：keyは両方書かないとバギー　uniratarall
  has_one :master_torihikisaki, class_name: 'Master::Torihikisaki', foreign_key: 'id',  primary_key: 'master_torihikisaki_id'
  Rack::Utils.parse_nested_query(format)['master_torihikisaki_id']

  validates :some_attr, presence: true, numericality: {true|false|other_than: 0 }
  e, length: { "is/maximum/minimum": 2 }, uniqueness: { scope: :deleted_at }

    # チェックが入っている場合限定;  ↓
    with_options if: :filter_date do
      validates :date, presence: true
      validate :end_after_start
    end





