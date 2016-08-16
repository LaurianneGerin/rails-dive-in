class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pool

  validates :user_id, :pool_id, :begin_date, :end_date, presence: true
end
