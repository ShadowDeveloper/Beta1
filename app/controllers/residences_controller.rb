class ResidencesController < ApplicationController

	def create
		residence = Residence.new(residence_params[:residence])
		if residence.valid?
			begin 
		    	pos = residence.position
		    	residence.create_residence_info(residence_params[:residence_info])
				residence.address = "#{pos[:lat]}|#{pos[:lng]}"
				residence.save

				status = %Q{ fnAlertClients("#{status}",'#{code}','#{url}') }
				url = "/residences/#{residence.id}"
				code = "200"

			rescue
				code = "500"
				render js: %Q{ fnDefaultMessage('Ocorreu uma falha em sua conexao, tente novamente.') }
				return
			end
			
		else
			url = ""
	   	code = "500"
			status = "console.log('erro')"
		end

		render js: status
	end

	def index
		if params[:residence_type] != ""
			residences = Residence.where(
				residence_type: params[:residence_type].to_i,
				status: params[:residence_status].to_i
			)
			@residence_geo = []
			residences.map {|res| @residence_geo.push res.geo}
			@residence_geo
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

	protected
	def residence_params
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
