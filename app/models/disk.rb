class Disk < ApplicationRecord
  belongs_to :virtual_machine

  validates :label, :model, presence: true

  validates :capacity, numericality: { greater_than_or_equal_to: 0 }, presence: true

  validate :check_space, :on => [:create, :update]

  def check_space
    available = GlobalResource.first.freeDiskSpace
    if Disk.exists?(id)then available=available+Disk.find(id).capacity end
    errors.add(:capacity, I18n.t("disk_errors.capacity_less_or_equal_to", :available=> available)) if capacity && capacity > available
  end
end
