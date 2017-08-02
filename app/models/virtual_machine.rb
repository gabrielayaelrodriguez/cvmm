class VirtualMachine < ApplicationRecord
  belongs_to :user
  has_many :disks, dependent: :destroy

  validates :name, :state, :os, presence: true

  validates :memory, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :cores, numericality: { greater_than_or_equal_to: 0  }, presence: true

  # en el create, para que no se pase de lo que tiene el Global Resource
  validate :check_memory, :on => :create
  validate :check_cores, :on => :create

  # en el update, para que no se pase de lo que ya tiene + lo que esta free
  validate :check_edit_memory, :on => :update
  validate :check_edit_cores, :on => :update

  def check_memory
    available = GlobalResource.first.freeRAM
    if !(self.memory.nil?) 
      if self.memory > available
        errors.add(:memory, "Memory must be less or equal than #{available}")
      end
    end
  end

  def check_edit_memory
    available = GlobalResource.first.freeRAM
    machine = VirtualMachine.find(self.id)
    total_available = available + machine.memory
    if !(self.memory.nil?) 
      if self.memory > total_available
        errors.add(:memory, "Memory must be less or equal than #{total_available}")
      end
    end
  end

  def check_cores
    available = GlobalResource.first.freeCPUCores
    if !(self.cores.nil?) 
      if self.cores > available
        errors.add(:cores, "Cores must be less or equal than #{available}")
      end
    end
  end

  def check_edit_cores
    available = GlobalResource.first.freeCPUCores
    machine = VirtualMachine.find(self.id)
    total_available = available + machine.cores
    if !(self.cores.nil?) 
      if self.cores > total_available
        errors.add(:cores, "CPU Cores must be less or equal than #{total_available}")
      end
    end
  end

end
