class DuckPhoto < ApplicationRecord
  belongs_to :duck

  # validations
  validates :url, presence: true, uniqueness: true
  validates :name, presence: true
end
