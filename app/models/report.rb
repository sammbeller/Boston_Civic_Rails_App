class Report < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :timestamp, :accuracy, :velocity, :address
  validates :latitude, presence: true, numericality: true

  validates :longitude, presence: true, numericality: true

  TIMESTAMP_MIN_TIME = 1341235426528
  validates :timestamp, presence: true
  belongs_to :user

	reverse_geocoded_by :latitude, :longitude do |obj, results|
		if geo = results.first 
			obj.city = geo.city
			obj.address = geo.address
		end 
	end 

	after_validation :reverse_geocode
end
