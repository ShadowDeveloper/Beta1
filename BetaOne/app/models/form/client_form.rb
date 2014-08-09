class Form::ClientForm
	include ActiveModel::Model

	attr_accessor :name, :rg, :dob, :cpf, :relationship, :address, :phone_number, :phone_number2, :email_address,
	:email_address2, :mobile_number, :mobile_number2, :client_type, :income, :extra_income, :ocupation,
	:company_name,  :name, :phone_number, :phone_number2, :bank_id, :agency, :account_number
	

	validates :name, :rg, :dob, :cpf, :relationship, :address, :phone_number, :phone_number2, :email_address,
	:email_address2, :mobile_number, :mobile_number2, :client_type, presence: true

	validates :income, :extra_income, :ocupation, :company_name, presence: true

	validates :name, :phone_number, :phone_number2, presence: true

	validates :bank_id, :agency, :account_number, presence: true
	
	def validate
		valid? ? true : false
	end
end