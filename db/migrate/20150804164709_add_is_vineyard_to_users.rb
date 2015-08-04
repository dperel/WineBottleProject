class AddIsVineyardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_vineyard, :boolean
  end
end
