class Manufacturer < ApplicationRecord

  has_many :eqp_profiles

  validates :code, uniqueness: true
  validates :description, presence: :true
  
  def self.select_values
    Manufacturer.all.map { |manufacturer| [manufacturer.code, manufacturer.id, { data: { url: data_url(manufacturer) }}]}
  end

  private

  def self.data_url(manufacturer)
    Rails.application.routes.url_helpers.manufacturer_eqp_profiles_path(manufacturer, format: :json)
  end
  
end
