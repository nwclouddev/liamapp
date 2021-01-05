namespace :add_org do

  desc "Add orgs to PMSchedule EqpObjects"
  task add_org_to_pm_resources: :environment do
    Rails.logger = Logger.new(STDOUT)
    @pm_schedule_eqp_objects = PmScheduleEqpObject.where(eqp_object_org_id: nil)
    @pm_schedule_eqp_objects.each do |pm_schedule_eqp_object|
      pm_schedule_eqp_object.eqp_object_org_id = pm_schedule_eqp_object.eqp_object.organization_id
      pm_schedule_eqp_object.save
    end
  end
end
