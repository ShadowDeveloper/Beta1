# encoding: utf-8
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

		if new_user.valid?
			new_user.save
			status = 200
			id = new_user.id
			msg = "Usuário cadastrado com sucesso!"
			msg = %Q{createUser('#{status}','#{msg}','#{id}')}
			
		else
			status = 500
			msg =  new_user.errors.full_messages.first
			msg = %Q{console.log("#{msg}")}
		end
		render js: msg
	end

	#get /users/
	def index

	end

	def new
		@user = User.new
	end

	#get /users/:id
	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@user.address = params[:region]
		@user.save

		render js: "fnDefaultMessage('Dados alterados com sucesso.'), window.location.reload();"
	end

	def list
		@user  = User.where("login = ?", params[:search])
	end
end
