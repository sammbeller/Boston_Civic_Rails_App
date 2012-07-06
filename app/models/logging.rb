class Logging < ActiveRecord::Base
  attr_accessible :user_id, :when, :event

  belongs_to :user
end
