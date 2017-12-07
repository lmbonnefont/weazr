require 'open-uri'
require 'nokogiri'

class CampaignDaysController < ApplicationController

  def update
    url = "https://www.timeanddate.com/weather/france/paris/ext"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    i = 0
    k = 0
    l = 6
    m = 8
    for j in (1..14) do
      weather = {
       temperature: html_doc.search(".c#{i} .sep")[k].text,
       damp: html_doc.search(".c#{i} td")[l].text,
       rain: html_doc.search(".c#{i} td")[m].text,
      }
      if i == 0
        i = 1
      elsif i == 1
        i = 0
        k += 3
        l += 12
        m += 12
      end

      #update


    end
  end

  def destroy
  end

end
