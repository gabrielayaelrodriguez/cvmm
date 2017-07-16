class VirtualMachine < ApplicationRecord
	belongs_to :user
	has_many :disks, dependent: :destroy

	validates :name, :os, :memory, :cores, presence: true

	#validates :memory, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: GlobalResource.first().freeRAM }, presence: true
	#validates :cores, numericality: { less_than_or_equal_to: GlobalResource.first().freeCPUCores }, presence: true

end
