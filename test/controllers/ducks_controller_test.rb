require 'test_helper'

class DucksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ducks_index_url
    assert_response :success
  end

  test "should get show" do
    get ducks_show_url
    assert_response :success
  end

  test "should get search" do
    get ducks_search_url
    assert_response :success
  end

  test "should get edit" do
    get ducks_edit_url
    assert_response :success
  end

  test "should get update" do
    get ducks_update_url
    assert_response :success
  end

  test "should get new" do
    get ducks_new_url
    assert_response :success
  end

  test "should get create" do
    get ducks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ducks_destroy_url
    assert_response :success
  end

end
