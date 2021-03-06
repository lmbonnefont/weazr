require 'open-uri'
require 'nokogiri'

namespace :weather do
  desc "Update Weather for the next 14 days by scrapping data."
  task update_weather_14_days: :environment do
  nextdays = Meteo.where("date >= :toomorow AND date <= :date_in_two_weeks", toomorow: Date.today + 1, date_in_two_weeks: Date.today + 14.days)
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
      p hashday
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
    updatedays(nextdays, hashday)
    if Meteo.where(date: Date.today + 14).empty? #On demande si le jour existe déjà (on fait tourner heroku task manager plusieurs fois par jour par sécurité)
      m = Meteo.new
      m.date = Date.today + 14
      m.save!
    end
  end

  def transform_date(date)
    date = date.split(" ")
    d = date[0].match(/\d+/)
    months = {
      jan: 1,
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
      Jan: 1,
      Feb: 2,
      Mar: 3,
      Apr: 4,
      May: 5,
      Jun: 6,
      Jul: 7,
      Aug: 8,
      Sep: 9,
      Oct: 10,
      Nov: 11,
      Dec: 12}

    m = months[date[1].to_sym]
    if m != 12
      y = Date.today.year + 1
    else
      y = Date.today.year
    end
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
    array_to_be_uploaded.each do |day|
      p hash_with_infos[day.date.strftime("%Y-%m-%d")]
      if hash_with_infos[day.date.strftime("%Y-%m-%d")]
      p day.damp = hash_with_infos[day.date.strftime("%Y-%m-%d")][:damp]
      p day.temperature = hash_with_infos[day.date.strftime("%Y-%m-%d")][:temperature]
      p day.rain = hash_with_infos[day.date.strftime("%Y-%m-%d")][:rain]
      p "hellofromupdateendbeforesaving"
      day.save!
      p day
      else
        p "wrong"
      end
      p "hellofinished"
    end
  end

end
