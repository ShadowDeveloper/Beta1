class SessionController < ApplicationController
	
	skip_before_filter :verify_active_session, :except => [:logout]
	
	def login
		user = User.where(
		 	login:    params[:user_name],
			password: params[:password]
		).first

		if  user
			session[:user_id]     = user.id
			session[:user_login]  = user.login
			session[:client_step] = "personal"
			redirect_to user
			return
		else
			redirect_to response = "/main", :flash => { :error => "invalid_password" }
			return
		end
	end

	def logout
		session.delete :user_id
		session.delete :user_login
		session.delete :client_step
		session.delete :client_params
		redirect_to "/main"
	end
end