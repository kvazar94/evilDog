class CategoriesController < ApplicationController
	#before_filter :set_search
	before_action :set_category, only: :show


	

	def show
		@advertisements = Advertisement.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
	end

	

	def set_category
		@category = Category.find(params[:id])
	end


end