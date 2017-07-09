class Users::VirtualMachine < ApplicationRecord

	belongs_to :user, :touch => true
end
