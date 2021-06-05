module Api
	module V1
		class FollowsController < ApiController
            def create
                # Validar que sean distintos current_user != user
                unless current_user.blank?
                    if User.exists?(params[:id])
                        @user = User.find(params[:id])
                        if @user.id !=  @current_user.id
                            follow = Follow.where(user_id: @current_user.id,
                                                    following_id: @user.id)
                            if follow.blank?
                                Follow.create(user_id: @current_user.id,
                                            following_id: @user.id)
                                message = "You follow this user."
                                render :json => message, :status => 200
                            else
                                follow.first.destroy
                                message = "You unfollow this user."
                                render :json => message, :status => 200
                            end

                            #render json: @profile
                        else
                            message_error = "Sorry! You cannot follow yourself."
                            render :json => {:error => message_error}.to_json, :status => 400
                        end
                    else
                        message_error = "Sorry! This user does not exist."
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