# encoding: utf-8
class ResidencesController < ApplicationController

	def create
		residence = Residence.new(residence_params[:residence])

		if residence.valid?
				begin
		    		pos = residence.position
		    		residence.create_residence_info(residence_params[:residence_info])
					residence.address = "#{pos[:lat]}|#{pos[:lng]}"
					residence.client_id = Client.where(cpf: params[:cpf]).first.id
					residence.save
				
					url = "/residences/#{residence.id}"
					code = "200"
					status = "<center><b>Imovel cadastrado com sucesso!</b></center>"
					status = %Q{ fnAlertClients("#{status}",'#{code}','#{url}') }
				rescue
					code = "500"
					render js: %Q{ fnDefaultMessage('Ocorreu uma falha em sua conexao, tente novamente.') }
				return	
				end
		else
			status = %Q{ console.log('Dados invalidos') }
		end

		render js: status
	end

	def index
		if params[:residence_search]
			residences = Residence.where(
				id: params[:residence_search]
			)
			@residence_geo = []
			residences.map {|res| @residence_geo.push res.geo}
			@residence_geo
		else
			if params[:residence_status] != ""
				residences = Residence.where(
					status: params[:residence_status].to_i
				)
				@residence_geo = []
				residences.map {|res| @residence_geo.push res.geo}
				@residence_geo
			end
		end
	end

	def show
		@residence = Residence.find(params[:id])
	end

	def list

	end

	def new
		@residence = Residence.new
		@residence_info = ResidenceInfo.new
	end

	def edit
		@residence = Residence.find(params[:id])
	end

	def update
		@residence = Residence.find(params[:id])
		@pic = Picture.create(residence_update_params)
	
		@pic.residence_id = params[:id]
		@pic.pic_file_name = residence_update_params[:pics].original_filename
		@pic.pic_content_type = residence_update_params[:pics].content_type
		@pic.updated_at = Time.new
		@pic.save
		redirect_to :back
	end

	def binding
		client = Client.where(cpf: params[:cpf]).first

		response = ""
		if client
			@residence = Residence.find(params[:id])
			@residence.status = "1"
			@residence.save
			Sale.create(
				cpf_owner: 	  @residence.client.cpf,
				cpf_client:   client.cpf,
				status: 	  '1',
				residence_id: @residence.id
			)

			ResidenceLog.create(
				user_id: session[:user_id],
				residence_id: params[:id],
				description: "Início de venda",
			)
			response = ""
		else
			response = "Cliente não encontrado."
		end
		redirect_to :back, :flash => { :notice => response}
	end

	def sale_action
		residence = Residence.find(params[:id])
		sale = Sale.where(residence_id: residence.id, status: 1).first
		
		# Quando status for 2, é uma confirmacao de venda,
		# Quando status for 1, o imovél está disponivel para venda
		# Quando status for 3, é um cancelamento de venda.
	
		if params[:sale_status] == '2'
			sale.status = 2
			residence.status = 2
			sale.save

			ResidenceLog.create(
				user_id: session[:user_id],
				residence_id: params[:id],
				description: "Imóvel vendido para #{sale.cpf_client}",
			)
		elsif  params[:sale_status] == '1'
			residence.status = 3

			ResidenceLog.create(
				user_id: session[:user_id],
				residence_id: params[:id],
				description: "Disponível para venda",
			)
		else
			sale.status = 3
			residence.status = 3
			sale.save

			ResidenceLog.create(
				user_id: session[:user_id],
				residence_id: params[:id],
				description: "Venda cancelada",
			)
		end

		
		residence.save

		redirect_to :back
	end

	def log
		@log = ResidenceLog.where(residence_id: params[:id])
	end

	protected

	def residence_update_params
  		params.require(:residence).permit(:pics)
	end

	def residence_params
		params[:residence_info][:sell_value].delete!("R$ ")
		params[:residence_info][:iptu_value].delete!("R$ ") 
		params[:residence_info][:rent_value].delete!("R$ ") 
		params[:residence_info][:condominium_value].delete!("R$ ") 
		
		params.permit(
			residence:[
				:status,
				:residence_type,
				:cep,
				:street,
				:neighbourhood,
				:city,
				:state,
				:number
			],
			residence_info:[
				:residence_code,
				:sell_value,
				:rent_value,
				:condominium_value,
				:iptu_value,
				:area_total,
				:scritura_definitiva,
				:escritura_alienada,
				:estritura_inventario,
				:qtd_dormitorio,
				:qtd_suite,
				:qtd_banheiro,
				:qtd_garage
			]
		)
	end
end
