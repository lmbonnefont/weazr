require 'koala'
# require 'facebook_ads'
# require 'facebook_ads'

# Assing a peculiar page to. variable
# access_token = 'EAACEdEose0cBALiQZANhAMCwjOVwZBqhmbDrPjjCQkwZCHZCrHC76Jh6nY5gk3P0VHuUDsZAVAlFGUzTfg0gnYvzKZA7zn2TF0Bs3cVrvsokxwmHXOrYj5DkEGBt9VNmuqUIsogJoqxlzGaUZCyAPFlH8AmKkyh9YLIpPwLSmLRD15ZBm6gOgJ3TtVM7Tm8ZAZA6QZD'
FacebookAds.access_token = 'EAAVcDLP8LsoBAJsIacGWn93YSlf0xbrYqAT94xPdX96yZC59O3pjgVFQpD4NHYvaSXpAwu2ytjImY1XaFbuo5gwUgNk0bHQHAOxWmyUR8ZBsrqBCvpUYKfqd6FnbrWi8TBjIChRjqZAK1xFMmqLdYIL8z9llzRNhV8kHahgtAZDZD'
account_id = 'act_114566172663449'
page_id = '1917026111950285'

# @graph = Koala::Facebook::API.new(access_token)
# FacebookAds.configure do |config|
#   config.access_token = ad_token
# end
# ad_account = FacebookAds::AdAccount.all #find('act_114566172663449')

# Publish a single message
# @graph.put_connections("me", "feed", message: "A super bon steak !")

# Publish a single photo
# @graph.put_connections("me", "feed", url: "https://www.omahasteaks.com/gifs/990x594/pr_ts004.jpg")

# Publish both message and picture
# @graph.put_picture("http://constance-a-table.fr/wp-content/uploads/2016/06/colombo-de-poulet.jpg")

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
#   name: 'My AdSet', # campaign.id here will return {result=create-campaign:$.id}
#   status: 'PAUSED',
#   targeting: {'geo_locations':{'countries':['FR']}},
#   daily_budget: '100',
#   billing_event: 'IMPRESSIONS',
#   bid_amount: '1',
#   campaign_id: campaign_id,
#   optimization_goal: 'REACH',
#   promoted_object: {'POST_ID': @post_id},
# })
