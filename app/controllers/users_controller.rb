class UsersController < ApplicationController
  
  before_filter :logged_in, :except => [:new, :create]
  def new
      @user = User.new
  end
  
  def show
  end

    def create
      @user = User.new(params[:user])
      if @user.save
        redirect_to root_url, :notice => "Signed up!"
      else
        render "affiliates/new"
      end
    end
    
    
    
    def new_affiliate_details
      @affiliate_detail = AffiliateDetail.new
    end
    
    def create_affiliate_details
      @affiliate_detail = AffiliateDetail.new(params[:affiliate_detail])
      #raise @affiliate_detail.inspect
      if @affiliate_detail.save
        redirect_to user_affiliates_path(current_user.id)
        #create affiliate_urls
        code = @affiliate_detail.affiliate_code
        url_path = "http://app.breeasy.com/signup?referrer=#{code}"
        link = "<a href='#{url_path}'>Edit This Text</a>"
        user = @affiliate_detail.user
        url = user.urls.build(:product => "Breeasy For Business", :url => url_path, :link => link)
        url.save
      else
        render 'new_affiliate_details'
      end
      
    end
end
