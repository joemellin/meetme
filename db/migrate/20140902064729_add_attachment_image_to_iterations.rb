class AddAttachmentImageToIterations < ActiveRecord::Migration
  def self.up
    change_table :iterations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :iterations, :image
  end
end
