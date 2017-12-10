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
      account_id = current_user.companies.account_id
      page_id = current_user.companies.page_id
      website_url = current_user.companies.website_url
      pixel_id = current_user.companies.pixel_id
      new_campaign = FacebookAdsAPIClient.new(account_id, page_id, website_url, pixel_id)
      name = @campaign.name
      post_title = @campaign.post_title
      post_msg = @campaign.post_msg
      image_url = @campaign.photo
      new_campaign.generate_ad(name, post_title, post_msg, image_url)
      # -------- End -------- #

      # -------- Display on Facebook page -------- #
      if @campaign.display == true
        new_campaign.display(image_url, post_msg)
      end
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
    params.require(:campaign).permit(:start, :end, :budget_total, :name, :budget_fb, :target_age_min, :target_age_max, :post_msg, :post_title, :url, :photo, :display)
  end
end
