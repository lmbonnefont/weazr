class CampaignDaysController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])

    #@camapain_day = @campaign.campaign
    @campaign_days = @campaign.campaign_days


    @days = [{}]
    @days[0]["category"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:date).map do |date|
      {"label": date.strftime("%a")}
    end

    @series = [{}, {}, {}]
    @series[0]["seriesname"] = "rain index"
    @series[0]["data"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:indice_rain).map do |rain|
      {"value": rain}
    end
    @series[1]["seriesname"] = "damp index"
    @series[1]["data"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:indice_damp).map do |damp|
      {"value": damp}
    end
    @series[2]["seriesname"] = "temperature index"
    @series[2]["data"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:indice_temperature).map do |temperature|
      {"value": temperature}
    end
  end

end
