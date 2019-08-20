class Duck < ApplicationRecord
  belongs_to :user
  has_many :duck_photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings




  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("race LIKE ?", "%#{search}%")
    where("sex LIKE ?", "%#{search}%")
    where("colour LIKE ?", "%#{search}%")
    where("weight LIKE ?", "%#{search}%")
    where("tags LIKE ?", "%#{search}%")
  end
end

