require 'test_helper'

class GlobalResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @gr = global_resources(:gr)
  end

  test "should not reduce global resource memory if it is in use" do
    @gr.totalRAM = 0
    assert_not @gr.save
    assert_equal [:totalRAM], @gr.errors.keys
  end

  test "should not reduce global resource cores if it is in use" do
    @gr.totalCPUCores = 0
    assert_not @gr.save
    assert_equal [:totalCPUCores], @gr.errors.keys
  end

  test "should not reduce global resource disk space if it is in use" do
    @gr.totalDiskSpace = 0
    assert_not @gr.save
    assert_equal [:totalDiskSpace], @gr.errors.keys
  end

  test "should reduce global resource cores successfully" do
    @gr.totalCPUCores = 1
    assert @gr.save
  end

  test "should reduce global resource memory successfully" do
    @gr.totalRAM = 1
    assert @gr.save
  end

  test "should reduce global resource disk space successfully" do
    @gr.totalDiskSpace = 1
    assert @gr.save
  end

end
