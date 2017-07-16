require 'test_helper'

class DiskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@user = User.create(:name => 'user', :email => 'asd@asd', :password => 'pass', :password_confirmation => 'pass')
  	@vm = VirtualMachine.create(name: 'myVM', os: 'linux', user: @user, cores: 1, memory: 1)
  end

  test "should not create a disk without a virtual machine" do
	  disk = Disk.create(:label => 'disk', :model => 'SSD', :capacity => 1)
	  assert_not disk.save
  end

  test "should not create a disk with more space than allowed" do
	  disk = Disk.create(:label => 'disk', :model => 'SSD', :capacity => 30, :virtual_machine => @vm)
	  assert_not disk.save
  end

  test "should create a disk successfully" do
	  disk = Disk.create(:label => 'disk', :model => 'SSD', :capacity => 1, :virtual_machine => @vm)
	  assert disk.save
  end

end
