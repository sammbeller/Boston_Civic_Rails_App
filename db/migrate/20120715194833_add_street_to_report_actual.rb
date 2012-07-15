class AddStreetToReportActual < ActiveRecord::Migration
  def change
  	add_column :reports, :street, :string
  end
end
