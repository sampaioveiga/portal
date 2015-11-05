class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Registo efetuado com sucesso no Portal e-ULSNE')
	end
end