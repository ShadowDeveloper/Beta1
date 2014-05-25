class PersonalReference < ActiveRecord::Base
	self.table_name = "personal_references"

	belongs_to :client
end