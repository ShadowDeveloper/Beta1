class ClientController < ApplicationController
	def create
		new_client = Client.new(
			:cpf => params[:cpf],
			:name => params[:name],
			:dob => params[:dob],
			:rg => params[:rg],
			:phone => params[:phone],
			:cep => params[:cep],
			:number => params[:number]
		)

		if new_client.save
			redirect_to "/client/#{new_client.id}"
		else
			@error = "cpf_exists" if new_client.errors.messages[:cpf][0]
			redirect_to "/client?error=#{@error}"
		end
	end
	def index
		
	end

	def show
		@client = Client.find params[:id]
		
	end

	def list
		if params[:search]
			search_by = "" if params[:search_by] == "last"
			search_by = "cpf = #{params[:search]}" if params[:search_by] == "cpf"
			search_by = "name like '%#{params[:search]}%'" if params[:search_by] == "nome"
			@clients  = Client.where("#{search_by}")
		else
			@clients  = Client.all
		end
	end
end
