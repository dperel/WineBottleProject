class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :vineyard_id
      t.string :btc_address
      t.timestamps null: false
    end
  end
end

