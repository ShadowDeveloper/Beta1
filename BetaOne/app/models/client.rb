class Client < ActiveRecord::Base
	self.table_name = "client"
	 
	validates :cpf, uniqueness: { message: " - CPF existente na base de dados." }

	has_many :personal_references
end
