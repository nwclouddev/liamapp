class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :description
      t.belongs_to :part_class, null: false, foreign_key: true
      t.belongs_to :part_uom, null: false, foreign_key: true
      t.boolean :not_used

      t.timestamps
    end
    add_index :parts, :code, unique: true
  end
end
