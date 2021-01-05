class CreateEqpProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :eqp_profiles do |t|
      t.string :code
      t.string :description
      t.string :manufact
      t.string :manufact_model
      t.boolean :not_used
      t.references :eqp_object_class, null: false, foreign_key: true
      t.references :eqp_object_category, null: false, foreign_key: true
      t.references :eqp_object_status, null: false, foreign_key: true
      t.references :eqp_object_criticality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
