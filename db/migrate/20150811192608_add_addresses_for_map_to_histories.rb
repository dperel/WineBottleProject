class AddAddressesForMapToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :addresess_for_map, :text
  end
end
