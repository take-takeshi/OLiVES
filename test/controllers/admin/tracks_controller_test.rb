require "test_helper"

class Admin::TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_tracks_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_tracks_update_url
    assert_response :success
  end
end
