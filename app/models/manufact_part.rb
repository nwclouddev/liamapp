class ManufactPart < ApplicationRecord
  belongs_to :part
  belongs_to :manufacturer
end
