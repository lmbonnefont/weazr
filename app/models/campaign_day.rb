class CampaignDay < ApplicationRecord
  belongs_to :campaign
  has_one :weather
end
