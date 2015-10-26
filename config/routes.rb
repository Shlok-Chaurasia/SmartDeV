Smarty::Application.routes.draw do
  get "sessions/new"

  root :to => 'user_sign_in#home'
  match 'home/' => 'user_sign_in#home'
  match "create_user/" => "user_sign_in#create", :via => :post
  get "product/each_product/:id" => "products#each_product"
  match 'product/fruits' => 'products#product'
  match 'products/partial_page' => 'products#partial_page'
  match 'products/add_product' => 'products#add_product', :via => :post
  match 'error/' => 'errors#error'
  get    'login'   => 'sessions#new'
  get 'checkout/show' => 'checkout#show'
  get 'checkout/show_prod' => 'checkout#show_prod'
  post   'login'   => 'user_sign_in#login'
  get 'logout'  => 'user_sign_in#logout'
  get 'slots' => 'slots#show_slot'
  post 'place_order' => 'slots#place_order'
  post 'save_add' => 'slots#save_address'
  post 'products/add_product_to_basket'=> 'products#add_quantity'
  post 'products/remove_from_basket'=> 'products#remove_from_basket'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
