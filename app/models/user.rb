class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pools, dependent: :destroy
  has_many :reservations, dependent: :destroy

  has_attachment  :photo, accept: [:jpg, :png]

  # TODO validates :first_name, presence: true
  # TODO validates :last_name, presence: true

  def list_own_pool_reservations
    pool_reservations = []
    self.pools.each do |pool|
       pool_reservations << pool.reservations
    end
    pool_reservations.flatten
  end
end
