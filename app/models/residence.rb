class Residence < ActiveRecord::Base
	self.table_name = "residences"
	validates :cep, presence: true

	has_one :residence_info

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
end
