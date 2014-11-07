class Sale < ActiveRecord::Base
=begin 
	status:
		1: em negociacao
		2: venda concluida
		3: venda cancelada
=end

	def status_name
		if self.status == 1
			"Em negociacao"
		elsif self.status == 2
			"Venda concluida"
		else
			"Venda cancelada"
		end
	end
end
