class CreatePmSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :pm_schedules do |t|
      t.string :code
      t.string :description
      t.integer :frequency
      t.string :period_uom
      t.boolean :not_used
      t.float :est_hours
      t.integer :persons_required
      t.string :trade

      t.timestamps
    end
    add_index :pm_schedules, :code, unique: true
  end
end
