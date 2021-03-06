class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def user_not_authorized
    redirect_to root_path, alert: 'Você não possui acesso para realizar essa ação.'
  end
end
