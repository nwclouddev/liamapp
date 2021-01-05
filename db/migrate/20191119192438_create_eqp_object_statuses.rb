class CreateEqpObjectStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :eqp_object_statuses do |t|
      t.integer :seq
      t.string :description
      t.boolean :active_on_create
      t.boolean :not_used

      t.timestamps
    end
  end
end
