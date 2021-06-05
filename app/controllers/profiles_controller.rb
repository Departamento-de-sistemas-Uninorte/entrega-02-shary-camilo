class ProfilesController < ApplicationController
	
	before_action :authenticate_user!

	def index
		@profiles = Profile.all
		@profile = Profile.new
	end

	def show
		@profile = Profile.find(params[:id])

	end

	def create
		@profile =  Profile.new(profile_params)
		@profile.user_name = current_user.user_name
		if @profile.save
			redirect_to profiles_path
		else
			redirect_to profiles_path
		end
		
	end
	
	def destroy
		@profile = Profile.find(params[:id]).destroy
	   
		redirect_to profiles_path, :notice => "Your post has been deleted successfully."
	end

	private

	def profile_params
		params.require(:profile).permit(:tweet, :image)
	end
end
