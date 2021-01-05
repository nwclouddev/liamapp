class CreateStockCriticalities < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_criticalities do |t|
      t.integer :seq
      t.string :code
      t.string :description
      t.boolean :not_used

      t.timestamps
    end
    add_index :stock_criticalities, :seq, unique: true
    add_index :stock_criticalities, :code, unique: true
  end
end
