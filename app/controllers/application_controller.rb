class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private
  def redirect_back_or(default)
  	redirect_to(session[:return_to] || default)
  	session.delete(:return_to)
  end

  def signed_in_user
    unless signed_in?
    	store_location
    	redirect_to signin_path, notice: 'Please sign in.'
    end
  end

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_path) unless current_user? (@user)
  end

  def admin_user
  	redirect_to(root_path) unless signed_in? && current_user.admin?
  end

  def msg(report)
    # point1 = [report.latitude, report.longitude]
    # nearby_points = []
    # @Report.each do |x|
    #   point2 = [x.latitude, x.longitude]
    #   if (distance_between(point1, point2, options = {}) <= 0.005)
    #     nearby_points.push(point2)
    #   end
    # end 
    # return nearby_points.length
    maxSpeed = Setting.find_by_name("Speed").value.to_int
    if report.user.activation
      if report.velocity <= maxSpeed
        return "Your report has been sent succesfully!"
      else 
        return "For your own safety, we do not accept reports from moving vehicles. You must come to a full stop before submitting a report."
      end 

    else 
      return "Your report has been noted but will not be submitted to the City of Boston until you activate your account. An email has been sent to the email address you provided with instructions explaining how to activate your account."
    end 

  end 
end
