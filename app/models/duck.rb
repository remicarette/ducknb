class Duck < ApplicationRecord
  belongs_to :user
  has_many :duck_photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :birthdate, presence: true
  validates :user, presence: true
  validates :name, presence: true
  validates :race, presence: true
  validates :sex, presence: true
  validates :colour, presence: true
  validates :weight, presence: true
  validates :tags, presence: true 
end

