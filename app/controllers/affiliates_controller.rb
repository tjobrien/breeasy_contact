class AffiliatesController < ApplicationController
  
  before_filter :logged_in, :except => [:new]
  
  
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
    #need a method that returns all the users that have this users affiliate code in BFB
   code = current_user.affiliate_detail.affiliate_code
   #go to BFB and get all the users that have this code.
   
  # @bfb_users = some_url_at_bfb(code)
  
   #with each user, need to know the account status; i.e. if they paid etc.    
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
