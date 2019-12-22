class AdvertisementsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index, :show]

	before_action :set_advertisement, only: [ :show, :edit, :update, :destroy]

	#before_filter :set_search

	def index
		@q = Advertisement.where("state = 'published' ").ransack(params[:q])
  		
		@advertisements = @q.result.paginate(page: params[:page], per_page: 5)
	end

	def show


	end

	def new
		@advertisement = current_user.advertisements.build

	end

	def create
		@advertisement = current_user.advertisements.build(advertisement_params)
		if @advertisement.save
			redirect_to @advertisement, success: 'Объявление создано' 
		else
			render :new, danger: 'Что-то пошло не так ...'

		end

	end

	def edit 


	end

	def update

		if @advertisement.update_attributes(advertisement_params)
			redirect_to @advertisement, success: 'Объявление отредактировано успешно'
		else
			render :edit, danger: 'Упс... что-то пошло не так...'

		end
	end

	def destroy
		@advertisement = Advertisement.find(params[:id])
		@advertisement.destroy
		redirect_to advertisements_path, success: 'Объявление уничтожено успешно'

	end


	private

	def set_advertisement
		@advertisement = Advertisement.find(params[:id])

	end

	def advertisement_params
		params.require(:advertisement).permit(:title, :body, :image, :category_id, :state, :user_id)

	end






end