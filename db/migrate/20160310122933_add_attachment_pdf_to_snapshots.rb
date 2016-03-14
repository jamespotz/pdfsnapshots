class AddAttachmentPdfToSnapshots < ActiveRecord::Migration
  def self.up
    change_table :snapshots do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :snapshots, :pdf
  end
end
