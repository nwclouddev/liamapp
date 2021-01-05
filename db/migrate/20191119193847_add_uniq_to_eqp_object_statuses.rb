class AddUniqToEqpObjectStatuses < ActiveRecord::Migration[6.0]
  def change
    add_index :eqp_object_statuses, [:seq, :description], :unique => true
  end
end
