class ReportsController < ApplicationController
	def index
	end

	def client_x_day
		Axlsx::Package.new do |p|
		  p.workbook.add_worksheet(:name => "Clientes Cadastrados por dia") do |sheet|
		    sheet.add_row ["Nome"]
		    cli = Client.all
		    cli.map{|c| c.name}.each { |label| sheet.add_row [label, rand(24)+1] }
		    cli.map{|c| c.name}.each { |label| sheet.add_row [label, rand(24)+2] }
		    #sheet.add_chart(Axlsx::Pie3DChart, :start_at => [0,5], :end_at => [10, 20], :title => "example 3: Pie Chart") do |chart|
		    #  chart.add_series :data => sheet["B2:B4"], :labels => sheet["A2:A4"],  :colors => ['FF0000', '00FF00', '0000FF']
		    #end
		  end
 		 p.serialize('cliente_x_dia.xlsx')
		end
	end
end
