class CreatePmScheduleEqpObjects < ActiveRecord::Migration[6.0]
  def change
    create_table :pm_schedule_eqp_objects do |t|
      t.references :pm_schedule, null: false, foreign_key: true
      t.references :eqp_object, null: false, foreign_key: true
      t.date :due_date
      t.decimal :est_hours
      t.integer :eqp_object_org_id

      t.timestamps
    end
  end
end
