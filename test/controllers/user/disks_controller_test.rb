require 'test_helper'

class DisksControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @virtual_machine = virtual_machines(:vm1)
    @disk = disks(:disk1)
  end

  test "should not get new if not logged in" do
    get new_user_virtual_machine_disk_url(@virtual_machine)
    assert_response :redirect
  end

  test "should not get new if admin" do
    sign_in users(:user2)
    get new_user_virtual_machine_disk_url(@virtual_machine)
    assert_response :redirect
  end

  test "should get new" do
    sign_in users(:user1)
    get new_user_virtual_machine_disk_url(@virtual_machine)
    assert_response :success
  end

  test "should not create disk if not logged in" do
    assert_no_difference('Disk.count') do
      post user_virtual_machine_disks_url(@virtual_machine), params: { disk: { label: @disk.label, model: @disk.model, capacity: @disk.capacity, virtual_machine: @virtual_machine } }
    end

    assert_redirected_to new_user_session_url
  end

  test "should not create disk if admin" do
    sign_in users(:user2)
    assert_no_difference('Disk.count') do
      post user_virtual_machine_disks_url(@virtual_machine), params: { disk: { label: @disk.label, model: @disk.model, capacity: @disk.capacity, virtual_machine: @virtual_machine } }
    end

    assert_redirected_to root_url
  end

  test "should create disk" do
    sign_in users(:user1)
    assert_difference('Disk.count') do
      post user_virtual_machine_disks_url(@virtual_machine), params: { disk: { label: @disk.label, model: @disk.model, capacity: @disk.capacity, virtual_machine: @virtual_machine } }
    end

    assert_redirected_to user_virtual_machine_url(@virtual_machine)
  end

  test "should not show disk if not logged in" do
    get user_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :redirect
  end

  test "should not show disk if admin" do
    sign_in users(:user2)
    get user_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :redirect
  end

  test "should show disk" do
    sign_in users(:user1)
    get user_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_user_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :redirect
  end

  test "should not get edit if admin" do
    sign_in users(:user2)
    get edit_user_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :redirect
  end

  test "should get edit" do
    sign_in users(:user1)
    get edit_user_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :success
  end

  test "should not update disk if not logged in" do
    patch user_virtual_machine_disk_url(@virtual_machine, @disk), params: { disk: { label: @disk.label, model: @disk.model, capacity: @disk.capacity, virtual_machine: @virtual_machine } }
    assert_redirected_to new_user_session_url
  end

  test "should not update disk if admin" do
    sign_in users(:user2)
    patch user_virtual_machine_disk_url(@virtual_machine, @disk), params: { disk: { label: @disk.label, model: @disk.model, capacity: @disk.capacity, virtual_machine: @virtual_machine } }
    assert_redirected_to root_url
  end

  test "should update disk" do
    sign_in users(:user1)
    patch user_virtual_machine_disk_url(@virtual_machine, @disk), params: { disk: { label: @disk.label, model: @disk.model, capacity: @disk.capacity, virtual_machine: @virtual_machine } }
    assert_redirected_to user_virtual_machine_url(@virtual_machine)
  end

  test "should not destroy disk if not logged in" do
    assert_no_difference('Disk.count', -1) do
      delete user_virtual_machine_disk_url(@virtual_machine, @disk)
    end
    assert_redirected_to new_user_session_url
  end

  test "should not destroy disk if admin" do
    sign_in users(:user2)
    assert_no_difference('Disk.count', -1) do
      delete user_virtual_machine_disk_url(@virtual_machine, @disk)
    end
    assert_redirected_to root_url
  end

  test "should destroy disk" do
    sign_in users(:user1)
    assert_difference('Disk.count', -1) do
      delete user_virtual_machine_disk_url(@virtual_machine, @disk)
    end
    assert_redirected_to user_virtual_machine_url(@virtual_machine)
  end

end
