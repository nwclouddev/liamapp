class GeneratePmWosJob < ApplicationJob
  queue_as :generate_wos

  def perform
    ## Roll-forward due_dates in the past
    ## Will need to "un" hard-code generation lead time
    lead_time = 14.days
    
    def generate_the_wos
      lead_time = 14.days
      until PmScheduleEqpObject.where("due_date < ?", (Date.today + lead_time)).count == 0
        @pm_schedule_eqp_objects = PmScheduleEqpObject.where("due_date <= ?", (Date.today + lead_time))
        if @pm_schedule_eqp_objects.count == 0
          puts "No Work Orders to generate!!!"
        else
          @pm_schedules = PmSchedule.all

          @pm_schedule_eqp_objects.each do |pe|
            if Event.create(
                organization_id: pe.eqp_object.organization_id,
                eqp_object_id: pe.eqp_object_id,
                description: pe.pm_schedule.description,
                event_type_id: 4,
                event_status_id: 2,
                event_priority_id: 5,
                user_id: 3,
                sched_start_date: pe.due_date,
                sched_end_date: pe.due_date,
                pm_schedule_id: pe.pm_schedule_id,
                due_date: pe.due_date
              )
              pe.due_date = pe.due_date + (pe.pm_schedule.frequency * pe.pm_schedule.period_uom.uom_int)
              pe.save
            else
              print "Help!"
            end
          end
        end
      end
    end
    generate_the_wos
  end
end