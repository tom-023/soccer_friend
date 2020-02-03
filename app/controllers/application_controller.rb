class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    '/events'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name support_team support_history introduce icon))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name support_team support_history introduce icon))
  end
end
