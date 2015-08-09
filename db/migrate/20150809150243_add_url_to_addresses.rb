class AddUrlToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :url, :string
  end
end
