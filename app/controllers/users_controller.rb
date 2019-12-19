class UsersController < ApplicationController

	
	def current_user
		User.find_by(id: session[:user_id])
	end


	def show

		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements
	end

end
