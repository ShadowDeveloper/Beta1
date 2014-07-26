class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :verify_active_session
  
  protect_from_forgery with: :exception
   	def verify_active_session
	  	if session[:user_id] == nil
	  		redirect_to "/main"
	  	end
  	end
end
