class DashboardsController < ApplicationController

  def show
    @company = current_user.companies.first
    # @dashboard = @company.dashboard

    @dashboard = @company.dashboard
  end

end
