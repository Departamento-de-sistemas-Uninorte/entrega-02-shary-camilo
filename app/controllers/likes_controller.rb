class LikesController < ApplicationController
    def create
        @profile = Profile.find(params[:id])
        like = Like.where(user_id: current_user.id,
                            profile_id: @profile.id)
        
        if like.blank?
            Like.create(user_id: current_user.id,
                        profile_id: @profile.id)
        else
            like.first.destroy
        end

        redirect_to profiles_path
    end
end
