class GlobalResource < ApplicationRecord

	#validates_numericality_of :totalRAM, :only_integer => true, :greater_than_or_equal_to => 0
	#validates :totalRAM, numericality: { greater_than_or_equal_to: 0 }

	def freeDiskSpace
		self.totalUsableDiskSpace - Disk.all.sum(:capacity)
		
		#self.totalUsableDiskSpace - inUse
	end

	def freeRAM
		(self.totalUsableRAM - VirtualMachine.all.sum(:memory))
	end

	def freeCPUCores
		self.totalUsableCPUCores - VirtualMachine.all.sum(:cores)
	end
end
