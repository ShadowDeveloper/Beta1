class Residence < ActiveRecord::Base
	self.table_name = "residences"

	has_one :residence_info
end
