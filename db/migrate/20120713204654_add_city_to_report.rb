class AddCityToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :city, :string
  end
end
