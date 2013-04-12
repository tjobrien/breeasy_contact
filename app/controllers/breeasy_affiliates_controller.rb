class BreeasyAffiliatesController < ApplicationController
  
  def show
    @affiliate = User.find(params[:id])
  end
  
  def new
    
  end
end
