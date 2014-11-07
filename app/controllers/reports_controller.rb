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

	def sales
		Axlsx::Package.new do |p|
			wb = p.workbook
			wb.styles do |s|
				blue_border =  s.add_style :border => { :style => :thick, :color =>"FF0000FF", :edges => [:left, :right, :bottom, :top] }
				
				p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
		 		sheet.add_row ['Relatório de Vendas'], b: true, :color =>"FF0000FF"
	      	sheet.add_row ["Situação","Dono do Imóvel","Comprador", "Endereço do imóvel", "Início da venda"], b: true, :style => blue_border, :color =>"FF0000FF"
		   	Sale.all.order('id desc').each do |sale|
		   		sheet.add_row [sale.status_name, Client.where(cpf: sale.cpf_owner).first.name, Client.where(cpf: sale.cpf_client).first.name, Residence.find(sale.residence_id).street_code, sale.created_at.strftime("%m/%d/%Y às %I:%M%p")], :style => blue_border
		   	end
		   end
 	 	end
 	 	begin
 			p.serialize('reports/vendas.xlsx')
 			send_file "reports/vendas.xlsx", :type => "application/vnd.ms-excel", :filename => "vendas.xls", :stream => false
		rescue
			send_file "reports/vendas.xlsx", :type => "application/vnd.ms-excel", :filename => "vendas.xls", :stream => false
		end
		end
	end

	def access_log
		Axlsx::Package.new do |p|
			wb = p.workbook
			wb.styles do |s|
				blue_border =  s.add_style :border => { :style => :thick, :color =>"FF0000FF", :edges => [:left, :right, :bottom, :top] }
				
				p.workbook.add_worksheet(:name => "Basic Worksheet") do |sheet|
		 		sheet.add_row ['Relatório de Acesso'], b: true, :color =>"FF0000FF"
	      	sheet.add_row ["Usuário","Nome","Data de Acesso", "IP"], b: true, :style => blue_border, :color =>"FF0000FF"
		   	 AcessLog.order('id desc').each do |log|
		   		sheet.add_row [User.find(log.user_id).login, User.find(log.user_id).name, log.created_at.strftime("%m/%d/%Y às %I:%M%p"), log.ip], :style => blue_border
		   	end
		   end
 	 	end
 	 	begin
 			p.serialize('reports/acesso.xlsx')
 			send_file "reports/acesso.xlsx", :type => "application/vnd.ms-excel", :filename => "acesso.xls", :stream => false
		rescue
			send_file "reports/acesso.xlsx", :type => "application/vnd.ms-excel", :filename => "acesso.xls", :stream => false
		end
		end
	end

	def informacoes_imovel_display

		if params[:search] == "1"
			#Em negociação
			@residence = Residence.where(status: 1)
		elsif params[:search] == '2'
			#Vendido
			@residence= Residence.where(status: 2)
		elsif params[:search] == "3"
			#A Venda
			@residence = Residence.where(status: 3)
		else
			@residence = Residence.all
		end
	end

	def client_x_day_display
		@client = Client.all
	end

	def sales_display
		if params[:search] == "1"
			@sales = Sale.where(status: 1)
		elsif params[:search] == "2"
			@sales = Sale.where(status: 2)
		elsif params[:search] == "3"
			@sales = Sale.where(status: 3)
		else
			@sales = Sale.all
		end
		@sales.order('id desc')
	end

	def access_log_display
		@access_log = AcessLog.order('id desc')
	end
end
