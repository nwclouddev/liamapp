module EventsHelper
  def calculate_labor
    @event.labor_hours = 0
    @labor_hours = LaborEvent.where(labor_id: @event.id).each do |labor_hours|
      @event.labor_hours += labor_hours.labor_hours
      @event.save
    end  
  end
end
