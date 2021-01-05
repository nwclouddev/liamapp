json.array! @pm_events do |pm_event|
  json.id pm_event.id
  json.title "#{pm_event.pm_schedule.frequency}#{pm_event.pm_schedule.period_uom.code}"
  json.resourceId pm_event.id
  json.start pm_event.due_date
  json.backgroundColor 'green'
  json.textColor 'white'
  json.id pm_event.id
  json.eqp_object pm_event.eqp_object.code
  json.pm_schedule pm_event.pm_schedule.code
  json.organization pm_event.eqp_object.organization.code
  json.est_hrs pm_event.pm_schedule.est_hours
end