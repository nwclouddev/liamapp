class AddLaborableTypeToLaborHours < ActiveRecord::Migration[6.0]
  def change
    add_column :labor_hours, :laborable_type, :string
  end
end
