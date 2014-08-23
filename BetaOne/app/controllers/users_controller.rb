class UsersController < ApplicationController

	#post /users
	def create
		new_user = User.new(
			:name     => params[:user][:name],
			:login    => params[:user][:login],
			:password => params[:user][:password],
			:adm      => params[:user][:adm] ||= 0,
			:cpf      => params[:user][:cpf]
		)

		if new_user.save
			status = "Registro criado com sucesso!"
		end
		#	status =  new_user.errors.full_messages.first
		#end

		render js: "$('#status')[0].innerHTML='<center>"+status+"<center>'"
	end

	#get /users/
	def index

	end

	def new
		@user = User.new
	end

	#get /users/:id
	def show
		@user = User.find(session[:user_id])
	end
end
