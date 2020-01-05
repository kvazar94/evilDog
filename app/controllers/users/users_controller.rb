class Users::UsersController < Users::UsersController
	#load_and_authorize_resource
	#before_action :authenticate_user!


	def index 
		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements #.paginate(page: params[:page], per_page: 10)
		
	end

	def show
			@user = User.find(params[:id])
		@user_advertisements = @user.advertisements
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
