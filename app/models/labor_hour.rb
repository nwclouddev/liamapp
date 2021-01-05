class LaborHour < ApplicationRecord
  belongs_to :user
  belongs_to :laborable, polymorphic: true
end
