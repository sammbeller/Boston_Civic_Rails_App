class RemoveTimestampFromReports < ActiveRecord::Migration
  def up
    remove_column :reports, :timestamp
  end

  def down
    add_column :reports, :timestamp, :integer
  end
end
