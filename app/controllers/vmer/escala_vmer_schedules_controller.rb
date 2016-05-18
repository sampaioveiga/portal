class Vmer::EscalaVmerSchedulesController < ApplicationController
	before_action :check_authorization
	before_action :set_schedule, only: [ :show, :edit, :update, :destroy ]
	before_action :load_group_users
	after_action :verify_authorized, only: [ :index, :create, :edit, :update ]


	def index
		if current_user.escala_vmer_user.nivel_acesso == 2
			@schedules = EscalaVmerSchedule.where(user_id: @group_users)
		else
			@schedules = current_user.escala_vmer_schedules
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
			redirect_to vmer_escala_vmer_schedules_path()
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

	def destroy
		unless @schedule.escalado
			@schedule.destroy
			flash[:success] = "Disponibilidade eliminada"
			redirect_to escala_vmer_schedules_path()
		else
			flash[:danger] = "Disponibilidade não pode ser eliminada"
			redirect_to @schedule
		end
	end

	private


	def check_authorization
		authorize EscalaVmerSchedule
	end

	def load_group_users
		@group_users = User.joins(:escala_vmer_user).where(escala_vmer_users: { escala_vmer_group_id: current_user.escala_vmer_user.escala_vmer_group.id } ) unless (current_user.administrator && current_user.escala_vmer_user.nil?)
	end

	def set_schedule
		@schedule = EscalaVmerSchedule.find(params[:id])
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