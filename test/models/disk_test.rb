require 'test_helper'

class DiskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:user1)
    @vm = virtual_machines(:vm1)
  end

  test "should not create a disk without attributes" do
    disk = Disk.new()
    assert_not disk.save
    assert_equal [:virtual_machine, :label, :model, :capacity], disk.errors.keys
  end

  test "should not create a disk if capacity is not a number" do
    disk = Disk.new(capacity: 'capacity')
    assert_not disk.save
    assert_equal [:virtual_machine, :label, :model, :capacity], disk.errors.keys
    assert_equal ["is not a number"], disk.errors.messages[:capacity]
  end

  test "should not create a disk without a virtual machine" do
    disk = Disk.new(label: 'disk', model: 'SSD', capacity: 1)
    assert_not disk.save
    assert_equal [:virtual_machine], disk.errors.keys
  end

  test "should not create a disk with more space than allowed" do
    disk = Disk.new(label: 'disk', model: 'SSD', capacity: 30, virtual_machine: @vm)
    assert_not disk.save
    assert_equal [:capacity], disk.errors.keys
  end

  test "should create a disk successfully" do
    disk = Disk.new(label: 'disk', model: 'SSD', capacity: 1, virtual_machine: @vm)
    assert disk.save
  end

end
