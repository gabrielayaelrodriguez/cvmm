require 'test_helper'

class User::VirtualMachinesControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @virtual_machine = virtual_machines(:vm1)
    @user = users(:user1)
  end

  test "should not get index if not logged in" do
    get user_virtual_machines_url
    assert_response :redirect
  end

  test "should not get index if admin" do
    sign_in users(:user2)
    get user_virtual_machines_url
    assert_response :redirect
  end

  test "should get index" do
    sign_in users(:user1)
    get user_virtual_machines_url
    assert_response :success
  end

  test "should not get new if not logged in" do
    get new_user_virtual_machine_url
    assert_response :redirect
  end

  test "should not get new if admin" do
    sign_in users(:user2)
    get new_user_virtual_machine_url
    assert_response :redirect
  end

  test "should get new" do
    sign_in users(:user1)
    get new_user_virtual_machine_url
    assert_response :success
  end

  test "should not create virtual_machine if not logged in" do
    assert_no_difference('VirtualMachine.count') do
      post user_virtual_machines_url, params: { virtual_machine: { name: @virtual_machine.name, state: @virtual_machine.state, os: @virtual_machine.os, user: @user, cores: @virtual_machine.cores, memory: @virtual_machine.memory } }
    end

    assert_redirected_to new_user_session_url
  end

  test "should not create virtual_machine if admin" do
    sign_in users(:user2)
    assert_no_difference('VirtualMachine.count') do
      post user_virtual_machines_url, params: { virtual_machine: { name: @virtual_machine.name, state: @virtual_machine.state, os: @virtual_machine.os, user: @user, cores: @virtual_machine.cores, memory: @virtual_machine.memory } }
    end

    assert_redirected_to root_url
  end

  test "should create virtual_machine" do
    sign_in users(:user1)
    assert_difference('VirtualMachine.count') do
      post user_virtual_machines_url, params: { virtual_machine: { name: @virtual_machine.name, state: @virtual_machine.state, os: @virtual_machine.os, user: @user, cores: @virtual_machine.cores, memory: @virtual_machine.memory } }
    end

    assert_redirected_to user_virtual_machine_url(VirtualMachine.last)
  end

  test "should not show virtual_machine if not logged in" do
    get user_virtual_machine_url(@virtual_machine)
    assert_response :redirect
  end

  test "should not show virtual_machine if admin" do
    sign_in users(:user2)
    get user_virtual_machine_url(@virtual_machine)
    assert_response :redirect
  end

  test "should show virtual_machine" do
    sign_in users(:user1)
    get user_virtual_machine_url(@virtual_machine)
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_user_virtual_machine_url(@virtual_machine)
    assert_response :redirect
  end

  test "should not get edit if admin" do
    sign_in users(:user2)
    get edit_user_virtual_machine_url(@virtual_machine)
    assert_response :redirect
  end

  test "should get edit" do
    sign_in users(:user1)
    get edit_user_virtual_machine_url(@virtual_machine)
    assert_response :success
  end

  test "should not update virtual_machine if not logged in" do
    patch user_virtual_machine_url(@virtual_machine), params: { virtual_machine: { name: @virtual_machine.name, state: @virtual_machine.state, os: @virtual_machine.os, user: @user, cores: @virtual_machine.cores, memory: @virtual_machine.memory } }
    assert_redirected_to new_user_session_url
  end

  test "should not update virtual_machine if admin" do
    sign_in users(:user2)
    patch user_virtual_machine_url(@virtual_machine), params: { virtual_machine: { name: @virtual_machine.name, state: @virtual_machine.state, os: @virtual_machine.os, user: @user, cores: @virtual_machine.cores, memory: @virtual_machine.memory } }
    assert_redirected_to root_url
  end

  test "should update virtual_machine" do
    sign_in users(:user1)
    patch user_virtual_machine_url(@virtual_machine), params: { virtual_machine: { name: @virtual_machine.name, state: @virtual_machine.state, os: @virtual_machine.os, user: @user, cores: @virtual_machine.cores, memory: @virtual_machine.memory } }
    assert_redirected_to user_virtual_machine_url(@virtual_machine)
  end

  test "should not destroy virtual_machine if not logged in" do
    assert_no_difference('VirtualMachine.count', -1) do
      delete user_virtual_machine_url(@virtual_machine)
    end
    assert_redirected_to new_user_session_url
  end

  test "should not destroy virtual_machine if admin" do
    sign_in users(:user2)
    assert_no_difference('VirtualMachine.count', -1) do
      delete user_virtual_machine_url(@virtual_machine)
    end
    assert_redirected_to root_url
  end

  test "should destroy virtual_machine" do
    sign_in users(:user1)
    assert_difference('VirtualMachine.count', -1) do
      delete user_virtual_machine_url(@virtual_machine)
    end
    assert_redirected_to user_virtual_machines_url
  end






  

  

  

  


end
