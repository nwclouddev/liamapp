class CreateManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturers do |t|
      t.string :code
      t.string :description
      t.boolean :not_used
      t.string :preferred_supplier

      t.timestamps
    end
    add_index :manufacturers, :code, unique: true
  end
end
