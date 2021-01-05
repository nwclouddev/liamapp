class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :eqp_object, null: false, foreign_key: true
      t.string :description
      t.references :event_type, null: false, foreign_key: true
      t.references :event_status, null: false, foreign_key: true
      t.references :event_priority, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :sched_start_date
      t.date :sched_end_date
      t.decimal :labor_hours
      t.decimal :estimated_hours
      t.integer :pm_schedule_id
      t.date :due_date
      t.date :date_completed
      t.boolean :reopened
      t.integer :completed_by_id
      t.integer :event_eqp_group_id
      t.integer :event_problem_id
      t.integer :event_failure_id
      t.integer :event_component_id
      t.integer :event_owner
      t.integer :assigned_to
      t.decimal :downtime_hours
      t.string :scheduling_block

      t.timestamps
    end
  end
end
