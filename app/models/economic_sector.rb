class EconomicSector < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :damp, presence: true
  validates :rain, presence: true
  validates :temperature, presence: true

end
