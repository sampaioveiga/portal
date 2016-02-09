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
  get 'people/:id', to:  'contact_lists#person', as: 'person'
  get 'units/:id', to: 'contact_lists#unit', as: 'unit'
  get 'departments/:id', to: 'contact_lists#department', as: 'department'
  get 'search', to: 'contact_lists#search', as: 'search'

  # Transportes
  get 'transp_user_trips/list', to: 'transp_user_trips#list', as: 'transp_user_trips/list'
  get 'transp_materials/list', to: 'transp_materials#list', as: 'transp_materials/list'
  resources :transp_users, :transp_destinations, :transp_user_trips, :transp_materials


  # Auditorias higiene das mãos
  resources :hig_maos_users, :hig_maos_observations, :hig_maos_worker_categories, :hig_maos_oportunities_clusters, :hig_maos_oportunities
  get 'hig_maos_stats', to: 'hig_maos_observations#stats', as: 'hig_maos_stats'
  get 'hig_maos_export', to: 'hig_maos_observations#export', as: 'hig_maos_export', defaults: { format: 'xlsx' }

  # Inquérito de satisfação utentes
  resources :satisf_surv_users, :satisf_surv_surveys
  get 'satisf_surv_stats', to: 'satisf_surv_surveys#stats', as: 'satisf_surv_stats', defaults: { format: 'xlsx' }

  # Escala VMER
  resources :escala_vmer_users, :escala_vmer_groups, :escala_vmer_schedules, :escala_vmer_maps

  # Ajudas tecnicas
  resources :ajudas_tecnicas_users, :ajudas_tecnicas_physicians, :ajudas_tecnicas_contact_types, :ajudas_tecnicas_equipments
  resources :ajudas_tecnicas_patients do
    resources :ajudas_tecnicas_loans
  end

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
