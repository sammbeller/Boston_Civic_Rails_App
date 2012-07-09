class Report < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :timestamp
  validates :latitude, presence: true, numericality: true

  validates :longitude, presence: true, numericality: true

  TIMESTAMP_MIN_TIME = 1341235426528
  validates :timestamp, presence: true
  belongs_to :user

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode
end
