module Api
  module V1
    class AppsController < ApplicationController
      skip_before_filter :current_user, :only => [:create]
      #respond_to :json
      # This controller handles the adding of users to the other breeasy apps
      #respond_to :json
      def create
     
       if params[:user][:app] == "instainvoice"
         options = {:body => {:user =>  {:email => params[:user][:email], :password => params[:user][:password]}}}
         resp = HTTParty.post("http://billing.breeasy.com/api/v1/users.json", options)
         #raise resp.body.inspect
       elsif params[:user][:app] == "breeasy_free"
         
       elsif params[:user][:app] == "breeasy_paid"
         
       end
       # user = User.find 35
       retval = JSON.parse(resp.body)
       respond_to do |format|
         format.json { render :json => retval }  # note, no :location or :status options
       end
      end
      
    end
  end
  
end