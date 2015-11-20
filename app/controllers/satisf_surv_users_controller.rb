class SatisfSurvUsersController < ApplicationController
	before_action :authorize
	before_action :is_admin
	def index
		@users = SatisfSurvUser.all
		@user = SatisfSurvUser.new
		@users_collection = User.order(:nome_utilizador)
	end

	private

	def satisf_surv_user_params
		params.require(:satisf_surv_user).permit(:user_id,
												:nivel_acesso)
	end
end