class GlobalResourcesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_global_resource, only: [:show, :edit, :update, :destroy]

  # GET /global_resources
  # GET /global_resources.json
  def index
    #@global_resources = GlobalResource.all
  end

  # GET /global_resources/1
  # GET /global_resources/1.json
  def show
    #authorize! :read, @global_resource
  end

  # GET /global_resources/new
  def new
  end

  # GET /global_resources/1/edit
  def edit
    #authorize! :update, @global_resource
  end

  # POST /global_resources
  # POST /global_resources.json
  def create
  end

  # PATCH/PUT /global_resources/1
  # PATCH/PUT /global_resources/1.json
  def update
    #authorize! :update, @global_resource
    #respond_to do |format|

      if @global_resource.update(global_resource_params)
        redirect_to global_resource_path
        #format.html { redirect_to global_resource_path, notice: 'Global resource was successfully updated.' }
        #format.json { render :show, status: :ok }
      else
        render :action => :edit
        #format.html { redirect_to edit_global_resource_path }
        #format.json { render json: @global_resource.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /global_resources/1
  # DELETE /global_resources/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_resource
      @global_resource = GlobalResource.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def global_resource_params
      params.require(:global_resource).permit(:totalRAM, :totalUsableRAM, :totalDiskSpace, :totalUsableDiskSpace, :totalCPUCores, :totalUsableCPUCores)
    end
end
