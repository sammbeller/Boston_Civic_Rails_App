class ChangeActivationToUsers < ActiveRecord::Migration
  def change 
  	remove_column :users, :actication, :boolean
    add_column :users, :actication, :boolean, default: false
  end
end
