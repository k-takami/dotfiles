ActiveSupport
	.camelize  <=> .underscore
	.tablerize <=>.classify
	.humanize
	.constantize.new
	.***gytes
	XML
	xml= <<-ENDOFHEARDOC
		<?xml....
		<entry>
			......
		</entry>
	ENDOFHEARDOC
	.from_xml(xml)



なければつくる
	Model.find_or_create_by_<attribute>(:<attribute> => "")
		eg) CheckItem.find_or_create_by({ check_item_code: '9N791000000000011', updated_ip_address: '127.0.0.1' })
	Model.find_or_initialize_by_<attribute>(:<attribute> => "")
		eg) User.find_or_initialize_by(kumiai_code: "dsc#{i.to_s}", encrypted_account_id: SymmetricEncryption.encrypt("desc#{i.to_s}admin"))


一括更新
current_time　=Time.zone.now
            destination_wallet_coins.update_all do |el|
              el.number += number_tobe_transfered
              el.updated_at: current_time,
              el.save!
            end
            #XXX: validateしたければ　もしくはdestination_wallet_coins.update(destination_wallet_coins.ids, Array.new(destination_wallet_coins.ids.size,number: number_tobe_transfered))


変換前<%= f.text_field :name, [[id,val],[id2,val2]...], selected: ***  %>
変換後<%= f.select :name, VenueCity.related_names, { include_blank: '-- Select --' }, class: "browser-default custom-select", id: "XXX" %>
          <script src="https://code.jquery.com/jquery-3.1.0.slim.min.js"></script>
          <script>
            $("#project_implementation_plan_receiving_country_id").change(function(){
              var data = { id: $(this).val() };
              $.ajax({
                url: '/api/venue_city_from_country',
                method: 'GET', dataType: 'json', data: data,
                error: function(xhr, status, error){ console.error('AJAX Error: ' + status + error); },
                success: function(response){
                  $('#XXX').html("<option value=''>-- Select --</option>");
                  $.each(response, function (i, val) {
                    $('#XXX').append($("<option>").val(val[0]).text(val[1]));
                  });
                }
              });
            });
          </script>

      @M
         scope :related_names, -> { pluck(:name).zip(pluck(:name)) }
         または
           def self.related_names(venue_id)
             related_things = venue_id ? where(venue_id: venue_id).pluck(:name).uniq : all.pluck(:name).uniq
             related_things.zip(related_things)
           end
      @R
          get '/api/some_name' => 'api#some_method'
      @C
          class ApiController < ApplicationController
            def some_method
              return unless request.xhr?
              render json: SomeClass.related_names(params[:id]), status: :ok
            end
          end






**(options_for_select(KV二次元配列やハッシュ、:selected=>選択状態にしたい値).sub(/="selected/,'="yes') ** #<---selected=yesにしないと最近のブラウザーが認識しない傾向
options_from_collection_for_select(:value列、:選択肢文言列、selected: 値)
#Scope
	Passcode.limit(1000).offset(0).by_hokensha_bango(hokensha_bango).includes(member: [:hokenshas, :member_peculiarity, :work_place]).includes(:passcode_transitions).where(state: [:issued, :reissued]).where(members: {expired: false}).to_sql


# transaction や同時アクセス　対策
  # ARELキャッシュリロード：　author.reload.books.reload.empty?





  NDL
  ]
  class UserSetting < ActiveRecord::Base
    belongs_to :user
    accepts_nested_attributes_for :user, :update_only => true

    #validates :name, :presence => true, :length => {:maximum => 100}
    validates :city, :presence => {:if  => :prefecture_id}

    before_save :set_lat_lng

    private
    def set_lat_lng
      return unless self.prefecture_id
      return unless Prefecture.find(self.prefecture_id)
      return unless self.city

      address = Prefecture.find(self.prefecture_id).name + self.city
      geo = EnjuNdl::GoogleGeocode.lat_lng(address)
      if geo
        self.lat = geo.lat
        self.lng = geo.lng
      end
      geo
    end
  end
  ~
  require 'openssl'
  class User < ActiveRecord::Base
    #PASSWORD_RESET_TIMEOUT = 24.hours

    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable, :lockable and :timeoutable
    #devise :database_authenticatable, :confirmable, :recoverable, :rememberable
  #         :registerable, :trackable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :login, :email, :password, :password_confirmation, :remember_me, :setting_attributes

    acts_as_paranoid

    has_and_belongs_to_many :roles
    has_one :setting, :class_name => 'UserSetting', :dependent => :destroy
    has_one :profile#, :dependent => :destroy
    accepts_nested_attributes_for :setting
    has_many :modification_requests
    belongs_to :ndl_library #librarian の所属図書館

    before_validation :set_tokens, :on => :create
    #before_validation :set_dummy_password
    #before_validation :set_login #, :on => :create
    before_validation :convert_email

    #PASSWORD_REGEX = /^[a-zA-Z0-9_\-\+\=\!\#\$\%\&\'\@\,\.\/]+$/i
    #SNIPPET: validates :some_attr, presence: true, numericality: true, length: { "is/maximum/inimum": 2 }, uniqueness: { scope: :deleted_at } #非削除レコードの中でunique制約
    # gem 'validates_timeliness', '~> 5.0.0.alpha3'
         validates_date :date_start, on_or_after: ->{ 1.month.ago.beginning_of_month.to_date }, on_or_after_message: 'は先月一日以降を入力してください', on: :create, unless: :data_import
         validates_date :date_start, after: :today, after_message: 'は翌日以降を入力してください', on: :update, if: :date_start_changed?

         def date_from_doesnt_overlap_last_period
           return unless date_from == Master::TaxRate.where.not(id: id).order(:date_from).last.date_to.tomorrow
           errors.add(:date_from, 'は 直前の消費税の終了日翌日の日付を入力してください。')
         end

    #
    #validates_presence_of :password, :on => :update, :if => :no_confirmed?
    #validates_presence_of :password_confirmation, :on => :update, :if => :no_confirmed?
    #validates_length_of :password, :on => :update, :minimum => 8, :allow_blank => true
    #validates_length_of :password_confirmation, :on => :update, :minimum => 8, :allow_blank => true
    #validates_format_of :password, :with  => PASSWORD_REGEX, :allow_blank => true
    #validates_format_of :password_confirmation, :with  => PASSWORD_REGEX, :allow_blank => true
    #validates_confirmation_of :password

    EMAIL_REGEX = /^[A-Z0-9_\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,4}|museum|travel)$/i
    #validates_presence_of   :email
    #validates_uniqueness_of :email
    #validates_format_of     :email, :with  => EMAIL_REGEX, :allow_blank => true

    # ユーザ設定テーブルの属性をUserから直接使えるようにする
    delegate :name, :to => :setting, :allow_nil => true
    delegate :prefecture_id, :to => :setting, :allow_nil => true
    delegate :city, :to => :setting, :allow_nil => true
    delegate :lat, :to => :setting, :allow_nil => true
    delegate :lng, :to => :setting, :allow_nil => true
    delegate :url, :to => :setting, :allow_nil => true
    delegate :library, :to => :setting, :allow_nil => true #ユーザ画面で設定する図書館
    delegate :max_display_size, :to => :setting, :allow_nil => true
    delegate :sort, :to => :setting, :allow_nil => true
  #  migrationが失敗するのでとりあえず
  #  (UserSetting.column_names - ["id", "user_id"]).each do |column|
  #    delegate column.to_sym, :to => :setting, :allow_nil => true
  #  end




# 略記方法
    # nested_model_query ORM関連先を条件にしたwhere : .where( orm_symbols:{some_column1: x, some_column2: y} )


