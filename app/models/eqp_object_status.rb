class EqpObjectStatus < ApplicationRecord
  validates :status_code, uniqueness: true, presence: true
end
