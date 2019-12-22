class Admin::AdvertisementsController < ApplicationController


	before_action :authenticate_user!, except: [:index, :show]

	before_action :set_advertisement, only: [ :show]

	def index
		@q = Advertisement.ransack(params[:q])
		
		@advertisements = @q.result.paginate(page: params[:page], per_page: 5)
	end

	def show
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





end