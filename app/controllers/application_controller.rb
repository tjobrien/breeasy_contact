class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :logged_in

   private

   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end
   
   def logged_in
     if current_user.nil?
       redirect_to root_path, :notice => "You must login to acccess this page."
     end
   end
   
   def route_request
    if request.url == "http://contact.breeasy.com/"
      redirect_to new_contact_path
    end
  
   end
end
