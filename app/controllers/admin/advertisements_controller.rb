class Admin::AdvertisementsController < ApplicationController


	before_action :authenticate_user!, except: [:index, :show ]

	before_action :set_advertisement, only: [ :edit, :update, :destroy, :ads_approve, :ads_reject ]

	def index
		@q = Advertisement.where("state = 'new' ").ransack(params[:q])
		
		@advertisements = @q.result.paginate(page: params[:page], per_page: 5)
	end

	def show
	end	
	
	def ads_reject
		@advertisement.reject
	end
	
	def ads_approve
		@advertisement.ads_approve
	end

	def destroy

		@advertisement.destroy
		redirect_to advertisements_path, success: 'Объявление уничтожено успешно'

	end

	private

	def set_advertisement
		@advertisement = Advertisement.find(params[:id])

	end





end