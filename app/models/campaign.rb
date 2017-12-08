class Campaign < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :company
  has_many :campaign_days, dependent: :destroy
end
