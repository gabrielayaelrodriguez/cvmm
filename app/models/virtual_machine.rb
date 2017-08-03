class VirtualMachine < ApplicationRecord
  belongs_to :user
  has_many :disks, dependent: :destroy

  validates :name, :state, :os, presence: true

  POSSIBLE_STATES = ["shut_down", "sleeping", "running"]

  validates :memory, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :cores, numericality: { greater_than_or_equal_to: 0  }, presence: true

  # cant have more resources than Global Resource has
  
  validate :check_memory, :on => [:create, :update]
  validate :check_cores, :on => [:create, :update]

  def check_memory
    available = GlobalResource.first.freeRAM
    if VirtualMachine.exists?(id)then available=available+VirtualMachine.find(id).memory end
    errors.add(:memory, I18n.t("virtual_machine_errors.memory_less_or_equal_to", :available=> available)) if memory && memory > available
  end

  def check_cores
    available = GlobalResource.first.freeCPUCores
    if VirtualMachine.exists?(id)then available=available+VirtualMachine.find(id).cores end
    errors.add(:cores, I18n.t("virtual_machine_errors.cores_less_or_equal_to", :available=> available)) if cores && cores > available
  end

end
