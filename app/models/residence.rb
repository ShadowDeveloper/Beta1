class Residence < ActiveRecord::Base
	self.table_name = "residences"
	validates :cep, presence: true

	has_one :residence_info
	belongs_to :client
	def position
		position = Geocoder.search(self.street_code)[0].data["geometry"]["location"]
		{
		    lat: position['lat'],
		    lng: position['lng']
		}
	end
	
	def street_code
	   "#{self.street}, #{self.number} #{self.city}"
	end
	
	def status_name
	    ResidenceHelper::status_name[self.status.to_s]
	end
	
	def type_name
	    ResidenceHelper::type_name[self.residence_type.to_s]
	end

	def geo
		position = self.address.split("|")
		{
			lat:    position[0].to_f,
		    lng:    position[1].to_f,
		    type:   self.type_name,
		    status: self.status_name,
		    id:     self.id,
		    cep:    self.cep,
		    bairro: self.neighbourhood,
		    rua:    self.street,
		    valor:  self.residence_info.sell_value,
		    quarto:  self.residence_info.qtd_suite,
		    banheiro:  self.residence_info.qtd_banheiro,
		    garagem:  self.residence_info.qtd_garage
		}
	end
	
end
