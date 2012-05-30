class UsersController < ApplicationController
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
      else
        render 'new_affiliate_details'
      end
      
    end
end
