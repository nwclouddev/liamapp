class AddStatusCodeToEqpObjects < ActiveRecord::Migration[6.0]
  def change
    add_column :eqp_objects, :status_code, :string, :limit => 2
  end
end
