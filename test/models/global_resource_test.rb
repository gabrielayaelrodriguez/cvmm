require 'test_helper'

class GlobalResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@user = User.create(:name => 'user', :email => 'asd@asd', :password => 'pass', :password_confirmation => 'pass')
  	@vm = VirtualMachine.create(name: 'myVM', os: 'linux', user: @user, cores: 1, memory: 1)
  	@gr = GlobalResource.first
  end

  test "should not reduce global resource memory if it is in use" do
	  @gr.totalRAM = 0
	  assert_not @gr.save
  end

  test "should not reduce global resource cores if it is in use" do
	  @gr.totalCPUCores = 0
	  assert_not @gr.save
  end

  test "should reduce global resource cores successfully" do
	  @gr.totalCPUCores = 1
	  assert @gr.save
  end

  test "should reduce global resource memory successfully" do
	  @gr.totalRAM = 1
	  assert @gr.save
  end

end
