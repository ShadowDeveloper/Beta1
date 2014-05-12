class Client < ActiveRecord::Base
	self.table_name = "client"
	 
	validates :cpf, uniqueness: {message: " - CPF existente na base de dados."}
end
