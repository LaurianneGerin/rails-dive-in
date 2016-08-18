class Pool < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_attachments :photos, maximum: 4

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

  def available?(begin_date_pick, end_date_pick)
    #transform date
    bdp = begin_date_pick.split('/')
    begin_date_pick = (bdp[1] + '/' + bdp[0] + '/' + bdp[2]).to_date

    edp = end_date_pick.split('/')
    end_date_pick = (edp[1] + '/' + edp[0] + '/' + edp[2]).to_date

    current_reservations = Reservation.where(pool: self).where("end_date <= ?", end_date_pick)

    current_reservations.each do |reservation|
      return false if reservation.overlap?(begin_date_pick, end_date_pick)
    raise
    end
    return true
  end
end
