class AddTimestampToReports < ActiveRecord::Migration
  def change
    add_column :reports, :timestamp, :integer
  end
end
