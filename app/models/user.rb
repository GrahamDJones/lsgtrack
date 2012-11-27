class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :permissions, dependent: :delete_all

  before_save :ensure_authentication_token

  def self.reset_request_count!
    update_all("request_count = 0", "request_count > 0")
  end

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
