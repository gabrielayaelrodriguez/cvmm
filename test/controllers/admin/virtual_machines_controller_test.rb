require 'test_helper'

class Admin::VirtualMachinesControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    @virtual_machine = virtual_machines(:vm1)
  end

  test "should not get index if not logged in" do
    get admin_virtual_machines_url
    assert_response :redirect
  end

  test "should not get index if not admin" do
    sign_in users(:user1)
    get admin_virtual_machines_url
    assert_response :redirect
  end

  test "should get index" do
    sign_in users(:user2)
    get admin_virtual_machines_url
    assert_response :success
  end

  test "should not show virtual_machine if not logged in" do
    get admin_virtual_machine_url(@virtual_machine)
    assert_response :redirect
  end

  test "should not show virtual_machine if not admin" do
    sign_in users(:user1)
    get admin_virtual_machine_url(@virtual_machine)
    assert_response :redirect
  end

  test "should show virtual_machine" do
    sign_in users(:user2)
    get admin_virtual_machine_url(@virtual_machine)
    assert_response :success
  end

  test "should not destroy virtual_machine if not logged in" do
    assert_no_difference('VirtualMachine.count', -1) do
      delete admin_virtual_machine_url(@virtual_machine)
    end

    assert_redirected_to root_url
  end

  test "should not destroy virtual_machine if not admin" do
    sign_in users(:user1)
    assert_no_difference('VirtualMachine.count', -1) do
      delete admin_virtual_machine_url(@virtual_machine)
    end

    assert_redirected_to root_url
  end

  test "should destroy virtual_machine" do
    sign_in users(:user2)
    assert_difference('VirtualMachine.count', -1) do
      delete admin_virtual_machine_url(@virtual_machine)
    end

    assert_redirected_to admin_virtual_machines_url
  end

end
