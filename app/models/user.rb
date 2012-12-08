class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :permissions, dependent: :delete_all

  before_save :ensure_authentication_token
  before_save :default_name

  def self.reset_request_count!
    update_all("request_count = 0", "request_count > 0")
  end

  def to_s
    "#{name} (#{admin? ? "Admin" : "User"})"
  end

  private

  def default_name
    self.name = self.email if self.name.blank? || self.name.nil?
  end
end
