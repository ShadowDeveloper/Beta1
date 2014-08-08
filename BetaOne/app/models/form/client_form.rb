class Form::ClientForm
	include ActiveModel::Model

	attr_accessor :name, :rg, :dob, :cpf, :relationship, :address, :phone_number, :phone_number2, :email_address,
	:email_address2, :mobile_number, :mobile_number2, :client_type

	validates :name,  presence: true
	validates :rg,    presence: true
	validates :dob,   presence: true
	validates :cpf, presence: true    
	validates :relationship, presence: true
	validates :address, presence: true
	validates :phone_number, presence: true
	validates :phone_number2, presence: true
	validates :email_address, presence: true
	validates :email_address2, presence: true
	validates :mobile_number, presence: true
	validates :mobile_number2, presence: true
	validates :client_type, presence: true

	def validate
		valid? ? true : false
	end
end