class RenameLastLocationToCurrentLocationInAddresses < ActiveRecord::Migration
  def change
    rename_column :addresses, :last_location, :current_location
  end
end
