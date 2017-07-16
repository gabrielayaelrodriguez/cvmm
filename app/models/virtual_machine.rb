class VirtualMachine < ApplicationRecord
	belongs_to :user
	has_many :disks, dependent: :destroy

	validates :name, :os, presence: true

	validates :memory, numericality: { greater_than_or_equal_to: 0 }, presence: true
	validates :cores, numericality: { greater_than_or_equal_to: 0  }, presence: true

end
