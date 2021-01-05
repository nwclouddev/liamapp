class CreateEqpObjectCriticalities < ActiveRecord::Migration[6.0]
  def change
    create_table :eqp_object_criticalities do |t|
      t.integer :seq
      t.string :description
      t.boolean :not_used

      t.timestamps
    end
  end
end
