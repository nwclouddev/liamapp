class CreateEventComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :event_components do |t|
      t.string :code
      t.string :description
      t.boolean :not_used

      t.timestamps
    end
    add_index :event_components, :code, unique: true
  end
end
