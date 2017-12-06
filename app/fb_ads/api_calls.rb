require 'facebook_ads'

class FacebookAdsAPIClient

  def initialize(account_id, campaign_id, page_id)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAJsIacGWn93YSlf0xbrYqAT94xPdX96yZC59O3pjgVFQpD4NHYvaSXpAwu2ytjImY1XaFbuo5gwUgNk0bHQHAOxWmyUR8ZBsrqBCvpUYKfqd6FnbrWi8TBjIChRjqZAK1xFMmqLdYIL8z9llzRNhV8kHahgtAZDZD'
    FacebookAds.base_uri = 'https://graph.facebook.com/v2.11'
    @account = FacebookAds::AdAccount.find(account_id)
    @campaign = FacebookAds::AdCampaign.find(campaign_id)
    @page_id = page_id
  end

  def get_account
    @account
  end

  def get_campaign
    @campaign
  end

  def get_adimages
    @account.ad_images
  end

  def get_adcreative
  end

  def get_adset
  end

  def create_campaign
  end

  # def create_adimages
  #   @account.create_ad_images([
  #     'https://d38eepresuu519.cloudfront.net/485674b133dc2f1d66d20c9d52c62bec/original.jpg'
  #   ])
  # end

  def create_adcreative
  end

  def create_adset
  end
end

require 'pathname'
def download(url)
  pathname = Pathname.new(url)
  name = "#{pathname.dirname.basename}.jpg"
  # @FIXME: Need to handle exception here.
  data = RestClient.get(url).body
  file = File.open("/tmp/#{name}", 'w') # Assume *nix-based system.
  file.binmode
  file.write(data)
  file.close
  [name, file.path]
end


this = FacebookAdsAPIClient.new('act_114566172663449', '23842663923640452', '1917026111950285')
account = this.get_account
campaign = this.get_campaign
FacebookAds.access_token = 'EAAVcDLP8LsoBAJsIacGWn93YSlf0xbrYqAT94xPdX96yZC59O3pjgVFQpD4NHYvaSXpAwu2ytjImY1XaFbuo5gwUgNk0bHQHAOxWmyUR8ZBsrqBCvpUYKfqd6FnbrWi8TBjIChRjqZAK1xFMmqLdYIL8z9llzRNhV8kHahgtAZDZD'
url = 'https://d38eepresuu519.cloudfront.net/485674b133dc2f1d66d20c9d52c62bec/original.jpg'
dl = download(url)
file = File.open(dl[1])
# response = AdImage.post("/act_114566172663449/adimages", query: {"original" => url })
# query = pack(query, objectify: false)
uri = "#{FacebookAds.base_uri}/act_114566172663449/adimages"
p response = RestClient.post(uri, {dl[0] => file, objectivity: false, access_token: FacebookAds.access_token })
# account.create_ad_images(['https://d38eepresuu519.cloudfront.net/485674b133dc2f1d66d20c9d52c62bec/original.jpg'])

# account.ad_images

# puts "1. #{account.name}"
# puts "2. #{campaign.name}"
# puts


# urls = ['https://d38eepresuu519.cloudfront.net/485674b133dc2f1d66d20c9d52c62bec/original.jpg', 'https://d38eepresuu519.cloudfront.net/3977d2a47b584820969e2acf4d923e33/original.jpg']
# p files = urls.map do |url|
#   name, path = download(url)
#   [name, File.open(path)]
# end.to_h
