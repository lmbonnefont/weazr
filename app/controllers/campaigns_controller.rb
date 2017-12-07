class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.company = current_user.companies.first
    @campaign.budget_remaining = @campaign.budget_total
    @campaign.save
    if @campaign.save!
      (@campaign.start..@campaign.end).each do |day|
        c = CampaignDay.new
        c.campaign = @campaign
        c.date = day
        c.save!
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
    params.require(:campaign).permit(:start, :end, :budget_total, :title)
  end
end
