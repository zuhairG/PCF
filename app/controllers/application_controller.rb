class ApplicationController < ActionController::Base
  protect_from_forgery
  load_and_authorize_resource  
  
  check_authorization :unless => :devise_controller?
  before_filter :authenticate_user!, :except => [:show, :index]
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
end
