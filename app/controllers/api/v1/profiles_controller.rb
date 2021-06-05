module Api
	module V1
		class ProfilesController < ApiController

			def index
				unless current_user.blank?
					@follows = Follow.where(following_id: @current_user.id)
					array = []
					@follows.each do |follow|
						tweet = Profile.select('tweet', 'user_name', 'id').find(follow.user_id)
						array.push(tweet)
					end
					@tweets = Profile.select('tweet', 'user_name', 'id').where(id: @current_user.id)
					render json: {following_tweets: array, own_tweets: @tweets}
				else
					message_error = "Sorry! Authenticate yourself first."
					render :json => {:error => message_error}.to_json, :status => 400
				end
			end
			def create
				unless current_user.blank?
					@profile = Profile.new(profile_params)
					@profile.user_name = @current_user.user_name
					@profile.user_id = @current_user.id
					if @profile.save
						render json: @profile
					else
						if profile_params[:tweet].length > 280
							message_error = "Sorry! Your tweet could not be published because exceed 280 characters."
						else
						message_error = "Sorry! The tweet could not be saved."
						end
						render :json => {:error => message_error}.to_json, :status => 400
					end
				else
					message_error = "Sorry! Authenticate yourself first."
					render :json => {:error => message_error}.to_json, :status => 400
				end
			end
			def profile_params
				params.require(:profile).permit(:tweet, :image)
			end	
			def show
				unless current_user.blank?
					if Profile.exists?(params[:id])
						@profile = Profile.find(params[:id])
						render json: @profile
					else
						message_error = "Sorry! The tweet you are looking for does not exist."
						render :json => {:error => message_error}.to_json, :status => 400
					end
				else
					message_error = "Sorry! Authenticate yourself first."
					render :json => {:error => message_error}.to_json, :status => 400
				end
			end
			def destroy
				unless current_user.blank?
					if Profile.exists?(params[:id])
						@profile = Profile.find(params[:id]).destroy
						message_information = "Success! The tweet has been deleted."
						render :json => {"success" => message_information}.to_json, :status => :ok
					else
						message_error = "Sorry! The tweet you are trying to delete does not exist."
						render :json => {:error => message_error}.to_json, :status => 400
					end
				else
					message_error = "Sorry! Authenticate yourself first."
					render :json => {:error => message_error}.to_json, :status => 400
				end
			end
		end
	end
end