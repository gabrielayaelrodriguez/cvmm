class Users::VirtualMachinesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :except => [:create]
  before_action :findparent
  before_action :set_users_virtual_machine, only: [:show, :edit, :update, :destroy]
  
  

  # GET /users/virtual_machines
  # GET /users/virtual_machines.json
  def index
    @users_virtual_machines = Users::VirtualMachine.all
  end

  # GET /users/virtual_machines/1
  # GET /users/virtual_machines/1.json
  def show
  end

  # GET /users/virtual_machines/new
  def new
    @users_virtual_machine = Users::VirtualMachine.new
  end

  # GET /users/virtual_machines/1/edit
  def edit
  end

  # POST /users/virtual_machines
  # POST /users/virtual_machines.json
  def create
    @users_virtual_machine = Users::VirtualMachine.new(users_virtual_machine_params)
    @users_virtual_machine.user_id=@user.id

    respond_to do |format|
      if @users_virtual_machine.save
        format.html { redirect_to @users_virtual_machine, notice: 'Virtual machine was successfully created.' }
        format.json { render :show, status: :created, location: @users_virtual_machine }
      else
        format.html { render :new }
        format.json { render json: @users_virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/virtual_machines/1
  # PATCH/PUT /users/virtual_machines/1.json
  def update
    respond_to do |format|
      if @users_virtual_machine.update(users_virtual_machine_params)
        format.html { redirect_to @users_virtual_machine, notice: 'Virtual machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_virtual_machine }
      else
        format.html { render :edit }
        format.json { render json: @users_virtual_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/virtual_machines/1
  # DELETE /users/virtual_machines/1.json
  def destroy
    @users_virtual_machine.destroy
    respond_to do |format|
      format.html { redirect_to users_virtual_machines_url, notice: 'Virtual machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_virtual_machine
      @users_virtual_machine = Users::VirtualMachine.find(params[:id])
    end

    def findparent
      user=current_user.id
      @user = User.find(user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_virtual_machine_params
      params.require(:users_virtual_machine).permit(:state)
    end
end
