class Duck < ApplicationRecord
  belongs_to :user
  has_many :duck_photos
  has_many :bookings
  has_many :reviews, through: :bookings
end
