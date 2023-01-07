class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
# debugger
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user| user.permit(:email, :password, :firstname, :lastname) end
    devise_parameter_sanitizer.permit(:sign_in) do |user| user.permit(:email, :password) end
  end
end
