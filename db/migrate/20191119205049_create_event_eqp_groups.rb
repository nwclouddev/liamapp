class CreateEventEqpGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :event_eqp_groups do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
    add_index :event_eqp_groups, :code, unique: true
  end
end
