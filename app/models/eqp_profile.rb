class EqpProfile < ApplicationRecord
  belongs_to :eqp_object_class
  belongs_to :eqp_object_category
  belongs_to :eqp_object_status
  belongs_to :eqp_object_criticality
  belongs_to :manufacturer
  has_many :pm_schedules

  def expanded_desc
    expanded_desc = "#{code} - #{description}"
  end

  def self.select_values(eqp_object_category)
    return [] unless eqp_object_category
    eqp_object_category.eqp_profiles.pluck(:code, :id)
  end
  
  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      eqp_profile = EqpProfile.assign_from_row(row)
      if eqp_profile.save
        counter += 1
      else
        puts "#{eqp_profile.code} - #{eqp_profile.errors.full_messages.join(", ")}"
      end  
    end
    counter
  end
  
  def self.assign_from_row(row)
    eqp_profile = EqpProfile.where(code: row[:code]).first_or_initialize
    eqp_profile.assign_attributes row.to_hash.slice(:description, :manufact, :manufact_model, :not_used, :eqp_object_class_id, :eqp_object_category_id, :eqp_object_status_id, :eqp_object_criticality_id)
    eqp_profile
  end
end
