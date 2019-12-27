class Admin::AdminController < ApplicationController

	before_action :authenticate_user!
	before_action :check_admin
	#before_filter :set_search
	layout "admin"

	protected

	def check_admin
		redirect_to root_path, alert: "У Вас нет прав доступа к данной странице" unless current_user.try(:admin?) 
	end


	def index
		
	end

end