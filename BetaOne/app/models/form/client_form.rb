class Form::ClientForm
	include ActiveModel::Model

	attr_acessor :name, :rg, :dob, :cpf, :relationship, :address, :phone_number, :phone_number2, :email_address,
	:email_address2, :mobile_number, :mobile_number2, :client_type

	validates :name,  presence: true
	validates :rg,    presence: true
	validates :dob,   presence: true

	def validate
		valid? ? true : false
	end
end