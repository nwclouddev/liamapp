class AddOrganizationToEqpObjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :eqp_objects, :organization, null: false, foreign_key: true
  end
end
