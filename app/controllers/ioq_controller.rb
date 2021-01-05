class IoqController < ApplicationController
  before_action :authenticate_user!
  before_action :set_eqp_object, only: [:show, :edit, :update, :destroy]
  def index
    if current_user.organization.code == "*"
      @ioq_objects = EqpObject.all.page(params[:page]).includes(:eqp_object_class,
                                                                :eqp_object_category,
                                                                :eqp_object_criticality, 
                                                                :eqp_object_status, :organization).order(:code)       
    else
      @ioq_objects = EqpObject.where(organization_id: current_user.organization_id).page(params[:page]).includes(:eqp_object_class,
                                                                                                                  :eqp_object_category, 
                                                                                                                  :eqp_object_criticality, 
                                                                                                                  :eqp_object_status, 
                                                                                                                  :organization).order(:code) 
    end
    respond_to do |format|
      format.html { render :index }
      format.json { render json: UsersDatatable.new(view_context) }
    end
  end

  # GET /eqp_objects/1
  # GET /eqp_objects/1.json
  def show
  end

  # GET /eqp_objects/new
  def new
    @eqp_object = EqpObject.new
    @eqp_object_categories = EqpObjectCategory.active
    @eqp_profiles = EqpProfile.where(obj_type: 'A').includes(:eqp_object_category)
  end

  # GET /eqp_objects/1/edit
  def edit
    @eqp_object_categories = EqpObjectCategory.active
    @pm_schedule_eqp_objects = PmScheduleEqpObject.where(eqp_object_id: @eqp_object.id)
  end

  # POST /eqp_objects
  # POST /eqp_objects.json
  def create
    @eqp_object_categories = EqpObjectCategory.active
    @eqp_object = EqpObject.new(eqp_object_params)
    respond_to do |format|
      if @eqp_object.save
        format.html { redirect_to new_ioq_path, notice: 'Asset was successfully added.' }
        format.json { render :show, status: :created, location: @eqp_object }
      else
        format.html { render :new }
        format.json { render json: @eqp_object.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @eqp_object.update(eqp_object_params)
        format.html {
          redirect_to edit_ioq_path(@eqp_object), notice: 'Asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @eqp_object }
      else
        format.html { render :edit }
        format.json { render json: @eqp_object.errors, status: :unprocessable_entity }
      end
    end
  end  

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_eqp_object
    @eqp_object = EqpObject.find(params[:id])
    @eqp_profiles = EqpProfile.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def eqp_object_params
    params.require(:eqp_object).permit(:code, :description, :alias, :commission_date,
                                      :manufact, :manufact_model, :revision,
                                      :profile_to_apply, :not_used, :eqp_object_category_id,
                                      :eqp_object_status_id, :eqp_object_criticality_id,
                                      :organization_id, :eqp_profile_id, :functional_area_id, :lane_type_id, 
                                      :num_des)
  end
end