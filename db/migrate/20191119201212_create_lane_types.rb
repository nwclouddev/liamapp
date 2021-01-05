class CreateLaneTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :lane_types do |t|
      t.string :code
      t.boolean :not_used

      t.timestamps
    end
    add_index :lane_types, :code, unique: true
  end
end
