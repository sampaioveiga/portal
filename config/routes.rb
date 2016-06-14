Rails.application.routes.draw do
	get 'static_pages/index'
	# teste
	get 'static_pages/form'

	devise_for :users
	get 'patients/processo_sonho/:id', to: 'patients#processo_sonho'
	resources :patients do
		resources :uci_catheters
	end

	# UCI
	namespace :uci do
		resources :users
	end
	resources :catheter_types

	# Lista de contactos
	namespace :contacts do 
		resources :users, :ulsne_departments, :ulsne_sites
	end

	# Requisição de Transportes
	namespace :sagt do
		get 'transp_user_trips/calendar', to: 'transp_user_trips#calendar', as: 'transp_user_trips/calendar'
		get 'transp_materials/calendar', to: 'transp_materials#calendar', as: 'transp_materials/calendar'
		resources :transp_users, :transp_destinations, :transp_user_trips, :transp_materials
	end

	# PPCIRA
	namespace :ppcira do
		# Auditorias higiene das mãos
		resources :hig_maos_users, :hig_maos_observations, :hig_maos_worker_categories, :hig_maos_oportunities_clusters, :hig_maos_oportunities
		get 'hig_maos_stats', to: 'hig_maos_observations#stats', as: 'hig_maos_stats'
		get 'hig_maos_export', to: 'hig_maos_observations#export', as: 'hig_maos_export', defaults: { format: 'xlsx' }
	end

	# Inquérito de satisfação utentes
	resources :satisf_surv_users, :satisf_surv_surveys
	get 'satisf_surv_stats', to: 'satisf_surv_surveys#stats', as: 'satisf_surv_stats', defaults: { format: 'xlsx' }

	# Escala VMER
	namespace :vmer do
		resources :escala_vmer_users, :escala_vmer_groups, :escala_vmer_schedules, :escala_vmer_maps
	end

	# Ajudas tecnicas
	resources :ajudas_tecnicas_users, :ajudas_tecnicas_physicians, :ajudas_tecnicas_contact_types, :ajudas_tecnicas_equipments
	resources :ajudas_tecnicas_patients do
		resources :ajudas_tecnicas_loans
	end

	root 'static_pages#index'
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
