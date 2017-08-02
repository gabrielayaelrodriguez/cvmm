class Admin::DisksController < Admin::BaseController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_disk, only: [:show, :edit, :update, :destroy]

  def show
  end

  private

    def set_disk
      @disk=Disk.find(params[:id])
      @virtual_machine=VirtualMachine.find(@disk.virtual_machine_id)
    end

end
