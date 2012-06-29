class CreateLoggings < ActiveRecord::Migration
  def change
    create_table :loggings do |t|
      t.datetime :when
      t.integer :user_id

      t.timestamps
    end
  end
end
