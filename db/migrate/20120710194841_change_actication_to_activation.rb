class ChangeActicationToActivation < ActiveRecord::Migration
  def change 
  	remove_column :users, :actication, :boolean, default: false
    add_column :users, :activation, :boolean, default: false
  end
end
