class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private
  def redirect_back_or(default)
  	redirect_to(session[:return_to] || default)
  	clear_return_to
  end
end
