require 'test_helper'

class VirtualMachineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create a machine without attributes" do
	  vm = VirtualMachine.new()
	  assert_not vm.save
  end

  test "should create a machine successfully" do
	  vm = VirtualMachine.new(name: 'myVM', os: 'linux', user: users(:user1), cores: 0, memory: 0)
	  assert vm.save
  end

  test "should not create a machine with more memory than allowed" do
	  vm = VirtualMachine.new(name: 'myVM', os: 'linux', user: users(:user1), cores: 0, memory: 500)
	  assert_not vm.save
  end

  test "should not create a machine with more CPU cores than allowed" do
	  vm = VirtualMachine.new(name: 'myVM', os: 'linux', user: users(:user1), cores: 500, memory: 0)
	  assert_not vm.save
  end

  test "should destroy all disks when machine is destroyed" do
    vm = virtual_machines(:vm1)
    disk = disks(:disk1)
    assert_difference('Disk.count', -1) do
      vm.destroy
    end

  end

end
