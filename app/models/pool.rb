class Pool < ApplicationRecord
  belongs_to :user

  validates :width, presence: true
  validates :height, presence: true
  validates :depth, presence: true
  validates :color, presence: true
  validates :pool_type, presence: true
  validates :address, presence: true
  validates :water_type, presence: true
  validates :capacity, presence: true
  validates :description, presence: true
  validates :pool_girl, presence: true, default: 0
  validates :pool_boy, presence: true
end
