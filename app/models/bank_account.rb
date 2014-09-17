class BankAccount < ActiveRecord::Base
	self.table_name = "bank_account"
	
	belongs_to :client
end