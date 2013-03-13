module Api
  module V1
    class AppsController < ApplicationController
      skip_before_filter :current_user, :only => [:create]
      #respond_to :json
      # This controller handles the adding of users to the other breeasy apps
      #respond_to :json
      def create
     
       if params[:user][:app] == "instainvoice"
         options = {:body => {:user =>  {
                              :email => params[:user][:email], :password => params[:user][:password], 
                              :referrer => params[:user][:referrer], :source => "InstaInvoice"}
                            }
                            
                          }
         resp = HTTParty.post("http://billing.breeasy.com/api/v1/users.json", options)
         #raise resp.body.inspect
        retval = JSON.parse(resp.body)
       elsif params[:user][:app] == "bfsb"
         
         options = {:body => {:user =>  {:email => params[:user][:email], :password => params[:user][:password], 
                              :username => params[:user][:username],:refferal_code => params[:user][:referral_code]}
                            },
                            :query => {:plan_id => params[:plan_id]}
                          }
                          resp = HTTParty.post("http://app.breeasy.com/api/v1/users.json", options)
        retval = JSON.parse(resp.body)
         
       end
       # user = User.find 35
      
       respond_to do |format|
         format.json { render :json => retval }  # note, no :location or :status options
       end
      end
      
    end
  end
  
end