class Disk < ApplicationRecord
	belongs_to :virtual_machine

	validates :label, :model, presence: true

	validates :capacity, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
