class ClientController < ApplicationController
	def create
		Client.create(
			:cpf => params[:cpf],
			:name => params[:name],
			:dob => params[:dob],
			:rg => params[:rg],
			:phone => params[:phone],
			:cep => params[:cep],
			:number => params[:number]
		)

		redirect_to :back
	end
	def index
		
	end

	def show
		@client = Client.find params[:id]
		
	end

	def list

		if params[:search]
			#TO DO
			#Criar busca por CJPJ e RG
			#[end]
			search_by = "cpf = #{params[:search]}" if params[:search_by] == "cpf"
			search_by = "name like '%#{params[:search]}%'" if params[:search_by] == "nome"
			@clients = Client.where("#{search_by}")
		else
			@clients = Client.all
		end
	end
end
