class AffiliatesController < ApplicationController
  
  before_filter :get_owner, :logged_in, :except => [:new]
  
  
   def get_owner
     @user = User.find(params[:user_id])
   end
  
  
  def new
    @user = User.new
  end
  
  def edit
    @affiliate_detail = AffiliateDetail.find(params[:id])
  end

  def index
    
      
  end
  
  
  def show
  end
  
  def update
    @affiliate_detail = AffiliateDetail.find(params[:id])
    if @affiliate_detail.update_attributes(params[:affiliate_detail])
      redirect_to user_affiliates_path(current_user.id)
    else
      render 'edit'
    end
    
  end
end
