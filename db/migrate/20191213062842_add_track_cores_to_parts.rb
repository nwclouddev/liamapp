class AddTrackCoresToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :track_cores, :boolean
  end
end
