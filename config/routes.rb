BreeasyContact::Application.routes.draw do


  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  resources :users do
    resources :affiliates
  end
  
  resources :sessions
  resources :contacts
  
  namespace :api do
      namespace :v1 do
        resources :users, :apps
      end
    end
 resources :breeasy_affiliates, :only => [:show] 
  
  match 'thank_you/:id' => 'contacts#thank_you', :as => 'thank_you'
  match 'new_affiliate_details' => 'users#new_affiliate_details', :as => :new_affiliate_details
  match 'users/create_affiliate_details' => 'users#create_affiliate_details', :as => :create_affiliate_details
  match 'affiliate-home' => 'affiliates#home', :as => :affiliate_home
  match 'affiliate-tips' => 'affiliates#tips', :as => :affiliate_tips
  match 'affiliate-help' => 'affiliates#help', :as => :affiliate_help
  match 'master-affiliate-signup' =>'affiliates#new_master', :as => :new_master
  match 'standard-affiliate-signup' => 'affiliates#new_standard', :as => :new_standard
  match 'master-affiliate-earnings-calculator' => 'affiliates#affiliate_calculator', :as => :master_affiliate_earnings
  match 'calculate-commissions' => 'affiliates#calculate_commissions', :as => :calculate_commissions
  match 'standard-affiliate-earnings-calculator' => 'affiliates#standard_affiliate_calculator', :as => :standard_affiliate_earnings
  match 'standard-calculate-commissions' => 'affiliates#standard_calculate_commissions', :as => :standard_calculate_commissions
  match 'sub-affiliate/:master_id' => 'affiliates#sub_affiliate', :as => :sub_affiliate
  match 'api/v1/user/login' => 'api/v1/users#login'
  match 'users/create_contact' => 'users#create_contact'
  match 'breeasy-affiliate-program/:affiliate_id' => "affiliates#breeasy_affiliate_program", :as => :breeasy_affiliate_program
  
  root :to => 'affiliates#home'
  
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
