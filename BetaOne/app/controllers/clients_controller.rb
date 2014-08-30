class ClientsController < ApplicationController
	
	def create
		new_client = Client.new(client_params[:client])
		new_client.create_company(client_params[:company])
		new_client.client_references.new(client_params[:client_reference])
		new_client.bank_account.new(client_params[:bank_account])

		if new_client.save
			status = "window.location.href='/clients/" + new_client.id.to_s + "'"
		else	
		    #fail_field = new_client.errors.full_messages[0].split(" ")[0].downcase
		    
		    status = %Q{ $("#status_form").html("<p>Preencha Todos os Campos</p>") }
		end
		render js: status
	end

	def new
		@client       = Client.new
		@company   	  = Company.new
		@reference 	  = ClientReference.new
		@bank_account = BankAccount.new
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
			@clients = nil
		end
	end

	private
	def client_params
		params.permit(
			client:[
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
			],
			company:[
				:income,
				:extra_income,
				:ocupation,
				:company_name
			],
			client_reference:[
				:name,
				:phone_number,
				:phone_number2
			],
			bank_account:[
				:bank_id,
				:agency,
				:account_number
			]
		)
	end

end
