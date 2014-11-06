# encoding: UTF-8
module ResidenceHelper
	def residence_status
		[
			['Selecione',''],
			['A Venda','3'],
			#['Compra','1'],
			['Vendido','2']
		]
	end

	def residence_type
		[
			['Selecione', ''],
			['Residencial','1'],
			['Comercial','2']
		]
	end
	
	def self.status_name
        {
          "3" => "A Venda",
          "1" => "Em negociação",
          "2" => "Vendido"
        }
    end
    
    def self.type_name
        {
          "1" => "Residencial",
          "2" => "Comercial"
        }
    end
end
