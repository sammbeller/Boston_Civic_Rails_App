class AddEventsToLogging < ActiveRecord::Migration
  def change
    add_column :loggings, :event, :string
    add_column :loggings, :extra1, :string
    add_column :loggings, :extra2, :string
  end
end
