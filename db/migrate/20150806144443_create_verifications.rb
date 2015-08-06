class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.timestamps null: false
    end
  end
end
