class AddEmailToSnapshot < ActiveRecord::Migration
  def change
    add_column :snapshots, :email, :string
  end
end
