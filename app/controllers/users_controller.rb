class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements
	end

end
