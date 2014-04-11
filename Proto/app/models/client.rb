class Client < ActiveRecord::Base
	self.table_name = "client"
	 
	validates :cpf, uniqueness: {message: "cpf already exists"}
end
