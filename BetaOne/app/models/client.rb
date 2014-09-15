class Client < ActiveRecord::Base
	self.table_name = "cliente"

    alias_attribute :id, :id_cliente
    alias_attribute :client_type, :ctipo_cliente
    alias_attribute :name, :cnome
    alias_attribute :cpf,  :ccpf
    alias_attribute :marital_status, :cestado_civil
    alias_attribute :cep, :ccep
    alias_attribute :street, :clogradouro
    alias_attribute :addrress, :cendereco
    alias_attribute :house_nuber, :cnumero
    alias_attribute :house_n_complement:, :ccomplemento
    alias_attribute :city, :ccidade
    alias_attribute :neighborhood, :cbairro
    alias_attribute :nationality, :cnacionalidade
    alias_attribute :profession, :cprofissao
    alias_attribute :created_at, :ddta_Cadastro

	default_scope { order :id => :desc }
	
    validates :name, :rg, presence: true
	
	validates :cpf, uniqueness: { message: " - CPF existente na base de dados." }
	
	#has_many :client_references

	#has_one :company

	#has_many :bank_account

end
