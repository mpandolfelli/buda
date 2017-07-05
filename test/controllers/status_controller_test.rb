require 'test_helper'

class StatusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get status_new_url
    assert_response :success
  end

  test "should get create" do
    get status_create_url
    assert_response :success
  end

  test "should get edit" do
    get status_edit_url
    assert_response :success
  end

  test "should get update" do
    get status_update_url
    assert_response :success
  end

  test "should get destroy" do
    get status_destroy_url
    assert_response :success
  end

end
