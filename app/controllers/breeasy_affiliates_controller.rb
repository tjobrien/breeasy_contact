class BreeasyAffiliatesController < ApplicationController
  
  def show
    @affiliate = User.find(params[:id])
   # @bfsb_trial = @affiliate.urls.find_by_program_id(1)
  end
  
  def new
    @affiliate = params[:affiliate_id]
    
  end
  
  def sample
    #1 in production
     @affiliate = User.find(2)
  end
end
