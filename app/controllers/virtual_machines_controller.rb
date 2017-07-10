class VirtualMachinesController < ApplicationController
  load_and_authorize_resource :except => [:create], :through => :current_user
  before_action :authenticate_user!
  before_action :findparent
  before_action :set_virtual_machine, only: [:show, :edit, :update, :destroy]

  # GET /virtual_machines
  # GET /virtual_machines.json
  def index
    @virtual_machines = @user.virtual_machines.all
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
    
    @virtual_machine = VirtualMachine.new(require_params)
    @virtual_machine.user=@user
    #@user.virtual_machines.new(require_params)

    respond_to do |format|
      if @virtual_machine.save
        format.html { redirect_to @virtual_machine, notice: 'Virtual machine was successfully created.' }
        format.json { render :show, status: :created, location: @virtual_machine }
      else
        format.html { render :new }
        format.json { render json: @virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_machines/1
  # PATCH/PUT /virtual_machines/1.json
  def update
    respond_to do |format|
      if @virtual_machine.update(require_params)
        format.html { redirect_to @virtual_machine, notice: 'Virtual machine was successfully updated.' }
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
    @virtual_machine.destroy
    respond_to do |format|
      format.html { redirect_to user_virtual_machines_path, notice: 'Virtual machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_machine
      @virtual_machine = @user.virtual_machines.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def require_params
      params.require(:virtual_machine).permit(:state)
    end

    def findparent
      @user = User.find(params[:user_id])
    end
end
