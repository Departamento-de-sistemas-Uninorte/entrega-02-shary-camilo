class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name])
	end

	def after_sign_in_path_for(resource)
		stored_location_for(resource) || profiles_path
	end

	
end
