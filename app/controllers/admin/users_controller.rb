class Admin::UsersController < ApplicationController
	#before_filter :set_search

	layout "admin"
	def current_user
		User.find_by(id: session[:user_id])
	end

	def index 
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements
	end

	def destroy
		resource.destroy
		set_flash_message :notice, :destroyed
		sign_out_and_redirect(self.resource)
	end

	def new
  #authorize! :manage, User
  @user = User.new
end

def create
	@user = current_users.create(user_params)
	@user = User.new(permitted_params.user)
	#authorize! :manage, User
end

private

def user_params
	params.require(:user).permit(:email, :password,      
		:password_confirmation, :first_name, :last_name, :username, :birthday)
end

end