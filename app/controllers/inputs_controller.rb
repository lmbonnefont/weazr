class InputsController < ApplicationController
  def new
    @input = Input.new
  end

  def create
    input = Input.new(params_input)
    input.company = Company.find(params[:company_id])
    input.save
    redirect_to company_path(params[:company_id])
  end

  def edit
  end

  def update
  end

  private
  def params_input
    params.require(:input).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end
end
