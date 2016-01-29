class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Registo efetuado com sucesso no Portal e-ULSNE')
	end

	def transp_user_trip_email(trip)
		@trip = trip
		@user = trip.user
		mail(to: @user.email, subject: 'Requisição de transporte: ' + @trip.transp_destination.destino + ' ' + @trip.data_inicio.to_s)
	end

	def transp_material_email(transport)
		@transport = transport
		@user = transport.user
		mail(to: @user.email, subject: 'Transporte material: ' + @transport.local_entrega.destino + ' ' + @transport.data_entrega.to_s)
	end
end