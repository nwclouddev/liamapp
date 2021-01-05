class Events::LaborHoursController < LaborHoursController
  before_action :set_laborable
  before_action :set_event_labor_hour

  def create
    @labor_hour = @laborable.labor_hours.create labor_hour_params
    @labor_hour.user = current_user
    if @labor_hour.save
      redirect_to edit_event_path(@laborable), notice: "Labor saved successfully"
    end
  end


  private

    def set_event_labor_hour
      @event_labor_hour = LaborHour.find_by(laborable_type: 'Event', laborable_id: :event_id)
    end  

    def set_laborable
      @laborable = Event.find(params[:event_id])
    end

    def labor_hour_params
      params.require(:labor_hour).permit(:user_id, :hours, :date_worked, :description)
    end
end