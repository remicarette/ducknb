class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true
  validates :stars, presence: true
  validates :booking, presence: true

def convert_date(date_at)
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    datum = date_at.to_s
    year = datum[0..3]
    month = months[datum[5..6].to_i - 1]
    day = datum[8..9]
    return "#{month} #{day}, #{year}"
  end
end
