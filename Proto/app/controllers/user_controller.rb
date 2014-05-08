class UserController < ApplicationController

	before_filter :verify_active_session,  :except => [:create, :login]

	def create
		new_user = User.new(
			:name => params[:name],
			:login => params[:login],
			:password => params[:password],
			:adm => params[:adm] ||= 0,
			:cpf => params[:cpf]
		)

		new_user.valid?
		

		if new_user.errors.any?
			status =  new_user.errors.full_messages[0]
		else
			new_user.save
			status = "Registro criado com sucesso!"
		end

		render js: "$('#status')[0].innerHTML='<center>"+status.upcase+"<center>'"
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
		@user = User.find(session[:user_id])

	end
end
