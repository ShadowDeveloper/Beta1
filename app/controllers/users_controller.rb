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
			status = "Usuario cadastrado com sucesso!"
		else
			status =  new_user.errors.full_messages.first
		end

		# render js: "$('#status')[0].innerHTML='<center>"+status+"<center>'"
		render js: "fnAlertUsers('"+status+"')"
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

		redirect_to :back
	end

	def list
		@user  = User.where("login = ?", params[:search])
	end
end
