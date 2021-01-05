class AddUniqToEqpObjectCriticalities < ActiveRecord::Migration[6.0]
  def change
    add_index :eqp_object_criticalities, [:seq, :description], :unique => true
  end
end
