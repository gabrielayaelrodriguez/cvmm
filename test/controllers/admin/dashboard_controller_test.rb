require 'test_helper'

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test "should not get index if not logged in" do
    get admin_dashboard_index_url
    assert_response :redirect
  end

  test "should get index if logged in" do
  	sign_in users(:user2)
    get admin_dashboard_index_url
    assert_response :success
  end

  test "should not get index if not admin" do
  	sign_in users(:user1)
    get admin_dashboard_index_url
    assert_response :redirect
  end

end
