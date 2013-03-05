class UsersController < ApplicationController
  
  before_filter :logged_in, :except => [:new, :create]
  
  def new
      @user = User.new
      @referrer = "breeasy"
  end
  
  def show
  end

    def create
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        redirect_to new_affiliate_details_path, :notice => "Signed up!"
      else
        if @user.master
          render "affiliates/new_master"
        elsif @user.master_id
          @master_affiliate = User.find(@user.master_id)
          render 'affiliates/sub_affiliate'
        else
          render "affiliates/new_standard"
        end
      end
    end
    
    
    
    def new_affiliate_details
      @affiliate_detail = AffiliateDetail.new
    end
    
    def create_affiliate_details
      @affiliate_detail = AffiliateDetail.new(params[:affiliate_detail])
      #raise @affiliate_detail.inspect
      if @affiliate_detail.save
        
        #create affiliate_urls
        code = @affiliate_detail.affiliate_code
        #url_path = "http://app.breeasy.com/signup?referrer=#{code}"
        #link = "<a href='#{url_path}'>Edit This Text</a>"
        user = @affiliate_detail.user
        Program.all.each do |p|
          url_path = p.url_path + code
          link = "<a href='#{url_path}'>Edit This Text</a>"
          url = user.urls.build(:program_description => p.name, :url => url_path, :link => link, :program_id => p.id)
          url.save
        end
        redirect_to user_affiliates_path(current_user.id)
      else
        render 'new_affiliate_details'
      end
      
    end
end
