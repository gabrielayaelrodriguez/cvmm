class Admin::VirtualMachinesController < ApplicationController
  

  #load_and_authorize_resource :user
  #load_and_authorize_resource :through => :user

  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_virtual_machine, only: [:show, :edit, :update, :destroy]


  def index
    @virtual_machines = VirtualMachine.all
  end

  def show
  end

  # DELETE /virtual_machines/1
  # DELETE /virtual_machines/1.json
  def destroy
    @virtual_machine.destroy
    respond_to do |format|
      format.html { redirect_to admin_virtual_machines_path, notice: 'Virtual machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_machine
      @virtual_machine = VirtualMachine.find(params[:id])
    end

end
