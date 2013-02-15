class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  has_one :affiliate_detail, :dependent => :destroy
  has_many :urls, :dependent => :destroy
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  def get_breeasy_billing_referrals
    ref_code = self.affiliate_detail.affiliate_code
    response = HTTParty.get("http://billing.breeasy.com/api/v1/user/referral_users.json?referrer=#{ref_code}")
    return response
  end
  
  def get_bfsb_referrals
    ref_code = self.affiliate_detail.affiliate_code
    response = HTTParty.get("http://app.breeasy.com/api/v1/users.json?referrer=#{ref_code}")
    return response
  end
end
