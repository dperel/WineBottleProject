class ChangeIsSoldInAddresses < ActiveRecord::Migration
  def change
    change_column :addresses, :is_sold, :boolean, :default => false
  end
end
