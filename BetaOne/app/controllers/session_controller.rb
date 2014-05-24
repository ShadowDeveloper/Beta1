class SessionController < ApplicationController

	def login
		user = User.where(
		 	login:    params[:user_name],
			password: params[:password]
		)

		if  user != []
			session[:user_id]    = user[0].id
			session[:user_login] = user[0].login
			redirect_to "/user/#{user[0].id}"
			return
		else
			redirect_to response = "/main", :flash => { :error => "invalid_password" }
			return
		end
	end

	def logout
		session.delete :user_id
		session.delete :user_login
		redirect_to "/main"
	end
end