class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :string
    add_column :users, :not_used, :boolean
    add_column :users, :permission_group_id, :integer
    add_column :users, :organization_id, :integer
  end
end
