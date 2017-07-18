require 'test_helper'

class Admin::GlobalResourcesControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    @global_resource = global_resources(:gr)
  end

  test "should not get index if not logged in" do
    get admin_global_resource_url
    assert_response :redirect
  end

  test "should not get index if not admin" do
    sign_in users(:user1)
    get admin_global_resource_url
    assert_response :redirect
  end

  test "should get index" do
    sign_in users(:user2)
    get admin_global_resource_url
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_admin_global_resource_url(@global_resource)
    assert_response :redirect
  end

  test "should not get edit if not admin" do
    sign_in users(:user1)
    get edit_admin_global_resource_url(@global_resource)
    assert_response :redirect
  end

  test "should get edit" do
    sign_in users(:user2)
    get edit_admin_global_resource_url(@global_resource)
    assert_response :success
  end

  test "should not update global_resource if not logged in" do
    patch admin_global_resource_url(@global_resource), params: { global_resource: { totalCPUCores: @global_resource.totalCPUCores, totalDiskSpace: @global_resource.totalDiskSpace, totalRAM: @global_resource.totalRAM } }
    assert_redirected_to root_url
  end

  test "should not update global_resource if not admin" do
    sign_in users(:user1)
    patch admin_global_resource_url(@global_resource), params: { global_resource: { totalCPUCores: @global_resource.totalCPUCores, totalDiskSpace: @global_resource.totalDiskSpace, totalRAM: @global_resource.totalRAM } }
    assert_redirected_to root_url
  end

  test "should update global_resource" do
    sign_in users(:user2)
    patch admin_global_resource_url(@global_resource), params: { global_resource: { totalCPUCores: @global_resource.totalCPUCores, totalDiskSpace: @global_resource.totalDiskSpace, totalRAM: @global_resource.totalRAM } }
    assert_redirected_to admin_global_resource_url
  end

end
