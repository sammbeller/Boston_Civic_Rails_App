class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :user_id
  

  before_save {|user| user.email = email.downcase}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_secure_password

  has_many :reports
  has_many :messages




  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
