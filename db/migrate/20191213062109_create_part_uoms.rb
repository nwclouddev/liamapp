class CreatePartUoms < ActiveRecord::Migration[6.0]
  def change
    create_table :part_uoms do |t|
      t.string :code
      t.string :description
      t.boolean :not_used

      t.timestamps
    end
    add_index :part_uoms, :code, unique: true
  end
end
