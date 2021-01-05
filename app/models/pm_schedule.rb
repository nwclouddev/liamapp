class PmSchedule < ApplicationRecord
  belongs_to :eqp_profile, optional: true
  belongs_to :period_uom
  has_many :pm_schedule_eqp_objects, dependent: :destroy
  has_many :eqp_objects, through: :pm_schedule_eqp_objects
  accepts_nested_attributes_for :pm_schedule_eqp_objects

  validates :code, uniqueness: true
  
  def expanded_desc
    expanded_desc = self.code + " - " + self.description
  end
 
  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      pm_schedule = PmSchedule.assign_from_row(row)
      if pm_schedule.save
        counter += 1
      else
        puts "#{pm_schedule.code} - #{pm_schedule.errors.full_messages.join(", ")}"
      end  
    end
    counter
  end
  
  def self.assign_from_row(row)
    pm_schedule = PmSchedule.where(code: row[:code]).first_or_initialize
    pm_schedule.assign_attributes row.to_hash.slice(:description, :frequency, :not_used, :est_hours, :persons_required, :trade, :eqp_profile_id, :period_uom_id)
    pm_schedule
  end
end
