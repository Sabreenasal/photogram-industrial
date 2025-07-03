class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :name, :bio, :avatar_image, :private, :website, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end
