class ApplicationController < ActionController::Base
	include Pundit
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
			user_params.permit(
				:nome_utilizador,
				:numero_mecanografico,
				:titulo,
				:email,
				:password,
				:password_confirmation,
				:ulsne_site_id,
				:user_phone_numbers_attributes => [ :id, :user_id, :numero_contacto, :_destroy ],
				:u2d_associations_attributes => [ :id, :user_id, :ulsne_department_id, :_destroy ])
		end

		devise_parameter_sanitizer.permit(:account_update) do |user_params|
			user_params.permit(
				:nome_utilizador,
				:numero_mecanografico,
				:titulo,
				:email,
				:password,
				:password_confirmation,
				:current_password,
				:ulsne_site_id,
				:user_phone_numbers_attributes => [ :id, :user_id, :numero_contacto, :_destroy ],
				:u2d_associations_attributes => [ :id, :user_id, :ulsne_department_id, :_destroy ])
		end
	end

	private

	def user_not_authorized(exception)
		policy_name = exception.policy.class.to_s.underscore
		flash[:warning] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
		redirect_to(request.referrer || root_path)
	end

end