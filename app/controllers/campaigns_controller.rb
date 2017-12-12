class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.company = current_user.company
    @campaign.budget_remaining = @campaign.budget_total
    if @campaign.save!
      @campaign = Campaign.find(@campaign.id) # TODO find smartest way

    #### BEWARE WHEN ADDING A CAMPAIGN, TOKENS MAY NEED AN UPDATE #####

      # # -------- Creation of a Facebook campaign -------- #
      # account_id = current_user.company.account_id
      # page_id = current_user.company.page_id
      # website_url = current_user.company.website_url
      # pixel_id = current_user.company.pixel_id
      # new_campaign = FacebookAdsAPIClient.new(account_id, page_id, website_url, pixel_id)
      # name = @campaign.title
      # budget = @campaign.budget_total
      # post_title = @campaign.post_title
      # post_msg = @campaign.post_msg
      # image_url = @campaign.photo.url

      # new_campaign.generate_ad(title, post_title, post_msg, image_url, budget)


      # # -------- Display on Facebook page -------- #
      # if @campaign.display == true
      #   new_campaign.display(image_url, post_msg)
      # end


  ################################################################


      somme_coeffs_inputs = 0
      array_days = []

      (@campaign.start..@campaign.end).each do |day|
        c = CampaignDay.new
        c.campaign = @campaign
        c.date = day
        coeff_input = @campaign.company.input.attributes[c.date.strftime("%A").downcase] #on recherche dans les input le jour de la campagn day en création
        somme_coeffs_inputs += coeff_input
        c.save!
        array_days << c
      end

      array_days.each do |cd| #on pondère les inputs utilisateurs au cas ou les semaines ne seraient pas completes
        cd.indice_bau = @campaign.company.input.attributes[cd.date.strftime("%A").downcase]/ somme_coeffs_inputs
        cd.save!
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
    @company = current_user.company
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
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
    params.require(:campaign).permit(:start, :end, :budget_total, :title, :budget_fb, :target_age_min, :target_age_max, :post_msg, :post_title, :url, :photo, :display)
  end
end
