class Report < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :timestamp, :accuracy, :velocity, :street
  validates :latitude, presence: true, numericality: true

  validates :longitude, presence: true, numericality: true

  TIMESTAMP_MIN_TIME = 1341235426528
  validates :timestamp, presence: true
  belongs_to :user

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.address = geo.address
      obj.street = geo.address_components_of_type(:route)[0]["short_name"]
    end 
  end 
  after_validation :reverse_geocode


  # after_initialize :init
  #   def init
  #     puts self.street
  #     self.street  ||= "Main st"           #will set the default value only if it's nil
  #   end

    #method that finds nearby reports
    def find_nearby_reports(report, number, time, precision=nil)
    	return Report.find_all_by_street(report.street)
    end

	
end
