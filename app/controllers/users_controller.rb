class UsersController < ApplicationController

	layout "application"
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

		def show_published
			@user = User.find_by(id: session[:user_id])
		@user_advertisements = @user.advertisements.where("state = 'published' ").ransack(params[:q])
	end

	def show_archived
		@user = User.User.find_by(id: session[:user_id])
		#@archived = @user.advertisements.find_by(state: ) #.where("state = 'archived' ").ransack(params[:q])
	end

	def show_approved
		@q = Advertisement.where("state = 'approve' ").ransack(params[:q])
	end

	def show_rejected
		@q = Advertisement.where("state = 'rejected' ").ransack(params[:q])
	end


	def destroy
		resource.destroy
		set_flash_message :notice, :destroyed
		sign_out_and_redirect(self.resource)
	end

end
