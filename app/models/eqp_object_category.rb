class EqpObjectCategory < ApplicationRecord
  belongs_to :eqp_object_class
  has_many :eqp_objects
  has_many :eqp_profiles

  def expanded_desc
    expanded_desc = "#{code.upcase} - #{description.upcase}"
  end

  def self.select_values
    EqpObjectCategory.active.map { |eqp_object_category| [eqp_object_category.code, eqp_object_category.id, {data: { url: data_url(eqp_object_category) }}]}
  end

  scope :active, -> { where(not_used: false) }

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      eqp_object_category = EqpObjectCategory.assign_from_row(row)
      if eqp_object_category.save
        counter += 1
      else
        puts "#{eqp_object_category.code} - #{eqp_object_category.errors.full_messages.join(", ")}"
      end  
    end
    counter
  end

  def self.assign_from_row(row)
    eqp_object_category = EqpObjectCategory.where(code: row[:code]).first_or_initialize
    eqp_object_category.assign_attributes row.to_hash.slice(:description, :not_used, :eqp_object_class_id)
    eqp_object_category
  end

  private

  def self.data_url(eqp_object_category)
    Rails.application.routes.url_helpers.eqp_object_category_eqp_profiles_path(eqp_object_category, format: :json)
  end
end

