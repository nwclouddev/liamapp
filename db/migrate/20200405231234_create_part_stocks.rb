class CreatePartStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :part_stocks do |t|
      t.belongs_to :part, null: false, foreign_key: true
      t.belongs_to :organization, null: false, foreign_key: true
      t.belongs_to :store, null: false, foreign_key: true
      t.belongs_to :bin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
