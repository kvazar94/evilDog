class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [ :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def show
    @advertisements = Advertisement.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, @category], success: 'Категория успешно создана'
    else
      flash[:danger] = 'Категория не создана'
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to [:admin, @category], success: 'Категория успешно обновлена'
    else
      flash[:danger] = 'Категория не обновлена'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Категория успешно удалена'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end