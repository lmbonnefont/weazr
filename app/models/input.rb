class Input < ApplicationRecord
  belongs_to :company

  validates :monday, presence: true
  validates :tuesday, presence: true
  validates :wednesday, presence: true
  validates :thursday, presence: true
  validates :friday, presence: true
  validates :saturday, presence: true
  validates :sunday, presence: true

  # validate :total_100

  # def total_100
  #   total_100 = monday + tuesday + wednesday + thursday + friday + saturday + sunday
  #   if total_100 != 100
  #     errors.add(:sunday, "Sum of the days must be 100")
  #   end
  # end
end
