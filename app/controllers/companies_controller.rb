class CompaniesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @company = current_user.companies.find(params[:id])
  end


  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params_company)
    @company.user = current_user
    @company.save!

    dashboard = Dashboard.new
    dashboard.company_id = @company.id
    dashboard.save

    redirect_to new_company_input_path(@company.id)
  end

  def edit
    @company = current_user.companies.find(params[:id])
  end

  def update
    @company = current_user.companies.find(params[:id])
    @company.update(params_company)
    redirect_to profile_path
  end

  private
  def params_company
    params.require(:company).permit(:address, :name, :economic_sector_id)
  end
end
