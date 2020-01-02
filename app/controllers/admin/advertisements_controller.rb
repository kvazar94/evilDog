class Admin::AdvertisementsController < Admin::AdminController
	
	before_action :authenticate_user!, except: [:index, :show ]
	before_action :set_advertisement,  except: [:index ]
	#before_filter :set_search

	def index
		@q = Advertisement.where("state = 'fresh' ").ransack(params[:q])
		@advertisements = @q.result.paginate(page: params[:page], per_page: 10)
	end

	def show

	end	
	
	def reject
		@advertisement.reject!
		redirect_to admin_advertisements_path, success: 'Объявление отклонено успешно'
	end
	
	def approve
		@advertisement.approve!
		redirect_to admin_advertisements_path, success: 'Объявление заверено успешно'
	end

	def destroy
		@advertisement.destroy
		redirect_to advertisements_path, success: 'Объявление уничтожено успешно'
	end

	def update
		if @advertisement.update_attributes(advertisement_params)
			redirect_to admin_advertisements_path #, success: 'Объявление отредактировано успешно'
			#@advertisement.to_fresh
		else
			flash.now[:danger] = 'Ой... что-то пошло не так...'
			render :edit
		end
	end

	private

	def set_advertisement
		@advertisement = Advertisement.find(params[:id])
	end
	
	def advertisement_params
		params.require(:advertisement).permit(:title, :body, :image, :category_id, :state_event, :user_id)
	end
end