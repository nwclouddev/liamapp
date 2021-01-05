class Store < ApplicationRecord
  belongs_to :organization
  
  has_many :store_parts
  has_many :parts, through: :store_parts
  accepts_nested_attributes_for :store_parts
  
  validates :code, uniqueness: true
  validates :description, presence: true
end
