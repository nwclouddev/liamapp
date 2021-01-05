class AddPeriodUomIdColumnToPmSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :pm_schedules, :period_uom_id, :integer
  end
end
