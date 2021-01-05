class AddLaborableIdToLaborHours < ActiveRecord::Migration[6.0]
  def change
    add_column :labor_hours, :laborable_id, :integer
    remove_column :labor_hours, :event_id
  end
end
