class EqpObjectClass < ApplicationRecord 
  has_many :eqp_object_categories 

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      eqp_object_class = EqpObjectClass.assign_from_row(row)
      if eqp_object_class.save
        counter += 1
      else
        puts "#{eqp_object_class.code} - #{eqp_object_class.errors.full_messages.join(", ")}"
      end  
    end
    counter
  end
  
  def self.assign_from_row(row)
    eqp_object_class = EqpObjectClass.where(code: row[:code]).first_or_initialize
    eqp_object_class.assign_attributes row.to_hash.slice(:description, :not_used)
    eqp_object_class
  end

end 