class Users::UserController < ApplicationController


	
	def current_user
		User.find_by(id: session[:user_id])
	end

	def index 

		@users = User.all
		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements
		
	end



	def show

		
	end

end
