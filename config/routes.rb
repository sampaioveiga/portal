Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :ajudas_tecnicas_contacts
    resources :ajudas_tecnicas_contact_types
    resources :ajudas_tecnicas_equipments
    resources :ajudas_tecnicas_loans
    resources :ajudas_tecnicas_patients
    resources :ajudas_tecnicas_physicians
    resources :ajudas_tecnicas_users
    resources :body_parts
    resources :device_types
    resources :escala_vmer_groups
    resources :escala_vmer_schedules
    resources :escala_vmer_users
    resources :hig_maos_observations
    resources :hig_maos_opportunities_clusters
    resources :hig_maos_opportunities
    resources :hig_maos_users
    resources :hig_maos_worker_categories
    resources :office_phone_numbers
    resources :patients
    resources :pneumo_devices_categories
    resources :pneumo_forms_inhaler_devices
    resources :pneumo_inhaler_devices
    resources :pneumo_users
    resources :pneumology_forms
    resources :satisf_surv_surveys
    resources :satisf_surv_users
    resources :transp_destinations
    resources :transp_materials
    resources :transp_users
    resources :transp_user_trips
    resources :u2d_associations
    resources :uci_devices
    resources :uci_tiss_values
    resources :uci_users
    resources :uci_wounds
    resources :ulsne_departments
    resources :ulsne_sites
    resources :user_phone_numbers
    resources :wound_types

    root to: "users#index"
  end

	# homepage
	get 'static_pages/index'
	get 'static_pages/about'

	# generic routes
	devise_for :users
	resources :device_types
	resources :wound_types
	resources :body_parts

	# patients
	get 'patients/processo_sonho', to: 'patients#processo_sonho', as: 'processo_sonho_patient'
	get 'patients/map_tiss_28', to: 'patients#map_tiss_28'
	resources :patients do
		resources :pneumology_forms
		resources :uci_tiss_values
	end

	# UCI
	namespace :uci do
		#get 'patients/processo_sonho/:id', to: 'patients#processo_sonho'
		resources :patients, only: [ :show ] do
			resources :uci_devices
			resources :uci_wounds
			resources :uci_tiss_values
		end
		resources :users
	end

	# Pneumo
	namespace :pneumo do
		resources :users
		resources :devices_categories
		resources :inhaler_devices
	end

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
