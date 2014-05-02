class ClientController < ApplicationController

	before_filter :verify_active_session
	
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
			status = "window.location.href='/client/"+new_client.id.to_s+"'"
		end

		if new_client.errors.any?	
			status = new_client.errors.full_messages[0]
			status = "$('#status')[0].append='<center>"+status.upcase+"<center>'"
		end
		render js: status
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
