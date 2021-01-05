class CreatePartClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :part_classes do |t|
      t.string :code
      t.boolean :not_used

      t.timestamps
    end
    add_index :part_classes, :code, unique: true
  end
end
