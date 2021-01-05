class CreateFunctionalAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :functional_areas do |t|
      t.string :code
      t.boolean :not_used

      t.timestamps
    end
    add_index :functional_areas, :code, unique: true
  end
end
