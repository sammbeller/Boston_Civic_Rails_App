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
      route_components = geo.address_components_of_type(:route)
      if !(route_components.nil? || route_components[0].nil?)
        obj.street = route_components[0]["short_name"]
      end
    end 
  end 
  after_validation :reverse_geocode

#  default_scope order: 'reports.created_at DESC'

    #method that finds nearby reports
    def find_nearby_reports(report, number, time, precision=nil)
    	return Report.find_all_by_street(report.street)
    end

    def self.find_by_options(span, days, time)
      reports = Report.all
      reports = reports.select do |x|
        days.include?(x.timestamp.wday)
      end

      reports = reports.select do |x|
        time.include?(x.timestamp.hour)
      end

      reports = reports.select do |x|
        (x.timestamp - span) >= 0
      end
    end
end
