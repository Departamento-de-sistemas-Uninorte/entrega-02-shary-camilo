module Api
	module V1
		class LikesController < ApiController
            def create
                if Profile.exists?(params[:id])
                    @profile = Profile.find(params[:id])
                    like = Like.where(user_id: @current_user.id,
                                      profile_id: @profile.id)
                    
                    if like.blank?
                        Like.create(user_id: @current_user.id,
                                    profile_id: @profile.id)
                        message = "You like this tweet."
                        render :json => {:ok => message}.to_json, :status => 200
                    else
                        like.first.destroy
                        message = "Like has been deleted succesfully."
                        render :json => {:ok => message}.to_json, :status => 200
                    end

                    #render json: @profile
                else
                    message_error = "Sorry! The tweet you are looking for does not exist."
                    render :json => {:error => message_error}.to_json, :status => 404
                end
            end
        end 
    end
end