Rails.application.routes.draw do

  # users
  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'
  resources :users

  # departments
  resources :ulsne_departments

  # units
  resources :ulsne_sites

  # sessions
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  # contact list
  get 'people', to: 'contact_lists#people', as: 'people'
  get 'people/:id' => 'contact_lists#person', as: 'person'
  get 'units/:id' => 'contact_lists#unit', as: 'unit'
  get 'units/:unit_id/departments/:id' => 'contact_lists#department_unit', as: 'department_unit'

  # Transportes
  resources :transp_users, :transp_destinations, :transp_user_trips

  # Auditorias higiene das mãos
  resources :hig_maos_users, :hig_maos_observations, :hig_maos_worker_categories, :hig_maos_oportunities_clusters, :hig_maos_oportunities

  # Inquérito de satisfação utentes
  resources :satisf_surv_users, :satisf_surv_surveys

  root 'contact_lists#people'
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
