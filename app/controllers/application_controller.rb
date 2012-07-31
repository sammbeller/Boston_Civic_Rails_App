class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  #after_filter process_ping

  private

  def process_ping
    time = DateTime.now.to_i
    if time - Setting.find_by_name("LastPing").value >= 3600
      reports = Report.find(:all, order: "id desc", limit: 10)
      reports.each.check_for_frequency
    end
  end

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

  #send back messsage to client once mcreate called
  def msg(report)
    maxSpeed = Setting.find_by_name("Speed").value.to_int
    rsp = ""
    
    #check if user is activated 
    if !report.user.activation
      rsp = rsp + "Your report has been noted but will not be submitted to the City of Boston until you activate your account. An email has been sent to the email address you provided with instructions explaining how to activate your account. "
    end 
    
    #check if user is at a certain speed 
    if report.velocity >= maxSpeed
      rsp = rsp + "For your own safety, we do not accept reports from moving vehicles. You must come to a full stop before submitting a report. "      
    end 
      
    #find nearby reports (hotspots)   
    @recs = report.find_nearby_reports(report, 5, 10)
    rsp = rsp + "You are the #{number_to_ordinal(@recs.length)} person to report this location."

    #return concatinated response to mobile client 
    return rsp 
  end 

  #changing integer into ordinal 
  def number_to_ordinal(num)  
    num = num.to_i
    if (10...20)===num
      "#{num}th"
    else
      g = %w{ th st nd rd th th th th th th }
      a = num.to_s
      c=a[-1..-1].to_i
      a + g[c]
    end
  end   
end
