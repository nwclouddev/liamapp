class CreateManufactParts < ActiveRecord::Migration[6.0]
  def change
    create_table :manufact_parts do |t|
      t.belongs_to :part, null: false, foreign_key: true
      t.belongs_to :manufacturer, null: false, foreign_key: true
      t.string :manufact_part_num

      t.timestamps
    end
  end
end
