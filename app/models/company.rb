class Company < ActiveRecord::Base
	self.table_name = "company"

	belongs_to :client
end