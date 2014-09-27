# encoding: utf-8
class ReportsController < ApplicationController
	def index
	end

	def client_x_day
		Axlsx::Package.new do |p|
		  p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
	 	  sheet.add_row ['Relatório de Clientes Ativos']
        sheet.add_row ["CPF", "Nome", "E-mail", "Celular","Telefone"]
	     Client.all.each do |cli|
	      sheet.add_row [cli.cpf, cli.name, cli.email_address, cli.mobile_number, cli.phone_number]
	     end
 	 end
 		 p.serialize('reports/cliente_x_dia.xlsx')
 		 send_file "reports/cliente_x_dia.xlsx", :type => "application/vnd.ms-excel", :filename => "cliente_x_dia.xls", :stream => false
		end
	end
end
