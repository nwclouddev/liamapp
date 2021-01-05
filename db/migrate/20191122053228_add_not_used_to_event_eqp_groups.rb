class AddNotUsedToEventEqpGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :event_eqp_groups, :not_used, :boolean
  end
end
