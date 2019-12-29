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
	
	def show_published
		@q = Advertisement.where("state = 'published' ").ransack(params[:q])
	end

	def show_archived
		@q = Advertisement.where("state = 'archived' ").ransack(params[:q])
	end

	def show_approved
		@q = Advertisement.where("state = 'approve' ").ransack(params[:q])
	end

	def show_rejected
		@q = Advertisement.where("state = 'rejected' ").ransack(params[:q])
	end

end
