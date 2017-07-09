require 'test_helper'

class Users::VirtualMachinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_virtual_machine = users_virtual_machines(:one)
  end

  test "should get index" do
    get users_virtual_machines_url
    assert_response :success
  end

  test "should get new" do
    get new_users_virtual_machine_url
    assert_response :success
  end

  test "should create users_virtual_machine" do
    assert_difference('Users::VirtualMachine.count') do
      post users_virtual_machines_url, params: { users_virtual_machine: { state: @users_virtual_machine.state } }
    end

    assert_redirected_to users_virtual_machine_url(Users::VirtualMachine.last)
  end

  test "should show users_virtual_machine" do
    get users_virtual_machine_url(@users_virtual_machine)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_virtual_machine_url(@users_virtual_machine)
    assert_response :success
  end

  test "should update users_virtual_machine" do
    patch users_virtual_machine_url(@users_virtual_machine), params: { users_virtual_machine: { state: @users_virtual_machine.state } }
    assert_redirected_to users_virtual_machine_url(@users_virtual_machine)
  end

  test "should destroy users_virtual_machine" do
    assert_difference('Users::VirtualMachine.count', -1) do
      delete users_virtual_machine_url(@users_virtual_machine)
    end

    assert_redirected_to users_virtual_machines_url
  end
end
