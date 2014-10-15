class ClientsController < ApplicationController
	
	def create
		new_client = Client.new(client_params[:client])
		new_client.create_company(client_params[:company])
		new_client.client_references.new(client_params[:client_reference])
		new_client.bank_account.new(client_params[:bank_account])

		if new_client.save
			status = "Cadastro efetuado com sucesso!"
		 	url = "/clients/#{new_client.id}" 
		 	code = "200"
		else
	   	status = new_client.errors.full_messages[0].split("-")[0].strip
	   	url = ""
	   	code = "500"
		end
		render js: %Q{ fnAlertClients("#{status}",'#{code}','#{url}') }
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
			@clients  = Client.where("name like ?", "%#{params[:search]}%").first
		else
			@clients = nil
		end
	end

	def verify_by_cpf
		if Client.where(cpf: params[:cpf]).first.nil?
			response = {:message => "error", code: 500}
		else
			response = {:message => "success", code: 200}
		end

		render :json => response.to_json
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
