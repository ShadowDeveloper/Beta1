class ClientController < ApplicationController

	before_filter :verify_active_session
	
	def create
		new_client = Client.new(client_params)

		if new_client.save
			status = "window.location.href='/client/"+new_client.id.to_s+"'"
		else	
			status = new_client.errors.full_messages[0]
			status = "$('#status')[0].append='<center>"+status+"<center>'"
		end
		render js: status

	end
	def index
		
	end

	def show
		@client = Client.find params[:id]
		
	end

	def list
		if params[:search_by] == "cpf"
			search_by = "cpf = #{params[:search]}" 
			@clients  = Client.where("cpf = ?", params[:search])
		elsif params[:search_by] == "nome"
			@clients  = Client.where("name like ?", "%#{params[:search]}%")
		else
			@clients  = Client.all
		end
	end

	private
	def client_params
		params.permit(
			:name,
			:rg,
			:dob,
			:cpf,
			:relationship,
			:address,
			:phone_number,
			:phone_number2,
			:email_address,
			:email_address2,
			:mobile_number,
			:mobile_number2,
			:client_type
		)
		#:extra_income,
		#:income,
		#:ocupation,
		#:company_name,
	end
end
