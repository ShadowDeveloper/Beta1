Proto::Application.routes.draw do
  resources :main
  
  resources :residences do
    put 'binding', on: :member
    put 'sale_action', on: :member
    get 'log', on: :member
  end

  resources :users do
    get 'list', on: :collection
  end
  
  resources :clients do
    get 'list', on: :collection
    get 'verify_by_cpf', on: :collection
  end

  resources :session do
    post 'login', on: :collection
    get 'logout', on: :collection
  end

  resources :home do
    get 'old', on: :collection
  end

  resources :reports do
    get 'client_x_day', on: :collection
    get 'informacoes_imovel', on: :collection
    get 'sales', on: :collection
    get 'access_log', on: :collection
    get 'informacoes_imovel_display', on: :collection
    get 'client_x_day_display', on: :collection
    get 'sales_display', on: :collection
    get 'access_log_display', on: :collection
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
