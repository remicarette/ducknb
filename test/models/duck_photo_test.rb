require 'test_helper'

class DuckPhotoTest < ActiveSupport::TestCase
    mount_uploader :url, PhotoUploader
end
