class GlobalResource < ApplicationRecord

  validates :totalRAM, :totalDiskSpace, :totalCPUCores, presence: true

  validate :inUseDiskSpace
  validate :inUseRAM
  validate :inUseCPUCores


  def inUseDiskSpace
    usedSpace = Disk.all.sum(:capacity)
    if !(self.totalDiskSpace.nil?)
      if self.totalDiskSpace < usedSpace
        errors.add(:totalDiskSpace, "Total Disk Space must be more or equal than #{usedSpace}")
      end
    end
  end

  def inUseRAM
    usedRAM = VirtualMachine.all.sum(:memory)
    if !(self.totalRAM.nil?)
      if self.totalRAM < usedRAM
        errors.add(:totalRAM, "Total RAM must be more or equal than #{usedRAM}")
      end
    end
  end

  def inUseCPUCores
    usedCPU = VirtualMachine.all.sum(:cores)
    if !(self.totalCPUCores.nil?)
      if self.totalCPUCores < usedCPU
        errors.add(:totalCPUCores, "Total CPU cores must be more or equal than #{usedCPU}")
      end
    end
  end

  def freeDiskSpace
    self.totalDiskSpace - Disk.all.sum(:capacity)
  end

  def freeRAM
    (self.totalRAM - VirtualMachine.all.sum(:memory))
  end

  def freeCPUCores
    self.totalCPUCores - VirtualMachine.all.sum(:cores)
  end
end
