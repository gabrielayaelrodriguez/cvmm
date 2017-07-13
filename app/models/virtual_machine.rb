class VirtualMachine < ApplicationRecord
	belongs_to :user
	has_many :disks, dependent: :destroy

	validates :name, :os, presence: true

	validates :memory, numericality: { less_than_or_equal_to: GlobalResource.first().totalUsableRAM }, presence: true
	validates :cores, numericality: { less_than_or_equal_to: GlobalResource.first().totalUsableCPUCores }, presence: true

end
