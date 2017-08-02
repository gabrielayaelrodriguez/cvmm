class Disk < ApplicationRecord
  belongs_to :virtual_machine

  validates :label, :model, presence: true

  validates :capacity, numericality: { greater_than_or_equal_to: 0 }, presence: true

  validate :check_space, :on => :create
  validate :check_edit_space, :on => :update

  def check_space
    available = GlobalResource.first.freeDiskSpace
    if !(self.capacity.nil?) 
      if self.capacity > available
        errors.add(:capacity, "Capacity must be less or equal than #{available}")
      end
    end
  end

  def check_edit_space
    available = GlobalResource.first.freeDiskSpace
    disk = Disk.find(self.id)
    total_available = available + disk.capacity
    if !(self.capacity.nil?) 
      if self.capacity > total_available
        errors.add(:capacity, "Capacity must be less or equal than #{total_available}")
      end
    end
  end
end
