require 'koala'
# require 'facebook_ads'
# require 'facebook_ads'

# Assing a peculiar page to. variable
access_token = 'EAAdGnkgbtQoBACCOFpcLBcTycoEx57g3HCn8qvo4wK8fblnQDIpI1wCcQZAZAOTTMrp3P6EJUf1HDvA0yHcrcZAVtRpuKWJMZATxB9ImLzjvGFHsDTg0zDZAeDNWManfx96RpW9nx2PbbrhtqXULH3hXt5EYonv3YLzbHYQbYAd0ZBkwvHVF9yZAW16Ic8eauMZD'
ad_token = 'EAAdGnkgbtQoBACCOFpcLBcTycoEx57g3HCn8qvo4wK8fblnQDIpI1wCcQZAZAOTTMrp3P6EJUf1HDvA0yHcrcZAVtRpuKWJMZATxB9ImLzjvGFHsDTg0zDZAeDNWManfx96RpW9nx2PbbrhtqXULH3hXt5EYonv3YLzbHYQbYAd0ZBkwvHVF9yZAW16Ic8eauMZD'
# account_id = 'act_114566172663449'
# page_id = '1917026111950285'

@graph = Koala::Facebook::API.new(access_token)
# FacebookAds.configure do |config|
#   config.access_token = ad_token
# end

# Publish a single message
# @graph.put_connections("me", "feed", message: "A super bon steak !")

# Publish a single photo
# @graph.put_connections("me", "feed", url: "https://www.omahasteaks.com/gifs/990x594/pr_ts004.jpg")

# Publish both message and picture
@graph.put_picture("http://constance-a-table.fr/wp-content/uploads/2016/06/colombo-de-poulet.jpg", message: "A super bon steak !")

# Get all media publications in an array
# @posts = []
# @graph.get_connections("me", "feed").each do |post|
#   @posts<<post
# end
# @post_id = @posts.first["id"]

# Get a publication by id
# @post = @posts.find do |post|
#   post["id"] = "1917026111950285_1917608328558730"
# end
# p @post



# Creation of a campain
# campaign = ad_account.campaigns.create({
#   name: "My First campaign",
#   objective: "CONVERSIONS",
# })

# campaign = FacebookAds::Campaign.get('23842663923640452')
# campaign_id = campaign["id"]


#Creation of a promotion
# ad_account.adsets.create({
  # name: 'My AdSet', # campaign.id here will return {result=create-campaign:$.id}
  # status: 'PAUSED',
  # targeting: {'geo_locations':{'countries':['FR']}},
  # daily_budget: '100',
  # billing_event: 'IMPRESSIONS',
  # bid_amount: '1',
  # campaign_id: campaign_id,
  # optimization_goal: 'REACH',
  # promoted_object: {'POST_ID': @post_id},
# })
