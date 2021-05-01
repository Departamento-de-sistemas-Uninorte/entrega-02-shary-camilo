module Api
	module V1
		class ApiController < ActionController::API
			
			skip_before_action :verify_authenticity_token
            before_action :authenticate
            def authenticate
	        	authenticate_with_http_basic do |email, user_token|
					user = User.authenticate(email,user_token).first
						if user.blank? 
							head :no_content
							message_error = "Sorry! You have not authenticated."
							render :json => {:error => message_error}.to_json, :status => 200
						else       			
							@current_user = user
						end       		
	        	end
            end
            private

            def current_user
                @current_user
            end

		end
	end
end

