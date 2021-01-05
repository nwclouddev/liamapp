class PurchaseOrder < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :store
  
  validates :description, presence: true
end
