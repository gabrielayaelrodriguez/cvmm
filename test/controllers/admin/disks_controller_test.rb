require 'test_helper'

class Admin::DisksControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    @virtual_machine = virtual_machines(:vm1)
    @disk = disks(:disk1)
  end

  test "should not show disk if not logged in" do
    get admin_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :redirect
  end

  test "should not show disk if not admin" do
    sign_in users(:user1)
    get admin_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :redirect
  end

  test "should show disk" do
    sign_in users(:user2)
    get admin_virtual_machine_disk_url(@virtual_machine, @disk)
    assert_response :success
  end

end
