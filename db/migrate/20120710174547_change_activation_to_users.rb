class ChangeActivationToUsers < ActiveRecord::Migration
  def change 
  	remove_column :users, :activation
    add_column :users, :activation, :boolean, default: false
  end
end
