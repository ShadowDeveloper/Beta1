class User < ActiveRecord::Base
	self.table_name = "user"

	validates :cpf, uniqueness: {message: "cpf already exists"}
end
