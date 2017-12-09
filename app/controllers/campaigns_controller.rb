class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.company = current_user.companies.first
    @campaign.budget_remaining = @campaign.budget_total
    if @campaign.save!

      # -------- Creation of a Facebook campaign -------- #
      current_user.account_id =
      current_user.page_id =
      current_user.website_url =
      FacebookAdsAPIClient.new(account_id, campaign_id, page_id, page_url, website_url))
      # -------- End -------- #

      (@campaign.start..@campaign.end).each do |day|
        c = CampaignDay.new
        c.campaign = @campaign
        c.date = day
        c.save!
        w = Weather.new
        w.campaign_day = c
        w.save!
      end
    end
    redirect_to campaign_path(@campaign)
  end

  def edit
  end

  def update
    @campaign.update(campaign_params)
    @campaign.save
    redirect_to campaign_path(@campaign)
  end

  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def destroy
    @campaign.destroy
    redirect_to profile_path(current_user)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:start, :end, :budget_total, :title, :budget_fb, :target_age_min, :target_age_max, :post_msg, :post_title, :url, :photo)
  end
end
