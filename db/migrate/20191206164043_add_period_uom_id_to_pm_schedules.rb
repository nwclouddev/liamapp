class AddPeriodUomIdToPmSchedules < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :pm_schedules, :period_uoms, null: false
  end
end
