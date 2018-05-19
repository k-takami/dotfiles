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

