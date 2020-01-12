# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  # prepend: true
  add_flash_types :success, :danger, :info, :warning
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  def set_search
    @q = Advertisement.search(params[:q])
  end

  def show
  end
  # private
  # def current_user
  #   # checks for a User based on the session’s user id that was stored when they logged in, and stores result in an instance variable
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # # to give access to this method from all the views, the helper_method makes it a helper method
  # helper_method :current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username birthday email password current_password remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name username birthday email password current_password remember_me])
  end
end
