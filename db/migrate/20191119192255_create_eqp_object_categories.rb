class CreateEqpObjectCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :eqp_object_categories do |t|
      t.string :code
      t.string :description
      t.references :eqp_object_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
