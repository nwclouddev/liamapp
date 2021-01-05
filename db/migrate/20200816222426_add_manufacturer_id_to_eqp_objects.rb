class AddManufacturerIdToEqpObjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :eqp_objects, :manufacturer, null: true, foreign_key: true
  end
end
