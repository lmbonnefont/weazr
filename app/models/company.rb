class Company < ApplicationRecord
  belongs_to :user
  has_one :input, dependent: :destroy
  has_one :weather_sensitiveness, dependent: :destroy
end
