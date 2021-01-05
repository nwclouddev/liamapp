class CreateEventStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :event_statuses do |t|
      t.integer :seq
      t.string :description
      t.boolean :active_event
      t.boolean :active_on_create
      t.boolean :active_on_update
      t.boolean :not_used

      t.timestamps
    end
    add_index :event_statuses, :seq, unique: true
  end
end
