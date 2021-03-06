class ApplicationController < ActionController::Base
	#Agrego constantes
	include Constants
	
	before_action :authenticate_user!	
  	protect_from_forgery with: :exception

 	#before_action :configure_permitted_parameters, if: :devise_controller?

 	protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
        end

end
