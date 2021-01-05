class PmSchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pm_schedule, only: [:show, :edit, :update, :destroy]

  # GET /pm_schedules
  # GET /pm_schedules.json
  def index
    respond_to do |format|
      format.html { 
        @pm_schedules = PmSchedule.page(params[:page]).order(:code, :not_used).includes(:eqp_profile, :period_uom)
        render :index 
      }
    end
  end

  # GET /pm_schedules/1
  # GET /pm_schedules/1.json
  def show
  end

  # GET /pm_schedules/new
  def new
    @pm_schedule = PmSchedule.new
  end

  # GET /pm_schedules/1/edit
  def edit
    @pm_schedule_eqp_objects = PmScheduleEqpObject.where(pm_schedule_id: @pm_schedule.id).page(params[:page]).includes(:pm_schedule, :eqp_object)
  end

  # POST /pm_schedules
  # POST /pm_schedules.json
  def create
    @pm_schedule = PmSchedule.new(pm_schedule_params)

    respond_to do |format|
      if @pm_schedule.save
        format.html { redirect_to edit_pm_schedule_path(@pm_schedule), notice: 'Pm schedule was successfully created.' }
        format.json { render :show, status: :created, location: @pm_schedule }
      else
        format.html { render :new }
        format.json { render json: @pm_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pm_schedules/1
  # PATCH/PUT /pm_schedules/1.json
  def update
    respond_to do |format|
      if @pm_schedule.update(pm_schedule_params)
        format.html { redirect_to edit_pm_schedule_path(@pm_schedule), notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @pm_schedule }
      else
        format.html { render :edit }
        format.json { render json: @pm_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pm_schedules/1
  # DELETE /pm_schedules/1.json
  def destroy
    @pm_schedule.destroy
    respond_to do |format|
      format.html { redirect_to pm_schedules_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    count = PmSchedule.import(params[:file])
    redirect_to pm_schedules_path, notice: "Imported #{count} PM Schedules"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pm_schedule
      @pm_schedule = PmSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pm_schedule_params
      params.require(:pm_schedule).permit(:code, :description, :frequency, :period_uom, :trade, :est_hours, :persons_required, :not_used, :eqp_profile_id)
    end
end
