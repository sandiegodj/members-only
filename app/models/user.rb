class User < ActiveRecord::Base

  before_save { self.email = email.downcase}
  before_create :create_remember_token
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
  #I removed uniquness validation for a test  uniqueness: {case_sensitive: false  }
  validates :password, length: {minimum: 6}
  has_secure_password
  before_save { email.downcase! }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  has_many :posts

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end  
end