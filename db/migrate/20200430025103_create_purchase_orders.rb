class CreatePurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_orders do |t|
      t.string :description
      t.belongs_to :organization, null: false, foreign_key: true
      t.date :due_date
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :purchase_order_status_id
      t.integer :supplier_id
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
