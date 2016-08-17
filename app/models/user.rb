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

end
