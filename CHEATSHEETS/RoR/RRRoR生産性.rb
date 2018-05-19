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
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]
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
	

