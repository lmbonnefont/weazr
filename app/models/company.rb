class Company < ApplicationRecord
  belongs_to :user
  has_one :input, dependent: :destroy
  has_one :economic_sector
  has_many :campaigns, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
