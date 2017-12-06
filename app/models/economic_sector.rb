class EconomicSector < ApplicationRecord
  has_many :companies

  validates :name, presence: true
  validates :damp, presence: true
  validates :rain, presence: true
  validates :temperature, presence: true

end
