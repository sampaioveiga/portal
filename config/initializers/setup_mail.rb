ActionMailer::Base.raise_delivery_errors = false
ActionMailer::Base.smtp_settings = {  
	address:              '192.168.1.215',
	enable_starttls_auto: false,
}