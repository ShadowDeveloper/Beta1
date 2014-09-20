class Residence < ActiveRecord::Base
	self.table_name = "residences"
	validates :cep, presence: true

	has_one :residence_info
end
