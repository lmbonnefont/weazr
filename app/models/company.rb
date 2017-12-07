class Company < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_one :input, dependent: :destroy
  has_many :campaigns, dependent: :destroy
  belongs_to :economic_sector

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
