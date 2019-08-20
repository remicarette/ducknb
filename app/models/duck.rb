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

  def rating_average
    average = reviews.sum(&:stars).fdiv(reviews.count)
    return round_to_half(average)
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

end

