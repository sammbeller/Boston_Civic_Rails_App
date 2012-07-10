class AddActivationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :actication, :boolean, default: false
  end
end

#1. create column for activation deafult false
#2. generate and send email when a user is created by virtue of the mobile 
#3. create a route for /users/activate
#4. create action that goes with that route when theres a GET for that path
#5. generate link to that route in the amil text. please click here: html 
#6. when click on lick it switches boolean of activate to true 