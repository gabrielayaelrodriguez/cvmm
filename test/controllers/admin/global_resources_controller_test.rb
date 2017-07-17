require 'test_helper'

class GlobalResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @global_resource = global_resources(:one)
  end

  test "should get index" do
    get global_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_global_resource_url
    assert_response :success
  end

  test "should create global_resource" do
    assert_difference('GlobalResource.count') do
      post global_resources_url, params: { global_resource: { totalCPUCores: @global_resource.totalCPUCores, totalDiskSpace: @global_resource.totalDiskSpace, totalRAM: @global_resource.totalRAM, totalUsableCPUCores: @global_resource.totalUsableCPUCores, totalUsableDiskSpace: @global_resource.totalUsableDiskSpace, totalUsableRAM: @global_resource.totalUsableRAM } }
    end

    assert_redirected_to global_resource_url(GlobalResource.last)
  end

  test "should show global_resource" do
    get global_resource_url(@global_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_global_resource_url(@global_resource)
    assert_response :success
  end

  test "should update global_resource" do
    patch global_resource_url(@global_resource), params: { global_resource: { totalCPUCores: @global_resource.totalCPUCores, totalDiskSpace: @global_resource.totalDiskSpace, totalRAM: @global_resource.totalRAM, totalUsableCPUCores: @global_resource.totalUsableCPUCores, totalUsableDiskSpace: @global_resource.totalUsableDiskSpace, totalUsableRAM: @global_resource.totalUsableRAM } }
    assert_redirected_to global_resource_url(@global_resource)
  end

  test "should destroy global_resource" do
    assert_difference('GlobalResource.count', -1) do
      delete global_resource_url(@global_resource)
    end

    assert_redirected_to global_resources_url
  end
end
