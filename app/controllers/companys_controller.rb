class CompanysController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_company)
    @user.user = current_user
    @user.save
    redirect_to companys_path
  end

  private
  def params_user
    params.require(:company).permit(:address)
  end
end
