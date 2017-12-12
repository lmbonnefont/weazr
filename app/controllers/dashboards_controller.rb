class DashboardsController < ApplicationController

  def show
    @company = current_user.company
    # @dashboard = @company.dashboard

    @dashboard = @company.dashboard
  end

end
