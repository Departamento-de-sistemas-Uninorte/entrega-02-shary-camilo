module Api
	module V1
		class MessagesController < ApiController
            def index
                unless current_user.blank?
                    @messages = Message.where(user_id: @current_user.id).or(Message.where(user_message_id: @current_user.id))
                    render json: {messages: @messages}
                else
                    message_error = "Sorry! Authenticate yourself first."
					render :json => {:error => message_error}.to_json, :status => 404 
                end
            end
            def create
                unless current_user.blank?
                    @user = User.find(params[:id])
                    @follows = Follow.where(user_id: @user.id,
                                            following_id: @current_user.id)
                    if @follows.blank?
                        message = "Sorry! You cannot send direct messages to this user. Must be followed by this user to send direct messages."
                        render :json => {:error => message}.to_json, :status => 404
                    else
                        @message = Message.new(message: params[:message])
                        @message.user_id = @current_user.id
                        @message.user_message_id = @user.id
                        if @message.save
                            render json: {message: @message}
                        else
                            message_error = "Sorry! The direct message could not be send."
                            render :json => {:error => message_error}.to_json, :status => 404
                        end
                    end
                else
                    message_error = "Sorry! Authenticate yourself first."
					render :json => {:error => message_error}.to_json, :status => 404 
                end
                
            end
             

        end 
        
    end
end