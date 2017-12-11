namespace :upid do
  desc "After scrapping weather, update the indice for the day"
  task update_indice_7_days: :environment do
  end

  total_CD = CampaignDay.where("date >= :today AND date <= :date_in_two_weeks", today: Date.today, date_in_two_weeks: Date.today + 7.days)
  total_weather = {}
  sumrainweek = 0
  sumtemperatureweek = 0
  sumdampweek = 0
  total_CD.each do |cd|
    total_weather[cd.date] = cd.weather
    sumdampweek += cd.weather.damp
    sumtemperatureweek += cd.weather.temperature
    sumrainweek += cd.weather.rain
  end

  total_weather.each do |key, value|
    value.campaign_day.idamp = value.damp/sumdampweek
    value.campaign_day.itemperature = value.temperature/sumtemperatureweek
    value.campaign_day.irain = value.rain/sumrainweek
    p value.campaign_day.idailyabsolute = value.campaign_day.campaign.company.economic_sector.damp * value.campaign_day.idamp + value.campaign_day.campaign.company.economic_sector.temperature * value.campaign_day.itemperature + value.campaign_day.campaign.company.economic_sector.rain * value.campaign_day.irain
    value.campaign_day.save!

  end



end
