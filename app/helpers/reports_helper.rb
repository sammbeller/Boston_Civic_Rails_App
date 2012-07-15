module ReportsHelper

	def msg(report)
		# point1 = [report.latitude, report.longitude]
		# nearby_points = []
		# @Report.each do |x|
		# 	point2 = [x.latitude, x.longitude]
		# 	if (distance_between(point1, point2, options = {}) <= 0.005)
		# 		nearby_points.push(point2)
		# 	end
		# end 
		# return nearby_points.length
		maxSpeed = Setting.find_by_name("Speed").value.to_int
		if report.activation
			if report.velocity <= maxSpeed
				return "Your report has been sent succesfully!"
			else 
				return "Sorry but you need to be stationary (for your own safety.) We cannot accept reports from moving vehicles."
			end 

		else 
			return "Your report has been noted but will not be summated to the City of Boston until you activate your account. Please look for an email that we sent to you with instructions to activate."
		end 

	end 
end
