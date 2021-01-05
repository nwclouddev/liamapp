class CreateBins < ActiveRecord::Migration[6.0]
  def change
    create_table :bins do |t|
      t.string :code
      t.string :description
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
