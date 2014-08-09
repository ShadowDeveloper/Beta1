class ClientController < ApplicationController
	
	def create
		if params[:client] and  params[:company] and  params[:client_reference] and params[:bank_account]
			client_params = Hash.new
			client_params = client_params.merge params[:client] 
			client_params = client_params.merge params[:company]
			client_params = client_params.merge params[:client_reference] 
			client_params = client_params.merge params[:bank_account] 
			if Form::ClientForm.new(client_params.symbolize_keys).valid?
				new_client = Client.new(params[:client])
				new_client.create_company(params[:company])
				new_client.client_references.new(params[:company])
				new_client.bank_account.new(params[:company])
			end
		else
			redirect_to "/clients"
		end
=begin	
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
=end
	end

	def index
		#REMOVER
		redirect_to "/client/new"
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
			@clients  = Client.all.limit(10);
		end
	end
	
end
