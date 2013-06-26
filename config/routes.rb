Cfa::Application.routes.draw do
  
  

  root :to => "home#index"
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users
  resources :campaigns do
    collection do
      get 'get_campaigns_data'
      get 'search_pending_campaign'
      get 'get_calls_stat'
    end
    member do
      get 'get_calls_forever'
      get 'get_calls_today'
      get 'get_donation_amount'
      get 'get_calls_in_progress'
      get 'get_population_destribution_pyramid_chart', :format => :xml
    end
  end

  resources :campaign_globals do
    collection do
      get 'get_total_calls_forever'
      get 'get_total_calls_today'
      get 'get_donation_remaining'
      get 'get_calls_in_progress'
    end
  end

  resources :donations do
    collection do
      get 'has_donated'
    end
  end

  match 'donations/express_checkout' => "donations#express_checkout", :as => :donations_express_checkout, :via => :post
  
  ActiveAdmin.routes(self)
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
