class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :code
      t.string :description
      t.boolean :not_used
      t.date :go_live_date
      t.date :pm_start_date
      t.integer :pm_generation_lead_time

      t.timestamps
    end
    add_index :organizations, :code, unique: true
  end
end
