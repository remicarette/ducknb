class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true
  validates :stars, presence: true
  validates :booking, presence: true


end
