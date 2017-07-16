class DisksController < ApplicationController
  before_action :authenticate_user!
  #load_and_authorize_resource :virtual_machine
  #load_and_authorize_resource :through => :virtual_machine
  

  before_action :findparents
  before_action :set_disk, only: [:show, :edit, :update, :destroy]

  #load_and_authorize_resource :virtual_machine
  #load_and_authorize_resource :through => :virtual_machine

  # GET /disks
  # GET /disks.json
  #def index
  #  @disks = Disk.all
  #end

  # GET /disks/1
  # GET /disks/1.json
  def show
    #afdasd
    authorize! :read, @virtual_machine
  end

  # GET /disks/new
  def new
    authorize! :update, @user
    @disk = Disk.new
  end

  # GET /disks/1/edit
  def edit
    authorize! :update, @virtual_machine
  end

  # POST /disks
  # POST /disks.json
  def create
    authorize! :update, @user
    @disk = Disk.new(disk_params)
    @disk.virtual_machine=@virtual_machine

    if !(errors)
      respond_to do |format|
        if @disk.save
          format.html { redirect_to user_virtual_machine_path(@user, @virtual_machine), notice: 'Disk was successfully created.' }
          format.json { render :show, status: :created, location: @disk }
        else
          format.html { render :new }
          format.json { render json: @disk.errors, status: :unprocessable_entity }
        end
      end
    else
      render :new
    end
  end

  # PATCH/PUT /disks/1
  # PATCH/PUT /disks/1.json
  def update
    authorize! :update, @virtual_machine
    if !(errors)
      respond_to do |format|
        if @disk.update(disk_params)
          format.html { redirect_to user_virtual_machine_path(@user, @virtual_machine), notice: 'Disk was successfully updated.' }
          format.json { render :show, status: :ok, location: @disk }
        else
          format.html { render :edit }
          format.json { render json: @disk.errors, status: :unprocessable_entity }
        end
      end
    else
      render :edit
    end
  end

  # DELETE /disks/1
  # DELETE /disks/1.json
  def destroy
    authorize! :destroy, @virtual_machine
    @disk.destroy
    respond_to do |format|
      format.html { redirect_to user_virtual_machine_path(@user, @virtual_machine), notice: 'Disk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disk
      if current_user.admin?
        @disk=Disk.find(params[:id])
        @virtual_machine=VirtualMachine.find(@disk.virtual_machine_id)
        @user=User.find(@virtual_machine.user_id)
      else
        @user = User.find(params[:user_id])
        @virtual_machine = @user.virtual_machines.find(params[:virtual_machine_id])
        @disk = @virtual_machine.disks.find(params[:id])
        @space = @disk.capacity + @global_resource.freeDiskSpace
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disk_params
      params.require(:disk).permit(:label, :model, :capacity)
    end

    def findparents
      #if current_user.admin?
      #  authorize! :create, @virtual_machine
      #else
        @user = User.find(params[:user_id])
        @virtual_machine = @user.virtual_machines.find(params[:virtual_machine_id])
        @global_resource = GlobalResource.first
        @space = @global_resource.freeDiskSpace
      #end
    end

    def errors
      error = false
      if params[:disk][:capacity].to_i > @space
        @disk.errors.add(:capacity, "Must be less than #{@space}")
        error = true
      end
      return error

    end
end
