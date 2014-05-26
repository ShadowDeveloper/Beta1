class Client < ActiveRecord::Base
	self.table_name = "client"
	 
	validates :cpf, uniqueness: { message: " - CPF existente na base de dados." }

	has_many :client_references

	has_many :company

	has_many :bank_account
end
