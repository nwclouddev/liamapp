class CreateEventPriorities < ActiveRecord::Migration[6.0]
  def change
    create_table :event_priorities do |t|
      t.integer :seq
      t.string :description
      t.boolean :not_used

      t.timestamps
    end
    add_index :event_priorities, :seq, unique: true
  end
end
