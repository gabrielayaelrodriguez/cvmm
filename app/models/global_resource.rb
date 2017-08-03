class GlobalResource < ApplicationRecord

  validates :totalRAM, :totalDiskSpace, :totalCPUCores, presence: true

  validate :inUseDiskSpace
  validate :inUseRAM
  validate :inUseCPUCores


  def inUseDiskSpace
    usedSpace = Disk.sum(:capacity)
    errors.add(:totalDiskSpace, I18n.t("global_resource_errors.disk_space_more_or_equal_to", :usedSpace=> usedSpace)) if totalDiskSpace && totalDiskSpace < usedSpace
  end

  def inUseRAM
    usedRAM = VirtualMachine.sum(:memory)
    errors.add(:totalRAM, I18n.t("global_resource_errors.ram_more_or_equal_to", :usedRAM=> usedRAM)) if totalRAM && totalRAM < usedRAM
  end

  def inUseCPUCores
    usedCores = VirtualMachine.sum(:cores)
    errors.add(:totalCPUCores, I18n.t("global_resource_errors.cores_more_or_equal_to", :usedCores=> usedCores))if totalCPUCores && totalCPUCores < usedCores
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
