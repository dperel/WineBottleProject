class AddAddressIdToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :address_id, :integer
  end
end
