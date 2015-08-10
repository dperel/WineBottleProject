class AddStringifiedLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stringified_location, :string
  end
end
