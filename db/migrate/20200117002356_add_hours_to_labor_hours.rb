class AddHoursToLaborHours < ActiveRecord::Migration[6.0]
  def change
    add_column :labor_hours, :hours, :decimal
  end
end
