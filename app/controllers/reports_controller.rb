# encoding: utf-8
class ReportsController < ApplicationController
	def index
	end

	def client_x_day
		Axlsx::Package.new do |p|
				wb = p.workbook
			 	wb.styles do |s|
	    			blue_border =  s.add_style :border => { :style => :thick, :color =>"FF0000FF", :edges => [:left, :right, :bottom, :top] }

					p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
			 		sheet.add_row ['Relatório de Clientes Ativos','',''], b: true, :color =>"FF0000FF"
			   	sheet.add_row ["CPF", "Nome", "E-mail", "Celular","Telefone"], b: true, :style => blue_border, :color =>"FF0000FF"
			   	Client.all.each do |cli|
			   		sheet.add_row [cli.cpf, cli.name, cli.email_address, cli.mobile_number, cli.phone_number], :style => blue_border
			   	end
 	 			end
 	 		end
 	 		begin
	 			p.serialize('reports/cliente_x_dia.xlsx')
	 			send_file "reports/cliente_x_dia.xlsx", :type => "application/vnd.ms-excel", :filename => "clientes_ativos.xls", :stream => false
	 		rescue
	 			send_file "reports/cliente_x_dia.xlsx", :type => "application/vnd.ms-excel", :filename => "clientes_ativos.xls", :stream => false
			end
		end
	end

	def informacoes_imovel
		Axlsx::Package.new do |p|
			wb = p.workbook
			wb.styles do |s|
				blue_border =  s.add_style :border => { :style => :thick, :color =>"FF0000FF", :edges => [:left, :right, :bottom, :top] }
				
				p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
		 		sheet.add_row ['Relatório de Imóveis Ativos'], b: true, :color =>"FF0000FF"
	      	sheet.add_row ["Tipo","Status","CEP", "Bairro", "Rua", "Número"], b: true, :style => blue_border, :color =>"FF0000FF"
		   	Residence.all.each do |res|
		   		sheet.add_row [res.type_name, res.status_name, res.cep, res.neighbourhood, res.street, res.number], :style => blue_border
		   	end
		   end
 	 	end
 	 	begin
 			p.serialize('reports/imoveis_ativos.xlsx')
 			send_file "reports/imoveis_ativos.xlsx", :type => "application/vnd.ms-excel", :filename => "imoveis_ativos.xls", :stream => false
		rescue
			send_file "reports/imoveis_ativos.xlsx", :type => "application/vnd.ms-excel", :filename => "imoveis_ativos.xls", :stream => false
		end
		end
	end

	def informacoes_imovel_display
		@residence = Residence.all
	end

	def client_x_day_display
		@client = Client.all
	end
end
