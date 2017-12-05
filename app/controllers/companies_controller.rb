class CompaniesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @company = Company.find(params[:id])
  end


  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params_company)
    @company.user = current_user
    @company.save
    redirect_to companies_path(@company)
  end

  private
  def params_company
    params.require(:company).permit(:address)
  end
end
