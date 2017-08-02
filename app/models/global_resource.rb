class GlobalResource < ApplicationRecord

  validates :totalRAM, :totalDiskSpace, :totalCPUCores, presence: true

  validate :inUseDiskSpace
  validate :inUseRAM
  validate :inUseCPUCores


  def inUseDiskSpace
    usedSpace = Disk.sum(:capacity)
    errors.add(:totalDiskSpace, "Total Disk Space must be more or equal than #{usedSpace}") if totalDiskSpace && totalDiskSpace < usedSpace
  end

  def inUseRAM
    usedRAM = VirtualMachine.sum(:memory)
    errors.add(:totalRAM, "Total RAM must be more or equal than #{usedRAM}") if totalRAM && totalRAM < usedRAM
  end

  def inUseCPUCores
    usedCPU = VirtualMachine.sum(:cores)
    errors.add(:totalCPUCores, "Total CPU cores must be more or equal than #{usedCPU}") if totalCPUCores && totalCPUCores < usedCPU
  end

  def freeDiskSpace
    self.totalDiskSpace - Disk.sum(:capacity)
  end

  def freeRAM
    (self.totalRAM - VirtualMachine.sum(:memory))
  end

  def freeCPUCores
    self.totalCPUCores - VirtualMachine.sum(:cores)
  end
end
