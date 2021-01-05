class PmScheduleEqpObjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pm_schedule_eqp_object, only: [:show, :edit, :update, :destroy]

  def index
    @pm_schedule_eqp_objects = PmScheduleEqpObject.page(params[:page]).includes(:pm_schedule, :eqp_object, :period_uom).order(:eqp_object_id)
  end

  def pm_events
    @pm_events = PmScheduleEqpObject.where(due_date: Date.today..Date.today + 30).includes(:pm_schedule, :eqp_object, :period_uom, :organization)
  end
  
  def pm_resources
    @pm_resources = PmScheduleEqpObject.where(due_date: Date.today..Date.today+30).includes(:pm_schedule, :eqp_object, :period_uom)
  end 

  def forecast
  end

  def new
    @pm_schedule_eqp_object = PmScheduleEqpObject.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @pm_schedule_eqp_object = PmScheduleEqpObject.new(pm_schedule_params)
    @pm_schedule_eqp_object.organization_id = @pm_schedule_eqp_object.eqp_object.organization_id
    if @pm_schedule_eqp_object.save
      redirect_to edit_pm_schedule_eqp_object_path(@pm_schedule_eqp_object), notice: 'Pm schedule Equipment recordwas successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pm_schedules/1
  def update
    @pm_schedule_eqp_object.update(pm_schedule_eqp_object_params)
    redirect_to pm_schedule_eqp_objects_url
  end

  # DELETE /pm_schedules/1
  def destroy
    @pm_schedule_eqp_object.destroy
    redirect_to pm_schedule_eqp_objects_url, notice: 'Pm schedule Equipment record was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pm_schedule_eqp_object
      @pm_schedule_eqp_object = PmScheduleEqpObject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pm_schedule_eqp_object_params
      params.require(:pm_schedule_eqp_object).permit(:id, :pm_schedule_id, :eqp_object_id, :organization_id, :due_date)
    end
end
