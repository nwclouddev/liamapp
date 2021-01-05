class AddObjTypeToEqpProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :eqp_profiles, :obj_type, :string
  end
end
