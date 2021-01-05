class CreateSupplierParts < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_parts do |t|
      t.belongs_to :part, null: false, foreign_key: true
      t.belongs_to :supplier, null: false, foreign_key: true
      t.string :supplier_part_num

      t.timestamps
    end
  end
end
