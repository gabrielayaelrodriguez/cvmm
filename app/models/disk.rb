class Disk < ApplicationRecord
	belongs_to :virtual_machine

	validates :label, :model, presence: true

	validates :capacity, numericality: { less_than_or_equal_to: GlobalResource.first().freeDiskSpace }, presence: true
end
