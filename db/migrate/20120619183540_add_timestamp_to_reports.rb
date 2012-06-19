class AddTimestampToReports < ActiveRecord::Migration
  def change
    add_column :reports, :timestamp, :string
  end
end
