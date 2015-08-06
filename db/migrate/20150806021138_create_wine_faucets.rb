class CreateWineFaucets < ActiveRecord::Migration
  def change
    
    create_table :wine_faucets do |t|

      t.timestamps null: false
    end
  end
end
