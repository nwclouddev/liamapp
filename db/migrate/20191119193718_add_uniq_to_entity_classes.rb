class AddUniqToEntityClasses < ActiveRecord::Migration[6.0]
  def change
    add_index :eqp_object_classes, :code, :unique => true
  end
end
