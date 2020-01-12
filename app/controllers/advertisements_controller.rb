# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: :show
  # before_filter :set_search
  # scope :published, -> { where(state: 'published') }

  def index
    @q = Advertisement.published.ransack(params[:q])
    @advertisements = @q.result.paginate(page: params[:page], per_page: 15)
  end

  def show; end

  private

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

  def advertisement_params
    params.require(:advertisement).permit(:title, :body, :image, :category_id, :state_event, :user_id)
  end
end
