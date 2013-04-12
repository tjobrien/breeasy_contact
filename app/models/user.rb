class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :master, :master_id
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  has_one :affiliate_detail, :dependent => :destroy
  has_many :urls, :dependent => :destroy
  has_many :sub_affiliates, :class_name => "User", :foreign_key => "master_id"
  belongs_to :master_affiliate, :class_name => "User", :foreign_key => "master_id"
  belongs_to :account_executive
  has_one :content
  
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
  def get_breeasy_account
    retval = false
  ref_code = self.affiliate_detail.affiliate_code
  response = HTTParty.get("http://app.breeasy.com/api/v1/user/master_affiliate.json?affiliate_code=#{ref_code}")
  unless response['user'].nil?
    if response['user']['master_affiliate_id'] == ref_code
      retval = true
    end
  end
  return retval
  end
  
  def breeasy_username
    ref_code = self.affiliate_detail.affiliate_code
    response = HTTParty.get("http://app.breeasy.com/api/v1/user/master_affiliate.json?affiliate_code=#{ref_code}")
    unless response['user'].nil?
      retval = response['user']['username']
    end
    return retval
  end
end
