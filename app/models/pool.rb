class Pool < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 4

  has_many :reservations

  validates :width, presence: true
  validates :height, presence: true
  validates :depth, presence: true
  validates :color, presence: true

  validates :pool_type, presence: true
  validates :address, presence: true
  validates :water_type, presence: true
  validates :capacity, presence: true
  validates :description, presence: true

  validates :pool_girl, presence: true
  validates :pool_boy, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
