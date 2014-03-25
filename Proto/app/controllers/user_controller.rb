class UserController < ApplicationController
	def create
		
	end

	def index

	end

	def login
		user = User.where( login: params[:user_name], password: params[:password])
		if user != []
			response = "/user/#{user[0].id}"
		else
			response = "/main?password=1"
		end
		redirect_to response
	end

	def show
		@user = User.find(params[:id])

	end
end
