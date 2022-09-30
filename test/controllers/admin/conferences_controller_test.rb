require "test_helper"

class Admin::ConferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_conferences_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_conferences_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get admin_conferences_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_conferences_update_url
    assert_response :success
  end
end
