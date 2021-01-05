class CreateEventProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :event_problems do |t|
      t.string :code
      t.string :description
      t.boolean :not_used

      t.timestamps
    end
    add_index :event_problems, :code, unique: true
  end
end
