class Review < ApplicationRecord
  RATINGS = (0..5)
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :content, presence: true
  validates :rating,
            presence: true,
            numericality: { only_integer: true },
            inclusion: RATINGS
end
