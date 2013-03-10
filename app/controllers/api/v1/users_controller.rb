module Api
  module V1
    class UsersController < ApplicationController
      skip_before_filter :current_user, :only => [:create, :login, :show]
      # class Task < ::Task
      #   # def as_json(options = {})
      #   #   super.merge(released_on: released_at.to_date)
      #   # end
      # end
      #cred = YAML.load_file("#{Rails.root}/config/auth.yml")
      #raise cred.inspect
      
     # http_basic_authenticate_with name: "breeasy_user", password: "rt8932n12340982fj"
      #http_basic_authenticate_with name: cred['auth']['name'], password: cred['auth']['password']
      respond_to :json
      # 
      def show
        user = User.find(params[:id])
          
        respond_with user.affiliate_detail
      end
      # 
      # def create
      #  # respond_with User.create(params[:user])
      #  user = User.new(params[:user])
      #  user.source = "InstaInvoice"
      #  if user.save
      #    UserMailer.welcome_user(user).deliver
      #  end
      #  respond_with user
      #   
      # end
      # 
      # def update
      #   respond_with User.update(params[:id], params[:user])
      # end
      # 
      # def destroy 
      #   respond_with User.destroy(params[:id])
      # end
      
      def create
      end
      
      def login
        user = User.authenticate(params[:email], params[:password])
      
          respond_with user


      end
      # def update_user_details
      #   user = User.find(params[:id])
      #   user.user_detail.update_attributes(params[:user_detail])
      #   respond_with user.user_detail
      # 
      # end
      # def create_user_details
      #   detail = UserDetail.create(params[:user_detail])
      #     respond_with detail
      # end
      # def referral_users
      #   users = User.find_all_by_referrer(params[:referrer])
      #   respond_with users
      # end
    end
  end
  
end