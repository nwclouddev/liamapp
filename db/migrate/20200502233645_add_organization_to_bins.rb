class AddOrganizationToBins < ActiveRecord::Migration[6.0]
  def change
    add_reference :bins, :organization, null: false, foreign_key: true, default: 3
  end
end
