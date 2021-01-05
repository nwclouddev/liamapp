class CreateLaborHours < ActiveRecord::Migration[6.0]
  def change
    create_table :labor_hours do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_worked
      t.string :description
      t.references :event

      t.timestamps
    end
  end
end
