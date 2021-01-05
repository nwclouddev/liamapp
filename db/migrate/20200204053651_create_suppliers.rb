class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :code
      t.string :description
      t.boolean :not_used

      t.timestamps
    end
  end
end
