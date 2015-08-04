class AddPublicKeyToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :public_key, :string
  end
end
