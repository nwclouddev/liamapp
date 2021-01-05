class CreatePeriodUoms < ActiveRecord::Migration[6.0]
  def change
    create_table :period_uoms do |t|
      t.integer :uom_int
      t.string :description

      t.timestamps
    end
    add_index :period_uoms, :uom_int, unique: true
  end
end
