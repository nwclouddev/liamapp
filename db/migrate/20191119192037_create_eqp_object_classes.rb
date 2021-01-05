class CreateEqpObjectClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :eqp_object_classes do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
