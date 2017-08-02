require 'test_helper'

class VirtualMachineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create a machine without attributes" do
    vm = VirtualMachine.new()
    assert_not vm.save
    assert_equal [:user, :name, :os, :memory, :cores], vm.errors.keys
  end

  test "should not create a machine if memory is not a number" do
    vm = VirtualMachine.new(name: 'myVM', state: 'Shut Down', os: 'linux', user: users(:user1), cores: 0, memory: 'memory')
    assert_not vm.save
    assert_equal ["is not a number"], vm.errors.messages[:memory]
  end

  test "should not create a machine if cores is not a number" do
    vm = VirtualMachine.new(name: 'myVM', state: 'Shut Down', os: 'linux', user: users(:user1), cores: 'cores', memory: 0)
    assert_not vm.save
    assert_equal ["is not a number"], vm.errors.messages[:cores]
  end

  test "should create a machine successfully" do
    vm = VirtualMachine.new(name: 'myVM', state: 'Shut Down', os: 'linux', user: users(:user1), cores: 0, memory: 0)
    assert vm.save
  end

  test "should not create a machine with more memory than allowed" do
    vm = VirtualMachine.new(name: 'myVM', state: 'Shut Down', os: 'linux', user: users(:user1), cores: 0, memory: 500)
    assert_not vm.save
    assert_equal [:memory], vm.errors.keys
  end

  test "should not create a machine with more CPU cores than allowed" do
    vm = VirtualMachine.new(name: 'myVM', state: 'Shut Down', os: 'linux', user: users(:user1), cores: 500, memory: 0)
    assert_not vm.save
    assert_equal [:cores], vm.errors.keys
  end

  test "should destroy all disks when machine is destroyed" do
    vm = virtual_machines(:vm1)
    disk = disks(:disk1)
    assert_difference('Disk.count', -1) do
      vm.destroy
    end

  end

end
