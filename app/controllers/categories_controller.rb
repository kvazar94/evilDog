class CategoriesController < ApplicationController
	before_action :set_category, only: :show

	def show
		@q = Advertisement.where(state: 'published', category_id: [@category.subtree_ids]).ransack(params[:q])
		@advertisements = @q.result.paginate(page: params[:page], per_page: 10)

		#@advertisements = Advertisement.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end
end