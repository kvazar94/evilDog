class Users::AdvertisementsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]
	before_action :set_advertisement, only: [ :edit, :update, :destroy ]


	def index
		@users = User.all
		@user = User.find(params[:id])
		@user_advertisements = @user.advertisements #.paginate(page: params[:page], per_page: 5)
	end

	def show
	end

	def to_fresh
		@advertisement.to_fresh!
		redirect_to users_advertisements_path
	end

	def new
		#@advertisement = Advertisement.new
		@advertisement = current_user.advertisements.build
	end

	def create
		@advertisement = current_user.advertisements.create(advertisement_params)
		if @advertisement.save
			redirect_to @advertisement, success: 'Объявление создано' 
		else
			flash.now[:danger] = 'Статья не создана'
			render :new
		end
	end

	def edit 
	end

	def update
		if @advertisement.update_attributes(advertisement_params)
			@advertisement.to_draft
			redirect_to @advertisement, success: 'Объявление отредактировано успешно'
		else
			flash.now[:danger] = '...что-то пошло не так...'
			render :edit
		end
	end

	def destroy
		@advertisement.destroy
		redirect_to advertisements_path, success: 'Объявление уничтожено успешно'
	end

	private

	def set_advertisement
		@advertisement = Advertisement.find(params[:id])
	end

	def advertisement_params
		params.require(:advertisement).permit(:title, :body, :image, :category_id, :state_event, :user_id)
	end

end