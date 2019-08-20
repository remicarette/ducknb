class DuckPhoto < ApplicationRecord
  belongs_to :duck

  # validations
  validates :url, presence: true
  validates :name, presence: true
  validates :duck, presence: true
end
