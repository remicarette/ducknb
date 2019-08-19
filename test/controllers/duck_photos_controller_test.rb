require 'test_helper'

class DuckPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get duck_photos_new_url
    assert_response :success
  end

  test "should get create" do
    get duck_photos_create_url
    assert_response :success
  end

end
