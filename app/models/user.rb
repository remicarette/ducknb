class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ducks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :duck_photos, through: :ducks

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true

  def ducks_bookings
    array = []
    p "------------"
    p self.ducks
    self.ducks.each do |duck|
      duck.bookings.each do |booking|
        array << booking if booking.status == "pending" && booking.user != self
      end
    end
    return array
  end
end
