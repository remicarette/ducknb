class DuckPhoto < ApplicationRecord
  belongs_to :duck

  # validations
  validates :name, presence: true
  validates :duck, presence: true

  # cloudinary
  mount_uploader :url, PhotoUploader
end
