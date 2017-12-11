class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def show
    @company = current_user.company
    @dashboard = @company.dashboard
    unless @company.nil?
      return @input = @company.input
    end
  end

  def edit
  end

  def update
    @user = current_user
    @user.update(profile_params)
    if @user.company.exists?
      redirect_to profile_path
    else
      redirect_to new_company_path
    end
  end

  private

  def set_user
    @user = current_user
  end

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :photo, :account_id, :page_id, :website_url)
  end
end
