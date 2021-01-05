class CreateEventTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_types do |t|
      t.integer :seq
      t.string :description
      t.boolean :user_createable
      t.boolean :not_used

      t.timestamps
    end
    add_index :event_types, :seq, unique: true
  end
end
