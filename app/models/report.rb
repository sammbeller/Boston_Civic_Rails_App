class Report < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :timestamp

  belongs_to :user
end
