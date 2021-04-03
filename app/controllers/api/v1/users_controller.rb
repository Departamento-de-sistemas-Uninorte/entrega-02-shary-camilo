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
					message_information = "Confirme cuenta en su correo"
                    render :json => {"Confirmacion" => message_information}.to_json, :status => :ok
				else
					 message_error = "CAN'T SAVE USER"
                     render :json => {:error => message_error}.to_json, :status => 400
				end
			end
			# s
		end	
	end
end

