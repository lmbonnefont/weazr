namespace :indice do
  desc "After scrapping weather, update the indice for the day"
  task update_indice_7_days: :environment do

    duree = 14 #durée sur laquelle on update les budgets(max 14)

    nextdays = Meteo.where("date >= :toomorow AND date <= :date_in_two_weeks", toomorow: Date.today + 1, date_in_two_weeks: Date.today + 14.days)

    campaigns = []
    nextcampaigndays = CampaignDay.where("date >= :toomorow AND date <= :date_in_two_weeks", toomorow: Date.today + 1, date_in_two_weeks: Date.today + 14.days)
    nextcampaigndays.each do |cd|
      campaigns << cd.campaign
    end
    campaigns = campaigns.uniq






  # (1 - ((campaign.end - campaign.start + 1).to_i - campaign.campaign_days.length))
    for i in (0..campaigns.length-1) do
      tune = 0
      rain = 0
      damp = 0
      temperature = 0
      array = sum(i, campaigns)
      sumrain = array[0]
      sumtemperature = array[1]
      sumdamp = array[2]

      campaigns[i].campaign_days.each do |cd|
        if Meteo.find_by(date: cd.date) != nil || Meteo.find_by(date: cd.date) != nil || Meteo.find_by(date: cd.date) != nil
          r = Meteo.find_by(date: cd.date).rain / sumrain
          cd.indice_rain = r
          rain += r
          t = Meteo.find_by(date: cd.date).temperature / sumtemperature
          cd.indice_temperature = t
          temperature += t
          d = Meteo.find_by(date: cd.date).damp / sumdamp
          cd.indice_damp = d
          damp += d
          cd.indice_daily = 0.5 * (0.6 * cd.indice_damp + 0.2 * cd.indice_temperature + 0.2 * cd.indice_rain) + 0.5 * cd.indice_bau
          cd.budget_forcast = cd.campaign.budget_total * cd.indice_daily
          cd.save!
        end
      end
    end
  end

  def sum(campaign_nb, campaigns)
    sumrain = 0
    sumdamp = 0
    sumtemperature = 0
    # campaigns.each do |cd|
    #   p cd.campaign_days.length
    # end
    campaigns[campaign_nb].campaign_days.each do |cd|
      if Meteo.find_by(date: cd.date) != nil || Meteo.find_by(date: cd.date) != nil || Meteo.find_by(date: cd.date) != nil
        sumrain += Meteo.find_by(date: cd.date).rain
        sumtemperature += Meteo.find_by(date: cd.date).temperature
        sumdamp += Meteo.find_by(date: cd.date).damp
      end
    end
    array = [sumrain, sumtemperature, sumdamp]
  end
end
