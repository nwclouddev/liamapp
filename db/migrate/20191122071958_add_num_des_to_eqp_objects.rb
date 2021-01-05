class AddNumDesToEqpObjects < ActiveRecord::Migration[6.0]
  def change
    add_column :eqp_objects, :num_des, :string
  end
end
