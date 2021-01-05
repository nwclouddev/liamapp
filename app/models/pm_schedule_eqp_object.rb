class PmScheduleEqpObject < ApplicationRecord
  belongs_to :pm_schedule
  belongs_to :eqp_object
  belongs_to :period_uom, optional: true

  validates :due_date, presence: true
end
