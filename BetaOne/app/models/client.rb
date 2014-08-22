class Client < ActiveRecord::Base
	self.table_name = "client"
	attr_accessor :current_step

	 
	default_scope { order :id => :desc }
	
	validates :cpf, uniqueness: { message: " - CPF existente na base de dados." }
	
	has_many :client_references

	has_one :company

	has_many :bank_account

	def steps
  		%w[personal company reference bank_account]
	end

	def next_step
 		self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
  		self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
  		current_step == steps.first
	end

	def last_step?
  		current_step == steps.last
	end

  	def all_valid?
    	steps.all? do |step|
     		self.current_step = step
    		valid?
  		end
	end
end
