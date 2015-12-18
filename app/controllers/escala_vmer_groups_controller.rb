class EscalaVmerGroupsController < ApplicationController
	before_action :authorize
	before_action :check_access
	before_action :set_escala_vmer_group, only: [ :show, :edit, :update ]

	def index
		@groups = EscalaVmerGroup.order(:nome_grupo)
		@group = EscalaVmerGroup.new
	end

	def show
		@schedules = 
		render 'escalas_vmer_schedules/index'
	end

	def create
		@group = EscalaVmerGroup.new(escala_vmer_group_params)

		if @group.save
			flash[:success] = "Grupo criado"
			redirect_to escala_vmer_groups_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @group.update(escala_vmer_group_params)
			flash[:success] = "Grupo atualizado"
			redirect_to escala_vmer_groups_path()
		else
			render :edit
		end
	end

	private

	def check_access
		redirect_to escala_vmer_schedules_path() unless current_user.escala_vmer_user.nivel_acesso > 1
	end

	def set_escala_vmer_group
		@group = EscalaVmerGroup.find(params[:id])
	end

	def escala_vmer_group_params
		params.require(:escala_vmer_group).permit(
			:nome_grupo
		)
	end
end