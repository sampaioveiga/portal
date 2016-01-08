class EscalaVmerSchedulesController < ApplicationController
	before_action :authorize
	before_action :check_access
	before_action :set_schedule, only: [ :show, :edit, :update ]
	before_action :load_group_users

	def index
		if current_user.escala_vmer_user.nivel_acesso > 1
			@schedules = EscalaVmerSchedule.where(user_id: @group_users)
		else
			@schedules = EscalaVmerSchedule.where(user_id: current_user.id)
		end
	end

	def new
		@schedule = EscalaVmerSchedule.new
		@schedule.inicio_turno = Date.today + 1.day
	end

	def create
		@schedule = EscalaVmerSchedule.new(escala_vmer_schedules_params)

		@schedule.user_id = current_user.id unless current_user.escala_vmer_user.nivel_acesso > 1
		@schedule.inicio_turno = @schedule.inicio_turno + @schedule.tipo_turno.hour
		if @schedule.tipo_turno == 20
			@schedule.fim_turno = @schedule.inicio_turno + 12.hour
		else
			@schedule.fim_turno = @schedule.inicio_turno + 6.hour
		end
		

		if @schedule.save
			flash[:success] = "Disponibilidade criada"
			redirect_to escala_vmer_schedules_path()
		else
			render :new
		end
	end

	def show
		if @schedule.tipo_turno == 8
			@tipo_turno = "Manhã"
		elsif @schedule.tipo_turno == 14
			@tipo_turno = "Tarde"
		else
			@tipo_turno = "Noite"
		end
	end

	def edit
		@schedule.inicio_turno = @schedule.inicio_turno.beginning_of_day
	end

	def update
		@schedule.inicio_turno = @schedule.inicio_turno.beginning_of_day + @schedule.tipo_turno.hour
		if @schedule.tipo_turno == 20
			@schedule.fim_turno = @schedule.inicio_turno + 12.hour
		else
			@schedule.fim_turno = @schedule.inicio_turno + 6.hour
		end
		

		if @schedule.update(escala_vmer_schedules_params)
			flash[:success] = "Disponibilidade alterada"
			redirect_to escala_vmer_schedules_path()
		else
			render :edit
		end
	end

	private

	def load_group_users
		@group_users = User.joins(:escala_vmer_user).where(escala_vmer_users: { escala_vmer_group_id: current_user.escala_vmer_user.escala_vmer_group.id } )
	end

	def set_schedule
		@schedule = EscalaVmerSchedule.find(params[:id])
	end

	def check_access
		redirect_to escala_vmer_users_path() unless (current_user.escala_vmer_user)
	end

	def escala_vmer_schedules_params
		params.require(:escala_vmer_schedule).permit(
			:user_id,
			:inicio_turno,
			:tipo_turno,
			:fim_turno,
			:obs,
			:escalado
		)
	end
	
end