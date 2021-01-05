namespace :add_eqp_to_pms do

  desc "Import Equipment Classes from csv"
  task pm_schedule_eqp_objects: :environment do
    @eqp_objects = EqpObject.all
    @eqp_objects.each do |eqp_object|
      if PmScheduleEqpObject.find_by(eqp_object_id: eqp_object.id).present?
        puts "Equipment already added to PM schedules"
      else
        @profile_pm_schedules = PmSchedule.where(eqp_profile_id: eqp_object.eqp_profile_id)
        @profile_pm_schedules.each do |profile_pm_schedule|
          @pm_schedule_eqp_object = PmScheduleEqpObject.new
          @pm_schedule_eqp_object.eqp_object_id = eqp_object.id
          @pm_schedule_eqp_object.pm_schedule_id = profile_pm_schedule.id
          @pm_schedule_eqp_object.due_date = Date.today + 120 #need to write method to convert UOM to days
          @pm_schedule_eqp_object.save
        end
      end
    end
  end
end