class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def set_source
    session[:source] = params[:q] if params[:q]
  end
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
  before_action :set_title
  
  def set_title
    @page_title = "Devcamp Portfolio | My Portfolio Website"
  end
  
end
