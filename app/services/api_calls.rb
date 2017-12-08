require 'pathname'
require 'facebook_ads'

class FacebookAdsAPIClient

  def initialize(account_id, campaign_id, page_id, page_url, website_url)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAAwL3n4YGgrbFTZCpKkB7nvOd2PuyvtPMb01CjyPMeBGkiOssPSHFUPyORUUSaGTsjK9gl1W27vjBmVQtBcL0UZBqa7rMssuGHYaGWPQqDZA7asZBaUkZAPrwi1eQxcAwIuMqxGkCca3mfBFcVWrdXzqUy4u3qQZDZD'
    FacebookAds.base_uri = 'https://graph.facebook.com/v2.11'
    @account_id = account_id
    @campaign_id = campaign_id
    @page_id = page_id
    @page_url = page_url
    @website_url = website_url
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

  def index_campaigns
    self.get_account
    @account.ad_campaigns
  end

  def create_adimages(url)
    FacebookAds.access_token = 'EAAVcDLP8LsoBAAwL3n4YGgrbFTZCpKkB7nvOd2PuyvtPMb01CjyPMeBGkiOssPSHFUPyORUUSaGTsjK9gl1W27vjBmVQtBcL0UZBqa7rMssuGHYaGWPQqDZA7asZBaUkZAPrwi1eQxcAwIuMqxGkCca3mfBFcVWrdXzqUy4u3qQZDZD'
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

  def create_adset(campaign)
    targeting                   = FacebookAds::AdTargeting.new
    targeting.genders           = [FacebookAds::AdTargeting::WOMEN]
    targeting.age_min           = 29
    targeting.age_max           = 65
    targeting.countries         = ['FR']

    ad_set = campaign.create_ad_set(
      name: 'Test Ad Set',
      targeting: targeting,
      promoted_object: {
        pixel_id: '467837863611941'
      },
      optimization_goal: 'LINK_CLICKS',
      daily_budget: 100, # This is in cents, so the daily budget here is $5.
      billing_event: 'IMPRESSIONS',
      status: 'ACTIVE',
      is_autobid: true
    )
  end

  def create_adcreative(name)
    ad_image_hash = @account.ad_images.first["hash"]
    image_ad_creative = @account.create_ad_creative({
      name: name,
      page_id: @page_id, # Add your Facebook Page ID here.
      message: 'Les nouvelles applis de livraison de repas à la demande déferlent sur Paris et entament une campagne de France pour couvrir le plus de terrain en zone urbaine. La recette: des algorithmes de dispatching hyper précis, de la cuisine dans l’air du temps et des coursiers à vélo.',
      link: @website_url, # Add your Play Store ID here.
      link_title: 'Plat foodie servi par cycliste sympa.',
      image_hash: ad_image_hash,
      call_to_action_type: 'SIGN_UP'
    }, creative_type: 'image')
  end

  def generate_ad

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

this = FacebookAdsAPIClient.new('act_114566172663449', '23842663923640452', '1917026111950285', 'https://www.facebook.com/Kibouftou-1917026111950285/', 'https://aurel-allard.github.io/Kibouftou-Landing/')
p " this done "
account = this.get_account
p " account done "
p campaign = this.create_campaign('THURSDAY 1$ TEST BABY')
p " campaign done "
p ad_creative = this.create_adcreative('New creative')
p " ad_creative done "
p ad_set = this.create_adset(campaign)
p " ad_set done "
p ad = ad_set.create_ad(
  name: 'Test AD',
  creative_id: ad_creative.id,
  status: 'ACTIVE'
  )


# p account.ad_insights


# p campaign = this.index_campaigns.first
# ad_set = campaign.ad_sets(effective_status: ['PAUSED']).first
# ad_creative = account.ad_creatives.first
# ad_set.create_ad(name: 'Test Ad', creative_id: ad_creative.id)
# campaign = this.create_campaign("Pages like campaign")

# this.create_adset(campaign)
# new_ad = this.create_adcreative("Test adset 1")
# campaign = this.get_campaign('114566172663449')

puts "-------- Done --------"
