class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

  def root_method
    render json: { hello: 'pankaj' }
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation])
  end
end
