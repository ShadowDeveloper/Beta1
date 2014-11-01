# encoding: utf-8

class BankAccount < ActiveRecord::Base
	self.table_name = "bank_account"
	
	belongs_to :client

	def bank_name
		bank_id = self.bank_id

		 if bank_id == 1
		 	"Itaú"
		 elsif bank_id == 2
		 	"Bradesco"
		 elsif bank_id == 3
		 	"Santander"
		 elsif bank_id == 4
		 	"Caixa"
		 else
         "Caixa"
		 end
	end
end