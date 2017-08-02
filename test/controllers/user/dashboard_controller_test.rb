require 'test_helper'

class User::DashboardControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test "should not get index if not logged in" do
    get user_dashboard_index_url
    assert_response :redirect
  end

  test "should get index if logged in" do
    sign_in users(:user1)
    get user_dashboard_index_url
    assert_response :success
  end

  test "should not get index if admin" do
    sign_in users(:user2)
    get user_dashboard_index_url
    assert_response :redirect
  end
end
