require "test_helper"

class Admin::DaysControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_days_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_days_update_url
    assert_response :success
  end
end
