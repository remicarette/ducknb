class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :duck
  has_many :reviews, dependent: :destroy

  validates :user, presence: true
  validates :duck, presence: true
  validates :start, presence: true
  valdiates :end, presence: true
  validates :status, presence: true
end
