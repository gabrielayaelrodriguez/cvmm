class Admin::DisksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  #load_and_authorize_resource :through => :virtual_machine
  
  #before_action :findparents
  before_action :set_disk, only: [:show, :edit, :update, :destroy]

  # GET /disks
  # GET /disks.json
  #def index
  #  @disks = Disk.all
  #end

  # GET /disks/1
  # GET /disks/1.json
  def show
  end


  # DELETE /disks/1
  # DELETE /disks/1.json

  #def destroy
  #  authorize! :destroy, @virtual_machine
  #  @disk.destroy
  #  respond_to do |format|
  #    format.html { redirect_to user_virtual_machine_path(@user, @virtual_machine), notice: 'Disk was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private

    def set_disk
      @disk=Disk.find(params[:id])
      @virtual_machine=VirtualMachine.find(@disk.virtual_machine_id)
    end

end
