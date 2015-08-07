class AddIsSoldToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :is_sold, :boolean
  end
end
