class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :code
      t.string :description, null: false
      t.belongs_to :organization, null: false, foreign_key: true
      t.boolean :not_used, default: false

      t.timestamps
    end
    add_index :stores, :code, unique: true
  end
end
