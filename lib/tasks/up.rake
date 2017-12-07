require 'open-uri'
require 'nokogiri'

namespace :up do
  desc "Update Weather for the next 14 days by scrapping data."
  task update_weather_14_days: :environment do


  @total_ongoing = CampaignDay.where("date >= :today AND date <= :date_in_two_weeks", today: Date.today, date_in_two_weeks: Date.today + 13.days)

    url = "https://www.timeanddate.com/weather/france/paris/ext"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    i = 0
    k = 0
    l = 6
    m = 8
    n = 0
    hashday = {}
    for j in (1..14) do
    hashday[transform_date(html_doc.search(".c#{i} th")[n].text)] = {
       temperature: transform_temperature(html_doc.search(".c#{i} .sep")[k].text),
       damp: transform_humidity(html_doc.search(".c#{i} td")[l].text),
       rain: transform_rain(html_doc.search(".c#{i} td")[m].text),
        }
      if i == 0
        i = 1
      elsif i == 1
        i = 0
        k += 3
        l += 12
        m += 12
        n += 1
      end
    end
    updatedays(@total_ongoing,hashday)
  end

  def transform_date(date)
    date = date.split(" ")
    d = date[0].match(/\d+/)
    months = {
      janv: 1,
      fév: 2,
      mars: 3,
      avril: 4,
      mai: 5,
      juin: 6,
      jui: 7,
      aout: 8,
      sept: 9,
      oct: 10,
      nov: 11,
      déc: 12,
    }
    m = months[date[1].to_sym]
    #attention pb avec les changements d'année !!
    y = Date.today.year
    return "#{y}-#{m}-#{d}"
  end

  def transform_temperature(temp)
    temp.match(/\d+/)[0].to_f
  end

  def transform_humidity(humidity)
    humidity.match(/\d+/)[0].to_f/100
  end

  def transform_rain(rain)
    if rain == "-"
      return 0
    else
      rain.match(/\d+/)[0].to_f
    end
  end

  def updatedays(array_to_be_uploaded, hash_with_infos)
    array_to_be_uploaded.each do |campaign_day|
      if hash_with_infos[campaign_day.date.strftime("%Y-%m-%d")]
        # p campaign_day.weather
      campaign_day.weather.damp = hash_with_infos[campaign_day.date.strftime("%Y-%m-%d")][:damp]
      campaign_day.weather.temperature = hash_with_infos[campaign_day.date.strftime("%Y-%m-%d")][:temperature]
      campaign_day.weather.rain = hash_with_infos[campaign_day.date.strftime("%Y-%m-%d")][:rain]

      campaign_day.weather.save!
      end
    end
  end

end