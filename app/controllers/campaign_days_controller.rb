class CampaignDaysController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    #@camapain_day = @campaign.campaign
    @campaign_days = @campaign.campaign_days.all

  end

end
