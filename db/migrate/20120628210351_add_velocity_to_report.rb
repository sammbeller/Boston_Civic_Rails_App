class AddVelocityToReport < ActiveRecord::Migration
  def change
    add_column :reports, :velocity, :float
  end
end
