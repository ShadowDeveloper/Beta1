class User < ActiveRecord::Base
	self.table_name = "usuario"
    
    alias_attribute :id, :id_usuario
    alias_attribute :cresci_id, :id_cresci
    alias_attribute :name, :cnome
    alias_attribute :cpf, :ccpf
    alias_attribute :phone_number
    
	validates :cpf, uniqueness: {message: " - CPF existente na base de dados."}
	validates :login, uniqueness: {message: " - Login existente na base de dados."}
	validates :name, presence: true
end
