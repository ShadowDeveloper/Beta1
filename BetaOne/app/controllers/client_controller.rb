class ClientController < ApplicationController

	before_filter :verify_active_session
	
	def create
		new_client = Client.new(client_params)
		new_client.create_company(company_params)
		new_client.client_references.new(client_references_params)
		new_client.bank_account.new(bank_account_params)

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
	end

	def company_params
		params.permit(
		:income,
		:extra_income,
		:ocupation,
		:company_name
		)
	end

	def client_references_params
		params.permit(
			:name,
			:phone_number,
			:phone_number2
		)
	end

	def bank_account_params
		params.permit(
			:bank_id,
			:agency,
			:account_number
		)
	end
end
