class User::VirtualMachinesController < User::BaseController
  
  before_action :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :create]

  before_action :set_search

  before_action :find_parent
  before_action :set_limits_create, only: [:new]

  before_action :set_virtual_machine, only: [:show, :edit, :update, :destroy]
  before_action :set_limits_edit, only: [:edit]

  # GET /virtual_machines
  # GET /virtual_machines.json
  def index
    @virtual_machines = current_user.virtual_machines.search(params[:q]).result.page(params[:page])
  end

  # GET /virtual_machines/1
  # GET /virtual_machines/1.json
  def show
  end

  # GET /virtual_machines/new
  def new
    @virtual_machine = VirtualMachine.new
  end

  # GET /virtual_machines/1/edit
  def edit 
  end

  # POST /virtual_machines
  # POST /virtual_machines.json
  def create
    @virtual_machine = VirtualMachine.new(virtual_machine_params)
    @virtual_machine.user=@user
    #@user.virtual_machines.new(require_params)

   respond_to do |format|
      if @virtual_machine.save
        #redirect_to user_virtual_machines_path(@virtual_machine)
        format.html { redirect_to user_virtual_machine_path(@virtual_machine), notice: 'Virtual machine was successfully created.' }
        format.json { render :show, status: :created, location: @virtual_machine }
      else
        #render :new
        format.html { render :new }
        format.json { render json: @virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_machines/1
  # PATCH/PUT /virtual_machines/1.json
  def update
    #authorize! :update, @virtual_machine
    respond_to do |format|
      if @virtual_machine.update(virtual_machine_params)
        format.html { redirect_to user_virtual_machine_path(@virtual_machine), notice: 'Virtual machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @virtual_machine }
      else
        format.html { render :edit }
        format.json { render json: @virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_machines/1
  # DELETE /virtual_machines/1.json
  def destroy
    #authorize! :destroy, @virtual_machine
    @virtual_machine.destroy
    respond_to do |format|
      format.html { redirect_to user_virtual_machines_path, notice: 'Virtual machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_machine
      if current_user.admin?
        @virtual_machine = VirtualMachine.find(params[:id])
      else
        @virtual_machine = @user.virtual_machines.find(params[:id])
        #@ram = @global_resource.freeRAM + @virtual_machine.memory
        #@cores = @global_resource.freeCPUCores + @virtual_machine.cores
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def virtual_machine_params
      params.require(:virtual_machine).permit(:name, :state, :os, :memory, :cores)
    end

    def find_parent
      @user = current_user
    end

    def set_limits_create
      global_resource = GlobalResource.first
      @ram = global_resource.freeRAM
      @cores = global_resource.freeCPUCores
    end

    def set_limits_edit
      global_resource = GlobalResource.first
      @ram = global_resource.freeRAM + @virtual_machine.memory
      @cores = global_resource.freeCPUCores + @virtual_machine.cores
    end

    def set_search
      @search=VirtualMachine.search(params[:q])
    end

end
