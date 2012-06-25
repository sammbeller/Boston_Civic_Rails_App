class ChangeReportTimestampDataType < ActiveRecord::Migration
  def change
    remove_column :reports, :timestamp 
    add_column :reports, :timestamp, :datetime
  end
end
