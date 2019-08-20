class Duck < ApplicationRecord
  belongs_to :user
  has_many :duck_photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end

