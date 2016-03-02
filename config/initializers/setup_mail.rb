ActionMailer::Base.raise_delivery_errors = false
ActionMailer::Base.smtp_settings = {  
	address:              '192.168.1.215',
	#port:                 110,
	#authentication:       :ntlm,
	#user_name:            '40234',
	#password:             '3fbg8qpy4y',
	enable_starttls_auto: false
}