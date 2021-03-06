# frozen_string_literal: true

class Admin::UsersController < UsersController
  # before_filter :set_search
  before_action :authenticate_user!
  layout 'admin'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_advertisements = @user.advertisements.result.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
    # set_flash_message :notice, :destroyed
    # sign_out_and_redirect(self.resource)
  end

  def new
    # authorize! :manage, User
    @user = User.new
end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation, :first_name, :last_name, :username, :birthday)
  end
end
