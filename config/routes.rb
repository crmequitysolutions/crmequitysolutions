Rails.application.routes.draw do
  resources :business_cards
  devise_for :users
  resources :images
  resources :property_displays
  resources :transactions
  resources :rental_units
  resources :properties
  resources :prop_docs
  resources :investor_prefs
  resources :interactions
  resources :contacts
  resources :communities
  resources :businesses
  resources :addresses
  resources :abouts
  resources :logins
  resources :property_views
  resources :contact_page
  resources :guides
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  get 'properties/:id/images' => 'properties#images', as: :see_images
  get 'properties/:id/investors' => 'properties#investors', as: :see_investors
  get 'investor_prefs/:id/properties' => 'investor_prefs#properties', as: :see_properties
  get 'contacts/:id/business_cards' => 'contacts#business_cards', as: :see_business_cards
  get 'home' => 'home#index', as: :home
  post 'properties' => 'properties#create', as: :create_property
  
  resources :home do
    collection do
      match 'search' => 'home#search', via: [:get, :post], as: :search
    end
  end
  
  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
