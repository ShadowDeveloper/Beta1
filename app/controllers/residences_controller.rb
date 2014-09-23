class ResidencesController < ApplicationController

	def create
		#TODO criar dados
		residence = Residence.new(residence_params[:residence])

		residence.create_residence_info(residence_params[:residence_info])
		
		
		if residence.valid?
			residence.save
			status = "window.location = '/residences/#{residence.id}'"
		else
			status = %Q{ $(".alert-box").slideDown();}
		end

		render js: status
	end

	def index

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

	private
	def residence_params
		params.permit(
			residence:[
				:status,
				:type,
				:cep,
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
				:qdt_dormitorio,
				:qtd_dormitorio,
				:qtd_suite,
				:iqtd_banheiro,
				:iqtd_garage
			]
		)
	end
end
