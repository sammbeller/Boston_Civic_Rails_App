class AddVelocityAndAccuracyToReport < ActiveRecord::Migration
  def change
    add_column :reports, :velocity, :float
    add_column :reports, :accuracy, :integer
  end
end
