module Api
	module V1
		class HashtagController < ApiController
            def index
                exp = hashtag.match(/#[a-zA-Z0-9]/)
                if exp
                    var = "%#{hashtag}%"
                    tweets = Profile.where("tweet LIKE ? ", var)
                    if tweets.blank?
                        message = "Sorry! We didn't find what you're looking for."
                        render :json => message, :status => 200
                    else
                        render json:tweets
                    end
                else
                    message = "Sorry! We didn't find what you're looking for."
					render :json => message, :status => 200
                end
            end

            private 
            def hashtag
                params.require(:hashtag) 
            end
        end 
    end
end