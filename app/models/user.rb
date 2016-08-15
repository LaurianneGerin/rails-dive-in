class User < ApplicationRecord

  has_many :pools, dependent: :destroy
  has_many :reservations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true #add a regex
  validates :password, uniqueness: true, presence: true

end
