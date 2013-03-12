class AffiliateMailer < ActionMailer::Base
  
  default :from => "admin@breeasy.com"
  
  def welcome_master(user)
      @user = user
       @url  = "http://affiliate.breeasy.com"
       mail(:to => user.email, :subject => "Your New Breeasy Master Affiliate Details")
  end
  
  def welcome_standard(user)
      @user = user
       @url  = "http://affiliate.breeasy.com"
       mail(:to => user.email, :subject => "Your New Breeasy Affiliate Details")
  end
  
  def welcome_sub_standard(user)
       @user = user
        @url  = "http://affiliate.breeasy.com"
        @master = User.find @user.master_id
        mail(:to => user.email, :subject => "Your New Breeasy Affiliate Details")
  end
  
end