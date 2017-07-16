class GlobalResource < ApplicationRecord

	#validates_numericality_of :totalRAM, :only_integer => true, :greater_than_or_equal_to => 0
	#validates :totalRAM, numericality: { greater_than_or_equal_to: 0 }

	def freeDiskSpace
		self.totalDiskSpace - Disk.all.sum(:capacity)
		
		#self.totalUsableDiskSpace - inUse
	end

	def freeRAM
		(self.totalRAM - VirtualMachine.all.sum(:memory))
	end

	def freeCPUCores
		self.totalCPUCores - VirtualMachine.all.sum(:cores)
	end
end
