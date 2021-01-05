class Part < ApplicationRecord
  belongs_to :part_class
  belongs_to :part_uom
  has_many :manufact_parts, dependent: :destroy
  has_many :supplier_parts, dependent: :destroy

  has_many :store_parts
  has_many :stores, through: :store_parts
  accepts_nested_attributes_for :store_parts

  accepts_nested_attributes_for :manufact_parts, allow_destroy: true, reject_if: proc { |attr| attr['manufact_part_num'].blank? }
  accepts_nested_attributes_for :supplier_parts, allow_destroy: true, reject_if: proc { |attr| attr['supplier_part_num'].blank? }

  def expanded_desc
    expanded_desc = "#{id} - #{description}"
  end

end
