class AddPrivateKeyToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :private_key, :string
  end
end
