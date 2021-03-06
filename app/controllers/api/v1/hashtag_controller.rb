module Api
	module V1
		class HashtagController < ApiController
            def index
                unless current_user.blank?
                    exp = hashtag.match(/#[a-zA-Z0-9]/)
                    if exp
                        var = "%#{hashtag}%"
                        tweets = Profile.where("tweet LIKE ? ", var)
                        if tweets.blank?
                            message = "Sorry! We didn't find what you're looking for."
                            render :json => {tweets: message}, :status => 200
                        else
                            render json:{tweets: tweets}
                        end
                    else
                        message = "Sorry! We didn't find what you're looking for."
                        render :json => {error: message}, :status => 404
                    end
                else

                    message_error = "Sorry! Authenticate yourself first."
                        render :json => {:error => message_error}.to_json, :status => 404

                end
            end

            private 
            def hashtag
                params.require(:hashtag) 
            end
        end 
    end
end