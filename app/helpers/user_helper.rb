module UserHelper
	def select_region
		[
			['Selecione',''],
			['Norte','1'],
			['Sul','2'],
			['Leste','3'],
			['Oeste','4']
		]
	end

	def self.region
		{
          "1" => "Norte",
          "2" => "Sul",
          "3" => "Leste",
          "4" => "Oeste"
        }
	end
end