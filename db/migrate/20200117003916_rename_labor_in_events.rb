class RenameLaborInEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :labor_hours, :total_labor
  end
end
