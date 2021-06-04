module Api
	module V1
		class UsersController < ApiController	
			# skip_before_action :verify_authenticity_token
			def index
	           user = User.find_by(email: params.require(:email))
               if user.valid_password?(params.require(:password))
                    render :json=>{"user"=>user}.to_json
               end
	        end
	        def create
				@user =  User.create!(email: params[:email],user_name: params[:user_name],password: params[:password],password_confirmation: params[:password_confirmation])
				
				if @user.save
					message_information = "Please, confirm your e-mail."
                    render :json => {"Confirmacion" => message_information}.to_json, :status => :ok
				else
					 message_error = "Sorry! User haven't been saved."
                     render :json => {:error => message_error}.to_json, :status => 400
				end
			end
			
			def followers
				user = User.find_by(email: params.require(:email))
				if user.valid_password?(params.require(:password))
					 render :json=>{"user"=>user}.to_json
				end
			end

			def following
				user = User.find_by(email: params.require(:email))
				if user.valid_password?(params.require(:password))
					 render :json=>{"user"=>user}.to_json
				end
			end
		end	
	end
end

