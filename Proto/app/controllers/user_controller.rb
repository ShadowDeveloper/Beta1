class UserController < ApplicationController
	def create
		new_user = User.new(
			:name => params[:name],
			:login => params[:login],
			:password => params[:password],
			:adm => params[:adm] ||= 0,
			:cpf => params[:cpf]
		)

		if new_user.save
			status = "Registro criado com sucesso!"
		end

		if new_user.errors.any?
			status =  new_user.errors.full_messages[0]
		end

		render js: "alert('"+status+"');"
	end

	def index

	end

	def login
		user = User.where( login: params[:user_name], password: params[:password])

	if user != []
			session[:user_id] = user[0].id
			session[:user_login] = user[0].login
			response = "/user/#{user[0].id}"
		else
			response = "/main?someWrong=1"
		end
		redirect_to response
	end


	def logout
		session.delete :user_id
		session.delete :user_login
		redirect_to "/main"
	end

	def show
		@user = User.find(params[:id])

	end
end
