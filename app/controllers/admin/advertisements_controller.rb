class Admin::AdvertisementsController < Admin::AdminController


	before_action :authenticate_user!, except: [:index, :show ]

	before_action :set_advertisement,  except: [:index ]

	def index
		@q = Advertisement.where("state = 'new' ").ransack(params[:q])
		
		@advertisements = @q.result.paginate(page: params[:page], per_page: 5)
	end

	def show
	end	
	
	def reject
		@advertisement.reject!
	redirect_to @advertisement
	 end
	
	 def approve
	 	@advertisement.approve!
	 	redirect_to @advertisement
	 end

	def destroy

		@advertisement.destroy
		redirect_to advertisements_path, success: 'Объявление уничтожено успешно'

	end

	def update

		if @advertisement.update_attributes(advertisement_params)
			redirect_to @advertisement, success: 'Объявление отредактировано успешно'
			@advertisement.to_new
		else
			 flash.now[:danger] = 'Упс... что-то пошло не так...'
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