module ApplicationHelper
	def mobile_user_agent?
	  request.env["HTTP_USER_AGENT"].try :match, /(iphone|ipod|android)/i
	end
end
