module ApplicationHelper

	# Title for App
	def full_title(page_title = '')
		base_title = "Portal e-ULSNE"
	
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

end