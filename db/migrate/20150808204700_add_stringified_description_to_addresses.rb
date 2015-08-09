class AddStringifiedDescriptionToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :stringified_description, :string
  end
end
