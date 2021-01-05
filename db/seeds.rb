# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if EqpObjectCriticality.count == 0
  EqpObjectCriticality.create(seq: 10, description: "1 - CE Risk > 1250 with 15 min - If down", not_used: false)
  EqpObjectCriticality.create(seq: 20, description: "2 - CE Risk < 1250 with 15 min - If down", not_used: false)
  EqpObjectCriticality.create(seq: 30, description: "3 - Sustainable with safe work around - If down", not_used: false)
end

if EqpObjectStatus.count == 0
  EqpObjectStatus.create(seq: 10, description: "Awaiting IOQ", active_on_create: true, not_used: false)
  EqpObjectStatus.create(seq: 20, description: "In Service", active_on_create: false, not_used: false)
  EqpObjectStatus.create(seq: 30, description: "Withdrawn", active_on_create: false, not_used: false)
end

if EventStatus.count == 0
  EventStatus.create(seq:10, description: "Awaiting Assessment", active_on_create: true, active_on_update: true, not_used: false)
  EventStatus.create(seq:20, description: "Open", active_on_create: true, active_on_update: true, not_used: false)
  EventStatus.create(seq:30, description: "Scheduled", active_on_create: false, active_on_update: true, not_used: false)
  EventStatus.create(seq:40, description: "On Hold", active_on_create: false, active_on_update: true, not_used: false)
  EventStatus.create(seq:50, description: "In Progress", active_on_create: false, active_on_update: true, not_used: false)
  EventStatus.create(seq:60, description: "Completed", active_on_create: false, active_on_update: true, not_used: false)
end

if EventPriority.count == 0
  EventPriority.create(seq: 10, description: "1 - Emergency/Immediate", not_used: false)
  EventPriority.create(seq: 20, description: "2 - Urgent/Less than 24 hours", not_used: false)
  EventPriority.create(seq: 30, description: "3 - Required within 24-48 hours", not_used: false)
  EventPriority.create(seq: 40, description: "4 - Productivity No Immediately Affected", not_used: false)
  EventPriority.create(seq: 50, description: "5 - Productivity Not Immediately Affected", not_used: false)
end 

if EventType.count == 0
  EventType.create(seq: 10, description: "Breakdown - Equipment is Not Running", user_createable: true, not_used: false)
  EventType.create(seq: 20, description: "Corrective - Not running at 100%, can be scheduled, and not found on a checklist", user_createable: true, not_used: false)
  EventType.create(seq: 30, description: "PM - Preventative Maintenance", user_createable: false, not_used: false)
  EventType.create(seq: 40, description: "PdM - Work using a Predictive Tool", user_createable: false, not_used: false)
  EventType.create(seq: 50, description: "Condition Based Monitoring", user_createable: false, not_used: true)
  EventType.create(seq: 60, description: "Project", user_createable: true, not_used: true)
end

if Organization.count == 0
  Organization.create(code: "*", description: "COMMON", not_used: false)
end  

if PartUom.count == 0
  PartUom.create(code: "EA", description: "Each", not_used: false)
  PartUom.create(code: "FT", description: "Linear Foot", not_used: false)
  PartUom.create(code: "IN", description: "Linear Inch", not_used: false)
end

if PeriodUom.count == 0
  PeriodUom.create(uom_int: 1, code: "Days", description: "Days")
  PeriodUom.create(uom_int: 7, code: "Weeks", description: "Weeks")
  PeriodUom.create(uom_int: 30, code: "Months", description: "Months")
  PeriodUom.create(uom_int: 365, code: "Years", description: "Years")
end

if StockCriticality.count == 0
  StockCriticality.create(seq: 10, code: "1", description: "01 HIGH" not_used: false)
  StockCriticality.create(seq: 20, code: "2", description: "02 MED" not_used: false)
  StockCriticality.create(seq: 30, code: "3", description: "03 LOW" not_used: false)
end

if User.count == 0
  User.create(name: "AMZ", email: "user@example.com", password: "123456", description: "SUPER USER", organization_id: 1)
  User.create(name: "System", email: "system@example.com", password: "123456", description: "SUPER USER", organization_id: 1)
end 

if PeriodUom.count == 0
  PeriodUom.create(uom_int: 1, description: "Days")
  PeriodUom.create(uom_int: 7, description: "Weeks")
  PeriodUom.create(uom_int: 30, description: "Months")
  PeriodUom.create(uom_int: 365, description: "Years")
end
