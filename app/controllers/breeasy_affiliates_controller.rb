class BreeasyAffiliatesController < ApplicationController
  before_filter :logged_in, :except => [:show]
  def show
    @affiliate = User.find(params[:id])
   # @bfsb_trial = @affiliate.urls.find_by_program_id(1)
    if !@affiliate.content.active?
      redirect_to "http://www.breeasy.com"
    end
  end
  
  def new
    @affiliate = User.find(params[:affiliate_id])
    @content = @affiliate.build_content
    
  end
  def edit
    @affiliate = User.find(current_user.id)
    @content = @affiliate.content
    
  end
  
  def sample
    #1 in production
     @affiliate = User.find(2)
  end
  def preview
    @affiliate = User.find(current_user.id)
    
  end
  def create
    @content = Content.new(params[:content])
    if @content.save
      redirect_to user_affiliates_path(current_user.id), :notice => "Affiliate Content Created."
    else
      render "new"
    end
  end
  
  def update
     @content = Content.find(params[:id])
     
      if @content.update_attributes(params[:content])
        #raise @content.inspect
        redirect_to user_affiliates_path(current_user.id), :notice => "Affiliate Content updated."
      else
        render "edit"
      end
      
  end
end
