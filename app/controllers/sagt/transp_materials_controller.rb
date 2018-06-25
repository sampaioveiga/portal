class Sagt::TranspMaterialsController < ApplicationController
	before_action :check_authorization, except: [ :show ]
	before_action :set_transp_material, only: [ :show, :edit, :update, :destroy ]
	before_action :load_selects, only: [ :new, :create, :edit, :update ]
	after_action :verify_authorized, except: [ :show ]

	def index
		if current_user.transp_user.nivel_acesso == 2
			@q = TranspMaterial.data_entrega_after_today_or_pendente.order(:data_entrega).includes(:user, :ulsne_department, :local_saida, :local_entrega).ransack(params[:q])
			@transports = @q.result(distinct: true)
		else
			redirect_to sagt_transp_materials_calendar_path
			#@q = current_user.transp_materials.data_entrega_after_today_or_pendente.order(:data_entrega).ransack(params[:q])
			#@transports = @q.result(distinct: true)
		end
	end

	def calendar
		if current_user.transp_user.nivel_acesso == 2
			@transports = TranspMaterial.last(600)
		else
			@transports = current_user.transp_materials
		end
	end

	def show
	end

	def new
		@transport = TranspMaterial.new
		@transport.user_id = current_user.id
		@transport.data_entrega = Time.now.beginning_of_hour + 4.hour
		if current_user.administrator || current_user.transp_user.nivel_acesso == 2
			@transport.supervisor = true
		else
			@transport.supervisor = false
		end
	end

	def create
		@transport = TranspMaterial.new(transp_material_params)
		@transport.aprovacao = 0

		if current_user.administrator || current_user.transp_user.nivel_acesso == 2
			@transport.supervisor = true
		else
			@transport.supervisor = false
		end

		@transport.user_id = current_user.id unless (current_user.administrator || current_user.transp_user.nivel_acesso == 2)

		if @transport.save
			flash[:success] = "Requisição criada"
			UserMailer.transp_material_email(@transport).deliver_now
			redirect_to sagt_transp_materials_calendar_path()
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if current_user.administrator || current_user.transp_user.nivel_acesso == 2
			@transport.supervisor = true
		elsif Time.now > @transport.created_at + 10.minute
			flash[:danger] = "Requisição não pode ser alterada"
			redirect_to sagt_transp_materials_path()
			return
		else
			@transport.supervisor = false
		end

		if @transport.update(transp_material_params)
			flash[:success] = "Requisição alterada"
			UserMailer.transp_material_email(@transport).deliver_now
			redirect_to sagt_transp_materials_path()
		else
			render :edit
		end
	end

	def destroy
		@transport.destroy
		redirect_to sagt_transp_materials_path()
	end

	private

	def set_transp_material
		@transport = TranspMaterial.find(params[:id])
		unless (current_user.transp_user.nivel_acesso == 2 || @transport.user == current_user)
			@transport = nil
			redirect_to transp_materials_path()
		end
	end

	def transp_material_params
		params.require(:transp_material).permit(
			:user_id,
			:ulsne_department_id,
			:assunto,
			:local_saida_id,
			:local_entrega_id,
			:data_entrega,
			:urgente,
			:observacoes,
			:supervisor,
			:aprovacao,
			:comentarios_supervisor
		)
	end

	def load_selects
		@users = User.joins(:transp_user).reorder(:nome_utilizador)
		if (current_user.administrator || current_user.transp_user.nivel_acesso == 2)
			@departments = UlsneDepartment.order(:nome_servico)
		else
			@departments = current_user.ulsne_departments.reorder(:nome_servico)
		end
		@destinations = TranspDestination.order(:destino)
	end

	def check_authorization
		authorize TranspMaterial
	end
end