class UserController < ApplicationController
	def create
		if User.where( login: params[:user_name], password: params[:password]) != []
			response = "/user"
		else
			response = "/main?password=1"
		end
		redirect_to response
	end

	def index

	end
end
