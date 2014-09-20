class ResidenceInfo < ActiveRecord::Base
	self.table_name = "residence_info"

	belongs_to :residence
end
