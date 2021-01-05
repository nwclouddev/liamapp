class AddUniqToEqpProfiles < ActiveRecord::Migration[6.0]
  def change
    add_index :eqp_profiles, :code, :unique => true
  end
end
