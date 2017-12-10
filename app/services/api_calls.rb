require 'pathname'
require 'facebook_ads'

class FacebookAdsAPIClient

  def initialize(account_id, page_id, website_url, pixel_id)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAAwL3n4YGgrbFTZCpKkB7nvOd2PuyvtPMb01CjyPMeBGkiOssPSHFUPyORUUSaGTsjK9gl1W27vjBmVQtBcL0UZBqa7rMssuGHYaGWPQqDZA7asZBaUkZAPrwi1eQxcAwIuMqxGkCca3mfBFcVWrdXzqUy4u3qQZDZD'
    FacebookAds.base_uri = 'https://graph.facebook.com/v2.11'
    @account_id = account_id
    @page_id = page_id
    @website_url = website_url
    @pixel_id = pixel_id
  end

  def get_account
    @account = FacebookAds::AdAccount.find(@account_id)
  end

  def get_adimages
    self.get_account
    @account.ad_images
  end

  def index_campaigns
    self.get_account
    @account.ad_campaigns
  end

  def create_adimages(image_url)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAAwL3n4YGgrbFTZCpKkB7nvOd2PuyvtPMb01CjyPMeBGkiOssPSHFUPyORUUSaGTsjK9gl1W27vjBmVQtBcL0UZBqa7rMssuGHYaGWPQqDZA7asZBaUkZAPrwi1eQxcAwIuMqxGkCca3mfBFcVWrdXzqUy4u3qQZDZD'
    dl = download(image_url)
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

  def create_adset(campaign, name)
    targeting                   = FacebookAds::AdTargeting.new
    targeting.age_min           = 29
    targeting.age_max           = 65
    targeting.countries         = ['FR']

    ad_set = campaign.create_ad_set(
      name: "#{name} Ad Set",
      targeting: targeting,
      promoted_object: {
        pixel_id: @pixel_id,
        custom_event_type: 'LEAD'
      },
      optimization_goal: 'OFFSITE_CONVERSIONS',
      daily_budget: 100,
      billing_event: 'IMPRESSIONS',
      status: 'ACTIVE',
      is_autobid: true
    )
  end

  def create_adcreative(name, post_title, post_msg)
    ad_image_hash = @account.ad_images.first["hash"]
    image_ad_creative = @account.create_ad_creative({
      name: name,
      page_id: @page_id, # Add your Facebook Page ID here.
      message: post_msg,
      link: @website_url, # Add your Play Store ID here.
      link_title: post_title,
      image_hash: ad_image_hash,
      call_to_action_type: 'SIGN_UP'
    }, creative_type: 'image')
  end

  def generate_ad(name, post_title, post_msg, photo)
    # this = FacebookAdsAPIClient.new('act_114566172663449', '1917026111950285', 'https://aurel-allard.github.io/Kibouftou-Landing/')
    account = self.get_account
    p account.ad_images.first["hash"]
    campaign = self.create_campaign(name)
    create_adimages(photo)
    ad_creative = self.create_adcreative("Creative #{name}", post_title, post_msg)
    ad_set = self.create_adset(campaign, name)
    ad = ad_set.create_ad(
      name: 'Test AD',
      creative_id: ad_creative.id,
      status: 'ACTIVE'
      )
  end

  private

  def download(image_url)
    pathname = Pathname.new(image_url)
    name = "#{pathname.dirname.basename}.jpg"
    data = RestClient.get(image_url).body
    file = File.open("/tmp/#{name}", 'w')
    file.binmode
    file.write(data)
    file.close
    [name, file.path]
  end
end

this = FacebookAdsAPIClient.new('act_114566172663449', '1917026111950285', 'https://aurel-allard.github.io/Kibouftou-Landing/', '467837863611941')
this.generate_ad('THISSUNDAY', 'Title text', 'Post text', '')

puts
puts "-------- Done --------"
puts
