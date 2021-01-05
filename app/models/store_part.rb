class StorePart < ApplicationRecord
  belongs_to :part
  belongs_to :store
  belongs_to :bin
  belongs_to :stock_criticality
  belongs_to :supplier

  validates :part, uniqueness: { 
    scope: [:part_id, :store_id],
    message: ->(object, data) do
      "#{object.part.id} has already been added to this store."
    end
   }

end
