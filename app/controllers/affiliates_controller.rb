class AffiliatesController < ApplicationController
  layout 'members', :only => [:index, :edit, :tips, :help]
  before_filter :logged_in, :except => [:home, :new_standard, :new_master, :affiliate_calculator, :calculate_commissions, :sub_affiliate, :standard_calculate_commissions, :standard_affiliate_calculator]
  
  
   def get_owner
     @user = User.find(params[:user_id])
   end
  
  
  def new_standard
    @user = User.new
  end
  def new_master
    @user = User.new
  end
  
  def edit
    @affiliate_detail = AffiliateDetail.find(params[:id])
  end

  def index
    #need a method that returns all the users that have this users affiliate code in BFSB
  # code = current_user.affiliate_detail.affiliate_code
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
  def calculate_commissions
    #get direct earnings for master calculator
    comm_5 = 9.95 * params[:direct_5].to_f * 0.40 * 12
    comm_6 = 14.95 * params[:direct_6].to_f * 0.40 * 12
    comm_7 = 99.95 * params[:direct_7].to_f * 0.50
    comm_8 = 149.95 * params[:direct_8].to_f * 0.50
    @total_count = params[:direct_5].to_f + params[:direct_6].to_f + params[:direct_7].to_f + params[:direct_8].to_f
    @total_direct = comm_5 + comm_6 + comm_7 + comm_8
    plans = []
    sub_count = params[:number_of_subs].to_f

    sub_5 = 9.95 * params[:sub_5].to_f * 0.15 * sub_count * 12
    sub_6 = 14.95 * params[:sub_6].to_f * 0.15 * sub_count * 12
    sub_7 = 99.95 * params[:sub_7].to_f * 0.15 * sub_count
    sub_8 = 149.95 * params[:sub_8].to_f * 0.15 * sub_count
    @total_sub = sub_5 + sub_6 + sub_7 + sub_8
    
    redirect_to master_affiliate_earnings_path(:direct => @total_direct, :sub_affiliate => @total_sub, :total_count => @total_count, :sub_count => sub_count)
  end
  
  
  def affiliate_calculator
    @total_direct = params[:direct] unless params[:direct].nil?
    @total_sub = params[:sub_affiliate] unless params[:sub_affiliate].nil?
    @total = @total_sub.to_f + @total_direct.to_f
    @total_count = params[:total_count].to_f
    @sub_count = params[:sub_count].to_f
    
  end
  def sub_affiliate
  @master_affiliate = User.find params[:master_id]
  @user = User.new
    
  end
  def standard_calculate_commissions
    #get direct earnings for master calculator
    comm_5 = 9.95 * params[:direct_1].to_f * 0.25 * 12
    comm_6 = 14.95 * params[:direct_2].to_f * 0.25 * 12
    comm_7 = 99.95 * params[:direct_3].to_f * 0.35
    comm_8 = 149.95 * params[:direct_4].to_f * 0.35
    @total_count = params[:direct_1].to_f + params[:direct_2].to_f + params[:direct_3].to_f + params[:direct_4].to_f
    @total_direct = comm_5 + comm_6 + comm_7 + comm_8
    redirect_to standard_affiliate_earnings_path(:direct => @total_direct, :total_count => @total_count)
  end
  
  def standard_affiliate_calculator
    @total_direct = params[:direct] unless params[:direct].nil?
    @total_count = params[:total_count].to_f

    
  end
  
  def home
  end
  
  def tips
  end
  
  def help
  end
end
