class DuckPhoto < ApplicationRecord
  belongs_to :duck
  mount_uploader :url, PhotoUploader

  # validations
  validates :name, presence: true
  validates :duck, presence: true

  # cloudinary
end
