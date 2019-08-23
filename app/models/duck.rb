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
  validates :price, presence: true

  mount_uploader :photo, PhotoUploader

  def rating_average
    average = reviews.sum(&:stars).fdiv(reviews.count)
    if average.nan?
      return 0
    else
      return round_to_half(average)
    end
  end

  def round_to_half(float)
    (float * 2.0).round / 2.0
  end

  def show_stars
    a = rating_average.divmod 1
    full_stars = a[0]
    half_stars = (a[1] * 2).to_i
    empty_stars = 5 - full_stars - half_stars
    return [full_stars, half_stars, empty_stars]
  end

  def nb_reviews
    return reviews.size
  end

  def bookable?(date_start, date_end)
    date_start = Date.parse(date_start)
    date_end = Date.parse(date_end)
    booking_asked = date_start..date_end
    self.bookings.each do |booking|
      booking_range = booking.start..booking.end
      start = booking.start - date_start
      return false if booking_asked.overlaps?(booking_range)
    end
    return true
  end
end
