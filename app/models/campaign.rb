class Campaign < ApplicationRecord
  belongs_to :company
  has_many :campaign_days, dependent: :destroy
end
