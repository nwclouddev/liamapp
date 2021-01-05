class AddCodeToPeriodUoms < ActiveRecord::Migration[6.0]
  def change
    add_column :period_uoms, :code, :string
  end
end
