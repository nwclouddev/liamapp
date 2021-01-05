class AddDescriptionToFunctionalAreas < ActiveRecord::Migration[6.0]
  def change
    add_column :functional_areas, :description, :string, null: false
  end
end
