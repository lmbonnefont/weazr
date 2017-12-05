class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def show

  end

  def edit

  end

  def update
    @user = current_user
    @user.update(profile_params)
    redirect_to profile_path

  end

  private

  def set_user
    @user = current_user
  end

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number)
  end
end
