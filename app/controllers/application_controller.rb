class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	add_flash_types :success, :danger, :info, :warning

	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :current_password, :remember_me])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password] ) 
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :current_password, :remember_me]) 
		
	end
end
