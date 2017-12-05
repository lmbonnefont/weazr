class Input < ApplicationRecord
  belongs_to :company

  validates :monday, presence: true
  validates :tuesday, presence: true
  validates :wednesday, presence: true
  validates :thursday, presence: true
  validates :friday, presence: true
  validates :saturday, presence: true
  validates :sunday, presence: true
end
