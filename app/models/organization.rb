class Organization < ApplicationRecord
  has_many :users
  has_many :events
  has_many :eqp_objects
  
  validates :code, uniqueness: true
  validates :description, presence: :true
end
