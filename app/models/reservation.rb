class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pool

  validates :user_id, :pool_id, :begin_date, :end_date, presence: true

  def overlap?(begin_date_pick, end_date_pick)
    (begin_date_pick - self.end_date) * (self.begin_date - end_date_pick) >= 0
  end
end
