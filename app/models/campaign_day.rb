class CampaignDay < ApplicationRecord
  belongs_to :campaign
  has_one :weather, dependent: :destroy
end
