require 'pathname'
require 'facebook_ads'

class FacebookAdsAPIClient

  def initialize(account_id, campaign_id, page_id)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAJsIacGWn93YSlf0xbrYqAT94xPdX96yZC59O3pjgVFQpD4NHYvaSXpAwu2ytjImY1XaFbuo5gwUgNk0bHQHAOxWmyUR8ZBsrqBCvpUYKfqd6FnbrWi8TBjIChRjqZAK1xFMmqLdYIL8z9llzRNhV8kHahgtAZDZD'
    FacebookAds.base_uri = 'https://graph.facebook.com/v2.11'
    @account = FacebookAds::AdAccount.find(account_id)
    @account_id = account_id
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

  def create_adimages(url)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAJsIacGWn93YSlf0xbrYqAT94xPdX96yZC59O3pjgVFQpD4NHYvaSXpAwu2ytjImY1XaFbuo5gwUgNk0bHQHAOxWmyUR8ZBsrqBCvpUYKfqd6FnbrWi8TBjIChRjqZAK1xFMmqLdYIL8z9llzRNhV8kHahgtAZDZD'
    dl = download(url)
    file = File.open(dl[1])
    uri = "#{FacebookAds.base_uri}/#{@account_id}/adimages"
    response = RestClient.post(uri, {dl[0] => file, objectivity: false, access_token: FacebookAds.access_token })
  end

  def create_adcreative
    ad_image_hash = account.ad_images.first["hash"]
    image_ad_creative = account.create_ad_creative({
      name: 'Test Single Image Creative',
      page_id: @page_id, # Add your Facebook Page ID here.
      message: 'A message.',
      link: 'https://www.facebook.com/Kibouftou-1917026111950285/', # Add your Play Store ID here.
      link_title: 'A link title.',
      image_hash: ad_image_hash,
      call_to_action_type: 'SHOP_NOW'
    }, creative_type: 'image')
  end

  def create_adset
  end

  private

  def download(url)
    pathname = Pathname.new(url)
    name = "#{pathname.dirname.basename}.jpg"
    data = RestClient.get(url).body
    file = File.open("/tmp/#{name}", 'w')
    file.binmode
    file.write(data)
    file.close
    [name, file.path]
  end

end



this = FacebookAdsAPIClient.new('act_114566172663449', '23842663923640452', '1917026111950285')
account = this.get_account
campaign = this.get_campaign
# this.create_adimages('http://www.seriouseats.com/recipes/assets_c/2016/04/20160418-american-omelet-ham-and-cheese-21-thumb-1500xauto-431186.jpg')




puts "-------- Done --------"
