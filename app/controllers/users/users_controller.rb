class Users::UserController < ApplicationController
	load_and_authorize_resource
	before_action :authenticate_user!
	layout "application"
	def current_user
		User.find_by(id: session[:user_id])
	end

	def index 
		@users = User.all
		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements #.paginate(page: params[:page], per_page: 10)
		
	end

	def show
	end
	
	def show_published
		@user = User.find(params[:id])
		
		
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
