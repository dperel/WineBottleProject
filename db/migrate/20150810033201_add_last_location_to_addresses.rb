class AddLastLocationToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :last_location, :string
  end
end
