class AddAttachmentAvatarToAddresses < ActiveRecord::Migration
  def self.up
    change_table :addresses do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :addresses, :avatar
  end
end
