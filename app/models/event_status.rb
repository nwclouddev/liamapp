class EventStatus < ApplicationRecord
  belongs_to :work_order, optional: true
  validates :seq, uniqueness: true
end
