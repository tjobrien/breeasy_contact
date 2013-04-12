class SessionsController < ApplicationController
  def new
    end

    def create
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        if user.affiliate_detail.nil?
          redirect_to new_affiliate_details_path
        else
          redirect_to user_affiliates_path(current_user.id)
        end
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end
    
    
    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Logged out!"
    end
end
