class Company < ApplicationRecord
  belongs_to :user
  has_one :input, dependent: :destroy
  belongs_to :economic_sector

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
