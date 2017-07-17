class User::DisksController < User::BaseController
  before_action :authenticate_user!
  load_and_authorize_resource :virtual_machine
  #load_and_authorize_resource :virtual_machine, :through => :current_user
  #load_and_authorize_resource :through => :virtual_machine
  
  before_action :findparent
  before_action :set_limits_create, only: [:new]
  before_action :set_disk, only: [:show, :edit, :update, :destroy]
  before_action :set_limits_edit, only: [:edit]

  # GET /disks
  # GET /disks.json
  #def index
  #  @disks = Disk.all
  #end

  # GET /disks/1
  # GET /disks/1.json
  def show
  end

  # GET /disks/new
  def new
    @disk = Disk.new
  end

  # GET /disks/1/edit
  def edit
  end

  # POST /disks
  # POST /disks.json
  def create
    @disk = Disk.new(disk_params)
    @disk.virtual_machine=@virtual_machine
    respond_to do |format|
      if @disk.save
        format.html { redirect_to user_virtual_machine_path(@virtual_machine), notice: 'Disk was successfully created.' }
        format.json { render :show, status: :created, location: @disk }
      else
        format.html { render :new }
        format.json { render json: @disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disks/1
  # PATCH/PUT /disks/1.json
  def update
    authorize! :update, @virtual_machine
    respond_to do |format|
      if @disk.update(disk_params)
        format.html { redirect_to user_virtual_machine_path(@virtual_machine), notice: 'Disk was successfully updated.' }
        format.json { render :show, status: :ok, location: @disk }
      else
        format.html { render :edit }
        format.json { render json: @disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disks/1
  # DELETE /disks/1.json
  def destroy
    authorize! :destroy, @virtual_machine
    @disk.destroy
    respond_to do |format|
      format.html { redirect_to user_virtual_machine_path(@virtual_machine), notice: 'Disk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disk
      #if current_user.admin?
        #@disk=Disk.find(params[:id])
        #@virtual_machine=VirtualMachine.find(@disk.virtual_machine_id)
        #@user=User.find(@virtual_machine.user_id)
      #else
        #@user = User.find(params[:user_id])
        #@virtual_machine = @user.virtual_machines.find(params[:virtual_machine_id])
        @disk = @virtual_machine.disks.find(params[:id])
        #@global_resource = GlobalResource.first
        #@space = @disk.capacity + @global_resource.freeDiskSpace
      #end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disk_params
      params.require(:disk).permit(:label, :model, :capacity)
    end

    def findparent
           #if current_user.admin?
           #  authorize! :create, @virtual_machine
           #else
           #  @user = User.find(params[:user_id])
           #  if current_user.admin?
                @virtual_machine=VirtualMachine.find(params[:virtual_machine_id])
           # else
           #  @virtual_machine = @user.virtual_machines.find(params[:virtual_machine_id])
           #  end
           #end
         end

    def set_limits_create
      global_resource = GlobalResource.first
      @space = global_resource.freeDiskSpace
    end

    def set_limits_edit
      global_resource = GlobalResource.first
      @space = @disk.capacity + global_resource.freeDiskSpace
    end

end
