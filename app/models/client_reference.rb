class ClientReference < ActiveRecord::Base
	self.table_name = "client_references"

	belongs_to :client
end