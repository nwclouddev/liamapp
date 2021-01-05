class EqpObject < ApplicationRecord
  belongs_to :eqp_object_class
  belongs_to :eqp_object_category
  belongs_to :eqp_object_status
  belongs_to :eqp_object_criticality, optional: true
  belongs_to :organization
  belongs_to :eqp_profile, optional: true
  belongs_to :functional_area, optional: true
  belongs_to :lane_type, optional: true

  has_many :events, dependent: :destroy
  has_many :pm_schedule_eqp_objects, dependent: :destroy
  has_many :pm_schedules, through: :pm_schedule_eqp_objects

  accepts_nested_attributes_for :pm_schedule_eqp_objects
  accepts_nested_attributes_for :events

  validates :code, uniqueness: true
  validates :description, presence: true
  before_validation :update_profile_metadata
  before_validation :populate_eqp_object_class
  before_save :update_desc_attributes
  after_commit :add_object_to_pms, :on => :create
  after_commit :create_commission_event, :on => :create

  def populate_eqp_object_class
    self.eqp_object_class_id = self.eqp_object_category.eqp_object_class_id
  end


  def update_desc_attributes
    # add flattened status code to eqp object
    self.status_code = self.eqp_object_status.status_code

    # update formatted description
    eqp_class = self.eqp_object_class.code

    if (eqp_class = 'CONV' or eqp_class = 'CHUTE')
      if functional_area == nil
        func = '(Funct_des)'
      else
        func = functional_area.code
      end
      
      if lane_type == nil
        lane = '(Lane_des)'
      else
        lane = lane_type.code
      end

      if num_des == ''
        num = '(##)'
      else
        num = num_des
      end
      self.description = "#{func}; #{lane}; #{num}; #{self.alias}; #{eqp_object_category.description}"  
    end  
  end

  def update_profile_metadata
    @profile_to_apply = EqpProfile.find_by(manufact: self.manufact, manufact_model: self.manufact_model)
    # self.manufact = eqp_profile.manufacturer.code
    # self.manufact_model = eqp_profile.manufact_model
    # self.eqp_object_class_id = eqp_profile.eqp_object_class_id
    # self.eqp_object_category_id = eqp_profile.eqp_object_category_id
    # self.profile_applied = eqp_profile.code
    # self.eqp_object_criticality_id = eqp_profile.eqp_object_criticality_id
    # self.eqp_object_status_id = 1    
  end

  def add_object_to_pms
    # if 1 == 1
    #   @profile_pm_schedules = PmSchedule.where(eqp_profile_id: self.eqp_profile_id) 
    #   @profile_pm_schedules.each do |profile_pm_schedule| 
    #     @pm_schedule_eqp_object = PmScheduleEqpObject.new 
    #     @pm_schedule_eqp_object.eqp_object_id = self.id 
    #     @pm_schedule_eqp_object.eqp_object_org_id = self.organization_id
    #     @pm_schedule_eqp_object.pm_schedule_id = profile_pm_schedule.id
    #     @pm_schedule_eqp_object.due_date = Date.today + (profile_pm_schedule.frequency * profile_pm_schedule.period_uom.uom_int)
    #     @pm_schedule_eqp_object.est_hours = profile_pm_schedule.est_hours 
    #     @pm_schedule_eqp_object.save
    #   end  
    # end 
  end 

  def create_commission_event
    commission_event = Event.create(
      sched_start_date: Date.today,
      user: User.find_by(name: "System"),
      description: "COMMISSIONING/ACCEPTENCE CHECK",
      event_priority: EventPriority.last,
      eqp_object: self,
      organization: self.organization,
      event_type: EventType.first,
      event_status: EventStatus.first
    )
    commission_event.save
    puts "ERROR! #{commission_event.errors.full_messages}"
  end
  
  #Method for displaying formatted <CODE> - <Description>
  def expanded_desc
    expanded_desc = "#{code} - #{description}"
  end

  def status_desc 
    status_desc = self.eqp_object_status.description
  end
  
  def self.import(file)
    @eqp_profiles = EqpProfile.all
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      eqp_object = EqpObject.assign_from_row(row)
      if eqp_object.save
        counter += 1
      else
        puts "#{eqp_object.code} - #{eqp_object.errors.full_messages.join(", ")}"
      end  
    end
    counter
  end
  
  def self.assign_from_row(row)
    eqp_object = EqpObject.where(code: row[:code]).first_or_initialize
    eqp_object.assign_attributes row.to_hash.slice(:description, :alias, :eqp_profile_id, :eqp_object_status_id, :eqp_object_criticality_id, :organization_id, :not_used)
    eqp_object
  end
end

