# encoding: UTF-8
module ResidenceHelper
	def residence_status
		[
			['Selecione',''],
			['Venda','3'],
			['Compra','1'],
			['Locação','2']
		]
	end

	def residence_type
		[
			['Selecione', ''],
			['Residencial','1'],
			['Comercial','2']
		]
	end
end