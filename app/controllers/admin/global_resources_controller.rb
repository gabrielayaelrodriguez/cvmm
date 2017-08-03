class Admin::GlobalResourcesController < Admin::BaseController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_global_resource, only: [:show, :edit, :update, :destroy]


  def index
  end

  # GET /global_resources/1
  # GET /global_resources/1.json
  def show
  end

  # GET /global_resources/new
  def new
  end

  # GET /global_resources/1/edit
  def edit
  end

  # POST /global_resources
  # POST /global_resources.json
  def create
  end

  # PATCH/PUT /global_resources/1
  # PATCH/PUT /global_resources/1.json
  def update
    #if @global_resource.update(global_resource_params)
    #  flash[:notice] = 'Successfully checked in'
    #  redirect_to admin_global_resource_path
    #else
    #  render :action => :edit
    #end
    respond_to do |format|
      if @global_resource.update(global_resource_params)
        format.html { redirect_to admin_global_resource_path, notice: t('.success') }
        format.json { render :index, status: :ok, location: @global_resource }
      else
        format.html { render :edit }
        format.json { render json: @global_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_resource
      @global_resource = GlobalResource.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def global_resource_params
      params.require(:global_resource).permit(:totalRAM, :totalDiskSpace, :totalCPUCores)
    end
end
