class InputsController < ApplicationController
  def new

    @input = Input.new
  end

  def create
    input = Input.new(new_params(params_input))
    input.company = Company.find(params[:company_id])

    if input.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @input = current_user.company.input
  end

  def update
    @input = current_user.companies.first.input
    @input.update(new_params(params_input))
    redirect_to profile_path

  end

  private
  def params_input
    params.require(:input).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end

  def new_params(params_input)
    days = params_input.values.map {|valeurs| valeurs.to_i}
    total = days.reduce(:+)
    new_params_input_hash = params_input.to_h
    new_params_input_hash.each {|k,v| new_params_input_hash[k] = (v.to_f/total*100).round(2)}
  end
end
