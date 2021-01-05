class CreateEqpObjects < ActiveRecord::Migration[6.0]
  def change
    create_table :eqp_objects do |t|
      t.string :code
      t.string :description
      t.string :alias
      t.date :commission_date
      t.string :manufact
      t.string :manufact_model
      t.string :revision
      t.references :eqp_profile, null: false, foreign_key: true
      t.string :profile_applied
      t.boolean :not_used
      t.references :eqp_object_class, null: false, foreign_key: true
      t.references :eqp_object_category, null: false, foreign_key: true
      t.references :eqp_object_status, null: false, foreign_key: true
      t.references :eqp_object_criticality, null: false, foreign_key: true
      t.references :functional_area, null: true, foreign_key: true
      t.references :lane_type, null: true, foreign_key: true
      
      t.timestamps
    end
    add_index :eqp_objects, :code, unique: true
  end
end
