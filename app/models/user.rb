class User < ActiveRecord::Base
	self.table_name = "user"

	validates :cpf, uniqueness: {message: " - CPF existente na base de dados."}
	validates :login, uniqueness: {message: " - Login existente na base de dados."}
	validates :name, presence: true

	def region
		if self.address != nil
 			UserHelper::region[self.address.to_s]
 		end
	end
end
