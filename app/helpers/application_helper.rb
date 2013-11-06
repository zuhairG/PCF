module ApplicationHelper
	def mobile_user_agent?
	  request.env["HTTP_USER_AGENT"].try :match, /(iphone|ipod|android)/i
	end
	
	def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end
