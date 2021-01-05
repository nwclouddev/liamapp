class AddOrganizationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :organization, null: false, foreign_key: true, default: 3
  end
end
