require 'test_helper'

class VirtualMachineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = User.create(:name => 'user', :email => 'asd@asd', :password => 'pass', :password_confirmation => 'pass')
  end

  test "should not create a machine without attributes" do
	  vm = VirtualMachine.new()
	  assert_not vm.save
  end

  test "should create a machine successfully" do
	  vm = VirtualMachine.new(name: 'myVM', os: 'linux', user: @user, cores: 0, memory: 0)
	  assert vm.save
  end

end
