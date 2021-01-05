namespace :import do

  desc "Import Equipment Classes from csv"
  task eqp_object_classes: :environment do
    import = EqpObjectClass::Import.new file: File.open("eqp_object_classes.csv")
    import.process!
    puts "Imported #{import.imported_count} records"
    puts import.errors.full_messages
  end
end