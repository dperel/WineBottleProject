class CreateVineyards < ActiveRecord::Migration
  def change
    create_table :vineyards do |t|
      t.string :name
      t.string :city
      t.string :country
      t.timestamps null: false
    end
  end
end
