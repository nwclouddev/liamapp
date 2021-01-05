class Event < ApplicationRecord
  belongs_to :organization
  belongs_to :eqp_object
  belongs_to :event_type
  belongs_to :event_status
  belongs_to :event_priority
  belongs_to :user
  belongs_to :event_component, optional: true
  belongs_to :event_failure, optional: true
  belongs_to :event_problem, optional: true
  belongs_to :event_eqp_group, optional: true
  belongs_to :pm_schedule, optional: true

  has_many :comments, as: :commentable
  has_many :labor_hours, as: :laborable
end
