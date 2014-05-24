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

		if new_user.save
			status = "Registro criado com sucesso!"
		else
			status =  new_user.errors.full_messages[0]
		end

		render js: "$('#status')[0].innerHTML='<center>"+status.upcase+"<center>'"
	end

	def index

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
