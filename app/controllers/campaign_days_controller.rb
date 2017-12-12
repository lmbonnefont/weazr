class CampaignDaysController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    #@camapain_day = @campaign.campaign
    @campaign_days = @campaign.campaign_days


    # @days = [{
    #         "category": [{
    #             "label": "Mon"
    #         }, {
    #             "label": "Tue"
    #         }, {
    #             "label": "Wed"
    #         }, {
    #             "label": "Thu"
    #         }, {
    #             "label": "Fri"
    #         }, {
    #             "label": "Sat"
    #         }, {
    #             "label": "Sun"
    #         }]
    #     }]

    @days = [{}]
    @days[0]["category"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:date).map do |date|
      {"label": date.strftime("%a")}
    end

    @series = [{}, {}, {}]
    @series[0]["seriesname"] = "rain index"
    @series[0]["data"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:indice_rain).map do |rain|
      {"value": rain}
    end
    @series[0]["seriesname"] = "damp index"
    @series[0]["data"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:indice_damp).map do |damp|
      {"value": damp}
    end
    @series[0]["seriesname"] = "temperature index"
    @series[0]["data"] = @campaign_days.where(date: [Date.today..Date.today + 7]).pluck(:indice_temperature).map do |temperature|
      {"value": temperature}
    end

    # @series = [{
    #         "seriesname": "Bakersfield Central",
    #         "data": [{
    #             "value": "15123"
    #         }, {
    #             "value": "14233"
    #         }, {
    #             "value": "25507"
    #         }, {
    #             "value": "9110"
    #         }]
    #     }, {
    #         "seriesname": "Los Angeles Topanga",
    #         "data": [{
    #             "value": "13400"
    #         }, {
    #             "value": "12800"
    #         }, {
    #             "value": "22800"
    #         }, {
    #             "value": "12400"
    #         }]
    #     }]

  end

end
