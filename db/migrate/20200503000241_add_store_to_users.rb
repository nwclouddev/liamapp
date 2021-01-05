class AddStoreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :store, null: false, foreign_key: true, default: 1
  end
end
