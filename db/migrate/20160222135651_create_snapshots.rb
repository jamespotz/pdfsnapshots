class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.string :url
      t.string :snapshot_link

      t.timestamps null: false
    end
  end
end
