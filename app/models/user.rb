class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :activation
  attr_accessible :email, :password, :password_confirmation, :admin, :as => :admin_user

  has_secure_password

  before_save {|user| user.email = email.downcase}

  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  has_many :reports
  has_many :messages
  has_one :logging


  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
