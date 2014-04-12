class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   	def verify_active_session
	  	if session[:user_id] == nil
	  		redirect_to "/main"
	  	end
  	end
end
