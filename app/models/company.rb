class Company < ApplicationRecord
  belongs_to :user
  has_one :input, dependent: :destroy
  has_many :campaigns, dependent: :destroy
  belongs_to :economic_sector
  has_one :dashboard, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
