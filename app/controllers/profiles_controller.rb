class ProfilesController < ApplicationController
before_action :authenticate_user!
before_action :find_profile, only: [:show, :edit, :update, :destroy]

respond_to :html

  def index
    @profiles = Profile.all
  end

  def new
      @profile = current_user.build_profile
  end

  def create
     @profile = current_user.build_profile(profile_params)
  if @profile.save
    flash[:success] = "Profile saved"
    redirect_to current_user_path
  else
    flash[:error] = "Error"
    render: new
  end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
  	@profile = current_user.profile.find(params[:id])
  end

  def update
     @profile = current_user.profile.find(params[:id])
  if @profile.update_attributes(profile_params)
    flash[:success] = "Successfully updated"    # Optional
    redirect_to user_path
  else
    flash[:error] = "Error"       # Optional
    render :edit
  end
  end


  private

    def find_profile
      @profile = Profile.find(params[:id])
    end

  def profile_params
    params.require(:profile).permit(                  
        :gender, :telephone_no)
  end
	
end