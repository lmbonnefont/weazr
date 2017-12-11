namespace :indice do
  desc "After scrapping weather, update the indice for the day"
  task update_indice_7_days: :environment do

  duree = 14 #durée sur laquelle on update les budgets(max 14)

  total_CD = CampaignDay.where("date >= :today AND date <= :date_in_two_weeks", today: Date.today, date_in_two_weeks: Date.today + duree.days)
  total_weather = {}
  sumrainweek = 0
  sumtemperatureweek = 0
  sumdampweek = 0
  total_CD.each do |cd| #création des indices journaliers de rain, damp et temperature qui sont le poids des précipitations, température et humidité dans le total de la semaine. On commence par additioner la semaine
    total_weather[cd.date] = cd.weather
    sumdampweek += cd.weather.damp
    sumtemperatureweek += cd.weather.temperature
    sumrainweek += cd.weather.rain
  end

sum_idailyabsolute = 0 #puis on calcule le poids de chacun des jours dans ces totaux et on crée un indicedujour en absolue, correspondant à la pondération du secteur économique de l'entreprise
  total_weather.each do |key, value|
    value.campaign_day.idamp = value.damp/sumdampweek
    value.campaign_day.itemperature = value.temperature/sumtemperatureweek
    value.campaign_day.irain = value.rain/sumrainweek
    value.campaign_day.idailyabsolute = value.campaign_day.campaign.company.economic_sector.damp * value.campaign_day.idamp + value.campaign_day.campaign.company.economic_sector.temperature * value.campaign_day.itemperature + value.campaign_day.campaign.company.economic_sector.rain * value.campaign_day.irain
    sum_idailyabsolute += value.campaign_day.idailyabsolute
    sum_idailyabsolute
    value.campaign_day.save!
  end

average = sum_idailyabsolute / duree #moyenne des indices du jour sur la durée

  total_weather.each do |key, value| #création du dernier indice calculé comme l'écart à la moyenne des indices du jour + 1. Ce chiffre vient pondérer le chiffre du daily input donné par l'utilisateur (répartition théorique du business de l'utilisateur)
    value.campaign_day.idailyrelative = (value.campaign_day.idailyabsolute - average) + 1
    value.campaign_day.budget_forcast = value.campaign_day.idailyrelative * value.campaign_day.theorical_budget
    value.campaign_day.budget_forcast
    value.campaign_day.save!
  end
end
end
