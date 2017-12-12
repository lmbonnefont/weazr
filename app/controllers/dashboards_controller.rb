class DashboardsController < ApplicationController

  def show

    @company = current_user.company

   
    #raise
    #@campaign = @company.campaigns.first
    # campaign = @company.campaigns.find(params[:id])



    # @dashboard = @company.dashboard

    #@dashboard = @company.dashboard
  end

end
