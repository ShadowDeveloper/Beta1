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
end
