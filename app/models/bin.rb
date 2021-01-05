class Bin < ApplicationRecord
  belongs_to :store
  
  has_many :store_parts
end
