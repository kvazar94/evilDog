class UsersController < ApplicationController

	def index 
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements #.paginate(page: params[:page], per_page: 10)
	end

	def destroy
		resource.destroy
		set_flash_message :notice, :destroyed
		sign_out_and_redirect(self.resource)
	end

end
