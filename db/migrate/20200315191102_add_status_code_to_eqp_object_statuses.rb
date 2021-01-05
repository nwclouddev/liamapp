class AddStatusCodeToEqpObjectStatuses < ActiveRecord::Migration[6.0]
  def change
    add_column :eqp_object_statuses, :status_code, :string, :limit => 2, :uniqueness => true
  end
end
