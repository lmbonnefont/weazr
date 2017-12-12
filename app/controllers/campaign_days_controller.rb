class CampaignDaysController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @campaign_days = @campaign.campaign_days.all
  end

end
