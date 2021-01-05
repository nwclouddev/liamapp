class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if current_user.organization.code == "*"
      @events = Event.all.page(params[:page]).order(sched_start_date: :desc).includes(:eqp_object, :organization, :event_status, :event_type, :event_priority)
    else
      @events = Event.where(organization: current_user.organization).page(params[:page]).order(sched_start_date: :desc).includes(:eqp_object, :organization, :event_status, :event_type, :event_priority)
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.sched_start_date = Date.today
    @event.total_labor = 0
    @eqp_objects = EqpObject.all.collect
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    respond_to do |format|
      if @event.save
        format.html { redirect_to edit_event_path(@event), notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    # helpers.calculate_labor
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to edit_event_path(@event), notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_job_plan
    respond_to do |format|
      format.js {render layout: false} # Add this line to you respond_to block
      format.html
    end
    @events = Event.all
    @event = Event.new
  end

  def generate_wos
    @pm_schedule_eqp_objects = PmScheduleEqpObject.all
    @pm_events = Event.where.not(pm_code: nil)


  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:organization_id, :eqp_object_id, :description, :event_type_id, :event_status_id, 
                                    :event_priority_id, :user_id, :sched_start_date, :sched_end_date, :labor_hours, 
                                    :estimated_hours, :pm_code, :due_date, :date_completed, :reopened, :completed_by, 
                                    :evt_eqp_code_id, :evt_problem_code_id, :evt_failure_code_id, :evt_component_code_id, 
                                    :schedule_block, :event_failure_id, :event_problem_id, :event_component_id, 
                                    :downtime_hours, :event_owner, :event_eqp_group_id)
    end
end
