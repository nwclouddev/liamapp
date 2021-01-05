class Supplier < ApplicationRecord
  has_many :parts

  validates :code, uniqueness: true
  validates :description, presence: true
end
