class RemoveTimestampFromReport < ActiveRecord::Migration
  def up
    remove_column :reports, :timestamp
  end

  def down
    add_column :reports, :timestamp, :timestamp
  end
end
