class VirtualMachine < ApplicationRecord
	belongs_to :user
	has_many :disks, dependent: :destroy
end
