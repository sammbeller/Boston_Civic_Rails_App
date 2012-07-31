class AddShownToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :shown, :boolean
  end
end
