class Client < ActiveRecord::Base
	self.table_name = "client"

	default_scope { order :id => :desc }
	
    validates :name, :rg, presence: true
	
	validates :cpf, uniqueness: { message: " - CPF existente na base de dados." }
	
	has_many :client_references

	has_one :company

	has_many :residence

	has_many :bank_account

	def residence_negotiation
		Sale.where(cpf_client: self.cpf, status: 1)
	end
end
