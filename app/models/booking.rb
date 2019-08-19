class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :duck
  has_many :reviews
end
