require 'pathname'
require 'facebook_ads'

class FacebookAdsAPIClient

  def initialize(account_id, campaign_id, page_id)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAJsIacGWn93YSlf0xbrYqAT94xPdX96yZC59O3pjgVFQpD4NHYvaSXpAwu2ytjImY1XaFbuo5gwUgNk0bHQHAOxWmyUR8ZBsrqBCvpUYKfqd6FnbrWi8TBjIChRjqZAK1xFMmqLdYIL8z9llzRNhV8kHahgtAZDZD'
    FacebookAds.base_uri = 'https://graph.facebook.com/v2.11'
    @account_id = account_id
    @campaign_id = campaign_id
    @page_id = page_id
  end

  def get_account
    @account = FacebookAds::AdAccount.find(@account_id)
  end

  def get_campaign
    @campaign = FacebookAds::AdCampaign.find(@campaign_id)
  end

  def get_adimages
    self.get_account
    @account.ad_images
  end

  def get_adcreative
  end

  def get_adset
  end

  def index_campaigns
    self.get_account
    @account.ad_campaigns
  end

  def create_adimages(url)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAJsIacGWn93YSlf0xbrYqAT94xPdX96yZC59O3pjgVFQpD4NHYvaSXpAwu2ytjImY1XaFbuo5gwUgNk0bHQHAOxWmyUR8ZBsrqBCvpUYKfqd6FnbrWi8TBjIChRjqZAK1xFMmqLdYIL8z9llzRNhV8kHahgtAZDZD'
    dl = download(url)
    file = File.open(dl[1])
    uri = "#{FacebookAds.base_uri}/#{@account_id}/adimages"
    response = RestClient.post(uri, {dl[0] => file, objectivity: false, access_token: FacebookAds.access_token })
  end

  def create_campaign(name)
    @account.create_ad_campaign(
      name: name,
      objective: 'CONVERSIONS',
      status: 'PAUSED'
    )
  end

  def create_adset
    # Optimize
    ad_set = campaign.create_ad_set(
      name: 'Test Ad Set',
      targeting: targeting,
      promoted_object: { # This can be an Android app, iOS app or pixel ID, plus an optional custom event.
        application_id: '295802707128640',
        object_store_url: 'http://play.google.com/store/apps/details?id=com.tophatter',
        custom_event_type: 'PURCHASE'
      },
      optimization_goal: 'OFFSITE_CONVERSIONS',
      daily_budget: 500, # This is in cents, so the daily budget here is $5.
      billing_event: 'IMPRESSIONS',
      status: 'PAUSED',
      is_autobid: true
    )
  end

  def create_adcreative(name)
    ad_image_hash = @account.ad_images.first["hash"]
    image_ad_creative = @account.create_ad_creative({
      name: name,
      page_id: @page_id, # Add your Facebook Page ID here.
      message: 'Les nouvelles applis de livraison de repas à la demande déferlent sur Paris et entament une campagne de France pour couvrir le plus de terrain en zone urbaine. La recette: des algorithmes de dispatching hyper précis, de la cuisine dans l’air du temps et des coursiers à vélo.',
      link: 'https://www.facebook.com/Kibouftou-1917026111950285/', # Add your Play Store ID here.
      link_title: 'Plat foodie servi par cycliste sympa.',
      image_hash: ad_image_hash,
      call_to_action_type: 'SHOP_NOW'
    }, creative_type: 'image')
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
new_campaign = this.create_campaign("Kibouftou campaign #1")
new_ad = this.create_adcreative
p this.index_campaigns
# create_adcreative =

puts "-------- Done --------"
