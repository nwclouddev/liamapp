json.extract! pm_schedule, :id, :code, :description, :frequency, :period_uom, :not_used, :est_hours, :persons_required, :trade, :eqp_profile_id, :created_at, :updated_at
json.url pm_schedule_url(pm_schedule, format: :json)
