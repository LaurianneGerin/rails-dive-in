class Pool < ApplicationRecord
  belongs_to :user
  belongs_to :animal_option

  validates :width, presence: true
  validates :height, presence: true
  validates :depth, presence: true
  validates :color, presence: true
  validates :pool_house, presence: true
  validates :pool_toys, presence: true
  # validates :animal_option, presence: true
  validates :pool_type, presence: true
  validates :address, presence: true
  validates :water_type, presence: true
  validates :capacity, presence: true
  validates :description, presence: true
  validates :alcohol, presence: true
  validates :soft, presence: true
  validates :bbq, presence: true
  validates :pool_girl, presence: true
  validates :pool_boy, presence: true
end




