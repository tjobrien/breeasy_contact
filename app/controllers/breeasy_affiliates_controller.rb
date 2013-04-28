class BreeasyAffiliatesController < ApplicationController
  
  def show
    @affiliate = User.find(params[:id])
  end
  
  def new
    @affiliate = params[:affiliate_id]
    
  end
end
