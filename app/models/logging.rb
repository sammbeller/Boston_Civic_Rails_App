class Logging < ActiveRecord::Base
  attr_accessible :user_id, :when

  belongs_to :user
end
